import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  /// 總共有幾個步驟
  final int stepLength;

  /// 目前在的步驟index
  final int currentStep;

  const SignupState({
    this.currentStep = 0,
    this.stepLength = 3,
  });

  SignupState copyWith({
    int? currentStep,
    int? stepLength,
  }) {
    return SignupState(
      currentStep: currentStep ?? this.currentStep,
      stepLength: stepLength ?? this.stepLength,
    );
  }

  @override
  List<Object?> get props => [currentStep, stepLength];
}
