import 'package:based_project_list_club_sepak_bola/components/config/app_const.dart';
import 'package:based_project_list_club_sepak_bola/components/services/database/database.dart';
import 'package:based_project_list_club_sepak_bola/components/services/database/favorite_clubs.dart';
import 'package:based_project_list_club_sepak_bola/components/util/state.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/presentation/dummy_item_state.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/model/dummy_item_model.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/repository/dummy_item_repository.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DummyItemController extends GetxController {
  
  final _logger = Logger();

  DummyItemState state = DummyItemStateIdle();
  late final DummyItemModel idDummyItem;
  
  RxBool isFavorite = false.obs;
  AppDatabase database = AppDatabase();

  @override
  void onInit() {
    super.onInit();
    idDummyItem = Get.arguments;
    _logger.i("id : ${idDummyItem}");
    _isFavoriteClub();
  }

  void _isFavoriteClub() async {
    state = DummyItemStateLoading();
    update();

    try {
      final infoIsFavorite = database.select(database.favoriteClubs)
        ..where((test) => test.idTeam.equals(idDummyItem.idTeam!));
      final result = await infoIsFavorite.getSingleOrNull();

      if (result != null) {
        _logger.i("This club is your favorite item");
          isFavorite.value = true;
        } else {
          _logger.i("This club is not your favorite item");
          isFavorite.value = false;
        }

        state = DummyItemStateSuccess(isFavorite.value);
        } catch (e) {
        state = DummyItemStateError();
        } finally {
        update();
        }
        
  } 
  void actionOnTapButtonFavorite() async {
    if (idDummyItem.idTeam == null || idDummyItem.idTeam!.isEmpty) {
      _logger.e("Invalid idTeam: Cannot perform favorite action");
      return;
    }

    try {
      if (isFavorite.value) {
        await database.favoriteClubs
            .deleteWhere((test) => test.idTeam.equals(idDummyItem.idTeam!));
        isFavorite.value = false;
        _logger.i("Success delete as favorite");
      } else {
        await database.into(database.favoriteClubs).insert(
              FavoriteClubsCompanion.insert(
                idTeam: idDummyItem.idTeam ?? "",
                strLeague: idDummyItem.strLeague ?? "",
                strTeamAlternate: idDummyItem.strTeamAlternate ?? "",
                strStadium: idDummyItem.strStadium ?? "",
                strTeam: idDummyItem.strTeam ?? "",
                strDescriptionEN: idDummyItem.strDescriptionEN ?? "",
                strBadge: idDummyItem.strBadge ?? AppConst.imageExample,
              ),
            );
        isFavorite.value = true;
        _logger.i("Success set as favorite");
      }
    } catch (e) {
      _logger.e("Error in actionOnTapButtonFavorite: $e");
    }
  }

  // void _loadDummyItem() {
  //   state = DummyItemStateLoading();
  //   update();
  //   if (idDummyItem.value.isNotEmpty) {
  //     _repository.loadDummyItem(
  //         response: ResponseHandler(onSuccess: (dummyModel) {
  //           state = DummyItemStateSuccess(dummyModel);
  //         }, onFailed: (e, message) {
  //           state = DummyItemStateError();
  //           _logger.e(e);
  //         }, onDone: () {
  //           update();
  //         }),
  //         id: idDummyItem.value);
  //   } else {
  //     state = DummyItemStateError();
  //     update();
  //   }
  // }
}