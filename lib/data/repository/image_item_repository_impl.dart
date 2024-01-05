import 'package:image_search_app_006/data/data_source/image_api.dart';
import 'package:image_search_app_006/data/mapper/image_mapper.dart';
import 'package:image_search_app_006/data/repository/image_item_repository.dart';

import '../model/image_item.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageItems(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
