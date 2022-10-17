class PreEclampsiaErrors {
  String? name;
  String? message;

  PreEclampsiaErrors({this.name, this.message});

  PreEclampsiaErrors.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    message = json['message'] ?? '';
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['message'] = message;
    return data;
  }
}