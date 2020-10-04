class User{
  String _name;
  String _password;
  String _email;
  String _phohtoUrl;
  String _userid;
  String _address;
  String _phone;
  String _subject;


  String get subject => _subject;

  set subject(String value) {
    _subject = value;
  }

  String get userid => _userid;

  set userid(String value) {
    _userid = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get password => _password;

  String get phohtoUrl => _phohtoUrl;

  set phohtoUrl(String value) {
    _phohtoUrl = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  set password(String value) {
    _password = value;
  }

  set address(String value) {
    _address = value;
  }
  String get address => _address;

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  @override
  String toString() {
    return 'User{_name: $_name, _password: $_password, _email: $_email, _phohtoUrl: $_phohtoUrl}';
  }

  Map<String,dynamic> toMapRegister(){
    return {"name" : _name , "email":_email , "url" : _phohtoUrl};
  }

  Map<String,dynamic> toMapPassword(){
    return {"userid" : _userid , "password" : _password};

  }

  Map<String,dynamic> toMapChangePassword(){
    return {"email" : _email , "password" : _password};

  }

  Map<String,dynamic> toMapCredentials(){
    return {"email" : _email , "address" : _address , "phone" : _phone , "subject" : _subject , "userid" : _userid};
  }

}



