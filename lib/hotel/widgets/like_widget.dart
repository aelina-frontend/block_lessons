import 'package:bloc_lessons/hotel/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../booking_app/core/app_colors.dart';

class LikeWidget extends StatelessWidget {
  final bool isLike;
  final int id;


  const LikeWidget({
    super.key,
    required this.isLike, required this.id,

  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRatingContainer(),
            _buildLikeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingContainer() {
    return Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade500,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.yellow,
          ),
          const Text(
            '4.93',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton(BuildContext context) {
    return IconButton(
      onPressed: (){
        context.read<BookingCubit>().toggleLike(id);
      },
      icon: Icon(
        isLike ? Icons.favorite : Icons.favorite_border,
        size: isLike ? 40 : 35,
        color: isLike ? AppColors.red : AppColors.white,
      ),
    );
  }
}