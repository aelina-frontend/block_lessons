class Users {
  final String? id;
  final String name;
  final String surname;
  final int numbers;
  final String avatar;

  Users({
    this.id,
    required this.name,
    required this.surname,
    required this.numbers,
    required this.avatar});

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(id: json['id'],
        name: json['name'],
        surname: json['surname'],
        numbers: json['numbers'],
        avatar: json['avatar']);
  }
  Map<String,dynamic> toJson(){
    return {
      'name': name,
      'avatar': avatar,
      'numbers': numbers,
      'surname': surname,
    };
  }

}

// List<Map<String,dynamic>> _users = [
//   {
//     "name": "Aelina",
//     "avatar": "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/278.jpg",
//     "numbers": 700557744,
//     "surname": "Karymshakova",
//     "id": "1"
//   },
//   {
//     "name": "Bermet",
//     "avatar": "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/323.jpg",
//     "numbers": 500446655,
//     "surname": "Barakanova",
//     "id": "2"
//   },
// ];

List<Users> data = [
  Users(id: '1',
      name: 'Aelina',
      surname: 'Karymshakova',
      numbers: 345656567,
      avatar: 'avatar')
];
