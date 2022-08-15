class TasksModel{
  String id ;
  String taskName;
  String descruption ;
  int date ;

  TasksModel({
    this.id= '',
    required this.taskName,
    required this.descruption,
    required this.date});


    TasksModel.fromJson(Map<String,dynamic> json)
     : this(
      id: json['id']  as String ,
      taskName: json['taskName'] as String,
      descruption: json['descruption'] as String,
      date: json['date']  as int
       );

    Map <String,dynamic> toJson(){
      return{
        'id': id ,
        'taskName' : taskName,
        'descruption' : descruption,
        'date': date
      };
    }
}