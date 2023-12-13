import "package:dio/dio.dart";

class RetrieveTeams {
  Dio dio = Dio();
  List<Map<String, dynamic>> teamsList = [];

  Future<List<Map<String, dynamic>>> fetchTeams() async {
    try {
      final response = await dio.get('https://www.balldontlie.io/api/v1/teams');

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData.isNotEmpty) {
          for (var teamData in responseData['data']) {
            Map<String, dynamic> teamInfo = {
              'id': teamData['id'],
              'abbreviation': teamData['abbreviation'],
              'city': teamData['city'],
              'conference': teamData['conference'],
              'division': teamData['division'],
              'full_name': teamData['full_name'],
              'name': teamData['name']
            };
            teamsList.add(teamInfo);
          }
          return teamsList;
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return [];
  }
}
