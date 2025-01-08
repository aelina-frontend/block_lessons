class Category {
  final String category;
  final List<HotelData> data;

  Category({required this.category, required this.data});
}

class HotelData {
  final String title;
  final int price;
  final int rooms;
  final int square;
  final List<String> image;
  final bool isLike;
  final double rating;

  HotelData(
      {required this.title,
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
          title: 'Villa Kemah Tinggi',
          price: 920,
          rooms: 2,
          square: 214,
          image: ['assets/image1.png', 'assets/image1.png', 'assets/image1.png', 'assets/image1.png'],
      isLike: false,
      rating: 4.93,
      ),
      HotelData(
          title: 'Rixos Premium ',
          price: 920,
          rooms: 2,
          square: 214,
          image: ['assets/image1.png', 'assets/image1.png'],
        isLike: false,
        rating: 4.93,),
    ],
  ),
  Category(category: 'Popular', data: [
    HotelData(
        title: 'Sheraton',
        price: 2000,
        rooms: 2,
        square: 214,
        image: ['assets/image1.png', ],
      isLike: false,
      rating: 4.93,),
  ],),
  Category(category: 'Immediat', data: [
    HotelData(
      title: 'Garden',
      price: 300,
      rooms: 2,
      square: 214,
      image: ['assets/image1.png', 'assets/image1.png'],
      isLike: false,
      rating: 4.93,),
  ]),
  Category(category: 'New', data: [
    HotelData(
        title: 'NOVA othel',
        price: 920,
        rooms: 2,
        square: 214,
        image: ['assets/image1.png'],
      isLike: false,
      rating: 4.93,),
  ],
  ),
  Category(category: 'Profitable', data: [
    HotelData(
        title: 'Villa Kemah Tinggi',
        price: 920,
        rooms: 2,
        square: 214,
        image: ['assets/image1.png', 'assets/image1.png', 'assets/image1.png'],
      isLike: false,
      rating: 4.93,),
  ]),
];
