import 'package:cloud_firestore/cloud_firestore.dart';

const String USER_COLLECTION = "user";
const String CHAT_COLLECTION = "chat";

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  DatabaseService() {}
}
