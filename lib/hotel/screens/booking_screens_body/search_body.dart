import 'package:bloc_lessons/hotel/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../booking_app/core/app_colors.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) {
                context.read<BookingCubit>().searchHotels(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon: Icon(Icons.search),
                hintText: 'Enter city or region',
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.buttonColor,
          ),
          child: const Icon(Icons.tune, color: AppColors.white),
        ),
      ],
    );
  }
}