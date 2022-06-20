import 'package:equatable/equatable.dart';
import 'package:explodier/infrastructures/models/balance/balance_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState extends Equatable {
  final AsyncValue<BalanceModel> balance;

  const HomeState({
    required this.balance,
  });

  HomeState copyWith({
    AsyncValue<BalanceModel>? balance,
  }) {
    return HomeState(
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [balance];
}
