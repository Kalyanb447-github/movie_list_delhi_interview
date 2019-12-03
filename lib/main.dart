import 'package:flutter/material.dart';
import 'internet_connectivity.dart';
import 'movie_list.dart';
import 'simple_check_internet.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MovieList(),
    );
  }
}

// void main() => runApp(
//       ChangeNotifierProvider<CartModel>(
//         child: TabBarDemo(),
//         builder: (BuildContext context) {
//           return CartModel();
//         },
//       ),
//     );