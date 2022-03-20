class Question {
  int idx = 0;
  String urlx = '';
  String textx = '';
  String subtextx = '';
  String titlex = '';
  String passing = '';
  List<dynamic>colleges=[];
  Question({
    String url = '',
    int id = 0,
    String text = '',
    String subtext = '',
    String title = '',
    String pass = '',
    required List<dynamic> clg,
  }) {
    idx = id;
    urlx = url;
    textx = text;
    subtextx = subtext;
    titlex = title;
    passing = pass;
    colleges=clg;
  }
}

class Ques {
  int idx = 0;
  String urlx = '';
  String textx = '';
  String subtextx = '';
  String titlex = '';
  String passing = '';
  Ques({
    String url = '',
    int id = 0,
    String text = '',
    String subtext = '',
    String title = '',
    String pass = '',
  }) {
    idx = id;
    urlx = url;
    textx = text;
    subtextx = subtext;
    titlex = title;
    passing = pass;
  }
}
