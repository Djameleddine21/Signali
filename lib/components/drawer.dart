import 'package:flutter/material.dart';
import 'package:signalini/utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[greenColor, greenDeepColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            //user info
            ListTile(
              leading: CircleAvatar(
                maxRadius: 35.0,
                backgroundColor: whiteColor,
                child: Icon(Icons.person_outline, color: greenColor, size: 30.0),
              ),
              title: Text(
                "User name",
                style: TextStyle(color: whiteColor, fontSize: 18.0),
              ),
              subtitle: Text(
                "hd_sebbagh@esi.dz",
                style: TextStyle(color: whiteColor, fontSize: 15.0),
              ),
              contentPadding: const EdgeInsets.all(0.0),
            ),
            SizedBox(height: 40.0),
            //signaler un cas
            ListTile(
              leading: Icon(Icons.add_circle_outline, size: 28.0, color: whiteColor),
              title: Text(
                "Signaler un cas",
                style: whiteText.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            //settings
            ListTile(
              leading: Icon(Icons.settings, size: 28.0, color: whiteColor),
              title: Text(
                "Paramètres",
                style: whiteText.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(color: whiteColor),
            ),
            //Contact Us
            ListTile(
              leading: Icon(Icons.message, size: 28.0, color: whiteColor),
              title: Text(
                "Contactez-nous",
                style: whiteText.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            //note the App
            ListTile(
              leading: Icon(Icons.sentiment_satisfied, size: 28.0, color: whiteColor),
              title: Text(
                "Notez l'application",
                style: whiteText.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            //Share the App
            ListTile(
              leading: Icon(Icons.share, size: 28.0, color: whiteColor),
              title: Text(
                "Partagez l'application",
                style: whiteText.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            //Déconnecter
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                ListTile(
              leading: Icon(Icons.exit_to_app, size: 28.0, color: whiteColor),
              title: Text(
                "Déconnecter",
                style: whiteText.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
