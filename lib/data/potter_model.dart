class PotterModel {
  final String fullName;
  final String? nickname;
  final String? hogwartsHouse;
  final String? interpretedBy;
  final List<String>? children;
  final String? image;
  final String? birthdate;

  PotterModel({
    required this.fullName,
    this.nickname,
    this.hogwartsHouse,
    this.interpretedBy,
    this.children,
    this.image,
    this.birthdate,
  });

  // Factory constructor to create a Character object from JSON
  factory PotterModel.fromJson(Map<String, dynamic> json) {
    return PotterModel(
      fullName: json['fullName'] ?? '',
      nickname: json['nickname'],
      hogwartsHouse: json['hogwartsHouse'],
      interpretedBy: json['interpretedBy'],
      children: (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'],
      birthdate: json['birthdate'],
    );
  }

  // Method to convert a Character object to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'nickname': nickname,
      'hogwartsHouse': hogwartsHouse,
      'interpretedBy': interpretedBy,
      'children': children,
      'image': image,
      'birthdate': birthdate,
    };
  }
}
