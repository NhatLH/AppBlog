class Users {
  String id;
   String name;
   String username;
   String password;

  Users({
    this.id = '',
    this.name ='',
    this.username = '',
    this.password = ''
  });

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'username' : username,
    'password' : password,
  };

  static Users fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      password: json['password']
  );
}

