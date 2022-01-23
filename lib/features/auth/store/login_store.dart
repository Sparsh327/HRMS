import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../dashboard/ui/dashboard.dart';
import '../../landing_page/landing_page.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase extends ChangeNotifier with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  bool isLoginLoading = false;

  @observable
  bool isOtpLoading = false;

  User? firebaseUser;

  @action
  Future<bool> isAlreadyAuthenticated(BuildContext context) async {
    firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      final DocumentSnapshot dc = await FirebaseFirestore.instance
          .collection("Admin")
          .doc(firebaseUser!.uid)
          .get();

      if (dc.exists) {
        return true;
      } else {
        return false;
      }

      // await Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
    } else {
      // _auth.signOut();
      // await Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);

      return false;
    }
  }

  Future<void> onAuthenticationSuccessful(
    BuildContext context,
    User user,
  ) async {
    isLoginLoading = false;
    isOtpLoading = false;
    firebaseUser = user;

    final DocumentSnapshot dc = await FirebaseFirestore.instance
        .collection("Admin")
        .doc(user.uid)
        .get();

    if (dc.exists) {
      // ignore: use_build_context_synchronously
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashBoardScreen()),
        (route) => false,
      );
      isLoginLoading = false;
    } else {
      await _auth.signOut();
      // ignore: use_build_context_synchronously
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LandingPage()),
        (route) => false,
      );
      isLoginLoading = false;
    }
  }

  @action
  Future<void> signInWithEmailPass(
    BuildContext context,
    String email,
    String pass,
  ) async {
    try {
      isLoginLoading = true;
      await _auth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: pass.trim(),
      )
          .then((authResult) {
        if (authResult.user != null) {
          onAuthenticationSuccessful(context, authResult.user!);
        } else {
          showToast("Something Went Wrong");
          isLoginLoading = false;
        }
      });
    } on Exception catch (error) {
      isLoginLoading = false;
      switch (error.toString()) {
        case "email-already-in-use":
          // ignore: avoid_print
          await showToast("User with this email already regsiterd.");
          break;
        case "wrong-password":
          // ignore: avoid_print
          await showToast("Your password is wrong.");
          break;
        case "user-not-found":
          // ignore: avoid_print
          await showToast("User with this email doesn't exist.");
          break;
        case "user-disabled":
          // ignore: avoid_print
          await showToast("User with this email has been disabled.");
          break;
        case "too-many-requests":
          await showToast("Too many requests. Try again later.");
          break;
        case "operation-not-allowed":
          await showToast("Signing in with Email and Password is not enabled.");
          break;
        default:
          await showToast('Pls Check your details');
      }
    }
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    // ignore: use_build_context_synchronously
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LandingPage()),
      (route) => false,
    );
  }

  Future<bool?> showToast(String msg) {
    return Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      webBgColor: 'linear-gradient(to right,#333333,#333333)',
      webPosition: 'center',
    );
  }

  @action
  Future<void> signInWithGoogle() async {
    // Initialize Firebase

    User? user;

    // The `GoogleAuthProvider` can only be used while running on the web
    final GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(authProvider);

      user = userCredential.user;
      // print(user!.uid);
    } on Exception catch (error) {
      await showToast(error.toString());
    }

    if (user != null) {}
  }
}
