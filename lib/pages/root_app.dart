import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:telegram_ui/pages/chats_page.dart';
import 'package:telegram_ui/pages/contact_page.dart';
import 'package:telegram_ui/pages/setting_page.dart';
import 'package:telegram_ui/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [ContactPage(), ChatPage(), SettingPage()],
    );
  }

  Widget getFooter() {
    List iconsItems = [
      MaterialIcons.account_circle,
      Ionicons.ios_chatbubbles,
      MaterialIcons.settings,
    ];
    List textItems = ["Contacts", "Chats", "Settings"];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconsItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  index == 1
                      ? badge.Badge(
                          badgeContent: const Text(
                            "3",
                            style: TextStyle(color: white),
                          ),
                          child: Icon(iconsItems[index],
                              size: 30,
                              color: pageIndex == index
                                  ? primary
                                  : white.withOpacity(0.5)),
                        )
                      : Icon(iconsItems[index],
                          size: 30,
                          color: pageIndex == index
                              ? primary
                              : white.withOpacity(0.5)),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                        fontSize: 11,
                        color: pageIndex == index
                            ? primary
                            : white.withOpacity(0.5)),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
