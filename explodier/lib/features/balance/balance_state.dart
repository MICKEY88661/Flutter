import 'package:equatable/equatable.dart';
import 'package:explodier/infrastructures/models/balance/balance_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceState extends Equatable {
  final AsyncValue<BalanceModel> balance;

  const BalanceState({
    required this.balance,
  });

  BalanceState copyWith({
    AsyncValue<BalanceModel>? balance,
  }) {
    return BalanceState(
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [balance];
}
