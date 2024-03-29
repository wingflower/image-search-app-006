import 'package:flutter/material.dart';
import 'package:image_search_app_006/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app_006/di/di_setup.dart';
import 'package:image_search_app_006/routes.dart';
import 'package:image_search_app_006/ui/main_screen.dart';
import 'package:image_search_app_006/ui/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
                                                                                                                                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
