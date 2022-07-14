import 'package:explodier/infrastructures/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository.dart';

final userRepoProvider = Provider<IUserRepostory>((ref) {
  return UserRepostory();
});

abstract class IUserRepostory {
  Future<void> signup(UserModel user);
  Future<UserModel?> signin(String email);
  Future<void> signout();
  UserModel get currentUser;
}

class UserRepostory extends Repository implements IUserRepostory {
  List<UserModel> users = [
    UserModel(
      name: "demo-user",
      walletAddress: "0x5682035b6b1d04924c7661b09a974ff0695de6be",
      //0x5682035b6b1d04924c7661b09a974ff0695de6be
      //"0x627b321592a34D29AD5881274BB7a71Cedf5CD3C",
      //"0x3CAb982C10ca41f1a1992815b9185375c472cedc",
      email: "demo.gmail.com",
    )
  ];

  @override
  UserModel get currentUser => users.first;

  @override
  Future<UserModel?> signin(String email) async {
    await Future.delayed(const Duration(seconds: 3));

    for (var user in users) {
      if (user.email == email) return user;
    }

    return null;
  }

  @override
  Future<void> signout() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> signup(UserModel user) async {
    await Future.delayed(const Duration(seconds: 3));
    users.add(user);
  }
}
