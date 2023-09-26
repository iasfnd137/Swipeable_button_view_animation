import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'confirmation_page.dart';
class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SwipeableButtonView(
            buttonText: 'Slide to pay',
            buttontextstyle: TextStyle(
            color: Colors.white,fontSize: 25
          ),
            activeColor: Color(0xff009c41),
            buttonWidget: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
            onWaitingProcess: (){
            Future.delayed(Duration(seconds: 2),()=> setState(()=> isFinish = true));
            },
            isFinished: isFinish,
            onFinish: ()async{
              await Navigator.push(
                context,
                PageTransition(child: ConfirmationPage() , type: PageTransitionType.fade)
              );
              setState(() {
                isFinish = false;
              });

            },
          ),
        ),
      ),
    );
  }
}
