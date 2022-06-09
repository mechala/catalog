import 'package:equatable/equatable.dart';

class PRDProduct extends Equatable {
  int id;
  String name;
  double price;
  int available;
  String image;
  String description;
  String url;
  String category;

  PRDProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['Name'],
        price = json['Price'].toDouble(),
        available = json['Available'],
        image = json['Image'],
        description = json['Description'],
        url = json['Url'],
        category = json['Category'];

  static List<String> typesFromMap(List<dynamic> map) {
    List<String> types = [];
    for (var type in map) {
      types.add(type['type']['name'] ?? '');
    }

    return types;
  }

  @override
  List<Object?> get props => [id, name, price, available, image];
}
