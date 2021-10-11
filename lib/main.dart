import 'package:book_shelf/screen/home_screen.dart';
import 'package:book_shelf/screen/profile_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shelf',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _home = 'Home';
  String _list = 'List';
  String _message = 'Message';
  String _profile = 'Profile';
  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_book_outlined,color: Color(0xFF3D998A) ,),
        title: Text(
          _currentIndex == 0
              ? _home
              : (_currentIndex == 1)
                  ? _list
                  : (_currentIndex == 2)
                      ? _message
                      : _profile,
          style: TextStyle(color: Color(0xFF3D998A)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info,
                color: Color(0xFF3D998A),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AssetGiffyDialog(
                          image: Image.asset('assets/learning-concept.png'),
                          title: Text(
                            'About Me',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          ),
                          description: Text(
                            'This is a men wearing jackets dialog box',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                          entryAnimation: EntryAnimation.TOP,
                          onlyOkButton: true,
                          buttonOkColor: Color(0xFF3D998A),
                          onOkButtonPressed: () {
                            Navigator.pop(context);
                          },
                        ));
              })
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_list),
              ],
            )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_message),
              ],
            )),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 26,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 100), curve: Curves.easeIn);
          _currentIndex = index;
        }),
        iconSize: 28,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text(_home),
            activeColor: Color(0xFF3D998A),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.list_alt_sharp),
            title: Text(
              _list,
            ),
            activeColor: Color(0xFF3D998A),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              _message,
            ),
            activeColor: Color(0xFF3D998A),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(_profile),
            activeColor: Color(0xFF3D998A),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
