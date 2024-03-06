import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/common/util/exports.dart';
import 'app/common/util/initializer.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initializer.instance.init(() {
  runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 818),
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        defaultTransition: Transition.fadeIn,
        initialRoute: Routes.splash,
        getPages: AppPages.routes,
        initialBinding: InitialBindings(),
      ),
    );
  }
}
