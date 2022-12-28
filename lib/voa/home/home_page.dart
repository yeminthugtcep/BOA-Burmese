import 'package:flutter/material.dart';
import 'package:voa_news/voa/international/international.dart';
import 'package:voa_news/voa/myanmar/myanmar.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RSS Reader"),
        centerTitle: true,
        bottom: TabBar(controller: _tabController, tabs: [
          const Tab(
            child: Text("မြန်မာ သတင်း"),
          ),
          const Tab(
            child: Text("နိုင်ငံတကာ သတင်း"),
          ),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        MyanmarPage(),
        InternationalPage(),
      ]),
    );
  }
}
