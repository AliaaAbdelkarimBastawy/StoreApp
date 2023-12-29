import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/constants.dart';

class Api
{
  Future<dynamic> get({required String url, @required String? token}) async
  {

    Map<String, String> headers = {};

    if(token != null)
    { //addall == means eny hadeha key & value
      headers.addAll({
        'Authorization' :'Bearer $token'
      });
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if(response.statusCode == 200)
      {
        return jsonDecode(response.body);
      }
    else
    {
      throw Exception('There is a problem with Status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token}) async
  {
    Map<String, String> headers = {};
    if(token != null)
      { //addall == means eny hadeha key & value
        headers.addAll({
          'Authorization' :'Bearer $token'
        });
      }

    print('url = $url, body= $body, token= $token');
    http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers
    );

    if(response.statusCode == 200)
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        print('data $data');
        return data;
      }
    else
    {
      throw Exception('There is a problem with Status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }

  }


  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token}) async
  {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type' : 'application/x-www-form-urlencoded',
    });

    if(token != null)
    { //addall == means eny hadeha key & value
      headers.addAll({
        'Authorization' :'Bearer $token'
      });
    }
    print('url = $url, body= $body, token= $token');
    http.Response response = await http.put(
        Uri.parse(url),
        body: body,
        headers: headers
    );

    if(response.statusCode == 200)
    {
      Map<String, dynamic> data = jsonDecode(response.body);
      print('data $data');
      return data;
    }
    else
    {
      throw Exception('There is a problem with Status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }

  }
}

// headers: {
// 'Accept' : 'application/json',
// 'Content-Type' : 'application/x-www-form-urlencoded',
// 'Authorization' : "Bearer"
// }