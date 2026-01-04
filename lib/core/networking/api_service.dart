import 'package:advanced_flutter_project/core/networking/api_constants.dart';
import 'package:advanced_flutter_project/features/login/data/models/login_request_body.dart';
import 'package:advanced_flutter_project/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart'; // << عشان يعمل فيه  generation

// after any edit in this file i should regenerate
@RestApi(
  baseUrl: ApiConstants.apiBaseURL,
) // retrofit annotation (gives it the base URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Login API
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}

// عملت ل dio >> inject جوا ال apiService
