import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'data/repository/image_item_repository_impl.dart';
import 'ui/main_screen.dart';
import 'ui/main_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => MainViewModel(
          repository: ImageItemRepositoryImpl(),
        ),
        child: const MainScreen(),
      ),
    ),
  ],
);
