import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = StateProvider<UserData>((ref) => UserData());

class UserData extends StateNotifier<User?> {
  UserData() : super(FirebaseAuth.instance.currentUser);

  User? getUserData() {
    return state;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
