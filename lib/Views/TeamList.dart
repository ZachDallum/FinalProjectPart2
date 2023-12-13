import 'package:finalproject/Repositories/UserClient.dart';
import 'package:flutter/material.dart';
import 'TeamDetailPage.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  List<Map<String, dynamic>> teamsList = [];

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  Future<void> _loadTeams() async {
    try {
      List<Map<String, dynamic>> teams = await RetrieveTeams().fetchTeams();
      setState(() {
        teamsList = teams;
      });
    } catch (e) {
      print('Error loading teams: $e');
    }
  }

  void _showReloadSnackbar() {
    final snackBar = SnackBar(content: Text('Teams have been reloaded'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NBA Team List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 233, 233),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.transparent,
      body: _buildTeamListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadTeams();
          _showReloadSnackbar();
        },
        tooltip: 'Reload Teams',
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildTeamListView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.red],
        ),
      ),
      child: ListView.separated(
        itemCount: teamsList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> team = teamsList[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  team['full_name'],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Conference: ${team['conference']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Abbr: ${team['abbreviation']}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onTap: () {
              _navigateToTeamDetail(context, team);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }

  void _navigateToTeamDetail(BuildContext context, Map<String, dynamic> team) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeamDetailPage(team: team),
      ),
    );
  }
}
