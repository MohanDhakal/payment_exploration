import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraDependencies with ChangeNotifier {
  List<CameraDescription>? _cameras;
  CameraController? _controller;

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    if (cameras != null) {
      _controller = CameraController(cameras![0], ResolutionPreset.max);
      if (_controller != null) {
        // _controller!.setFlashMode(FlashMode.off);
        // _controller!.setExposureMode(ExposureMode.locked);
        await _controller!.initialize().catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                debugPrint('You have denied camera access.');
                break;
              case 'CameraAccessDeniedWithoutPrompt':
                // iOS only
                debugPrint(
                    'Please go to Settings app to enable camera access.');
                break;
              case 'CameraAccessRestricted':
                // iOS only
                debugPrint('Camera access is restricted.');
                break;
              case 'AudioAccessDenied':
                debugPrint('You have denied audio access.');
                break;
              case 'AudioAccessDeniedWithoutPrompt':
                // iOS only
                debugPrint('Please go to Settings app to enable audio access.');
                break;
              case 'AudioAccessRestricted':
                // iOS only
                debugPrint('Audio access is restricted.');
                break;
              default:
                _showCameraException(e);
                break;
            }
          }
        });
      }
    }
    notifyListeners();
  }

  CameraDependencies() {
    initializeCamera();
  }
  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
  }

  void _logError(String code, String? message) {
    debugPrint(
        'Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  List<CameraDescription>? get cameras => _cameras;
  CameraController? get controller => _controller;
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
