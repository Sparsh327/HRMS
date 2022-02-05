import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../dashboard/ui/dashboard.dart';
import '../../landing_page/landing_page.dart';
import 'repo/login_repo.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

final _loginRepo = LoginRepository();

abstract class LoginStoreBase extends ChangeNotifier with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  bool isLoginLoading = false;

  @observable
  bool showPassword = false;

  User? firebaseUser;

  @action
  Future<bool> isAlreadyAuthenticated(BuildContext context) async {
    firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      final DocumentSnapshot dc = await FirebaseFirestore.instance
          .collection("listOfCompanies")
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

  @action
  Future<void> registerWithEmailPass({
    required BuildContext context,
    required String email,
    required String pass,
    required String name,
    required String companyName,
  }) async {
    isLoginLoading = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: pass.trim(),
      )
          .then((authResult) {
        if (authResult.user != null) {
          isLoginLoading = false;
          verifyEmail(authResult.user!);
          _loginRepo.uploadOneTimeLoginDetail(
            name: name,
            email: email,
            id: authResult.user!.uid,
            nameOfCompany: companyName,
          );
        } else {
          isLoginLoading = false;
          // showToast(authResult.);
          showToast("Something Went Wrong");
        }
      });
    } on FirebaseAuthException catch (error) {
      // await showToast(error.toString());
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
        case "email-already-in-use":
          await showToast("User with this email already registered.");
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          await showToast("Your password is incorrect.");
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          await showToast("User with this email doesn't exist.");
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          await showToast("User with this email has been disabled.");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "too-many-requests":
          await showToast("Too many requests. Try again later.");
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          await showToast("Signing in with Email and Password is not enabled.");
          break;
        default:
          await showToast("Registered with social accounts.");
      }
      isLoginLoading = false;
    }
  }

  @action
  Future<void> verifyEmail(User user) async {
    await user.sendEmailVerification();
    await showToast(
      "Verify your email & then please login with your credentials",
    );
    await _auth.signOut();
  }

  Future<void> onAuthenticationSuccessful(
    BuildContext context,
    User user,
  ) async {
    isLoginLoading = false;

    firebaseUser = user;
    if (user.emailVerified) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashBoardScreen()),
        (route) => false,
      );
      isLoginLoading = false;
    } else {
      await _auth.signOut();
      await Fluttertoast.showToast(
        msg: 'Please complete the verification',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        textColor: Colors.white,
        fontSize: 14,
      );
    }
  }

  @action
  Future<void> signInWithEmailPass({
    required BuildContext context,
    required String email,
    required String pass,
  }) async {
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
      timeInSecForIosWeb: 5,
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
