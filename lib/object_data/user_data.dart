class UserData {
  String displayName;
  String phone;
  String token;

  UserData(
      {required this.displayName, required this.phone, required this.token});

  factory UserData.fromJson(Map<String, dynamic> map) {
    return UserData(
      displayName: map['fullName'],
      phone: map['Phone'],
      token: map['Token'],
    );
  }
}
