import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  // late String token;
  final String appBaseUrl;
  late String token;
  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = "";
    _mainHeader = {
      // 'X-RapidAPI-Key': 'c44d18a2c3msh04f6658bb80135cp1dca78jsn8fb99c6385a3',
      // 'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    };
  }

  Future<Response> getData(String uri) async {
    print("uri: $uri");
    try {
      /* 1.Response coming from getx
         2.get methods is coming from getx  so not need to put baseUrl+uri; because it internally will be added
      */
      Response response = await get(uri);
      print("response: ${response}");
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
