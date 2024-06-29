import 'package:http/http.dart' as http;

import '../models/Widgets/httpResult.dart';

/// api service
class HttpService {
  HttpService._privateConstructor();
  static final HttpService _instance = HttpService._privateConstructor();

  ///To access the repo quickly
  static HttpService get instance => _instance;

  /// client
  final client = http.Client();

  final Map<String, String> _headers = {
    'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  /// Makes a GET request to the specified path and returns the response.
  ///
  /// The `path` parameter specifies the URL to make the request to.
  ///
  /// Returns a `Future` that completes with the response from the server.
  Future<HttpResult> getRequest(
    String path,
  ) async {
    print(path);
    final response = await client.get(Uri.tryParse(path)!, headers: _headers);
    return _getResult(response);
  }

  /// Makes a POST request to the specified path and returns the response.
  ///
  /// The `path` parameter specifies the URL to make the request to.
  ///
  /// The `body` parameter is the data to be sent in the request.
  Future<HttpResult> postRequest(String path, [Map? body]) async {
    final response = await client.post(Uri.tryParse(path)!,
        headers: _headers, body: body);

    return _getResult(response);
  }

  /// Makes a PUT request to the specified path and returns the response.
  ///
  /// The `path` parameter specifies the URL to make the request to.
  ///
  /// The `body` parameter is the data to be sent in the request.
  ///
  /// Returns a `Future` that completes with the response from the server.
  Future<HttpResult> putRequest(String path, [Map? body]) async {
    final response =
        await client.put(Uri.tryParse(path)!, body: body, headers: _headers);
    return _getResult(response);
  }

  /// Makes a DELETE request to the specified path and returns the response.
  ///
  /// The `path` parameter specifies the URL to make the request to.
  ///
  /// Returns a `Future` that completes with the response from the server.
  Future<dynamic> deleteRequest(
    String path,
  ) async {
    final response =
        await client.delete(Uri.tryParse(path)!, headers: _headers);
    return _getResult(response);
  }

  /// Creates an instance of `HttpResult` by extracting the status code, reason phrase, and response body from the given `http.Response` object.
  ///
  /// Parameters:
  /// - `response`: The `http.Response` object from which to extract the information.
  ///
  /// Returns:
  /// - An instance of `HttpResult` with the extracted information.
  static HttpResult _getResult(http.Response response) {
    return HttpResult.create(
      code: response.statusCode,
      message: response.reasonPhrase,
      responseString: response.body,
    );
  }
}
