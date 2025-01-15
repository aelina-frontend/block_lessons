import 'package:bloc_lessons/hotel/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../booking_app/core/app_colors.dart';


class CategoryBody extends StatelessWidget {
  final Function(String category) onCategorySelected;

  const CategoryBody({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingSuccess) {
          final categories = ['All'] + state.categories.map((c) => c.category).toList();

          return SizedBox(
            height: 25,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == 'All'
                    ? state.filteredData?.length == state.categories.length
                    : state.filteredData?.any((c) => c!.category == category);

                return GestureDetector(
                  onTap: () => onCategorySelected(category),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected! ? AppColors.black : AppColors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink(); // Empty state when no categories are available
      },
    );
  }
}