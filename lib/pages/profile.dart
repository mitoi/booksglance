import 'package:book_glance/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:book_glance/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignInPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final newContext = context;

    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _user.displayName!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        IconButton(
            onPressed: () async {
              setState(() {});
              await Authentication.signOut(context: context);
              setState(() {});
              // ignore: use_build_context_synchronously
              Navigator.of(newContext).pushReplacement(_routeToSignInScreen());
            },
            icon: const Icon(Icons.logout))
      ]),
    );
  }
}
