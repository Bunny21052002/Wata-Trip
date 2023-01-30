import 'package:wata_trip/Widgets/recentSearch.dart';

import '../constants/constants.dart';

List countryCode = [
  "+91",
  "+1",
  "+65",
  "+60",
];

class RecentSearchList {
  recentSearchList(
      {required String name,
      required String image,
      required int id,
      required String apiId}) {
    if (rsList.length > 3) {
      rsList.removeLast();
      rsList.insert(
          0, (RecentSearch(name: name, image: image, id: id, api_id: apiId)));
    } else {
      rsList
        ..insert(
            0, (RecentSearch(name: name, image: image, id: id, api_id: apiId)));
    }
  }
}

List<RecentSearch> rsList = [];
