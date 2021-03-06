import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser;
      final String? uid = user?.uid;

      // print("user id:" + uid!);

      final String? name = user?.displayName;
      final String? email = user?.email;
      List<String>? aux = name?.split(" ");
      final docUser =
          FirebaseFirestore.instance.collection('PetOwner').doc(uid);
      final json = {
        'Email': email,
        'Name': aux![0],
        'Lastname': aux[1],
      };
      docUser.set(json);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    if (googleSignIn.currentUser != null) {
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.signOut();
  }
}
