import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetWorkHandler {
  static final client = http.Client();

  static void post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint),
        body: body, headers: {"Content-Type": "application/json"});
    print(response.body);
  }

// dotenv.env
  static Uri buildUrl(String endpoint) {
    String host = dotenv.get('APP_HOST');
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
