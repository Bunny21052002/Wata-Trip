List countryCode = [
  "+91",
  "+1",
  "+65",
  "+60",
];

List RSList = [];

class RecentSearchList {
  recentSearchList(
      {required String name,
      required String image,
      required int id,
      required String apiId}) {
    if (RSList.length > 3) {
      RSList.removeLast();
      RSList.add({"name": name, "image": image, "id": id, "api_id": apiId});
    } else {
      RSList.add({"name": name, "image": image, "id": id, "api_id": apiId});

    }
  }
}
