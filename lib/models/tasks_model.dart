class TasksModel{
  String id ;
  String taskName;
  String descruption ;
  int date ;
  bool isDone;

  TasksModel({
    this.id= '',
    required this.taskName,
    required this.descruption,
    required this.date,
     this.isDone = false});


    TasksModel.fromJson(Map<String,dynamic> json)
     : this(
      id: json['id']  as String ,
      taskName: json['taskName'] as String,
      descruption: json['descruption'] as String,
      date: json['date']  as int,
      isDone: json['isDone']  as bool
       );

    Map <String,dynamic> toJson(){
      return{
        'id': id ,
        'taskName' : taskName,
        'descruption' : descruption,
        'date': date,
        'isDone': isDone,
      };
    }
}