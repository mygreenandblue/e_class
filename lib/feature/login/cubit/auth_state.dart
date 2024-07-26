part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  const AuthState();
  bool get isAuthenticated =>
      switch (this) { Authenticated() => true, _ => false };
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState with EquatableMixin {
  final String token;

  Authenticated({required this.token});

  @override
  List<Object?> get props => [token];
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}
