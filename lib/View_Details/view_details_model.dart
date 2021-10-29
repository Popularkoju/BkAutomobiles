class Get {
  String? id;
  String? name;
  String? address;
  String? contact;
  String? bikeNo;

  Get({this.id, this.name, this.address, this.contact, this.bikeNo});

  factory Get.fromJson(Map<String, dynamic> json) {
    return Get(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      contact: json['contact'],
      bikeNo: json['bike'],
    );
  }
}
