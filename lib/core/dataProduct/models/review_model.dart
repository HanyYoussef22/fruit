class ReviewModel {
  final String name;
  final String image;
  final String ratting;
  final String data;
  final double rating;
  final DateTime reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.ratting,
    required this.data,
    required this.rating,
    required this.reviewDescription,
  });



  toMap() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'data': data,
      'rating': rating,
      'reviewDescription': reviewDescription.toIso8601String(),
    };
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'data': data,
      'rating': rating,
      'reviewDescription': reviewDescription.toIso8601String(),
    };
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      ratting: json['ratting'],
      data: json['data'],
      rating: json['rating'],
      reviewDescription: DateTime.parse(json['reviewDescription']),
    );
  }

}