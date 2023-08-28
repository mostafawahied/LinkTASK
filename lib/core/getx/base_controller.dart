import 'package:get/get.dart';

import '../enums/app_state.dart';

class BaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initialValues();
  }

  RxBool networkServiceLoading = false.obs;

//App State
  AppState loadingState = AppState.done;

  set updateState(AppState state) {
    loadingState = state;
    update();
  }

  //Pagination
  bool morePages = false;
  RxBool callingApi = false.obs;
  int maxPage = 1;
  int pageId = 1;
  initialValues() {
    morePages = false;
    callingApi.value = false;
    maxPage = 1;
    pageId = 1;
  }

  setMaxPageId({required int totalSize, required int pageSize}) {
    maxPage = (totalSize / pageSize).ceil();
    if (pageId < maxPage - 1 && maxPage != 1) {
      morePages = true;
    } else {
      morePages = false;
    }
    update();
  }

  Future<void> paginate() async {
    callingApi.value = true;
    pageId++;
    await nextPage();
    callingApi.value = false;
    update();
  }

  Future<void> nextPage() async {}
}
