import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class Parametres extends StatelessWidget {
  final String title;
  final int price;
  final int rooms;
  final int square;
  const Parametres({super.key, required this.title, required this.price, required this.rooms, required this.square});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    '\$$price',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonColor),
                  ),
                  Text(
                    'per month',
                    style: TextStyle(fontSize: 12, color: AppColors.grey),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.bed, color: AppColors.grey,),
              Text('$rooms bedrooms', style: TextStyle(color: AppColors.grey),),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.nfc, color: AppColors.grey,),
              Text('$square m2',style: TextStyle(color: AppColors.grey),),
            ],
          )
        ],
      ),
    );
  }
}