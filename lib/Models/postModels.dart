// class PostsModel {
//   PostsModel({
//       int? userId, 
//       int? id, 
//       String? title, 
//       String? body,}){
//     _userId = userId;
//     _id = id;
//     _title = title;
//     _body = body;
// }

//   PostsModel.fromJson(dynamic json) {
//     _userId = json['userId'];
//     _id = json['id'];
//     _title = json['title'];
//     _body = json['body'];
//   }
//   int? _userId;
//   int? _id;
//   String? _title;
//   String? _body;

//   int? get userId => _userId;
//   int? get id => _id;
//   String? get title => _title;
//   String? get body => _body;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['userId'] = _userId;
//     map['id'] = _id;
//     map['title'] = _title;
//     map['body'] = _body;
//     return map;
//   }
class Model1 {
  int? userId;
  int? id;
  String? title;
  String? body;

  Model1({this.userId, this.id, this.title, this.body});

  Model1.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}


