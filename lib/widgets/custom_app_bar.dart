import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_app/provider/user_data_provider.dart';

import '../login.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? username;

  const CustomAppBar({Key? key, this.username}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDataProvider);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.red),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              if (user?.getUserData() == null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginApp()));
              } else {
                user?.logout();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),

                Text(
                  user?.getUserData()?.email ?? 'Login',
                ),
                const Icon(Icons
                    .login), // Display username if available, otherwise display 'Login'
              ],
            ),
          ),
        ),
      ],
    );
  }
}
