import 'package:lapp/api%20&%20bloc/api_controller.dart';
import 'package:lapp/screen/hereglegch.dart';
import 'package:lapp/screen/login.dart';
import 'package:lapp/screen/zahailga.dart';
import 'package:lapp/screen/zahialgaharah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapp/widgets/alert_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var res;
  String? userName;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {});
    super.initState();
    getUserData();
  }

  getUserData() async {
    res = await ApiManager.getUserData();
    print("res:::${res.result?.name}");
    userName = res.result?.name;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeigth = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    _hereglegch() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserCreate(name: userName),
        ),
      );
    }

    _zahialgaharah() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductSee(name: userName),
        ),
      );
    }

    _zahialga() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ZahialgaPage(
            name: userName,
          ),
        ),
      );
    }

    _logout() async {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      WarningAlert().showDialog(
        context: context,
        text: "???? ???????????????? ???????????????? ?????????? ?????",
        button2Text: "????????",
        button1Text: "T??????",
        isNavigate: true,
      );
      var token = _prefs.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${userName}",
          // ${res.result?.firstName}",
          style: const TextStyle(
            backgroundColor: Color.fromARGB(255, 253, 255, 217),
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 253, 255, 217),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0, right: 9),
            child: Text(
              '????????????????????',
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 253, 255, 217),
                color: Color.fromARGB(255, 11, 115, 117),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: sizeWidth * 0.45,
                  height: sizeHeigth * 0.24,
                  child: InkWell(
                    onTap: _zahialga,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.shoppingCart,
                              color: Color(0xffED5E92),
                              size: sizeHeigth * 0.139,
                            ),
                          ),
                          SizedBox(
                            height: sizeHeigth * 0.01,
                          ),
                          const Text(
                            "????????????????",
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeHeigth * 0.01,
                ),
                SizedBox(
                  width: sizeWidth * 0.45,
                  height: sizeHeigth * 0.24,
                  child: InkWell(
                    onTap: _hereglegch,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.person,
                              color: Color(0xff9BF862),
                              size: sizeHeigth * 0.139,
                            ),
                          ),
                          SizedBox(
                            height: sizeHeigth * 0.01,
                          ),
                          const Text(
                            "??????????????????????",
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sizeHeigth * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: sizeWidth * 0.45,
                    height: sizeHeigth * 0.24,
                    child: InkWell(
                      onTap: _zahialgaharah,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.eyeDropper,
                                color: Color(0xffD9D5F7),
                                size: sizeHeigth * 0.139,
                              ),
                            ),
                            SizedBox(
                              height: sizeHeigth * 0.01,
                            ),
                            const Text(
                              "???????????????? ??????????",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: sizeHeigth * 0.01,
                  ),
                  SizedBox(
                    width: sizeWidth * 0.45,
                    height: sizeHeigth * 0.24,
                    child: InkWell(
                      onTap: _logout,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.usersCog,
                                color: Color(0xffB8D9EC),
                                size: sizeHeigth * 0.139,
                              ),
                            ),
                            SizedBox(
                              height: sizeHeigth * 0.01,
                            ),
                            const Text(
                              "??????????",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
