class BranchListModel {
  int? responseCode;
  String? message;
  List<BranchListData>? response;

  BranchListModel({this.responseCode, this.message, this.response});

  BranchListModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['response'] != null) {
      response = <BranchListData>[];
      json['response'].forEach((v) {
        response!.add(new BranchListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BranchListData {
  int? id;
  String? branchName;
  String? branchEmail;

  BranchListData({this.id, this.branchName, this.branchEmail});

  BranchListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branchName'];
    branchEmail = json['branchEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branchName'] = this.branchName;
    data['branchEmail'] = this.branchEmail;
    return data;
  }
}
