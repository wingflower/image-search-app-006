import 'package:get_it/get_it.dart';

import '../data/repository/image_item_repository.dart';
import '../data/repository/image_item_repository_impl.dart';
import '../ui/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // interface
  // repository : singleton
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  // viewModel : factory
  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repository: getIt<ImageItemRepositoryImpl>()));
}