// ignore: camel_case_types
class todoModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  todoModel({this.userId, this.id, this.title, this.completed});

  todoModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}