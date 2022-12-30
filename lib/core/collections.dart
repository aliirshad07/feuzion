import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
CollectionReference newsCollection = FirebaseFirestore.instance.collection("news");