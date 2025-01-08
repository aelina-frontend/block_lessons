import 'package:flutter/material.dart';

import '../core/app_colors.dart';

Widget likeWidget({required bool isLike}) {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade500,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.yellow,
                ),
                Text(
                  '4.93',
                  style: TextStyle(fontSize: 14, color: AppColors.white),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: isLike
                ? const Icon(
              Icons.favorite,
              size: 40,
              color: AppColors.red,
            )
                : const Icon(Icons.favorite_border, size: 35, color: AppColors.white,),
          ),
        ],
      ),
    ),
  );
}