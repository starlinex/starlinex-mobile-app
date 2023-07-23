/// responseCode : 200
/// message : "success"
/// response : {"access_token":"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzb2hpdHpAZ21haWwuY29tIiwiaWF0IjoxNjg4MjI2ODI3LCJleHAiOjE2ODgzMTMyMjd9.4IA8ExfSVaUKjigWiBwe4tGEOejczpllXnOWS1iKDwk","refresh_token":"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzb2hpdHpAZ21haWwuY29tIiwiaWF0IjoxNjg4MjI2ODI3LCJleHAiOjE2ODg4MzE2Mjd9.7Swqmeu-w9C97SsWlhhZa8xwuMBBTI4Pmv44XyN96Xo","id":7}

class RegisterModel {
  RegisterModel({
    this.responseCode,
    this.message,
    this.response,});

  RegisterModel.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? responseCode;
  String? message;
  Response? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

}

/// access_token : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzb2hpdHpAZ21haWwuY29tIiwiaWF0IjoxNjg4MjI2ODI3LCJleHAiOjE2ODgzMTMyMjd9.4IA8ExfSVaUKjigWiBwe4tGEOejczpllXnOWS1iKDwk"
/// refresh_token : "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzb2hpdHpAZ21haWwuY29tIiwiaWF0IjoxNjg4MjI2ODI3LCJleHAiOjE2ODg4MzE2Mjd9.7Swqmeu-w9C97SsWlhhZa8xwuMBBTI4Pmv44XyN96Xo"
/// id : 7

class Response {
  Response({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.otp
  });

  Response.fromJson(dynamic json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    id = json['id'];
    otp = json['otp'];
  }
  String? accessToken;
  String? refreshToken;
  num? id;
  num? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    map['id'] = id;
    map['otp'] = otp;
    return map;
  }

}