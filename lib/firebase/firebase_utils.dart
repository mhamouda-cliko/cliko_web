import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class FirebaseUtils {
  static CollectionReference<MyUserAdmin> getUserCollections() {
    return FirebaseFirestore.instance.collection("Users").withConverter<MyUserAdmin>(
          fromFirestore: (snapshot, options) =>
              MyUserAdmin.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addUserToFirestore(MyUserAdmin myUserAdmin){
   var docRef= getUserCollections().doc();
   myUserAdmin.id=docRef.id;
   return docRef.set(myUserAdmin);
  }
  static Stream<QuerySnapshot<MyUserAdmin>> getUserFromFirebase(){
   return  getUserCollections().snapshots();
  }

  static Future<void> deleteUserFromFirebase(String id){
    return  getUserCollections().doc(id).delete();
  }
}
