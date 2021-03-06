import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/models/login.dart';
import 'package:foodie_ui_kit/services/check_login.dart';
import 'package:foodie_ui_kit/theme/colors.dart';
import 'package:foodie_ui_kit/theme/helper.dart';
import 'package:foodie_ui_kit/theme/padding.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Roy App",
                  style: TextStyle(
                      color: primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: 16, color: grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: textFieldBg,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      cursorColor: textBlack,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Phone Number"),
                      controller: textController,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16, color: grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: textFieldBg,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            obscureText: true,
                            cursorColor: textBlack,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Password"),
                            controller: textController2,
                          ),
                        ),
                        Icon(
                          Icons.remove_red_eye,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil("/root_app", (route) => false);

                final String phone = textController.text;
                final String password = textController2.text;
                if (phone.isEmpty || password.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('?????????????????????????????????????????????'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  textController.clear();
                                  textController2.clear();
                                },
                                child: Text('Close')),
                          ],
                        );
                      });
                } else {
                  final Login user =
                      await Checklogin().logincheck(phone, password);

                  // ignore: unnecessary_null_comparison
                  if (user.uid != null) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/root_app", (route) => false);
                  } else {
                    print("not");
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                                Text('?????????????????????????????????????????????????????????????????????????????????????????????????????????'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    textController.clear();
                                    textController2.clear();
                                  },
                                  child: Text('Close')),
                            ],
                          );
                        });
                  }
                }
                // ignore: unused_local_variable
              },
              child: Container(
                width: 141,
                height: 45,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          color: textWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    getSvgIcon("arrow_forward_icon.svg")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  "Does not have an account yet?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/register_page", (route) => false);
                  },
                  child: Text('cerate one'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
