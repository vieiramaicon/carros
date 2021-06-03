import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    //var url = 'http://loripsum.net/api/10/short/headers';
    //var response = await http.get(url);
    var text = '''<h1>Non quam nostram quidem, inquit Pomponius iocans;</h1>

<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. At eum nihili facit; Primum in nostrane potestate est, quid meminerimus? Itaque fecimus. Eaedem res maneant alio modo. </p>

<p>Graece donan, Latine voluptatem vocant. Qui est in parvis malis. </p>

<p>Si enim ad populum me vocas, eum. Duo enim genera quae erant, fecit tria. Addidisti ad extremum etiam indoctum fuisse. Nos vero, inquit ille; </p>

<p>Primum in nostrane potestate est, quid meminerimus? Multoque hoc melius nos veriusque quam Stoici. Stoicos roga. Sed fac ista esse non inportuna; </p>

<p>Quid de Platone aut de Democrito loquar? Recte, inquit, intellegis. </p>

<p>Equidem e Cn. Et quidem, inquit, vehementer errat; Equidem e Cn. Invidiosum nomen est, infame, suspectum. Quo modo? Nunc vides, quid faciat. </p>

<p>Hunc vos beatum; Ut id aliis narrare gestiant? Erat enim Polemonis. Nam quid possumus facere melius? </p>''';

    text = text.replaceAll('<p>', '');
    text = text.replaceAll('</p>', '');

    text = text.replaceAll('<h1>', '');
    text = text.replaceAll('</h1>', '');

    return text;
  }
}
