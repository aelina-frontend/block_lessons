import 'package:bloc_lessons/booking_app/cubit/booking_cubit.dart';
import 'package:bloc_lessons/booking_app/screens/booking_screen.dart';
import 'package:bloc_lessons/booking_app/screens/detail_screen.dart';
import 'package:bloc_lessons/booking_app/screens/get_start_screen.dart';
import 'package:bloc_lessons/counter_app/counter_cubit.dart';
import 'package:bloc_lessons/counter_app/counter_screen.dart';
import 'package:bloc_lessons/counter_real_app/counter_real_app_cubit.dart';
import 'package:bloc_lessons/counter_real_app/counter_real_app_screen.dart';
import 'package:bloc_lessons/like_screen/like_cubit.dart';
import 'package:bloc_lessons/like_screen/like_screen.dart';
import 'package:bloc_lessons/rent_car_app/cubit/rent_cubit.dart';
import 'package:bloc_lessons/rent_car_app/screens/rent_car_screen.dart';
import 'package:bloc_lessons/string_app/string_cubit.dart';
import 'package:bloc_lessons/string_app/string_screen.dart';
import 'package:bloc_lessons/task_app/task_cubit.dart';
import 'package:bloc_lessons/task_app/task_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookingCubit()..loadHotels())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const BookingScreen(),
      ),
    );
  }
}
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//         create: (context) => CounterCubit(),),
//         BlocProvider(
//           create: (context) => LikeCubit(),
//         ),
//         BlocProvider(
//           create: (context) => StringCubit(),
//         ),
//         BlocProvider(
//           create: (context) => CounterRealAppCubit(),
//         ),
//         BlocProvider(
//           create: (context) => TaskCubit(),
//         ),
//         BlocProvider(create: (context) => RentCubit(),
//         )
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const GetStartScreen(),
//       ),
//     );
//   }
// }
