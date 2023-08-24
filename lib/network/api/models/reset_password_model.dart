/// responseCode : 200
/// message : "Success"
/// response : "Password changed successfully"

class ResetPasswordModel {
  ResetPasswordModel({
      this.responseCode, 
      this.message, 
      this.response,});

  ResetPasswordModel.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    response = json['response'];
  }
  num? responseCode;
  String? message;
  String? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    map['response'] = response;
    return map;
  }

}