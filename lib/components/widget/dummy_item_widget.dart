import 'package:based_project_list_club_sepak_bola/components/config/app_const.dart';
import 'package:based_project_list_club_sepak_bola/components/config/app_route.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/model/dummy_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyItemWidget extends StatelessWidget {
  final DummyItemModel? dummyItemModel;

  const DummyItemWidget({super.key, this.dummyItemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async =>
          Get.toNamed(AppRoute.detailScreen, arguments: dummyItemModel?.idTeam),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: dummyItemModel?.strBadge ?? AppConst.imageExample,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 80),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dummyItemModel?.strTeam ?? "-",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dummyItemModel?.strLeague ?? "Type of Meal",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            const SizedBox(
              width: 8.0,
            )
          ],
        ),
      ),
    );
  }
}