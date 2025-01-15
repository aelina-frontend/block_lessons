import 'package:bloc_lessons/hotel/data/hotel_data.dart';
import 'package:bloc_lessons/hotel/screens/detail_screen_body/hotel_info.dart';
import 'package:bloc_lessons/hotel/widgets/image_widget.dart';
import 'package:bloc_lessons/hotel/widgets/like_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class DetailScreen extends StatelessWidget {
  final HotelData hotel;


  const DetailScreen({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              _buildImageSection(context),
              const SizedBox(height: 20),
              HotelsInfo(
                title: hotel.title,
                price: hotel.price,
                rooms: hotel.rooms,
                square: hotel.square,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Align(
        alignment: Alignment.topRight,
        child: Icon(Icons.chat_bubble_outline),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(
          height: 250,
          images: hotel.image,
        ),
        LikeWidget(
          isLike: hotel.isLike,
          id: hotel.id,
        ),
      ],
    );
  }
}