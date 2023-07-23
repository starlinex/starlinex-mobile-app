import '../../network/api/api_response.dart';
import '../../network/api/models/register_model.dart';
import '../../network/api/requests/login_register_request.dart';

abstract class AppDataSource{

  Future<ApiResponse<RegisterModel>> emailLogin(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> register(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> verifyOtp(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> resetPassword(LoginRegisterRequest request);

  Future<ApiResponse<RegisterModel>> forgotPassword(LoginRegisterRequest request);


}