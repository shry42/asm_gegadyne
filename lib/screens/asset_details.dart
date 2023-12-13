import 'package:flutter/material.dart';

class AssetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildDetailItem(Icons.person, 'First Name', 'shravan'),
            _buildDetailItem(Icons.person, 'Last Name', 'yadav'),
            _buildDetailItem(Icons.confirmation_number, 'ID', '1'),
            _buildDetailItem(Icons.person_outline, 'Emp ID', '1'),
            _buildDetailItem(Icons.devices, 'Make', 'Laptop'),
            _buildDetailItem(Icons.confirmation_number, 'Serial No', 'gf'),
            _buildDetailItem(Icons.confirmation_number, 'Asset Tag', 'hfh'),
            _buildDetailItem(Icons.confirmation_number, 'IMEI No', 'jfhj'),
            _buildDetailItem(Icons.mobile_screen_share, 'OS Version', 'h'),
            _buildDetailItem(Icons.memory, 'SSD', 'hjh'),
            _buildDetailItem(Icons.memory, 'RAM', 'fh'),
            _buildDetailItem(Icons.memory, 'Processor', 'fhjf'),
            _buildDetailItem(Icons.network_wifi, 'LAN MAC Address', 'hjfhj'),
            _buildDetailItem(Icons.network_wifi, 'WiFi MAC Address', 'fhj'),
            _buildDetailItem(Icons.check_circle, 'Approval Status', 'Yes'),
            _buildDetailItem(Icons.person, 'Created By', '1'),
            _buildDetailItem(Icons.check_circle_outline, 'Active Status', '1'),
            _buildDetailItem(
                Icons.access_time, 'Created At', '2023-12-12T18:37:20.137Z'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 30),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  value,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
