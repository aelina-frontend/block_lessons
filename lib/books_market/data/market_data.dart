import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  String category;
  List<Datum> data;
  String id;

  Books({
    required this.category,
    required this.data,
    required this.id,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
    category: json["category"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "id": id,
  };
}

class Datum {
  String image;
  String name;
  String author;
  int price;
  String genre;
  String id;

  Datum({
    required this.image,
    required this.name,
    required this.author,
    required this.price,
    required this.genre,
    required this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    image: json["image"],
    name: json["name"],
    author: json["author"],
    price: json["price"],
    genre: json["genre"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "author": author,
    "price": price,
    "genre": genre,
    "id": id,
  };
}

// [
// {
// "category": "Trending",
// "data": [
// {
// "image": "https://2books.su/assets/img/covers/harry-potter-1-harry-potter-and-the-sorcerer-s-stone-j-k-rowling.jpg",
// "name": "Harry Potter and the Sorcerer's Stone",
// "author": "J.K. Rowling",
// "price": 500,
// "genre": "fantasy",
// "id": "1"
// },
// {
// "image": "https://2books.su/assets/img/covers/the-old-man-and-the-sea-ernest-hemingway.jpg",
// "name": "The Old Man and the Sea",
// "author": "Ernest Hemingway",
// "price": 350,
// "genre": "fiction",
// "id": "2"
// },
// {
// "image": "https://2books.su/assets/img/covers/the-hobbit-j-r-r-tolkien.jpg",
// "name": "The Hobbit",
// "author": "J.R.R. Tolkien",
// "price": 600,
// "genre": "fantasy",
// "id": "3"
// }
// ],
// "id": "1"
// },
// {
// "category": "Classics",
// "data": [
// {
// "image": "https://2books.su/assets/img/covers/pride-and-prejudice-adapted.jpg",
// "name": "Pride and Prejudice",
// "author": "Jane Austen",
// "price": 400,
// "genre": "romance",
// "id": "4"
// },
// {
// "image": "https://2books.su/assets/img/covers/1984-george-orwell.jpg",
// "name": "1984",
// "author": "George Orwell",
// "price": 450,
// "genre": "dystopian",
// "id": "5"
// },
// {
// "image": "https://2books.su/assets/img/covers/to-kill-a-mockingbird-adapted.jpg",
// "name": "To Kill a Mockingbird",
// "author": "Harper Lee",
// "price": 500,
// "genre": "fiction",
// "id": "6"
// }
// ],
// "id": "2"
// },
// {
// "category": "Science",
// "data": [
// {
// "image": "https://2books.su/assets/share/covers/3d5265687e8e0bc4e232f950296dc4bb.jpg",
// "name": "A Brief History of Time",
// "author": "Stephen Hawking",
// "price": 600,
// "genre": "science",
// "id": "7"
// },
// {
// "image": "https://2books.su/assets/share/covers/4ac645ebf7d9bed4ec47417e11b9568f.jpg",
// "name": "The Selfish Gene",
// "author": "Richard Dawkins",
// "price": 550,
// "genre": "biology",
// "id": "8"
// },
// {
// "image": "https://2books.su/assets/share/covers/e4fe1ca6552a0ab853c65ab53c24aac6.jpg",
// "name": "The Gene: An Intimate History",
// "author": "Siddhartha Mukherjee",
// "price": 700,
// "genre": "biology",
// "id": "9"
// }
// ],
// "id": "3"
// },
// {
// "category": "Biographies",
// "data": [
// {
// "image": "https://2books.su/assets/img/covers/the-diary-of-a-young-girl-anne-frank.jpg",
// "name": "The Diary of a Young Girl",
// "author": "Anne Frank",
// "price": 300,
// "genre": "autobiography",
// "id": "10"
// },
// {
// "image": "https://2books.su/assets/img/covers/harry-potter-1-harry-potter-and-the-sorcerer-s-stone-j-k-rowling.jpg",
// "name": "Long Walk to Freedom",
// "author": "Nelson Mandela",
// "price": 650,
// "genre": "autobiography",
// "id": "11"
// },
// {
// "image": "https://2books.su/assets/img/covers/steve-jobs-a-biography-walter-isaacson.jpg",
// "name": "Steve Jobs",
// "author": "Walter Isaacson",
// "price": 550,
// "genre": "biography",
// "id": "12"
// }
// ],
// "id": "4"
// }
// ]