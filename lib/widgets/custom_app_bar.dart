import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_app/screens/homepage.dart';
import 'package:valorant_app/provider/authentication_provider.dart';
import 'package:valorant_app/service/authentication.dart';

import '../service/login.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? username;

  const CustomAppBar({Key? key, this.username}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.red),
      actions: [
        authState.when(
            data: (userData) {
              if (userData != null) return _userNameWidget(context, userData);
              return _loginWidget(context);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, trace) => const Text('Invalid User Data')),
      ],
    );
  }

  Padding _loginWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginApp())),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 4),
            Text(
              'Login',
            ),
            Icon(Icons
                .login), // Display username if available, otherwise display 'Login'
          ],
        ),
      ),
    );
  }

  Padding _userNameWidget(BuildContext context, User user) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          Authentication().signOut(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4),
            Text(user.email!),
            const Icon(Icons
                .email), // Display username if available, otherwise display 'Login'
          ],
        ),
      ),
    );
  }
}
