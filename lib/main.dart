import 'dart:async';

import 'package:flutter/material.dart';
import 'theme/theme.dart';
import './theme/theme_provider.dart';
import 'screens/escape_blog/init_escape.dart';
import 'package:provider/provider.dart';
import 'utils/escape_icon.dart';
import '../screens/shorts/init_shorts.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: darkMode,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TabView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 80,
                child: Image.asset('assets/turtle.png', height: 170))));
  }
}

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => TabViewState();
}

class TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController controller;
  PageStorageBucket pageBucket = PageStorageBucket();

  @override
  initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        title: const EscapeIcon(showTitle: true),
        bottom: AppBar(
            toolbarHeight: 35,
            backgroundColor: Colors.transparent,
            title: TabBar(
                isScrollable: true,
                indicatorColor: lPalette.primary,
                labelColor: Colors.green,
                unselectedLabelColor: lPalette.text,
                // dividerColor: Colors.green,
                // automaticIndicatorColorAdjustment: false,
                controller: controller,
                tabs: [
                  Tab(text: 'shorts'),
                  Tab(text: 'stories'),
                ])),
      ),
      body: TabBarView(controller: controller, children: [
        ShortsScreen(bucket: pageBucket),
        EscapeScreen(),
        // StarShitScreen(),
      ]),
    );
  }
}
