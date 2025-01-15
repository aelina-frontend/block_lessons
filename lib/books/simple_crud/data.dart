class Books {
  final String? id;
  final String name;
  final String author;
  final int price;
  final String genre;

  Books({this.id,
    required this.name,
    required this.author,
    required this.price,
    required this.genre});

  factory Books.fromJson(Map<String, dynamic> json){
    return Books(id: json['id'],
        name: json['name'],
        author: json['author'],
        price: json['price'],
        genre: json['genre']);
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'author': author,
      'price': price,
      'genre': genre,
    };
  }
}

List<Books> data = [Books(id: '1', name: 'rich dad and poor dad', author: 'Robert Kiyosaki', price: 300, genre: 'business')];