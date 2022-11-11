// ignore_for_file: public_member_api_docs, sort_constructors_first
class HelpModel {
  int status;
  String message;
  List<Help> help;
  HelpModel({
    required this.message,
    required this.status,
    required this.help,
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
        
        status: json["status"],
        message: json["message"],
        help: List<Help>.from(
          json["help"].map(
            (x) => Help.fromJson(x),
          ),
        ),
      );
}

class Help {
      bool expanded=false;
  int id;
  String question;
  String answer;
  Help({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory Help.fromJson(Map<String, dynamic> json) =>
      Help(id: json["id"], question: json["question"], answer: json["answer"]);
}
