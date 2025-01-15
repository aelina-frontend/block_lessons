import 'package:bloc_lessons/hotel/cubit/booking_cubit.dart';
import 'package:bloc_lessons/hotel/widgets/image_widget.dart';
import 'package:bloc_lessons/hotel/widgets/like_widget.dart';
import 'package:bloc_lessons/hotel/widgets/parametres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../booking_app/core/app_colors.dart';
import '../../../booking_app/core/app_navigation.dart';
import '../../data/hotel_data.dart';
import '../detail_screen.dart';

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
        } else if (state is BookingSuccess) {
          final List<HotelData> allHotels =
          state.filteredData!.expand((category) => category.data).toList();

          if (allHotels.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('No hotels found.'),
              ),
            );
          }

          return SliverFixedExtentList(
            itemExtent: 450,
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final data = allHotels[index];
                return Container(
                  color: AppColors.white,
                  child: Column(
                    children: [
                      _ImageBody(
                        images: data.image,
                        isLike: data.isLike,
                        id: data.id,
                        onTap: () {
                          AppNavigation.push(
                            context,
                            DetailScreen(hotel: data, ),
                          );
                        },
                      ),
                      Parametres(
                        title: data.title,
                        price: data.price,
                        rooms: data.rooms,
                        square: data.square,
                      ),
                    ],
                  ),
                );
              },
              childCount: allHotels.length,
            ),
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
  final int id;
  final Function() onTap;

  const _ImageBody({
    super.key,
    required this.images,
    required this.isLike,
    required this.id,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            ImageWidget(height: 350, images: images),
            LikeWidget(isLike: isLike, id: id,),

          ],
        ),
      ),
    );
  }
}