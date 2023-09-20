class Item {
  String id;
  String name;
  String model;
  String color;
  int count;

  Item({
    required this.id,
    required this.name,
    required this.model,
    required this.color,
    required this.count,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        model: json["model"],
        color: json["color"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": model,
        "color": color,
        "count": count,
      };
}
