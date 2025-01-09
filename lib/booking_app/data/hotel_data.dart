class Category {
  final String category;
  final List<HotelData> data;

  Category({required this.category, required this.data});
}

class HotelData {
  final int id;
  final String title;
  final int price;
  final int rooms;
  final int square;
  final List<String> image;
  bool isLike;
  final double rating;

  HotelData(
      {required this.id,
        required this.title,
      required this.price,
      required this.rooms,
      required this.square,
      required this.image,
        required this.isLike,
        required this.rating,
      });
}

List<Category> categories = [
  Category(
    category: 'Best',
    data: [
      HotelData(
        id: 1,
          title: 'Villa Kemah Tinggi',
          price: 1200,
          rooms: 2,
          square: 214,
          image: [ 'assets/p1.jpg', 'assets/p2.jpg'],
      isLike: false,
      rating: 4.93,
      ),
      HotelData(
        id: 2,
          title: 'Rixos Premium ',
          price: 2500,
          rooms: 2,
          square: 214,
          image: ['assets/p8.jpg', 'assets/m2.jpg', 'assets/m3.jpg'],
        isLike: false,
        rating: 4.93,),
    ],
  ),
  Category(category: 'Popular', data: [
    HotelData(
      id: 3,
        title: 'Sheraton',
        price: 4200,
        rooms: 2,
        square: 214,
        image: ['assets/p18.jpg','assets/p3.jpg', 'assets/p10.jpg' ],
      isLike: false,
      rating: 4.93,),
  ],),
  Category(category: 'Immediat', data: [
    HotelData(
      id: 4,
      title: 'Garden',
      price: 1800,
      rooms: 2,
      square: 214,
      image: ['assets/p15.jpg', 'assets/p20.jpg', 'assets/p16.jpg'],
      isLike: false,
      rating: 4.93,),
  ]),
  Category(category: 'New', data: [
    HotelData(
      id: 5,
        title: 'NOVA othel',
        price: 900,
        rooms: 2,
        square: 214,
        image: ['assets/p6.jpg','assets/p14.jpg'],
      isLike: false,
      rating: 4.93,),
  ],
  ),
  Category(category: 'Profitable', data: [
    HotelData(
      id: 6,
        title: 'Villa Kemah Tinggi',
        price: 3000,
        rooms: 2,
        square: 214,
        image: ['assets/p9.jpg', 'assets/p17.jpg',],
      isLike: false,
      rating: 4.93,),
  ]),
];
