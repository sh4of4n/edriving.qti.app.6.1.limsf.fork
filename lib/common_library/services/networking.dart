import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'dart:convert';
import '../../utils/app_config.dart';
import '../utils/custom_snackbar.dart';
import 'repository/base_repository.dart';
import 'response.dart';
import 'package:xml2json/xml2json.dart';
import 'package:hive/hive.dart';

class Networking extends BaseRepo {
  final xml2json = Xml2Json();
  final appConfig = AppConfig();
  final customSnackbar = CustomSnackbar();
  final wsUrlBox = Hive.box('ws_url');
  // var body;
  String? url;
  String? customUrl;
  int? milliseconds;

  bool isJson(String str) {
    try {
      json.decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  late Uri uri;

  Networking({this.customUrl, this.milliseconds});

  Future<Response> getData({path}) async {
    if (customUrl != null) {
      url = customUrl;
    } else {
      // if (await Hive.box('ws_url').get('userDefinedUrl') != null &&
      //     await Hive.box('ws_url').get('userDefinedUrl') != '') {
      //   url = await Hive.box('ws_url').get('userDefinedUrl');
      // } else {
      //   url = await wsUrlBox.get('wsUrl');
      // }
      url = await wsUrlBox.get('wsUrl');
    }
    final transaction = Sentry.startTransaction(
      'webrequest',
      'request',
      bindToScope: true,
    );
    var client = SentryHttpClient();
    try {
      http.Response response;
      // for getWsUrl
      if (url == customUrl) {
        uri = Uri.parse('$url/${path ?? ""}');
        print('$url/${path ?? ""}');

        response = await client
            .get(uri)
            .timeout(Duration(milliseconds: milliseconds ?? 10000));
      } else {
        uri = Uri.parse('$url/webapi/${path ?? ""}');
        print('$url/webapi/${path ?? ""}');

        response = await client
            .get(uri)
            .timeout(Duration(milliseconds: milliseconds ?? 60000));
      }
      await transaction.finish(status: const SpanStatus.ok());
      if (response.statusCode == 200) {
        print(response.body);

        if (response.body == 'Valid user.' ||
            response.body == 'True' ||
            response.body == 'False' ||
            response.body.substring(0, 2) == 'OK' ||
            url == customUrl || !isJson(response.body)) return Response(true, data: response.body);

        return Response(true, data: jsonDecode(response.body));
      } else {
        String message = response.body;
        String trimmedMessage = removeAllHtmlTags(message);
        String parsedMessage = trimmedMessage
            .replaceAll('[BLException]', '')
            .replaceAll('&#xD;', '')
            .replaceAll(r'"', '')
            .replaceAll('\n', '')
            .replaceAll(r'\u000d\u000a', '');

        print(response.statusCode);
        print(message);

        return Response(
          false,
          message: parsedMessage,
        );
      }
    } catch (error, stackTrace) {
      return handleError(error, stackTrace);
    } finally {
      client.close;
    }
  }

  Future<Response> postData(
      {String? api, String? path, required body, headers}) async {
    final transaction = Sentry.startTransaction(
      'webrequest',
      'request',
      bindToScope: true,
    );
    var client = SentryHttpClient();
    try {
      if (customUrl != null) {
        url = customUrl;
      } else {
        // if (await Hive.box('ws_url').get('userDefinedUrl') != null &&
        //     await Hive.box('ws_url').get('userDefinedUrl') != '') {
        //   url = await Hive.box('ws_url').get('userDefinedUrl');
        // } else {
        //   url = await wsUrlBox.get('wsUrl');
        // }
        url = await wsUrlBox.get('wsUrl');
      }

      print('$url/webapi/$api${path ?? ""}');

      print('body: ' + body);

      uri = Uri.parse('$url/webapi/$api${path ?? ""}');

      http.Response response = await client
          .post(uri, body: body, headers: headers)
          .timeout(const Duration(seconds: 60));
      await transaction.finish(status: const SpanStatus.ok());
      if (response.statusCode == 200) {
        print(response.body);

        if (response.body == 'True' || response.body == 'False') {
          return Response(true, data: response.body);
        } else if (response.body.startsWith('{'))
          return Response(true, data: jsonDecode(response.body));
        else
          return Response(true, data: response.body);
      } else {
        String message = response.body
            .replaceAll('[BLException]', '')
            .replaceAll('&#xD;', '')
            .replaceAll(r'"', '')
            .replaceAll('\n', '')
            .replaceAll(r'\u000d\u000a', '');

        print(response.statusCode);
        print(message);

        return Response(
          false,
          message: message,
        );
      }
    } catch (error, stackTrace) {
      return handleError(error, stackTrace);
    } finally {
      client.close();
    }
  }

  /* Future multiPartRequest(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(url);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile(
      'picture',
      stream,
      length,
      filename: basename(imageFile.path),
      contentType: new MediaType('image', 'jpg'),
    );

    request.files.add(multipartFile);
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } */
}
