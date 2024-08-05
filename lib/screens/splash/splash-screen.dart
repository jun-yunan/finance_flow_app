import 'package:finance_flow_app/components/logo-brand.dart';
import 'package:finance_flow_app/controllers/AuthController.dart';
import 'package:finance_flow_app/screens/auth/auth-screen.dart';
import 'package:finance_flow_app/screens/dashboard/dashboard-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final AuthController authController = Get.put(AuthController());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        bool isLoggedIn = await authController.checkIsLogged();
        // bool isLoggedIn = false;
        if (isLoggedIn == true) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xff00D09E),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoBrand(
              type: LogoType.dark,
            ),
          ],
        ),
      ),
    );
  }
}
