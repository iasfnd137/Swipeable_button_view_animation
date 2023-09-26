import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> with TickerProviderStateMixin{
  late final AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff009c41),
      body: Center(
        child: Lottie.asset(
          'assets/images/check.json',
          controller: _animationController,
          onLoaded: (composition){
            _animationController
            ..duration = composition.duration
                ..forward();
          }
        ),

      ),
    );
  }
}
