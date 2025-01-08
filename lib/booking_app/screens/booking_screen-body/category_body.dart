import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class CategoryBody extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  const CategoryBody({super.key, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Best',
      'Popular',
      'Immediat',
      'New',
      'Profitable'
    ];
    return SizedBox(
      height: 25,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: onTap,
                child: Text(categories[index], style:  TextStyle(color: isSelected ? AppColors.black : AppColors.grey),),
              ),
            );
          }),
    );
  }
}
