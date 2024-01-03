class Asset {
  final int id;
  final int empId;
  final String make;
  // final String makeId;
  final String type;
  final String model;

  final String? assetHandOverDate;

  final String serialNo;
  final String assetTag;
  final String imeiNo;
  final String osVersion;
  final String ssd;
  final String ram;
  final String processor;
  final String lanMacAddress;
  final String wifiMacAddress;
  final String approvalStatus;
  final int createdBy;
  final int isActive;
  final String createdAt;
  final String firstName;
  final String lastName;

  Asset({
    required this.id,
    required this.empId,
    required this.make,
    required this.type,
    required this.model,
    required this.assetHandOverDate,
    required this.serialNo,
    required this.assetTag,
    required this.imeiNo,
    required this.osVersion,
    required this.ssd,
    required this.ram,
    required this.processor,
    required this.lanMacAddress,
    required this.wifiMacAddress,
    required this.approvalStatus,
    required this.createdBy,
    required this.isActive,
    required this.createdAt,
    required this.firstName,
    required this.lastName,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'],
      empId: json['emp_Id'],
      type: json['type'],
      model: json['model'],
      assetHandOverDate: json['assetHandOverDate'],
      make: json['make'],
      serialNo: json['serialNo'],
      assetTag: json['assetTag'],
      imeiNo: json['imeiNo'],
      osVersion: json['OSversion'],
      ssd: json['SSD'],
      ram: json['ram'],
      processor: json['processor'],
      lanMacAddress: json['lanMacAddress'],
      wifiMacAddress: json['wifiMacAddress'],
      approvalStatus: json['approvalStatus'],
      createdBy: json['createdBy'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'emp_Id': empId,
      'make': make,
      'type': type,
      'model': model,
      'assetHandOverDate': assetHandOverDate,
      'serialNo': serialNo,
      'assetTag': assetTag,
      'imeiNo': imeiNo,
      'OSversion': osVersion,
      'SSD': ssd,
      'ram': ram,
      'processor': processor,
      'lanMacAddress': lanMacAddress,
      'wifiMacAddress': wifiMacAddress,
      'approvalStatus': approvalStatus,
      'createdBy': createdBy,
      'isActive': isActive,
      'createdAt': createdAt,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
