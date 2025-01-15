import 'package:flutter/material.dart';
import '../../booking_app/core/app_colors.dart';
import '../../booking_app/core/app_navigation.dart';
import '../widgets/button_widget.dart';
import 'booking_screen.dart';


class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _contentContainer(context),
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image.png'),
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
      ),
    );
  }

  Widget _contentContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 30),
      child: Container(
        height: 311,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _title(),
        const SizedBox(height: 15),
        _description(),
        const SizedBox(height: 20),
        _getStartedButton(context),
      ],
    );
  }

  Widget _title() {
    return const Text(
      'Find your dream villa\nin Indonesia',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        height: 1.4, // Adjust line height for better readability
      ),
    );
  }

  Widget _description() {
    return const Text(
      'Long-term rental of villas with a guarantee of conformity with photographs',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.grey,
        height: 1.5, // Adds space between lines for better readability
      ),
    );
  }

  Widget _getStartedButton(BuildContext context) {
    return ButtonWidget(
      text: 'Get Started',
      onPressed: () {
        AppNavigation.push(context, const BookingScreen());
      },
    );
  }
}