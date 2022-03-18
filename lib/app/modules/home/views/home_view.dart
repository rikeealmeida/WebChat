import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weellu_web/app/modules/hometab/views/hometab_view.dart';
import 'package:weellu_web/app/modules/publish/views/publish_view.dart';
import 'package:weellu_web/app/modules/shopping/views/shopping_view.dart';

import '../components/sidebar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleAuthProvider authProvider = GoogleAuthProvider();
  final PageController _pageController = PageController();
  FirebaseAuth auth = FirebaseAuth.instance;
  User _currentUser;
  int _selected = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  "assets/images/5.png",
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Weellu",
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                if (_pageController.hasClients) {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate);
                  _selected = 0;
                }
              },
              child: Icon(
                Icons.home,
                color: _selected == 0 ? Colors.black : Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.decelerate);
                    _selected = 1;
                  }
                },
                child: Icon(
                  Icons.add,
                  color: _selected == 1 ? Colors.black : Colors.grey,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
            ),
            child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.decelerate);
                    _selected = 2;
                  }
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: _selected == 2 ? Colors.black : Colors.grey,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () {},
              child: Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: NetworkImage(
                          _currentUser == null
                              ? "assets/images/png-transparent-minecraft-sonic-mania-pixel-art-sonic-the-hedgehog-cartoon-character-pixel-art-game-text-sonic-the-hedgehog.png"
                              : _currentUser.photoURL,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      key: _scaffoldKey,
      drawer: Container(
        width: 200,
        child: const SideBar(),
      ),
      body: PageView(
        onPageChanged: (page) {
          setState(() {});
        },
        controller: _pageController,
        children: [
          HomeTabView(),
          PublishTabView(),
          ShoppingTabView(),
        ],
      ),
    );
  }
}
