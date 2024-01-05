import 'package:flutter/cupertino.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository_impl.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepositoryImpl _repository;

  MainViewModel({
    required ImageItemRepositoryImpl repository,
  }) : _repository = repository;

  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = (await _repository.getImageItems(query)).take(3).toList();

    _isLoading = false;
    notifyListeners();
  }
}
