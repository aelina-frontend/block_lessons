import 'package:bloc_lessons/hotel/cubit/booking_cubit.dart';
import 'package:bloc_lessons/hotel/screens/booking_screens_body/app_bar_body.dart';
import 'package:bloc_lessons/hotel/screens/booking_screens_body/category_body.dart';
import 'package:bloc_lessons/hotel/screens/booking_screens_body/hotel_body.dart';
import 'package:bloc_lessons/hotel/screens/booking_screens_body/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarBody(),
                    const SizedBox(height: 20),
                    const SearchBody(),
                    const SizedBox(height: 20),
                    CategoryBody(
                      onCategorySelected: (category) {
                        context.read<BookingCubit>().filterByCategory(category);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const HotelBody(),
            ],
          ),
        ),
      ),
    );
  }
}