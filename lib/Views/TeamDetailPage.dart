import 'package:flutter/material.dart';

class TeamDetailPage extends StatelessWidget {
  final Map<String, dynamic> team;

  TeamDetailPage({required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team Details',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 233, 233),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildTeamDetail(context),
    );
  }

  Widget _buildTeamDetail(BuildContext context) {
    Color backgroundColor = Colors.transparent;

    if (team['conference'] == 'East') {
      backgroundColor = Colors.blue;
    } else if (team['conference'] == 'West') {
      backgroundColor = Colors.red;
    }

    return Container(
      padding: EdgeInsets.all(16),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            team['full_name'],
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                team['abbreviation'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailItem('Name:', team['name']),
              _buildDetailItem('City:', team['city']),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailItem('Conference:', team['conference']),
              _buildDetailItem('Division:', team['division']),
            ],
          ),
          SizedBox(height: 16),
          _buildBackButton(context),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String propertyName, String propertyValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          propertyName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Text(
          propertyValue,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 200),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Return to Team List'),
    );
  }
}
