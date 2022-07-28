class Drone {
  final String idTag;
  final String weight;
  final String manufacturer;
  final String dateAcquired;
  final String isServiced;
  Drone({
    required this.idTag,
    required this.weight,
    required this.manufacturer,
    required this.dateAcquired,
    required this.isServiced,
  });

  factory Drone.fromMap(Map<String, dynamic> map) {
    return Drone(
      idTag: map['idTag'] ?? '',
      weight: map['weight'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      dateAcquired: map['dateAcquired'] ?? '',
      isServiced: map['isServiced'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTag': idTag,
      'weight': weight,
      'manufacturer': manufacturer,
      'dateAcquired': dateAcquired,
      'isServiced': isServiced,
    };
  }
}
