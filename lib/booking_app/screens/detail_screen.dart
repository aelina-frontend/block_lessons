import 'package:bloc_lessons/booking_app/core/app_text_style.dart';
import 'package:bloc_lessons/booking_app/cubit/booking_cubit.dart';
import 'package:bloc_lessons/booking_app/data/hotel_data.dart';
import 'package:bloc_lessons/booking_app/screens/detail_screen_body/hotels_info.dart';
import 'package:bloc_lessons/booking_app/widgets/button_widget.dart';
import 'package:bloc_lessons/booking_app/widgets/image_widget.dart';
import 'package:bloc_lessons/booking_app/widgets/like_widget.dart';
import 'package:bloc_lessons/booking_app/widgets/parametres_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_colors.dart';

class DetailScreen extends StatelessWidget {
  final HotelData hotel;
  final String category;
  const DetailScreen({super.key, required this.hotel, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.chat_bubble_outline)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              children: [
                ImageWidget(height: 250, images: hotel.image,),
                LikeWidget(isLike: hotel.isLike, onPressed: (){
                  context.read<BookingCubit>().isLike(category, hotel.id);
                }),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
            HotelsInfo(title: hotel.title, price: hotel.price, rooms: hotel.rooms, square: hotel.square),
          ],
        ),
      ),
    );
  }
  
}
