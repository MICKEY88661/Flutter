import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  final int currentPageIndex;
  final PageController pageController;
  final String userName;

  const HomeState({
    this.currentPageIndex = 0,
    this.userName = "",
    required this.pageController,
  });

  HomeState copyWith({
    int? currentPageIndex,
    PageController? pageController,
    String? userName,
  }) {
    return HomeState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pageController: pageController ?? this.pageController,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [currentPageIndex, pageController, userName];
}
