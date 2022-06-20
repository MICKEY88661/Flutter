import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'signup_state.dart';

final signupCtrlProvider =
    StateNotifierProvider.autoDispose<SignupController, SignupState>((ref) {
  return SignupController(
    const SignupState(),
  );
});

class SignupController extends StateNotifier<SignupState> {
  SignupController(
    SignupState state,
  ) : super(state);

  void cancel() {
    final int currentStep = state.currentStep;
    if (currentStep < 1) return;
    state = state.copyWith(currentStep: currentStep - 1);
  }

  void confirm() {
    final int currentStep = state.currentStep;
    if (currentStep >= state.stepLength - 1) return;
    state = state.copyWith(currentStep: currentStep + 1);
  }

  void jump(int destination) {
    if (destination < 0 || destination > state.stepLength - 1) return;
    state = state.copyWith(currentStep: destination);
  }
}
