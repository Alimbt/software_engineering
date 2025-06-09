import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class welcomeBodyWidget{
  Widget WelcomeBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.01,
          bottom: MediaQuery.of(context).size.width * 0.015,
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade600,
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: Colors.white24,
              spreadRadius: 4,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            welcomeBodyWidget().ImageWelcomeBody(context),

            welcomeBodyWidget().WelcomeTextComponent(context),
          ],
        ),
      ),
    );
  }
  Widget ImageWelcomeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 30.0),
      child: Image.asset(
        "assets/images/image2.jpg",
        width: MediaQuery.of(context).size.height * 0.39,
        height: MediaQuery.of(context).size.height * 0.39,
        fit: BoxFit.cover,
      ),
    );
  }
  Widget buttons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: const Text(
            "  My Profile  ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
       ElevatedButton(
          onPressed: () async {
            final url = Uri.parse('https://t.me/AliMbt');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  Widget TopIcons() {
    return const Row(
      children: [
        Icon(Icons.adb),
        Icon(Icons.adb),
        Icon(Icons.adb),
        Icon(Icons.adb)
      ],
    );
  }
  Widget WelcomeTextComponent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          left: MediaQuery.of(context).size.height * 0.05,
          right: MediaQuery.of(context).size.height * 0.05
      ),
      child: Column(
        children: [
          TopIcons(),
          const Text(
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            "I am Alireza Afrang",
          ),
          const Text(
              style: TextStyle(
                color: Colors.white,
              ),
              "a professional android developer\nwith long time experience in this field"),
          const SizedBox(
            height: 20,
          ),
          buttons()
        ],
      ),
    );
  }
}