class User {
  String username;
  String password;
  String nickName;
  String nationality;
  String dateOfBirth;

  User({
    this.username,
    this.password,
    this.nickName,
    this.nationality,
    this.dateOfBirth,
  });

  User.fromJsonMap(Map<String, dynamic> map)
      : username = map["username"],
        password = map["password"],
        nickName = map["nick_name"],
        nationality = map["nationality"],
        dateOfBirth = map["date_birth"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['nick_name'] = nickName;
    data['nationality'] = nationality;
    data['date_birth'] = dateOfBirth;
    return data;
  }
}
