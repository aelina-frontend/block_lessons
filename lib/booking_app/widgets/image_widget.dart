import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class ImageWidget extends StatelessWidget {
  final double height;
  final List<String> images;
  const ImageWidget({super.key, required this.height, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, pageIndex) {
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
                child: SizedBox(
                  height: 10,
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CircleAvatar(
                          radius: 8,
                          backgroundColor:  pageIndex == index ? AppColors.white : AppColors.grey,
                        );
                      }),
                ),
              );
            }),
      );
    }
  }
