class AppController {
  static String? _accessToken;
  static int? _id;
  static int? _empId;

//setter Getter methods
  static get accessToken => _accessToken;
  static setaccessToken(value) {
    _accessToken = value;
  }

  static get id => _id;
  static setid(value) {
    _id = value;
  }

  static get empId => _empId;
  static setempId(value) {
    _empId = value;
  }
}
