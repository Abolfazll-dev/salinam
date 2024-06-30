
import 'package:dartz/dartz.dart';
import 'package:salinam/Utill/Auth_manager.dart';
import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/dataSource/authentication_DataSource.dart';
import 'package:salinam/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthenticationRepository {
  // Register

  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
    String name,
    String email,
  );

  // Login

  Future<Either<String, String>> login(
    String username,
    String password,
  );
}

class AuthenticationRepository extends IAuthenticationRepository {
  final IAuthenticationDataSource _dataSource = locator.get();
  final SharedPreferences _sharedPref = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm,String name, String email) async {
    try {
      await _dataSource.register(username, password, passwordConfirm,name,email);
      return right('ثبت نام با موفقیت انجام شد !');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _dataSource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شدید');
      } else {
        return left('خطایی در ورود رخ داده است');
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}
