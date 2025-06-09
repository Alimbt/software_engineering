import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../tools/skill_chart.dart'; // فرض می‌کنم فایل HorizontalChart اینجا وارد شده

class letsWorkWidgets {
  Widget letsWorkBody(BuildContext context) {
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
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding:   EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05,left:MediaQuery.of(context).size.width * 0.05,right:MediaQuery.of(context).size.width * 0.05, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // فاصله‌گذاری بهتر بین متن و نمودار
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بخش متن
              Expanded(
                flex: 1, // اختصاص فضای مناسب به متن
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "i'm expert on",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Let's Work\nTogether",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "The accumulation of hardships is painful, and not something that structured thought alone can remedy.\n No concern is shallow when it involves various elements. From the very beginning, care must be taken in the essential places of support and transitions",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse('https://t.me/AliMbt');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent), // رنگ پس‌زمینه دکمه
                        foregroundColor: MaterialStateProperty.all(Colors.white), // رنگ متن یا آیکون دکمه
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // گرد کردن گوشه‌ها
                          ),
                        ),
                      ),
                      child: const Text(
                        "  Hire Me Now  ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // بخش نمودار
              Expanded(
                flex: 1, // اختصاص فضای مناسب به نمودار
                child: HorizontalChart(
                  items: [
                    ChartItem(label: "ّFlutter", percentage: 86),
                    ChartItem(label: "Kotlin", percentage: 74),
                    ChartItem(label: "Dart", percentage: 87),
                    ChartItem(label: "SEO", percentage: 78),
                    ChartItem(label: "HTML/CSS", percentage: 82),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}