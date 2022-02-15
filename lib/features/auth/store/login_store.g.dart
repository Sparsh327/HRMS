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

  final _$showPasswordAtom = Atom(name: 'LoginStoreBase.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$employeLoadingAtom = Atom(name: 'LoginStoreBase.employeLoading');

  @override
  bool get employeLoading {
    _$employeLoadingAtom.reportRead();
    return super.employeLoading;
  }

  @override
  set employeLoading(bool value) {
    _$employeLoadingAtom.reportWrite(value, super.employeLoading, () {
      super.employeLoading = value;
    });
  }

  final _$isAlreadyAuthenticatedAsyncAction =
      AsyncAction('LoginStoreBase.isAlreadyAuthenticated');

  @override
  Future<bool> isAlreadyAuthenticated(BuildContext context) {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated(context));
  }

  final _$registerWithEmailPassAsyncAction =
      AsyncAction('LoginStoreBase.registerWithEmailPass');

  @override
  Future<void> registerWithEmailPass(
      {required BuildContext context,
      required String email,
      required String pass,
      required String name,
      required String companyName}) {
    return _$registerWithEmailPassAsyncAction.run(() => super
        .registerWithEmailPass(
            context: context,
            email: email,
            pass: pass,
            name: name,
            companyName: companyName));
  }

  final _$verifyEmailAsyncAction = AsyncAction('LoginStoreBase.verifyEmail');

  @override
  Future<void> verifyEmail(User user) {
    return _$verifyEmailAsyncAction.run(() => super.verifyEmail(user));
  }

  final _$signInWithEmailPassAsyncAction =
      AsyncAction('LoginStoreBase.signInWithEmailPass');

  @override
  Future<void> signInWithEmailPass(
      {required BuildContext context,
      required String email,
      required String pass}) {
    return _$signInWithEmailPassAsyncAction.run(() =>
        super.signInWithEmailPass(context: context, email: email, pass: pass));
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

  final _$employeeLoginAsyncAction =
      AsyncAction('LoginStoreBase.employeeLogin');

  @override
  Future<void> employeeLogin(
      {required String email, required String password}) {
    return _$employeeLoginAsyncAction
        .run(() => super.employeeLogin(email: email, password: password));
  }

  @override
  String toString() {
    return '''
isLoginLoading: ${isLoginLoading},
showPassword: ${showPassword},
employeLoading: ${employeLoading}
    ''';
  }
}
