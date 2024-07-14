import 'package:flutter/material.dart';
import 'package:netflix_clone_1/utils/constants/image_constants.dart';
import 'package:netflix_clone_1/view/home_screen/home_screen.dart';
import 'package:netflix_clone_1/view/user_name_scren/user_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("hi");
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserName()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(image: AssetImage(ImageConstants.LOGO_PNG)),
      ),
    );
  }
}
