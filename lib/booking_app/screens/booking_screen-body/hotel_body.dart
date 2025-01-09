import 'package:bloc_lessons/booking_app/core/app_navigation.dart';
import 'package:bloc_lessons/booking_app/cubit/booking_cubit.dart';
import 'package:bloc_lessons/booking_app/data/hotel_data.dart';
import 'package:bloc_lessons/booking_app/screens/detail_screen.dart';
import 'package:bloc_lessons/booking_app/widgets/image_widget.dart';
import 'package:bloc_lessons/booking_app/widgets/like_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_colors.dart';
import '../../widgets/parametres_widget.dart';


class HotelBody extends StatelessWidget {
  const HotelBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is BookingError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.error),
            ),
          );
        } else if (state is BookingSuccess) {

          final List<HotelData> allHotels = state.categories
              .expand((category) => category.data)
              .toList();

          return SliverFixedExtentList(
            itemExtent: 450,
            delegate: SliverChildBuilderDelegate(
                childCount: allHotels.length, (context, index) {

                final data = allHotels[index];
                final categoryIndex = state.categories.indexWhere((category) =>
                    category.data.contains(data));
              return Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    _ImageBody(images: data.image, isLike: data.isLike, onPressed: (){
                      context.read<BookingCubit>().isLike(state.categories[categoryIndex].category, data.id);
                    }, onTap: (){
                      AppNavigation.push(context, DetailScreen(hotel: data, category: state.categories[categoryIndex].category,));
                    },),
                    Parametres(title: data.title, price: data.price, rooms: data.rooms, square: data.square),


                  ],
                ),
              );
            }),
          );
        } else {
          return const SliverToBoxAdapter();
        }
      },
    );
  }
}

class _ImageBody extends StatelessWidget {
  final List<String> images;
  final bool isLike;
  final Function() onPressed;
  final Function() onTap;
  const _ImageBody({super.key, required this.images, required this.isLike, required this.onPressed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            ImageWidget(height: 350, images: images,),
            LikeWidget(isLike: isLike, onPressed: onPressed),
            const SizedBox(height: 45,),

          ],
        ),
      ),
    );
  }

}
