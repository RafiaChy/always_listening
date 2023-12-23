class CommonResponseModel {
  CommonResponseModel({
    required this.status,
    required this.responseData,
  });

  bool status;
  ResponseData responseData;

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) => CommonResponseModel(
    status: json["status"],
    responseData: ResponseData.fromJson(json["responseData"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "responseData": responseData.toJson(),
  };
}

class ResponseData {
  ResponseData({
    this.message,
  });

  String? message;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}