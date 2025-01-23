class Signalement {
  final String enfantImage;
  final String enfantNom;
  final String enfantAge;
  final String phoneNumber;
  final String adresse;
  final String description;
  Signalement({
    required this.enfantImage,
    required this.enfantNom,
    required this.enfantAge,
    required this.phoneNumber,
    required this.adresse,
    required this.description,
  });

  // Méthode pour créer une instance de Signalement à partir d'un JSON
  factory Signalement.fromJson(Map<String, dynamic> json) {
    return Signalement(
      enfantImage: json['enfant_image'],
      enfantNom: json['enfant_nom'],
      enfantAge: json['enfant_age'],
      phoneNumber: json['phone_number'],
      adresse: json['adresse'],
      description:json['description']
    );
  }

  // Méthode pour convertir une instance de Signalement en JSON
  Map<String, dynamic> toJson() {
    return {
      'enfant_image': enfantImage,
      'enfant_nom': enfantNom,
      'enfant_age': enfantAge,
      'phone_number': phoneNumber,
      'adresse': adresse,
    };
  }
}
