import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Enter city or region',
              ),
            ),
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          height: 50,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.buttonColor,
          ),
          child: const Icon(Icons.tune, color: AppColors.white,),
        )
      ],
    );
  }
}
