import 'dart:developer';

import 'package:http/http.dart';

class Apidatasource {
  final Client http;

  Apidatasource(this.http);

  Future<String> getMethod() async {
    try {
      const String url =
          "https://raw.githubusercontent.com/DevTides/DogsApi/master/dogs.json?fbclid=IwAR1J8V0aEe9JQf0FxkMP_NWRjK0Qg9AAwzZWg6Hh4g-yeesSCKPLBgbh-_g";
      final Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("OKE", name: "Apidatasource");
        return response.body;
      } else {
        log("NOT OK", name: "Apidatasource");
        throw Exception();
      }
    } catch (e) {
      log(e.toString(), name: "Api");
      rethrow;
    }
  }
}
