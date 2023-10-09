import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:payment_exploration/dependencies/camera_dependencies.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  // This widget is the root of your application.
  XFile? imageFile;
  int _pointers = 0;
  bool searchButton = false;
  late AnimationController _flashModeControlRowAnimationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select by taking a photo"),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Consumer<CameraDependencies>(builder: (context, value, child) {
        return Column(
          children: [
            imageFile == null
                ? _cameraPreviewWidget(value.controller, size)
                : Image.file(
                    File(imageFile?.path ?? ""),
                    height: size.height * 0.8,
                    width: size.width,
                  ),
            Expanded(
              child: searchButton
                  ? _searchButtonWidget(size)
                  : _captureControlRowWidget(size),
            ),
          ],
        );
      }),
    );
  }

  Widget _searchButtonWidget(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: IconButton(
            icon: const Icon(Icons.search_rounded),
            color: imageFile == null ? Colors.white : Colors.black,
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                RouteName.searchProduct,
                arguments: {
                  "image_file": imageFile,
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _cropImage(String imagePath) async {
    // Crop the image using image_cropper package
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: imagePath, aspectRatioPresets: [
      CropAspectRatioPreset.square
    ], uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
      ),
      IOSUiSettings(
        title: 'Crop Image',
        cancelButtonTitle: 'Cancel',
        doneButtonTitle: 'Done',
      ),
    ]);

    if (croppedImage != null) {
      // You can use the cropped image for further processing or display.
      // In this example, we'll just display it in an Image widget.
      setState(() {
        imageFile = XFile(croppedImage.path);
        searchButton = true;
      });
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController =
        Provider.of<CameraDependencies>(context, listen: false).controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void _logError(String code, String? message) {
    debugPrint(
        'Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (imageFile != null) {
          _cropImage(imageFile!.path);
        }
        if (file != null) {
          showInSnackBar('Picture saved to ${file.path}');
        }
      }
    });
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget(Size size) {
    final cameraController =
        Provider.of<CameraDependencies>(context, listen: false).controller;
    return SizedBox(
      height: size.height * 0.1,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onFlashModeButtonPressed,
                child: const Icon(
                  Icons.flash_on,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: imageFile == null ? Colors.white : Colors.black,
                  onPressed: cameraController != null &&
                          cameraController.value.isInitialized &&
                          !cameraController.value.isRecordingVideo &&
                          imageFile == null
                      ? onTakePictureButtonPressed
                      : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    imageFile = null;
                  });
                },
                child: const Icon(
                  Icons.sync,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
    }
  }

  Future<void> onPausePreviewButtonPressed() async {
    final cameraController =
        Provider.of<CameraDependencies>(context, listen: false).controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isPreviewPaused) {
      await cameraController.resumePreview();
    } else {
      await cameraController.pausePreview();
    }

    if (mounted) {
      setState(() {});
    }
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget(CameraController? cameraController, final size) {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: SizedBox(
          height: size.height * 0.8,
          width: size.width,
          child: CameraPreview(
            cameraController,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (TapDownDetails details) =>
                      onViewFinderTap(details, constraints),
                );
              },
            ),
          ),
        ),
      );
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    final cameraController =
        Provider.of<CameraDependencies>(context, listen: false).controller;
    if (cameraController == null) {
      return;
    }

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }
}
