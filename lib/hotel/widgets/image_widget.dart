import 'package:flutter/material.dart';

import '../../booking_app/core/app_colors.dart';

class ImageWidget extends StatelessWidget {
  final double height;
  final List<String> images;

  const ImageWidget({
    super.key,
    required this.height,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, pageIndex) {
          return _buildImageContainer(pageIndex);
        },
      ),
    );
  }

  Widget _buildImageContainer(int pageIndex) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images[pageIndex]),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: _buildIndicator(pageIndex),
    );
  }

  Widget _buildIndicator(int pageIndex) {
    return SizedBox(
      height: 10,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildCircleIndicator(pageIndex == index);
        },
      ),
    );
  }

  Widget _buildCircleIndicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        radius: 8,
        backgroundColor: isActive ? AppColors.white : AppColors.grey,
      ),
    );
  }
}