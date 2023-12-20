import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetDetailsScreen extends StatelessWidget {
  final AssestsController ac = Get.put(AssestsController());
  String role = AppController.role;
  bool isEditing = false;

  AssetDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
        actions: [
          if (role == 'Superadmin')
            Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.lightGreenAccent),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(80),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
          const SizedBox(width: 25),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildDetailItem(
                Icons.person, 'First Name', ac.assets[0].firstName),
            _buildDetailItem(
                Icons.person, 'Last Name', ac.assets[0].lastName),
            _buildDetailItem(Icons.confirmation_number, 'ID', '1'),
            _buildDetailItem(Icons.person_outline, 'Emp ID', '1'),
            _buildDetailItem(Icons.devices, 'Make', ac.assets[0].make),
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
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 30),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
