class PersonalInformationModel {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? dob;
  String? email;
  String? startDate;
  String? position;
  String? address;
  String? gender;

  PersonalInformationModel({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.dob,
    this.email,
    this.startDate,
    this.position,
    this.address,
    this.gender,
  });
  factory PersonalInformationModel.fromJson(Map<String, dynamic> json) =>
      PersonalInformationModel(
        id: json['id'],
        fullName: json['full_Name'],
        phoneNumber: json['phone_Number'],
        dob: json['dob'],
        email: json['email'],
        startDate: json['start_Date'],
        position: json['position'],
        address: json['address'],
        gender: json['gender'],
      );

  Map<String, dynamic> tojson() => {
    "full_Name": fullName,
    "phone_Number": phoneNumber,
    "dob": dob,
    "email": email,
    "start_Date": startDate,
    "position": position,
    "address": address,
    "gender": gender,
  };
}
