import 'package:bloc_lessons/booking_app/data/hotel_data.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_style.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/parametres_widget.dart';

class HotelsInfo extends StatelessWidget {
  final String title;
  final int price;
  final int rooms;
  final int square;
  const HotelsInfo({super.key, required this.title, required this.price, required this.rooms, required this.square,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Parametres(title: title, price: price, rooms: rooms, square: square),
        _divider(),
        _description(),
        _circleImageName(),
        _divider(),
        _conveniences(),
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
          Icon(Icons.star, color: AppColors.yellow)
        ],
      ),
      subtitle: Text('Kanda Nok', style: AppTextStyle.s18w700),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.grey,
        size: 20,
      ),
    );
  }

  Widget _conveniences() {
    return const Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Conveniences at home',
            style: AppTextStyle.s18w700,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Free parking',
              style: AppTextStyle.s14w200,
            ),
            Text(
              'TV set',
              style: AppTextStyle.s14w200,
            ),
            Text(
              'Video monitoring',
              style: AppTextStyle.s14w200,
            ),
            Text(
              'Air conditioning',
              style: AppTextStyle.s14w200,
            )
          ],
        )
      ],
    );
  }

  Widget _totalPrice() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total \$2840',
                  style: AppTextStyle.s18w700,
                ),
                Text(
                  'per month',
                  style: AppTextStyle.s12grey,
                )
              ],
            ),
            ButtonWidget(text: 'Reservation', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
