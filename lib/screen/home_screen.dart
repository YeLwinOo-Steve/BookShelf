import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variables
  int booksNum = 1500;
  ScrollController _semicircleController = ScrollController();
  final controller = PageController(viewportFraction: 0.8);

  ScrollController scrollController;
  TextEditingController name = new TextEditingController();

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();
  TextEditingController _authorController = TextEditingController();
  final List<String> images = [
    'assets/book-lovers.png',
    'assets/idea.png',
    'assets/students-in-a-class.png'
  ];
  final List<String> quotes = [
    'miles to go before i sleep!',
    'Coffee and book;\na perfect combination',
    'this is shit!'
  ];
  final List<String> authors = ['ရို့', 'ရို့', 'me'];
  final List<String> categories = [
    'drama',
    'knowledge',
    'horror',
    'adventure',
    'novel',
    'comic',
    'cartoon',
    'science',
    'translation',
    'medical',
    'language'
  ];
  static List<bool> categoriesBool;
  @override
  void initState() {
    categories.sort();
    categoriesBool = List.filled(categories.length, false);
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add a new author',
            style: TextStyle(color: Color(0xFF3D998A)),
          ),
          content: TextField(
            style: TextStyle(color: Color(0xFF3D998A)),
            controller: _authorController,
            decoration: InputDecoration(
              hintText: "Author name",
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xFF3D998A)),
                  borderRadius: BorderRadius.circular(18.0)),
              focusedBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Color(0xFF3D998A)),
                  borderRadius: BorderRadius.circular(18.0)),
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xFF3D998A))),
              color: Colors.white,
              textColor: Color(0xFF3D998A),
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xFF3D998A))),
              color: Color(0xFF3D998A),
              textColor: Colors.white,
              child: Text('Confirm'),
              onPressed: () {
                print(_authorController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Authors', style: TextStyle(color: Color(0xFF3D998A))),
            content:
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: categoriesBool[index]
                              ? Color(0xFF3D998A)
                              : Colors.white,
                          elevation: 1.0,
                          child: ListTile(
                            trailing: Icon(Icons.book_rounded,
                                color: categoriesBool[index]
                                    ? Colors.white
                                    : Color(0xFF3D998A)),
                            title: Text(
                              'a',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: categoriesBool[index]
                                      ? Colors.white
                                      : Color(0xFF3D998A)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

            actions: <Widget>[
              RaisedButton(
                color: Color(0xFF3D998A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF3D998A))),
                child: Text(
                  'Choose',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Widget nameTextField = TextField(
      style: TextStyle(
        color: Color(0xFF3D998A),
      ),
      minLines: 1,
      maxLines: 3,
      cursorColor: Color(0xFF3D998A),
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
          prefixIcon: Icon(
            Icons.menu_book_outlined,
            color: Color(0xFF3D998A),
          ),
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF3D998A)),
              borderRadius: BorderRadius.circular(18.0)),
          focusedBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF3D998A)),
              borderRadius: BorderRadius.circular(18.0)),
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: "Book name"),
    );
    Widget authorTextField = GestureDetector(
      onTap: () {
        _showMyDialog();
      },
      child: TextField(
        style: TextStyle(
          color: Color(0xFF3D998A),
        ),
        minLines: 1,
        maxLines: 2,
        cursorColor: Color(0xFF3D998A),
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(
            enabled: false,
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xFF3D998A),
            ),
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Color(0xFF3D998A)),
                borderRadius: BorderRadius.circular(18.0)),
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: "Choose Author"),
      ),
    );
    SlidingUpPanelWidget panel = SlidingUpPanelWidget(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                blurRadius: 5.0,
                spreadRadius: 2.0,
                color: const Color(0x11000000))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Color(0xFF3D998A),
                    size: 20,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              height: 30.0,
            ),
            Divider(
              height: 0.5,
              color: Colors.grey[300],
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    controller: scrollController,
                    physics: ClampingScrollPhysics(),
                    children: [
                      Text(
                        "Add a new book",
                        style:
                            TextStyle(color: Color(0xFF3D998A), fontSize: 22),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      nameTextField,
                      SizedBox(
                        height: 20,
                      ),
                      authorTextField,
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            thickness: 1.0,
                            color: Color(0xFF3D998A),
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  color: Color(0xFF3D998A), fontSize: 20),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 1.0,
                            color: Color(0xFF3D998A),
                          )),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Container(
                              height: 320.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                              child: DraggableScrollbar.semicircle(
                                controller: _semicircleController,
                                alwaysVisibleScrollThumb: true,
                                child: ListView.builder(
                                  controller: _semicircleController,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            categoriesBool[index] =
                                                !categoriesBool[index];
                                          });
                                        },
                                        child: Card(
                                          color: categoriesBool[index]
                                              ? Color(0xFF3D998A)
                                              : Colors.white,
                                          elevation: 1.0,
                                          child: ListTile(
                                            trailing: Icon(Icons.book_rounded,
                                                color: categoriesBool[index]
                                                    ? Colors.white
                                                    : Color(0xFF3D998A)),
                                            title: Text(
                                              '${categories[index]}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: categoriesBool[index]
                                                      ? Colors.white
                                                      : Color(0xFF3D998A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                              flex: 0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width / 3,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.grey[500])),
                                      onPressed: () {
                                        panelController.collapse();
                                      },
                                      color: Colors.grey[500],
                                      textColor: Colors.white,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                    ),
                                  ),
                                  new Spacer(),
                                  SizedBox(
                                    width: size.width / 3,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color(0xFF3D998A))),
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          animType: AnimType.SCALE,
                                          width: size.width - 2,
                                          dialogType: DialogType.SUCCES,
                                          body: Center(
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                                child: Column(children: [
                                                  Card(
                                                    color: Color(0xFF3D998A),
                                                    elevation: 1.0,
                                                    child: ListTile(
                                                      title: Text(
                                                        'A100002',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  ListTile(
                                                    leading: Icon(
                                                      Icons.menu_book_rounded,
                                                      color: Color(0xFF3D998A),
                                                    ),
                                                    title: Text(
                                                      'နှလုံးသားကို လေးပေါ်တင်၍ ပစ်ကြည့်သောအခါ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xFF3D998A)),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  ListTile(
                                                    leading: Icon(
                                                      Icons.person_rounded,
                                                      color: Color(0xFF3D998A),
                                                    ),
                                                    title: Text(
                                                      'အောင်သင်း',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xFF3D998A)),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  ListTile(
                                                      leading: Icon(
                                                        Icons.category_rounded,
                                                        color:
                                                            Color(0xFF3D998A),
                                                      ),
                                                      title: Wrap(
                                                        spacing: 5.0,
                                                        children: [
                                                          Badge(
                                                            toAnimate: true,
                                                            shape: BadgeShape
                                                                .square,
                                                            badgeColor: Color(
                                                                0xFF3D998A),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            badgeContent:
                                                                Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                  'cartoon',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                          Badge(
                                                            toAnimate: true,
                                                            shape: BadgeShape
                                                                .square,
                                                            badgeColor: Color(
                                                                0xFF3D998A),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            badgeContent:
                                                                Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                  'horror',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                          Badge(
                                                            toAnimate: true,
                                                            shape: BadgeShape
                                                                .square,
                                                            badgeColor: Color(
                                                                0xFF3D998A),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            badgeContent:
                                                                Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                  'novel',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ])),
                                          ),
                                          btnOk: RaisedButton(
                                            onPressed: () {
                                              panelController.collapse();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'OK',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Color(0xFF3D998A))),
                                            color: Color(0xFF3D998A),
                                          ),
                                        )..show();
                                      },
                                      color: Color(0xFF3D998A),
                                      textColor: Colors.white,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          child: Text(
                                            "Add",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                    shrinkWrap: true,
                  ),
                ),
                color: Colors.white,
              ),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      controlHeight: 40.0,
      anchor: 0.3,
      panelController: panelController,
      onTap: () {
        ///Customize the processing logic
        if (SlidingUpPanelStatus.expanded == panelController.status) {
          print(panelController.status.toString());
          panelController.collapse();
        } else {
          panelController.expand();
        }
      },
      enableOnTap: false, //Enable the onTap callback for control bar.
    );

    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Total Books: $booksNum',
              style: TextStyle(
                color: Color(0xFF3D998A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 360,
              child: PageView(
                controller: controller,
                children: List.generate(
                  3,
                  (index) => Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListView(shrinkWrap: true, children: [
                      Image.asset(
                        images[index],
                        height: 220,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        quotes[index],
                        style:
                            TextStyle(color: Color(0xFF3D998A), fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text(
                          authors[index],
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF3D998A)),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(activeDotColor: Color(0xFF3D998A)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 300.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF3D998A))),
                onPressed: () {
                  panelController.expand();
                  print(SlidingUpPanelStatus.expanded.toString());
                },
                color: Color(0xFF3D998A),
                textColor: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Add Book",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 300.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF3D998A))),
                onPressed: () {
                  _displayTextInputDialog(context);
                },
                color: Color(0xFF3D998A),
                textColor: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Add Author",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 300.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF3D998A))),
                onPressed: () {},
                color: Color(0xFF3D998A),
                textColor: Colors.white,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Add Category",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ),
          ],
        ),
      ),
      panel,
    ]);
  }
}
