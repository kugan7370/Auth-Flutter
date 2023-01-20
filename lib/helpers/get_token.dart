import 'package:shared_preferences/shared_preferences.dart';

//get token
Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = await prefs.getString("token");
  if (token != null) {
    return token;
    // Token is available, user is logged in
  } else {
    return "";
    // Token is not available, user is not logged in
  }
}

//remove token
Future<void> removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("token");
}
