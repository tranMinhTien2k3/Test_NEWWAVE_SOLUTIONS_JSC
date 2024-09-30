class Address {
  final String title;
  final String label;
  final double latitude;
  final double longitude;

  Address(
      {required this.title,
      required this.label,
      required this.latitude,
      required this.longitude});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      title: json['title'],
      label: json['address']['label'],
      latitude: json['position']['lat'],
      longitude: json['position']['lng'],
    );
  }
}
