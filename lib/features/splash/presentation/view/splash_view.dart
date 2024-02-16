import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {
  double imageSize = 0;

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      animatedImage();
    });
    super.initState();
  }

  void animatedImage() {
    setState(() {
      imageSize = 180;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //const Color(0xffD2D2D2),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: imageSize,
          height: imageSize,
          child: Image.asset(
            logo1,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
