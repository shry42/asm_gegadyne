import 'package:asm_gegadyne/controllers/app_controllers.dart';
import 'package:asm_gegadyne/controllers/assets_controller.dart';
import 'package:asm_gegadyne/controllers/login_controllers.dart';
import 'package:asm_gegadyne/controllers/make_controller.dart';
import 'package:asm_gegadyne/controllers/type_controller.dart';
import 'package:asm_gegadyne/screens/login_page.dart';
import 'package:asm_gegadyne/utils/dialogbox_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../controllers/assets_edit_controller.dart';

class AssetDetailsScreen extends StatefulWidget {
  const AssetDetailsScreen({super.key});

  @override
  _AssetDetailsScreenState createState() => _AssetDetailsScreenState();
}

class _AssetDetailsScreenState extends State<AssetDetailsScreen> {
  final AssestsController ac = Get.put(AssestsController());
  final AssetsEditController editAssetController =
      Get.put(AssetsEditController());
  final loginController lc = Get.put(loginController());
  final makeController mc = Get.put(makeController());
  final typeController tc = Get.put(typeController());

  String? id;
  String? emp_Id;
  String? make;
  String? type;
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
  void initState() {
    // TODO: implement setState
    firstName = ac.assets[0].firstName;

    lastName = ac.assets[0].lastName;
    ram = ac.assets[0].ram.toString();
    id = ac.assets[0].id.toString();
    emp_Id = ac.assets[0].empId.toString();
    make = ac.assets[0].make.toString();
    type = ac.assets[0].type.toString();
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
    createdAt = ac.assets[0].createdAt.toString();

    isActive = ac.assets[0].isActive.toString();
    ram = ac.assets[0].ram.toString();

    AppController.setfirstName(firstName);
    AppController.setlastName(lastName);
    AppController.setaid(id);
    AppController.setaempId(emp_Id);
    AppController.setmake(make);
    AppController.settype(type);
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
    AppController.setcreatedBy(createdBy);
    AppController.setcreatedAt(createdAt);

    mc.fetchMakeList();
    tc.fetchTypeList();

    // -----------------------------------------------\\

    // log(AppController.firstName.toString());
    // log(AppController.lastName);

    // log(AppController.id);
    super.initState();
  }

  String role = AppController.role;
  bool isEditing = false;
  TextEditingController editText = TextEditingController();
  // Maintain individual editing state for each field
  bool isFirstNameEditing = false;

  bool isMakeEditing = false;

  bool isTypeEditing = false;

  bool isSerialNoEditing = false;

  bool isAssetTageEditing = false;

  bool isImeiEditing = false;

  bool isOsVersionEditing = false;

  bool isSsdEditing = false;

  bool isRamEditing = false;

  bool isProcessorEditing = false;
  bool isLanMacAddressEditing = false;

  bool isWifiMacAddressEditing = false;
  bool isApprovalStatusEditing = false;

