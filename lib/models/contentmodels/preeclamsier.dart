class Preeclampsier {
  String? id;
  String? username;
  String? email;
  String? identity;
  String? phone;
  String? local;
  String? firstname;
  String? lastname;

  Preeclampsier(
      {this.id,
      this.username,
      this.email,
      this.identity,
      this.phone,
      this.local,
      this.firstname,
      this.lastname,
      });

  Preeclampsier.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    identity = json['identity'] ?? '';
    phone = json['phone'] ?? '';
    local = json['local'] ?? '';
    firstname = json['firstname'] ?? '';
    lastname = json['lastname'] ?? '';
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['identity'] = identity;
    data['phone'] = phone;
    data['local'] = local;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data;
  }
}
