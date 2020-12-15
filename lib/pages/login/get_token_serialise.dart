class TokenSerialise {
  String token;

  TokenSerialise({this.token});

  factory TokenSerialise.fromJson(Map<String, dynamic> json) {
    return TokenSerialise(
      token: json['token'],
    );
  }
}

class ErrorConfirmNumber {
  String error;

  ErrorConfirmNumber({this.error});

  factory ErrorConfirmNumber.fromJson(Map<String, dynamic> json) {
    return ErrorConfirmNumber(error: json['error']);
  }
}
