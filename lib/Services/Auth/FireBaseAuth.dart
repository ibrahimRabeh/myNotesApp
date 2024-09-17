import 'package:mynewappmynotes/Services/Auth/AuthUser.dart';
import 'package:mynewappmynotes/Services/Auth/Auth_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:mynewappmynotes/Services/Auth/auth_exceptions.dart';
import 'package:mynewappmynotes/Components/HandleSigninUpErrors.dart';

class FirebBaseAuth implements AuthProvider {
  @override
  // ignore: non_constant_identifier_names
  Future<AuthUser> CreateUser({required email, required password}) async {
    try {
      await FirebaseAuth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;

      if (user != null)
        return user;
      else
        throw UserNotLoggedInAuthException();
    } on FirebaseAuth.FirebaseAuthException catch (e) {
      handleFirebaseError(e);
      throw GenericAuthException(); // Ensure an exception is thrown
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<AuthUser> LogIn({required email, required password}) async {
    try {
      await FirebaseAuth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;

      if (user != null)
        return user;
      else
        throw UserNotFoundAuthException();
    } on FirebaseAuth.FirebaseAuthException catch (e) {
      handleFirebaseError(e);
      throw GenericAuthException(); // Ensure an exception is thrown
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<void> LogOut() async {
    try {
      await FirebaseAuth.FirebaseAuth.instance.signOut();
    } on FirebaseAuth.FirebaseAuthException catch (e) {
      handleFirebaseError(e);
      throw GenericAuthException(); // Ensure an exception is thrown
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<void> SendEmailVerification() async {
    try {
      final user = await FirebaseAuth.FirebaseAuth.instance.currentUser;
      if (user != null) {
        user.sendEmailVerification();
      } else
        throw UserNotFoundAuthException();
    } on FirebaseAuth.FirebaseAuthException catch (e) {
      handleFirebaseError(e);
      throw GenericAuthException(); // Ensure an exception is thrown
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.FirebaseAuth.instance.currentUser;
    if (user != null)
      return AuthUser.fromFireBase(user);
    else
      return null;
  }

  Future<void> reload() async {
    try {
      final user = await FirebaseAuth.FirebaseAuth.instance.currentUser;
      user!.reload();
    } on FirebaseAuth.FirebaseAuthException catch (e) {
      handleFirebaseError(e);
    } catch (e) {
      GenericAuthException();
    }
  }
}
