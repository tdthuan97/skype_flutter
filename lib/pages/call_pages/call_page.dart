import 'package:flutter/material.dart';
import 'package:skypeflutter/models/call.dart';
import 'package:skypeflutter/resources/call_methods.dart';

class CallPage extends StatefulWidget {
  final Call call;

  const CallPage({Key key, this.call}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final CallMethods callMethods = CallMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Call has ben made'),
            MaterialButton(
                color: Colors.red,
                child: Icon(
                  Icons.call_end,
                  color: Colors.white,
                ),
                onPressed: () async => callMethods.endCall(call: widget.call))
          ],
        ),
      ),
    );
  }
}
