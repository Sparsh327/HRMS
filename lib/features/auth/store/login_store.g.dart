// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$isLoginLoadingAtom = Atom(name: 'LoginStoreBase.isLoginLoading');

  @override
  bool get isLoginLoading {
    _$isLoginLoadingAtom.reportRead();
    return super.isLoginLoading;
  }

  @override
  set isLoginLoading(bool value) {
    _$isLoginLoadingAtom.reportWrite(value, super.isLoginLoading, () {
      super.isLoginLoading = value;
    });
  }

  final _$isOtpLoadingAtom = Atom(name: 'LoginStoreBase.isOtpLoading');

  @override
  bool get isOtpLoading {
    _$isOtpLoadingAtom.reportRead();
    return super.isOtpLoading;
  }

  @override
  set isOtpLoading(bool value) {
    _$isOtpLoadingAtom.reportWrite(value, super.isOtpLoading, () {
      super.isOtpLoading = value;
    });
  }

  final _$isAlreadyAuthenticatedAsyncAction =
      AsyncAction('LoginStoreBase.isAlreadyAuthenticated');

  @override
  Future<bool> isAlreadyAuthenticated(BuildContext context) {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated(context));
  }

  final _$signInWithEmailPassAsyncAction =
      AsyncAction('LoginStoreBase.signInWithEmailPass');

  @override
  Future<void> signInWithEmailPass(
      BuildContext context, String email, String pass) {
    return _$signInWithEmailPassAsyncAction
        .run(() => super.signInWithEmailPass(context, email, pass));
  }

  final _$signOutAsyncAction = AsyncAction('LoginStoreBase.signOut');

  @override
  Future<void> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('LoginStoreBase.signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  @override
  String toString() {
    return '''
isLoginLoading: ${isLoginLoading},
isOtpLoading: ${isOtpLoading}
    ''';
  }
}
