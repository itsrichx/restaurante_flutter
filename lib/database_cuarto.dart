import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseCuarto {
  static final DatabaseCuarto _instance = DatabaseCuarto._internal();
  factory DatabaseCuarto() => _instance;
  DatabaseCuarto._internal();

  static Database? _database;

  Future<Database> get database async{
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

    //sirve para conectar la base de datos en la ruta correrta, y se abre la base
  Future<Database> _initDatabase() async{
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      );
  }
  Future<void> _onCreate(Database db, int  version) async{
  await db.execute('''
  CREATE TABLE clientes(
    id INTERGER PRIMARY KEY AUTOINCREMENT,
    apellido TEXT,
    nombre TEXT,
    correo TEXT,
    telefono TEXT
  )
  '''
  );
  }

  Future<int> insertClient(Map<String, dynamic> client) async{
  try{
    Database db = await database;
    return await db.insert('clientes', client);
  } catch (e) {
    print('Error al insertar cliente: $e');
    rethrow;
  }
  }
}




