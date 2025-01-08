import 'package:bloc_lessons/booking_app/screens/booking_screen-body/app_bar_body.dart';
import 'package:bloc_lessons/booking_app/screens/booking_screen-body/category_body.dart';
import 'package:bloc_lessons/booking_app/screens/booking_screen-body/hotel_body.dart';
import 'package:bloc_lessons/booking_app/screens/booking_screen-body/search_body.dart';
import 'package:flutter/material.dart';

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
                  children: [
                const AppBarBody(),
                    const SizedBox(height: 20,),
                    const SearchBody(),
                    const SizedBox(height: 20,),
                    CategoryBody(onTap: (){}, isSelected: true),
                    const SizedBox(height: 20,),
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
