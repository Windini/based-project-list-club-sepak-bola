import 'package:based_project_list_club_sepak_bola/components/config/app_const.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/presentation/dummy_item_controller.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/presentation/dummy_item_state.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/model/dummy_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyItemScreen extends StatefulWidget {
  const DummyItemScreen({super.key});

  @override
  State<DummyItemScreen> createState() => _DummyItemScreenState();
}

class _DummyItemScreenState extends State<DummyItemScreen> {
  final _controller = Get.find<DummyItemController>();

  @override
  void initState() {
    super.initState();
    // _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: Obx(() {
          return FloatingActionButton(
            onPressed: () async => _controller.actionOnTapButtonFavorite(),
            backgroundColor: 
              _controller.isFavorite.value ? Colors.red : Colors.black,
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),  
          );
        })
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Detail Dummy Data",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    );
  }

  Widget _bodyBuilder() {
    return GetBuilder<DummyItemController>(builder: (controller) {
      final state = controller.state;

      if (state is DummyItemStateLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is DummyItemStateError) {
        return const Center(
          child: Text("Error: ("),
        );
      }

      if (state is DummyItemStateSuccess) {
        return _body();
      }

      return Container();
    });
  }



  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(24)),
            child: CachedNetworkImage(
              imageUrl: _controller.idDummyItem.strBadge ??
                  AppConst.imageExample,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image, size: 100, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Liga
                Text(
                  _controller.idDummyItem.strTeam ?? "Name Of Meal",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                // Tipe Liga
                Text(
                  _controller.idDummyItem.strLeague ?? "Type Of Meal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi
                Text(
                  _controller.idDummyItem.strDescriptionEN?? "Description",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}