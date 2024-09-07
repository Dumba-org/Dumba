
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rekhdekh/models/user.dart' as model_user;
import 'package:rekhdekh/resources/storagemethods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get current user details
  Future<model_user.User?> getCurrentUserDetails() async {
    //get the current user from firebase auth
    User? currentUser = _auth.currentUser;
    //get the current user from firestore using the user id
    DocumentSnapshot userSnap =
        await _firestore.collection('users').doc(currentUser!.uid).get();






    //return the user object created from the snapshot of firestore database
    return model_user.User.fromSnap(userSnap);
  }

  //signup user
  Future signUpUser({
    //required keyword is used to make sure that the value is passed to the function
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List? profileImage,
  }) async {
    String res = "some error occured";
    try {
      //check if any of the fields are empty
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          profileImage != null) {
        //register user
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint(userCredential.user!.uid);

        //upload image to storage and get the url of the image uploaded to storage bucket in firebase storage bucket with child name as ProfilePictures and user id as folder name in which file will be uploaded and isPost as false as it is profile picture not post image
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('ProfilePictures', profileImage!, false);

        //add user to firestore database with user id as document id and user data as map object with all the fields of user object

        //create user object with all the fields of user object
        model_user.User user = model_user.User(
            uid: userCredential.user!.uid,
            email: email,
            username: username,
            password: password,
            bio: bio,
            photoUrl: photoUrl,
            );

        //convert user object to map object to store in firestore database
        await _firestore.collection('users').doc(userCredential.user!.uid).set(
              user.toJSON(),
            );
        res = 'success';
      }
    } catch (e) {
      //
      res = e.toString();
    }
    return res;

    // try {
    //   await _auth.createUserWithEmailAndPassword(email: email, password: password);
    //   return null;
    // } on FirebaseAuthException catch (e) {
    //   return e.message;
    // }
  }

  //sign in user
  Future signInUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter email and password";
      }
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
      return e.message;
    }
    return res;
  }
}