  // Add similar boolean variables for each field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Assets'),
        actions: [
          // if (role == 'Superadmin')
          Shimmer(
            duration: const Duration(seconds: 2),
            // This is NOT the default value. Default value: Duration(seconds: 0)
            interval: const Duration(milliseconds: 20),
            // This is the default value
            color: Colors.white,
            // This is the default value
            colorOpacity: 1,
            // This is the default value
            enabled: true,
            // This is the default value
            direction: const ShimmerDirection.fromLTRB(),
            child: GestureDetector(
              onTap: () {
                Get.to(Get.defaultDialog(
                  title: 'Change Password',
                  content: DialogBox(),
                ));
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(6)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Conditionally display the edit button only for superadmins
          if (role == 'Superadmin')
            // IconButton(
            //   icon: Icon(Icons.edit),
            //   onPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for all fields
            //       isEditing = !isEditing;
            //       // Reset the editing state for individual fields
            //       isFirstNameEditing = false;
            //       isMakeEditing = false;
            //       isSerialNoEditing = false;
            //       isAssetTageEditing = false;
            //       isImeiEditing = false;
            //       isOsVersionEditing = false;
            //       isSsdEditing = false;
            //       isRamEditing = false;
            //       isProcessorEditing = false;
            //       isLanMacAddressEditing = false;
            //       isWifiMacAddressEditing = false;

            //       // Reset editing state for other fields
            //     });
            //   },

            Shimmer(
              duration: const Duration(seconds: 2),
              // This is NOT the default value. Default value: Duration(seconds: 0)
              interval: const Duration(milliseconds: 20),
              // This is the default value
              color: Colors.white,
              // This is the default value
              colorOpacity: 1,
              // This is the default value
              enabled: true,
              // This is the default value
              direction: const ShimmerDirection.fromLTRB(),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the edit mode for all fields
                    isEditing = !isEditing;
                    // Reset the editing state for individual fields
                    isFirstNameEditing = false;
                    isMakeEditing = false;
                    isTypeEditing = false;
                    isSerialNoEditing = false;
                    isAssetTageEditing = false;
                    isImeiEditing = false;
                    isOsVersionEditing = false;
                    isSsdEditing = false;
                    isRamEditing = false;
                    isProcessorEditing = false;
                    isLanMacAddressEditing = false;
                    isWifiMacAddressEditing = false;

                    // Reset editing state for other fields
                  });
                },
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Edit',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              lc.onDelete;
              Get.offAll(() => const LoginPage(),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 200));
              // lc.logout();
              lc.user!.role = "";
              lc.user!.emailId = "";
              lc.user!.firstName = "";
              lc.user!.lastName = "";
              lc.user!.id = 0;
              // lc.resetControllers();
            },
            child: Container(
              child: Image.asset(
                'assets/logout.png',
                height: 38,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildDetailItem(
              Icons.person,
              'Full Name',
              isFirstNameEditing
                  ? _buildEditableTextField(
                      ac.assets[0].firstName,
                      (newValue) =>
                          editAssetController.firstName.value = newValue,
                    )
                  : Text('${ac.assets[0].firstName}' +
                      ' ${ac.assets[0].lastName}'),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  // isFirstNameEditing = !isFirstNameEditing;
                });
              },
            ),
            // _buildDetailItem(
            //   Icons.person,
            //   'Last Name',
            //   isFirstNameEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].lastName,
            //           (newValue) =>
            //               editAssetController.lastName.value = newValue,
            //         )
            //       : Text('${ac.assets[0].lastName}'),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isFirstNameEditing = !isFirstNameEditing;
            //     });
            //   },
            // ),
            // _buildDetailItem(
            //   Icons.confirmation_number,
            //   'ID',
            //   isFirstNameEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].id.toString(),
            //           (newValue) => editAssetController.id.value = newValue,
            //         )
            //       : Text('${ac.assets[0].id.toString()}'),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isFirstNameEditing = !isFirstNameEditing;
            //     });
            //   },
            // ),
            // _buildDetailItem(
            //   Icons.confirmation_number,
            //   'EMP ID',
            //   isFirstNameEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].empId.toString(),
            //           (newValue) => editAssetController.empId.value = newValue,
            //         )
            //       : Text('${ac.assets[0].empId.toString()}'),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isFirstNameEditing = !isFirstNameEditing;
            //     });
            //   },
            // ),
            // _buildDetailItem(
            //   Icons.check_circle_outline,
            //   'Active Status',
            //   isFirstNameEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].isActive.toString(),
            //           (newValue) =>
            //               editAssetController.isActive.value = newValue,
            //         )
            //       : Text(
            //           '${ac.assets[0].isActive.toString()}',
            //         ),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isFirstNameEditing = !isFirstNameEditing;
            //     });
            //   },
            // ),

            // _buildDetailItem(
            //   Icons.devices,
            //   'Make',
            //   isMakeEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].make.toString(),
            //           (newValue) => editAssetController.make.value = newValue,
            //         )
            //       : Obx(
            //           () => Text(
            //             '${editAssetController.make}',
            //           ),
            //         ),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isMakeEditing = !isMakeEditing;
            //     });
            //   }
            // ),

            //Below is added change for ***** asset make ******

            _buildDetailItem(
              Icons.devices,
              'Asset Make',
              isMakeEditing
                  ? DropdownButton<String>(
                      value: editAssetController.make.value,
                      onChanged: (String? newValue) {
                        setState(() {
                          editAssetController.make.value = newValue!;
                          editAssetController.id.value = newValue;
                        });
                      },
                      items: mc.makeList.map((item) {
                        return DropdownMenuItem<String>(
                          value: item.make.toString(),
                          child: Text(item.make.toString()),
                        );
                      }).toList())
                  : Obx(
                      () => Text(
                        '${editAssetController.make}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  isMakeEditing = !isMakeEditing;
                });
              },
            ),

            //***ASSET TYPE***/

            // _buildDetailItem(
            //   Icons.devices,
            //   'Asset Type',
            //   isTypeEditing
            //       ? DropdownButton<String>(
            //           value: editAssetController.type.value,
            //           onChanged: (String? newValue) {
            //             setState(() {
            //               editAssetController.type.value = newValue!;
            //             });
            //           },
            //           items: <String>[
            //             // mc.makeList
            //             //     .map((e) => e.make.toString())
            //             //     .toList()
            //             //     .toString(),
            //             tc.typeList[0].type.toString(),
            //             tc.typeList[1].type.toString(),
            //             tc.typeList[2].type.toString(),
            //             // tc.typeList[3].type.toString(),
            //             // tc.typeList[4].type.toString(),
            //             // tc.typeList[5].type.toString(),
            //             // tc.typeList[6].type.toString(),
            //           ].map<DropdownMenuItem<String>>((String value) {
            //             return DropdownMenuItem<String>(
            //               value: value,
            //               child: Text(value),
            //             );
            //           }).toList(),
            //         )
            //       : Obx(
            //           () => Text(
            //             '${editAssetController.type}',
            //           ),
            //         ),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       isTypeEditing = !isTypeEditing;
            //     });
            //   },
            // ),

