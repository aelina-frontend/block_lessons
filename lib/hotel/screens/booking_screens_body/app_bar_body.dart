import 'package:flutter/material.dart';

import '../../../booking_app/core/app_colors.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _location(),
        _circleImage(),
      ],
    );
  }

  Widget _location() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You are here',
          style: TextStyle(fontSize: 14, color: AppColors.grey),
        ),
        Text(
          'Indonesia',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _circleImage() {
    return const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage('assets/images/ellipse2.png'),
    );
  }
}