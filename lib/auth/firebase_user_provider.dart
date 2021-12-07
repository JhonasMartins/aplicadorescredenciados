import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AplicadoresCredenciadosFirebaseUser {
  AplicadoresCredenciadosFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AplicadoresCredenciadosFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AplicadoresCredenciadosFirebaseUser>
    aplicadoresCredenciadosFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AplicadoresCredenciadosFirebaseUser>(
            (user) => currentUser = AplicadoresCredenciadosFirebaseUser(user));
