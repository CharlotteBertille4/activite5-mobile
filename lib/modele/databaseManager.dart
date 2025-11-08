import 'package:activite1/modele/redacteur.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  //declaration des propriétes statiques
  static Database? _database;
  static const String _databaseName = "redacteurs.db";
  static const int _databaseVersion = 1;

  static const String tableRedacteurs = 'redacteurs';
  static const String columnId = 'id';
  static const String columnNom = 'nom';
  static const String columnPrenom = 'prenom';
  static const String columnEmail = 'email';

  //Eviter de repeter la base de donnees et conserver la connexion
  DatabaseManager._privateConstructor();

  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //initialisation de la base de donnees
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  //creation de la table redacteur
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableRedacteurs (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnNom TEXT NOT NULL,
      $columnPrenom TEXT NOT NULL,
      $columnEmail TEXT NOT NULL
    )
  ''');
  }

  //lister tous les rédacteurs
  Future<List<Redacteur>> getAllRedacteurs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableRedacteurs);
    return List.generate(maps.length, (i) {
      return Redacteur.fromMap(maps[i]);
    });
  }

  //insérer un redacteur
  Future<int> insertRedacteur(Redacteur redacteur) async {
    Database db = await instance.database;
    return await db.insert(tableRedacteurs, redacteur.toMap());
  }

  //mettre à jour un utilisateur
  Future<int> updateRedacteur(Redacteur redacteur) async {
    Database db = await instance.database;
    return await db.update(
      tableRedacteurs,
      redacteur.toMap(),
      where: '$columnId = ?',
      whereArgs: [redacteur.id],
    );
  }

  //supprimer un utilisateur
  Future<int> deleteRedacteur(int id) async {
    Database db = await instance.database;
    return await db.delete(
      tableRedacteurs,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  //Fermer la connexion à la BD
  Future<void> close() async {
    Database db = await instance.database;
    db.close();
  }

  // Future<void> initialisation() async {
  //   _database = await openDatabase(
  //     join(await getDatabasesPath(), _databaseName),
  //     onCreate: (db, version) {
  //       return db.execute('''
  //         CREATE TABLE redacteurs(
  //           id INTEGER PRIMARY KEY AUTOINCREMENT,
  //           nom TEXT,
  //           prenom TEXT,
  //           email TEXT
  //         )
  //         ''');
  //     },
  //     version: _databaseVersion,
  //   );
  // }
}
