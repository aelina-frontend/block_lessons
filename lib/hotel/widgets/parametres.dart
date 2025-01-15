import 'package:flutter/material.dart';

import '../../booking_app/core/app_colors.dart';

class Parametres extends StatelessWidget {
  final String title;
  final int price;
  final int rooms;
  final int square;

  const Parametres({
    super.key,
    required this.title,
    required this.price,
    required this.rooms,
    required this.square,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const SizedBox(height: 8),
          _buildDetailsRow(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$$price',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.buttonColor,
              ),
            ),
            Text(
              'per month',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailsRow() {
    return Row(
      children: [
        _buildIconTextRow(Icons.bed, '$rooms bedrooms'),
        const SizedBox(width: 10),
        _buildIconTextRow(Icons.nfc, '$square m²'),
      ],
    );
  }

  Widget _buildIconTextRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.grey,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: AppColors.grey),
        ),
      ],
    );
  }
}