import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app_task/provider/products_provider.dart';
import 'Screens/store_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: providers,
      child: const MyApp(),
  ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_)=>
      CartProvider()
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreScreen(),
    );
  }
}

