part of './bloc.dart';

/// Represents a user in the application.
class AppUser extends Model {
  ///unique id of the current user
  final String userID;

  ///token expires in
  final int? expiresIn;

  /// scope of the current user
  final String? scope;

  ///tenant name of the current user
  final String? tenantName;
  ///User name
  final String? userName;
///User type
  final String? userType;
  /// token type
  final String tokenType;
  /// access token
  final String accessToken;
  /// refresh token
  final String? refreshToken;
  ///Constructor
  AppUser({
    required this.userID,
    required this.accessToken,
    required this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.tenantName,
    this.userName,
    this.userType,
  });

  ///Creates AppUser from the [Json] result
  factory AppUser.fromJson(Json json,) {
    return AppUser(
      userID: json.safeString('user_id'),
      accessToken: json.safeString('access_token'),
      tokenType: json.safeString('token_type'),
      expiresIn: json.safeInt('expires_in'),
      refreshToken: json.safeString('refresh_token'),
      scope: json.safeString('scope'),
      tenantName: json.safeString('tenant_name'),
      userName: json.safeString('user_name'),
      userType: json.safeString('user_type'),
      
    );
  }

  @override
  Json get toJson => <String, dynamic>{
        'user_id': userID,
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
        'refresh_token': refreshToken,
        'scope': scope,
        'tenant_name': tenantName,
        'user_name': userName,
        'user_type': userType,
      
      };

  @override
  AppUser copyWith({
    String? userID,
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    String? refreshToken,
    String? scope,
    String? tenantName,
    String? userName,
    String? userType,
  }) {
    return AppUser(
      userID: userID??this.userID,
      accessToken: accessToken??this.accessToken,
      tokenType: tokenType??this.tokenType, 
      expiresIn: expiresIn??this.expiresIn,
      refreshToken: refreshToken??this.refreshToken,
      scope: scope??this.scope,
      tenantName: tenantName??this.tenantName,
      userName: userName??this.userName,
      userType: userType??this.userType,
    );
  }

  ///When the data is not yet loaded from server, this will be used to show loading indication
  static AppUser checking = AppUser(
    userID: 'checking',
    tokenType: 'checking',
    accessToken: 'checking',
  );

  ///When the data is not found, this will be returned
  static AppUser notFound = AppUser(
    userID: '',
    tokenType: 'notFound',
    accessToken: 'notFound',
  
  );
}
