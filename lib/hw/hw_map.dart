//
// import 'package:flutter/material.dart';
//
// Map<String, int> products = {
//   'Apples': 50,
//   'Bananas': 60,
//   'Orange': 30,
// };
//
// Map<String, dynamic> productDetails = {
//   'name': 'Apples',
//   'price': 50,
//   'inStock': true,
// };
//
// List<Map<String, dynamic>> products2 = [
//   {'name': 'Apples', 'price': 50, 'inStock': true,},
//   {'name': 'bananas', 'price': 70, 'inStock': false,},
//   {'name': 'grape', 'price': 20, 'inStock': true,},
//   {'name': 'orange', 'price': 30, 'inStock': false,},
// ];
// class HwMap extends StatelessWidget {
//   const HwMap({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//         itemCount: 2,
//         itemBuilder: (context, index){
//             final product = products2[index];
//             return Card(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Продукт: ${product['name']}'),
//                   Text('Продукт: ${product['price']}'),
//                   Text(product['inStock'] ? 'В наличии': 'Нет в наличии')б
//                 ],
//               ),
//             );
//         }),
//     );
//   }
// }
