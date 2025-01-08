import 'package:bloc_lessons/booking_app/core/app_navigation.dart';
import 'package:bloc_lessons/booking_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'booking_screen.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 30),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image.png'),
          )),
          child: Container(
            height: 311,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _title(),
                const SizedBox(height: 15,),
                _description(),
                const SizedBox(height: 15,),
                ButtonWidget(text: 'Get Started', onPressed: (){
                  AppNavigation.push(context, const BookingScreen());
                },),
              ],
            ),
          )),
    );
  }

  Widget _title() {
    return const Text(
      'Find your dream villa\nin Indonesia',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }

  Widget _description() {
    return const Text(
      'Long-term rental of villas with a guarantee of conformity with photographs',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.grey),
    );
  }


}
