class Request {
  String id;
  String name;
  String reason;
  String date;
  String status;

  Request({
    required this.id,
    required this.name,
    required this.reason,
    required this.date,
    required this.status,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        name: json["client"]["name"],
        reason: json["reason"],
        date: json["updated_at"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": reason,
        "updated_at": date,
        "status": status,
      };
}
