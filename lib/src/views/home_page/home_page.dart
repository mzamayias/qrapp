// flutter packages
import 'package:flutter/material.dart';

// custom widgets
import '../../widgets/bottom_nav_bar_buttons.dart';
import '../generate_page/generate_page.dart';
import '../scan_page/scan_page.dart';
import '../about_page/about_page.dart';

enum _SelectedTab { scan, generate, about }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _SelectedTab _selectedTab = _SelectedTab.scan;
  List<StatefulWidget> _pages = [GeneratePage(), ScanPage(), AboutPage()];
  int _selectedNavIndex = 0;
  final _pageController = PageController(
    initialPage: 0,
  );

  void _onPageChanged(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: _onPageChanged,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        selectedItemColor: const Color(0xff303030),
        unselectedItemColor: const Color(0x40303030),
        currentIndex: _selectedNavIndex,
        onTap: _onTap,
        items: <BottomNavigationBarItem>[
          generateNavButton(),
          scanNavButton(),
          aboutNavButton(),
        ],
      ),
    );
  }
}
