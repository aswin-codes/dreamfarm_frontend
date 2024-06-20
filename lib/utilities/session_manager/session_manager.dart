import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  late SharedPreferences prefs;

  final _userName = "username";
  final _email = "email";
  final _isLoggedIn = "isLoggedIn";
  final _phoneNumber = "phoneNumber";
  final _profileUrl = "profileURL";
  final _uid = "uid";

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    print("Shared Prefereneces Initialized");
  }

  //setter functions for all variables
  Future setUserName(String userName) async {
    await prefs.setString(_userName, userName);
  }

  Future setEmail(String email) async {
    await prefs.setString(_email, email);
  }

  Future setPhoneNumber(String phoneNumber) async {
    await prefs.setString(_phoneNumber, phoneNumber);
  }

  Future setIsLoggedIn(bool isLoggedIn) async {
    await prefs.setBool(_isLoggedIn, isLoggedIn);
  }

  Future setProfileUrl(String profileUrl) async {
    await prefs.setString(_profileUrl, profileUrl);
  }

  Future setUid(String uid) async {
    await prefs.setString(_uid, uid);
  }

  //getter functions for all variable
  Future getUserName() async {
    return prefs.getString(_userName);
  }

  Future getEmail() async {
    return prefs.getString(_email);
  }

  Future getPhoneNumber() async {
    return prefs.getString(_phoneNumber);
  }

  Future getIsLoggedIn() async {
    return prefs.getBool(_isLoggedIn);
  }

  Future getProfileUrl() async {
    return prefs.getString(_profileUrl);
  }

  Future getUid() async {
    return prefs.getString(_uid);
  }

  // Function to clear everything
  Future clearData() async {
    await prefs.clear();
  }
}
