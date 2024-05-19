class LoginParams {
  final String username;
  final String password;

  LoginParams({
    required this.username,
    required this.password,
  });
}

// class LoginUseCase implements UseCase<User?, LoginParams> {
//   final UserRepository _userRepository;

//   LoginUseCase(this._userRepository);

//   @override
//   Future<User?> call({required LoginParams params}) async {
//     return _userRepository.login(params);
//   }
// }
