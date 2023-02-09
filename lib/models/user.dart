class MyUserAdmin{
String id;
String name;
String role;
String email;
int activity;
MyUserAdmin({this.id="",required this.name,required
this.role,required this.email,required this.activity});

MyUserAdmin.fromJson(Map<String,dynamic>json):this(
  id: json['id'],
  name: json['name'],
  role: json['role'],
  email: json['email'],
  activity: json['activity']
);

Map<String,dynamic> toJson(){
  return {
    "id": id,
    "name": name,
    "role": role,
    "email": email,
    "activity": activity
  };
}

}