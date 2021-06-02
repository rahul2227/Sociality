import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance
        .collection("users")
        .add(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  // Future<Void> addQueast(userQuestMap) async {
  // Map<String, String> userQuestMap = {
  //   "title": "quest title",
  //   "description": "quest description",
  //   "users": "üsers of the quest array solve this" // TODO
  // };

  //   FirebaseFirestore.instance
  //       .collection("quests")
  //       .add(userQuestMap)
  //       .catchError((e) {
  //     print(e.toString());
  //   });
  // }

  Future<Void> addDBTask(taskMap) async {
    FirebaseFirestore.instance
        .collection("Misc_Task")
        .add(taskMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  // searchByName(String searchField) {
  //   return FirebaseFirestore.instance
  //       .collection("users")
  //       .where('name', isEqualTo: searchField)
  //       .getDocuments();
  // }
}
