import 'package:explodier/presentations/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        children: [
          const Text('What\'s your name?'),
          Consumer(
            builder: (context, ref, child) {
              return Form(
                key: formKey,
                child: TextFormField(),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;

              context.goNamed(HomePage().name);
            },
            child: const Text('Sign in'),
          ),
        ],
      ),
    );
  }
}
