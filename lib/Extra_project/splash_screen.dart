import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:blood_app/test_for_all_pages/reuseable_widget/splas_services.dart';
import 'package:blood_app/test_for_all_pages/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({ Key? key }) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  SplasServices splasServices = SplasServices();
_Splash_ScreenState(){
  // new Timer(
  //   Duration(seconds: 3), () {
  //     setState(() {
  //       Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context)=>UserScreen()), (route) => false
  //         );
  //     });
  //   },
  //   );
}
@override
  void initState() {
    super.initState();
    SplasServices();
  }

 
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/lottie1.json'),
      splashIconSize: 500,
      duration: 11000,
      nextScreen: UI_screen(),
      splashTransition: SplashTransition.rotationTransition,
    );
    
  }
}