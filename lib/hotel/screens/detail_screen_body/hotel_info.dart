import 'package:bloc_lessons/hotel/widgets/button_widget.dart';
import 'package:bloc_lessons/hotel/widgets/parametres.dart';
import 'package:flutter/material.dart';

import '../../../booking_app/core/app_colors.dart';
import '../../../booking_app/core/app_text_style.dart';


class HotelsInfo extends StatelessWidget {
  final String title;
  final int price;
  final int rooms;
  final int square;

  const HotelsInfo({
    super.key,
    required this.title,
    required this.price,
    required this.rooms,
    required this.square,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Parametres(title: title, price: price, rooms: rooms, square: square),
        const SizedBox(height: 10),
        _divider(),
        const SizedBox(height: 10),
        _description(),
        const SizedBox(height: 20),
        _circleImageName(),
        const SizedBox(height: 10),
        _divider(),
        const SizedBox(height: 10),
        _conveniences(),
        const SizedBox(height: 20),
        _divider(),
        const SizedBox(height: 15),
        _totalPrice(),
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      color: AppColors.grey,
      thickness: 0.5,
    );
  }

  Widget _description() {
    return const Text(
      'Excellent two-storey villa with a terrace, private pool and parking spaces is located only 5 minutes from the Indian Ocean',
      style: TextStyle(fontSize: 16, fontFamily: 'Manrope'),
    );
  }

  Widget _circleImageName() {
    return const ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/ellipse1.png'),
      ),
      title: Row(
        children: [
          Text(
            'Host',
            style: AppTextStyle.s14grey,
          ),
          SizedBox(width: 5),
          Icon(Icons.star, color: AppColors.yellow),
        ],
      ),
      subtitle: Text(
        'Kanda Nok',
        style: AppTextStyle.s18w700,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.grey,
        size: 20,
      ),
    );
  }

  Widget _conveniences() {
    const conveniences = [
      'Free parking',
      'TV set',
      'Video monitoring',
      'Air conditioning',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Conveniences at home',
          style: AppTextStyle.s18w700,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: conveniences
              .map(
                (convenience) => Text(
              convenience,
              style: AppTextStyle.s14w200,
            ),
          )
              .toList(),
        ),
      ],
    );
  }

  Widget _totalPrice() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Total \$2840',
                style: AppTextStyle.s18w700,
              ),
              SizedBox(height: 5),
              Text(
                'per month',
                style: AppTextStyle.s12grey,
              ),
            ],
          ),
          ButtonWidget(
            text: 'Reservation',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}