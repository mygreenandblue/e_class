part of 'home_cubit.dart';

class HomeState {
  const HomeState();
  bool get isLoaded => switch (this) { Loaded() => true, _ => false };
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class Loaded extends HomeState with EquatableMixin {
  final UserModel userModel;

  Loaded({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class UnLoaded extends HomeState {}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}

class GetListUser extends HomeState with EquatableMixin {
  final List<UserModel> userModels;

  GetListUser({required this.userModels});

  @override
  List<Object?> get props => [userModels];
}
