import 'package:get/get.dart';
import '../app/app_repository.dart';
import '../network/api/api_response.dart';
import '../network/api/models/register_model.dart';
import '../network/api/models/reset_password_model.dart';
import '../network/api/requests/login_register_request.dart';
import '../network/provider/service_locator.dart';

class LoginRegisterController extends GetxController {

  var name = Rxn();
  var email = Rxn();
  var phone = Rxn();
  var password = Rxn();
  var userId = Rxn();
  var otp = Rxn();
  var mLoading = false.obs;

  Future<ApiResponse<RegisterModel>> emailLogin() async {
    var request = LoginRegisterRequest(
        email: email.value,
        password: password.value);
    var response = await locator<AppRepository>().emailLogin(request);
    if (response.isSuccess()) {
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }

  Future<ApiResponse<RegisterModel>> register() async {
    var request = LoginRegisterRequest(
        name: name.value,
        email: email.value,
        phone: phone.value,
        password: password.value);
    var response = await locator<AppRepository>().register(request);
    if (response.isSuccess()) {
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }

  Future<ApiResponse<RegisterModel>> verifyOtp(String pin, String? userId) async {
    var request=LoginRegisterRequest(otp: pin.toString(),userId: userId);
    var response=await locator<AppRepository>().verifyOtp(request);
    if(response.isSuccess()){
      return ApiResponse.success(response.data());
    }else{
      return ApiResponse.error(response.error());
    }
  }

  Future<ApiResponse<ResetPasswordModel>> resetPassword(
      ) async {
    var request = LoginRegisterRequest(
        userId: userId.value,
        otp: otp.value,
        password: password.value
    );
    var response = await locator<AppRepository>().resetPassword(request);
    if (response.isSuccess()) {
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }

  Future<ApiResponse<RegisterModel>> forgetPassword(
      ) async {
    var request = LoginRegisterRequest(
        email: email.value
    );
    var response = await locator<AppRepository>().forgotPassword(request);
    if (response.isSuccess()) {
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }



}
