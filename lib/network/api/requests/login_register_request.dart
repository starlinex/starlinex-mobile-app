class LoginRegisterRequest {

  String? name;
  String? email;
  String? phone;
  String? password;
  String? deviceType;
  String? fcmToken;
  String? userId;
  String? otp;

  LoginRegisterRequest(
      {
        this.name,
        this.email,
        this.phone,
        this.password,
        this.deviceType,
        this.fcmToken,
        this.userId,
        this.otp,
      });
}
