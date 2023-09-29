class DbModel {
  int? id;
  String name;
  String weight;
  String image;
  double rate;
  double fixRate;
  int noPieces;

  DbModel({ this.id,
    required this.name, required this.weight, required this.image, required this.rate, required this.fixRate,required this.noPieces});

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'name': name,
      'weight': weight,
      'image': image,
      'rate': rate,
      'fixRate': fixRate,
      'noPieces': noPieces,
    };
  }

  factory DbModel.fromMap(Map<String, dynamic> map) {
    return DbModel(
      id: map['id'],
      name: map['name'],
      weight: map['weight'],
      image: map['image'],
      rate: map['rate'],
      fixRate: map['fixRate'],
      noPieces: map['noPieces'],
    );
  }
}