// *****************************************//

            _buildDetailItem(
              Icons.confirmation_number,
              'Serial No',
              isSerialNoEditing
                  ? _buildEditableTextField(
                      ac.assets[0].serialNo.toString(),
                      (newValue) =>
                          editAssetController.serialNo.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.serialNo}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isSerialNoEditing = !isSerialNoEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.data_array,
              'Asset Tag',
              isAssetTageEditing
                  ? _buildEditableTextField(
                      ac.assets[0].assetTag.toString(),
                      (newValue) =>
                          editAssetController.assetTag.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.assetTag}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isAssetTageEditing = !isAssetTageEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.numbers,
              'IMEI Number',
              isImeiEditing
                  ? _buildEditableTextField(
                      ac.assets[0].imeiNo.toString(),
                      (newValue) => editAssetController.imeiNo.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.imeiNo}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isImeiEditing = !isImeiEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.mobile_screen_share,
              'OS Version',
              isOsVersionEditing
                  ? _buildEditableTextField(
                      ac.assets[0].osVersion.toString(),
                      (newValue) =>
                          editAssetController.OSversion.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.OSversion}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isOsVersionEditing = !isOsVersionEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.storage,
              'SSD',
              isSsdEditing
                  ? _buildEditableTextField(
                      ac.assets[0].ssd.toString(),
                      (newValue) => editAssetController.SSD.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.SSD}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isSsdEditing = !isSsdEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.memory,
              'Ram',
              isRamEditing
                  ? _buildEditableTextField(
                      ac.assets[0].ram.toString(),
                      (newValue) => editAssetController.ram.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.ram}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isRamEditing = !isRamEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.memory,
              'Processor',
              isProcessorEditing
                  ? _buildEditableTextField(
                      ac.assets[0].processor.toString(),
                      (newValue) =>
                          editAssetController.processor.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.processor}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isProcessorEditing = !isProcessorEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.lan,
              'Lan Mac Address',
              isLanMacAddressEditing
                  ? _buildEditableTextField(
                      ac.assets[0].lanMacAddress.toString(),
                      (newValue) =>
                          editAssetController.lanMacAddress.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.lanMacAddress}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isLanMacAddressEditing = !isLanMacAddressEditing;
                });
              },
            ),

            _buildDetailItem(
              Icons.network_wifi,
              'Wifi Mac Address',
              isWifiMacAddressEditing
                  ? _buildEditableTextField(
                      ac.assets[0].wifiMacAddress.toString(),
                      (newValue) =>
                          editAssetController.wifiMacAddress.value = newValue,
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.wifiMacAddress}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  // Toggle the edit mode for First Name field
                  isWifiMacAddressEditing = !isWifiMacAddressEditing;
                });
              },
            ),

            // _buildDetailItem(
            //   Icons.check_circle,
            //   'ApprovalStatus',
            //   isApprovalStatusEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].approvalStatus.toString(),
            //           (newValue) =>
            //               editAssetController.approvalStatus.value = newValue,
            //         )
            //       : Obx(
            //           () => Text(
            //             '${editAssetController.approvalStatus}',
            //           ),
            //         ),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isApprovalStatusEditing = !isApprovalStatusEditing;
            //     });
            //   },
            // ),

            //**** Dropdown option added */

            _buildDetailItem(
              Icons.check_circle,
              'Asset Checkout Status',
              isApprovalStatusEditing
                  ? DropdownButton<String>(
                      value: editAssetController.approvalStatus.value,
                      onChanged: (String? newValue) {
                        setState(() {
                          editAssetController.approvalStatus.value = newValue!;
                        });
                      },
                      items: <String>['Yes', 'No']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  : Obx(
                      () => Text(
                        '${editAssetController.approvalStatus}',
                      ),
                    ),
              isEditing: isEditing,
              onEditPressed: () {
                setState(() {
                  isApprovalStatusEditing = !isApprovalStatusEditing;
                });
              },
            ),

            // _buildDetailItem(
            //   Icons.person,
            //   'createdBy',
            //   isFirstNameEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].createdBy.toString(),
            //           (newValue) =>
            //               editAssetController.createdBy.value = newValue,
            //         )
            //       : Text(
            //           '${ac.assets[0].createdBy.toString()}',
            //         ),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isFirstNameEditing = !isFirstNameEditing;
            //     });
            //   },
            // ),

            // _buildDetailItem(
            //   Icons.check_circle_outline,
            //   'createdAt',
            //   isFirstNameEditing
            //       ? _buildEditableTextField(
            //           ac.assets[0].createdAt.toString(),
            //           (newValue) =>
            //               editAssetController.createdAt.value = newValue,
            //         )
            //       : Text(
            //           '${ac.assets[0].createdAt.toString()}',
            //         ),
            //   isEditing: isEditing,
            //   onEditPressed: () {
            //     setState(() {
            //       // Toggle the edit mode for First Name field
            //       isFirstNameEditing = !isFirstNameEditing;
            //     });
            //   },
            // ),

            // ... (other detail items)
            if (role == "Superadmin" && isEditing == true)
              Center(
                child: GestureDetector(
                  onTap: () async {
                    await editAssetController.editAssetPost();
                    setState(() {
                      isEditing;
                      isFirstNameEditing = false;
                      isMakeEditing = false;
                      isSerialNoEditing = false;
                      isAssetTageEditing = false;
                      isImeiEditing = false;
                      isOsVersionEditing = false;
                      isSsdEditing = false;
                      isRamEditing = false;
                      isProcessorEditing = false;
                      isLanMacAddressEditing = false;
                      isWifiMacAddressEditing = false;
                      isApprovalStatusEditing = false;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white70,
                    ),
                    child: const Center(
                        child: Text(
                      "Update",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
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
    VoidCallback? onEditPressed,
  }) {
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
                isEditing
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: valueWidget),
                          IconButton(
                            icon: const Icon(Icons.edit),
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
      onChanged: onChanged != null
          ? (newValue) {
              onChanged.call(newValue);
            }
          : null,

      // Add onChanged or controller to handle edited values
    );
  }

  Widget _buildApprovalStatusDropdown() {
    return DropdownButtonFormField<String>(
      value: 'Yes', // Set initial value here if needed
      items: [
        DropdownMenuItem<String>(
          value: 'Yes',
          child: Text('Yes'),
        ),
        DropdownMenuItem<String>(
          value: 'No',
          child: Text('No'),
        ),
      ],
      onChanged: (newValue) {
        // Handle onChanged event for Approval Status dropdown
        // You may want to update state or variables accordingly
      },
    );
  }
}
