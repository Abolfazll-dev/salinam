import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:salinam/Utill/Auth_manager.dart';
import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/Utill/dio_provider.dart';

abstract class IAuthenticationDataSource {
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
    String name,
    String email,
  );

  Future<String> login(String username, String password);
}

class AuthenticationRemote implements IAuthenticationDataSource {
  final Dio _dio = DioProvider.createDioWithoutHeader();

  @override
  Future<void> register(
      String username, String password, String passwordConfirm,String name, String email,) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'name': name,
        'email': email,
      });
      if (response.statusCode == 200) {
        AuthManager.saveId(response.data?['id']);
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      var response =
          await _dio.post('collections/users/auth-with-password', data: {
        'identity': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        AuthManager.saveId(response.data?['record']['id']);
        return response.data?['token'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
    return '';
  }
}
