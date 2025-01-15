
import 'package:bloc_lessons/books/simple_crud/book_creat_screen.dart';
import 'package:bloc_lessons/books/simple_crud/book_data.dart';
import 'package:bloc_lessons/hotel/cubit/booking_cubit.dart';
import 'package:bloc_lessons/hotel/screens/booking_screen.dart';
import 'package:bloc_lessons/hotel/screens/get_started_screen.dart';
import 'package:bloc_lessons/server/simple_crud/create_screen.dart';
import 'package:bloc_lessons/server/simple_crud/get_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:device_preview/device_preview.dart';

import 'hotel/data/hotel_data.dart';

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
        BlocProvider(
            create: (_) => BookingCubit(categories: categories)..loadHotels())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const BookData(),
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
