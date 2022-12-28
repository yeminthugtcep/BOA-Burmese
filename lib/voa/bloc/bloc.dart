import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:voa_news/voa/dart_object/dart_object.dart';
import 'package:voa_news/voa/response_ob/reponse_ob.dart';
import 'package:voa_news/voa/utils/const.dart';

class BlocPage {
  StreamController<ResponseOb> _mmController = StreamController<ResponseOb>();
  StreamController<ResponseOb> _intController = StreamController<ResponseOb>();
  Stream<ResponseOb> mmGetStream() => _mmController.stream;
  Stream<ResponseOb> intGetStream() => _intController.stream;

  Dio dio = Dio();

  MMnews() async {
    ResponseOb respOb = ResponseOb(msgState: MsgState.loading);
    _mmController.sink.add(respOb);
    var response = await dio.get(BASE_MM_URL);
    if (response.statusCode == 200) {
      DartObjectPage dob = DartObjectPage.fromJson(response.data);

      respOb.msgState = MsgState.data;
      respOb.data = dob;

      _mmController.sink.add(respOb);
    } else if (response.statusCode == 500) {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.servierErr;
      _mmController.sink.add(respOb);
    } else if (response.statusCode == 404) {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.noFoundErr;
      _mmController.sink.add(respOb);
    } else {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.unknownErr;
      _mmController.sink.add(respOb);
    }
  }

  IntNews() async {
    ResponseOb respOb = ResponseOb(msgState: MsgState.loading);
    _intController.sink.add(respOb);
    var response = await dio.get(BASE_INT_URL);
    if (response.statusCode == 200) {
      DartObjectPage dob = DartObjectPage.fromJson(response.data);
      respOb.msgState = MsgState.data;
      respOb.data = dob;
      _intController.sink.add(respOb);
    } else if (response.statusCode == 500) {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.servierErr;
      _intController.sink.add(respOb);
    } else if (response.statusCode == 404) {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.noFoundErr;
      _intController.sink.add(respOb);
    } else {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.unknownErr;
      _intController.sink.add(respOb);
    }
  }

  dispose() {
    _mmController.close();
    _intController.close();
  }
}
