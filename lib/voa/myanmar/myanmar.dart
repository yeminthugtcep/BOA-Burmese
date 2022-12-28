import 'package:flutter/material.dart';
import 'package:voa_news/voa/bloc/bloc.dart';
import 'package:voa_news/voa/dart_object/dart_object.dart';
import 'package:voa_news/voa/show_ui/news_widget/news_widget.dart';
import 'package:voa_news/voa/response_ob/reponse_ob.dart';

class MyanmarPage extends StatefulWidget {
  MyanmarPageState createState() {
    return MyanmarPageState();
  }
}

class MyanmarPageState extends State<MyanmarPage> {
  final BlocPage blocPage = BlocPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocPage.MMnews();
  }

  Widget build(BuildContext context) {
    return StreamBuilder<ResponseOb>(
      stream: blocPage.mmGetStream(),
      initialData: ResponseOb(msgState: MsgState.loading),
      builder: (context, snapshot) {
        ResponseOb respOb = snapshot.data!;
        if (respOb.msgState == MsgState.data) {
          DartObjectPage dob = respOb.data;
          return ListView(
            children: dob.items!.map((NewsItem item) {
              return NewsWidget(item);
            }).toList(),
          );
        } else if (respOb.msgState == MsgState.error) {
          if (respOb.errState == ErrState.servierErr) {
            return const Center(
              child: Text("500\nServier Error"),
            );
          } else if (respOb.errState == ErrState.noFoundErr) {
            return const Center(
              child: Text("404\nPage not Found"),
            );
          } else {
            return const Center(
              child: Text("unknown Error"),
            );
          }
        } else {
          return const Center(
              child: Text(
            "Loading...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ));
        }
      },
    );
  }
}
