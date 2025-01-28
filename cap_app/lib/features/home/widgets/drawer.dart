import 'dart:math';

import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/services/shared_prefs.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _prefs = SharedPrefs();
    Future fetchData() async {
      final login = await _prefs.read(key: StorageKey.login);
      final name = await _prefs.read(key: StorageKey.name);
      return [name, login];
    }

    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    "https://b.fssta.com/uploads/application/soccer/headshots/885.png",
                  )),
              SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return Column(children: [
                      Text(
                        '${snapshot.data?[0]}',
                        style: AppTextstyles.bold.withFontSize(30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${snapshot.data?[1]}',
                        style: AppTextstyles.bold,
                      )
                    ]);
                  })
            ],
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text(
              "Home",
              style: AppTextstyles.bold,
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text(
              "Favourites",
              style: AppTextstyles.bold,
            ),
          ),
          ListTile(
            leading: Icon(Icons.call_outlined),
            title: Text(
              "Call",
              style: AppTextstyles.bold,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text(
              "Settings",
              style: AppTextstyles.bold,
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Log out",
              style: AppTextstyles.bold,
            ),
          )
        ],
      ),
    );
  }
}
