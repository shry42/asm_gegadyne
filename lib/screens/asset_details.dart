import 'dart:ffi';

import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/assets_edit_controller.dart';

class AssetDetailsScreen extends StatefulWidget {
  @override
  _AssetDetailsScreenState createState() => _AssetDetailsScreenState();
}

class _AssetDetailsScreenState extends State<AssetDetailsScreen> {
  final AssestsController ac = Get.put(AssestsController());
  final AssetsEditController editAssetController =
      Get.put(AssetsEditController());
  String? id;
  String? emp_Id;
  String? make;
  String? serialNo;
  String? assetTag;
  String? imeiNo;
  String? OSversion;
  String? SSD;
  String? processor;
  String? wifiMacAddress;
  String? lanMacAddress;
  String? approvalStatus;
  String? createdBy;
  String? isActive;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? ram;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    firstName = ac.assets[0].firstName;
    lastName = ac.assets[0].lastName;
    ram = ac.assets[0].ram.toString();
    id = ac.assets[0].id.toString();
    emp_Id = ac.assets[0].empId.toString();
    make = ac.assets[0].make.toString();
    serialNo = ac.assets[0].serialNo.toString();
    assetTag = ac.assets[0].assetTag;
    imeiNo = ac.assets[0].imeiNo;
    OSversion = ac.assets[0].osVersion;
    SSD = ac.assets[0].ssd;
    processor = ac.assets[0].processor;
    wifiMacAddress = ac.assets[0].wifiMacAddress;
    lanMacAddress = ac.assets[0].lanMacAddress;

    approvalStatus = ac.assets[0].approvalStatus;

    createdBy = ac.assets[0].createdBy.toString();

    isActive = ac.assets[0].isActive.toString();
    ram = ac.assets[0].ram.toString();

    AppController.setfirstName(firstName);
    AppController.setlastName(lastName);
    AppController.setaid(id);
    AppController.setaempId(emp_Id);
    AppController.setmake(make);
    AppController.setserialNo(serialNo);
    AppController.setassetTag(assetTag);
    AppController.setimeiNo(imeiNo);
    AppController.setOSversion(OSversion);
    AppController.setSSD(SSD);
    AppController.setprocessor(processor);
    AppController.setwifiMacAddress(wifiMacAddress);
    AppController.setlanMacAddress(lanMacAddress);

    AppController.setapprovalStatus(approvalStatus);
    AppController.setcreatedBy(createdBy);
    AppController.setisActive(isActive);
    AppController.setram(ram);

    super.setState(fn);
  }

  String role = AppController.role;
  bool isEditing = false;
  TextEditingController editText = TextEditingController();
  // Maintain individual editing state for each field
  bool isFirstNameEditing = false;
  bool isLastNameEditing = false;
  // Add similar boolean variables for each field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Details'),
        actions: [
          // Conditionally display the edit button only for superadmins
          if (role == 'Superadmin')
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  // Toggle the edit mode for all fields
                  isEditing = !isEditing;
                  // Reset the editing state for individual fields
                  isFirstNameEditing = false;
                  isLastNameEditing = false;
                  // Reset editing state for other fields
                });
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildDetailItem(
              Icons.person,
              'First Name',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].firstName,
                      (newValue) =>
                          editAssetController.firstName.value = newValue,
                    )
                  : Text('${ac.assets[0].firstName}'),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            _buildDetailItem(
              Icons.person,
              'Last Name',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].lastName,
                      (newValue) =>
                          editAssetController.lastName.value = newValue,
                    )
                  : Text('${ac.assets[0].lastName}'),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            _buildDetailItem(
              Icons.confirmation_number,
              'ID',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].id.toString(),
                      (newValue) => editAssetController.id.value = newValue,
                    )
                  : Text('${ac.assets[0].id.toString()}'),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            _buildDetailItem(
              Icons.confirmation_number,
              'EMP ID',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].empId.toString(),
                      (newValue) => editAssetController.empId.value = newValue,
                    )
                  : Text('${ac.assets[0].empId.toString()}'),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            _buildDetailItem(
              Icons.check_circle_outline,
              'Active Status',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].isActive.toString(),
                      (newValue) =>
                          editAssetController.isActive.value = newValue,
                    )
                  : Text(
                      '${ac.assets[0].isActive.toString()}',
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            _buildDetailItem(
              Icons.devices,
              'Make',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].make.toString(),
                      (newValue) => editAssetController.make.value = newValue,
                    )
                  : Text(
                      '${ac.assets[0].make.toString()}',
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            // ... (other detail items)
            if (role == "Superadmin")
              ElevatedButton(
                onPressed: () async {
                  await editAssetController.editAssetPost();
                },
                child: Text("Update"),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(
    IconData icon,
    String label,
    Widget valueWidget, {
    required bool isEditing,
    required VoidCallback onEditPressed,
  }) {
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
                isEditing
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: valueWidget),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: onEditPressed,
                          ),
                        ],
                      )
                    : valueWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableTextField(
      String initialValue, Function(String)? onChanged) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged != null ? (newValue) => onChanged(newValue) : null,

      // Add onChanged or controller to handle edited values
    );
  }
}
