import '../../provider/api.dart';

class AuthRepository {
  final MyApi api;

  AuthRepository(this.api);

  login(data) => api.login(data);
}