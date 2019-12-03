import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
class CheckInternetConnection extends StatefulWidget {
  // import
  // import 'package:flutter/material.dart';
  // import 'package:connectivity/connectivity.dart';
  // pub
  // connectivity: ^0.4.5+6

  @override
  _CheckInternetConnectionState createState() => _CheckInternetConnectionState();
}

class _CheckInternetConnectionState extends State<CheckInternetConnection> {
 var subscription;
internetTest()async{
  try {
      var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
  _showDialog(connectivityResult.toString(),connectivityResult.index.toString());
} else if (connectivityResult == ConnectivityResult.wifi) {
  _showDialog(connectivityResult.toString(),connectivityResult.index.toString());
}
  } catch (e) {
      _showDialog('no Internwt', 'error ');

  }
}

_checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'No internet', 
        "You're not connected to a network"
      );
    } else if (result == ConnectivityResult.mobile) {
      _showDialog(
        'Internet access',
        "You're connected over mobile data"
      );
    } else if (result == ConnectivityResult.wifi) {
      _showDialog(
        'Internet access',
        "You're connected over wifi"
      );
    }
  }

  _showDialog(title, text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }


@override
initState() {
  super.initState();
  // internetTest();
  subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
    _showDialog(result.index.toString(), result.toString());
  });
}
// Be sure to cancel subscription after you are done
@override
dispose() {
  super.dispose();

  subscription.cancel();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet connectivity'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Check connectivity'),
          onPressed: _checkInternetConnectivity,
        )
      )
    );
  }

  
}
