import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skypeflutter/models/call.dart';
import 'package:skypeflutter/pages/call_pages/pickup/pickup_page.dart';
import 'package:skypeflutter/provider/user_provider.dart';
import 'package:skypeflutter/resources/call_methods.dart';

class PickupLayout extends StatelessWidget {
  final Widget scaffold;
  final CallMethods callMethods = CallMethods();

  PickupLayout({@required this.scaffold});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return (userProvider != null && userProvider.getUser != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(uid: userProvider.getUser.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.data != null) {
                Call call = Call.fromMap(snapshot.data.data);
                return PickupPage(
                  call: call,
                );
              }
              return scaffold;
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
