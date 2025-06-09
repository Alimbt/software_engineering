import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aboutMeWidgets{

  Widget AboutMeBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.02,
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: Container(
          alignment: Alignment.center,
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
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Text(
                    "About Me",
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum standard dummy text.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 30.0),
                    child: Image.asset(
                      "assets/images/image3.jpg",
                      width: MediaQuery.of(context).size.height * 0.39,
                      height: MediaQuery.of(context).size.height * 0.39,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        "Hi There :)",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          "a professional android developer\nwith long time experience in this field Lorem Ipsum is \nsimply dummy text of the printing and typesetting industry. \nLorem Ipsum standard dummy text."),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          "a professional android developer\nsimply dummy text of the printing and typesetting industry. \nLorem Ipsum standard dummy text."),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              "Name: Alireza Afrang"),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              "Phone: +98 903 967 4521"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              "Email: example@domain.com"),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              "Linkedin: nadaram :)"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }

}