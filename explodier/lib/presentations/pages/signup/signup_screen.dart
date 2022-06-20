import 'package:explodier/features/signup/signup_controller.dart';
import 'package:explodier/presentations/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellcome'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Column(
            children: [
              Form(
                key: formKey,
                child: Stepper(
                  currentStep: ref.watch(signupCtrlProvider).currentStep,
                  onStepTapped: (stepIndex) {
                    ref.read(signupCtrlProvider.notifier).jump(stepIndex);
                  },
                  onStepCancel: () {
                    ref.read(signupCtrlProvider.notifier).cancel();
                  },
                  onStepContinue: () {
                    ref.read(signupCtrlProvider.notifier).confirm();
                  },
                  steps: <Step>[
                    Step(
                      title: const Text('What is your name?'),
                      subtitle:
                          const Text('How would you like us to call you?'),
                      content: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Step(
                      title: const Text('What is your email?'),
                      subtitle: const Text('yaya?'),
                      content: TextFormField(),
                    ),
                    Step(
                      title: const Text('What is your wallet address?'),
                      subtitle: const Text('This will only be stored locally'),
                      content: TextFormField(),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // if (!formKey.currentState!.validate()) return;

                  context.goNamed(HomePage().name);
                },
                child: const Text('Sign up'),
              ),
            ],
          );
        },
      ),
    );
  }
}
