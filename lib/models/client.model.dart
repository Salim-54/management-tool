class Client {
  String id;
  String name;
  String office;
  String phone;

  Client({
    required this.id,
    required this.name,
    required this.office,
    required this.phone,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        office: json["office"],
        phone: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": office,
        "phone": phone,
      };
}
