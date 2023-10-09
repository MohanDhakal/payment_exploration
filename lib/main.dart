import 'package:flutter/material.dart';
import 'package:payment_exploration/dependencies/camera_dependencies.dart';
import 'package:payment_exploration/routes/routes_handler.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/utils/app_styles.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraDependencies>(
          create: (_) => CameraDependencies(),
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            background: AppColors.backgroundColor,
            onSurface: AppColors.black,
          ),
          useMaterial3: true,
          fontFamily: "Metropolis",
          textTheme: TextTheme(
            displayLarge: headline1style,
            displayMedium: headline2style,
            displaySmall: headline3style,
          ),
        ),
        routerConfig: routerInstance,
      ),
    );
  }
}
