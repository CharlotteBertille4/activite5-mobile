class Redacteur {
  //declaration des proporiétés de la classe
  int? id;
  String nom;
  String prenom;
  String email;

  //constructeur de la classe
  Redacteur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  //constructeur sans id
  Redacteur.sansId({
    required this.nom,
    required this.prenom,
    required this.email,
  });

  //convertir un objet redacteur en map
  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'prenom': prenom, 'email': email};
  }

  // Définissez la méthode fromMap pour créer un Utilisateur à partir d'un Map
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
    );
  }
}
