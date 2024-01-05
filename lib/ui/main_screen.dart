import 'package:flutter/material.dart';
import 'package:image_search_app_006/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app_006/ui/widget/image_item_widget.dart';

import '../data/model/image_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  final repository = ImageItemRepositoryImpl();

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    isLoading = true;
    setState(() {});

    imageItems = await repository.getImageItems(query);

    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Search App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.cyan,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.cyan,
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      searchImage(searchTextEditingController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                  itemCount: imageItems.length,
                  itemBuilder: (context, index) {
                    final imageItem = imageItems[index];
                    return ImageItemWidget(imageItem: imageItem);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}