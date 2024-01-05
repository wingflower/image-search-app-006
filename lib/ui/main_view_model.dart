import 'package:flutter/cupertino.dart';

import '../data/repository/image_item_repository_impl.dart';
import 'main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepositoryImpl _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepositoryImpl repository,
  }) : _repository = repository;

  Future<bool> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final results = (await _repository.getImageItems(query)).take(3).toList();

      // 화면갱신
      _state = state.copyWith(
        isLoading: false,
        imageItems: results,
      );
      notifyListeners();
      return true;
    } catch (e) {
      // SnackBar or Dialog
      return false;
    }
  }
}
