import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  // properties of user class
  final String uid;
  final String email;
  final String username;
  final String password;
  final String bio;
  final String photoUrl;


  // constructor of user class
  User({
    required this.uid,
    required this.email,
    required this.username,
    required this.password,
    required this.bio,
    required this.photoUrl,
   
  });

  //toJSON method to convert user object to map object to store in firestore database
  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'password': password,
      'bio': bio,
      'photoUrl': photoUrl,
      
    };
  }

//factory constructor to create user object from snapshot of firestore database
  static User fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapShot['uid'],
      email: snapShot['email'],
      username: snapShot['username'],
      password: snapShot['password'],
      bio: snapShot['bio'],
      photoUrl: snapShot['photoUrl'],
     
    );
  }
}
