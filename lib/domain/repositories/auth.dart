import '../../data/data_sources/http_source.dart';
import '../../data/models/Widgets/httpResult.dart';
import '../apiUrls.dart';

/// auth repository
class AuthRepository {
  /// private constructor
  AuthRepository._privateConstructor();
  static final AuthRepository _instance = AuthRepository._privateConstructor();

  ///To access the repo quickly
  static AuthRepository get instance => _instance;

  /// get http service
  HttpService get service => HttpService.instance;

  /// login
  Future<HttpResult> login(String username, String password) async {
    print('login working===');
    final Map<String, String> _body = {
      'username': username,
      'password': password,
      'grant_type': 'password',
    };
    print(_body);
    final response = await service.postRequest(Apiurls.login, _body);
    
    return response;
  }
}
