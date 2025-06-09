import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class servicesBodyWidgets{

  Widget ServicesBody(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {'text': 'Mobile App Development', 'icon': Icons.phone_android},
      {'text': 'UI/UX Design', 'icon': Icons.design_services},
      {'text': 'Web Development', 'icon': Icons.web},
      {'text': 'Technical Support', 'icon': Icons.support_agent},
      {'text': 'Clean Code', 'icon': Icons.speed},
      {'text': 'Software Testing', 'icon': Icons.build},
    ];
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.shade800,
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
            children: [
              const Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Text(
                    "Services",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                  child: Text(
                    "My Services",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
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
              SizedBox(
                width: 800,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    // 3 ستون
                    crossAxisSpacing: 10,
                    // فاصله افقی
                    mainAxisSpacing: 10,
                    // فاصله عمودی
                    childAspectRatio: 1,
                    // نسبت عرض به ارتفاع (مربعی)
                    children: List.generate(gridItems.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                gridItems[index]['icon'],
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                gridItems[index]['text'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      );
                    }),
                  ),
                ),
              ),
            ],
          )),
    );
  }

}