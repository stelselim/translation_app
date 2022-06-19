import 'package:translation/domain/user_service_domain.dart';

// Singleton
class UserService extends UserServiceDomain {
  UserService._();
  UserService instance = UserService._();
}
