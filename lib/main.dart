import 'package:flutter/material.dart';
import 'theme/theme.dart';
import './theme/theme_provider.dart';
import 'screens/escape_blog/init_escape.dart';
import 'package:provider/provider.dart';
import 'utils/escape_icon.dart';
import './screens/starshit_store/init_starshit.dart';
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
      home: const TabView(),
    );
  }
}

// import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => TabViewState();
}

class TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const EscapeIcon(),
        bottom: AppBar(
            backgroundColor: Colors.transparent,
            title: TabBar(
                isScrollable: true,
                indicatorColor: lPalette.primary,
                // dividerColor: Colors.green,
                // automaticIndicatorColorAdjustment: false,
                controller: controller,
                tabs: const [
                  Tab(text: 'SHORTS'),
                  Tab(text: 'BLOG'),
                  Tab(text: 'SHOP'),
                ])),
      ),
      body: TabBarView(
          controller: controller,
          children: const [EscapeScreen(), ShortsScreen(), StarShitScreen()]),
    );
  }
}
