import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var text = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Occultum facinus esse potuerit, gaudebit; Quae in controversiam veniunt, de iis, si placet, disseramus. Duo Reges: constructio interrete. Me igitur ipsum ames oportet, non mea, si veri amici futuri sumus. Utrum igitur tibi litteram videor an totas paginas commovere? Conferam avum tuum Drusum cum C. Ex ea difficultate illae fallaciloquae, ut ait Accius, malitiae natae sunt. 

Dicet pro me ipsa virtus nec dubitabit isti vestro beato M. Ita multo sanguine profuso in laetitia et in victoria est mortuus. Mihi enim satis est, ipsis non satis. Itaque his sapiens semper vacabit. Faceres tu quidem, Torquate, haec omnia; In ipsa enim parum magna vis inest, ut quam optime se habere possit, si nulla cultura adhibeatur. Mihi quidem Antiochum, quem audis, satis belle videris attendere. Cur tantas regiones barbarorum pedibus obiit, tot maria transmisit? Quo plebiscito decreta a senatu est consuli quaestio Cn. Gloriosa ostentatio in constituendo summo bono. 

Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus. Nummus in Croesi divitiis obscuratur, pars est tamen divitiarum. Multoque hoc melius nos veriusque quam Stoici. Sed quid attinet de rebus tam apertis plura requirere? Quam illa ardentis amores excitaret sui! Cur tandem? 

Quid ait Aristoteles reliquique Platonis alumni? Illud mihi a te nimium festinanter dictum videtur, sapientis omnis esse semper beatos; Cur fortior sit, si illud, quod tute concedis, asperum et vix ferendum putabit? Ait enim se, si uratur, Quam hoc suave! dicturum. At iam decimum annum in spelunca iacet. Aliter enim explicari, quod quaeritur, non potest. Illud dico, ea, quae dicat, praeclare inter se cohaerere. Neque enim civitas in seditione beata esse potest nec in discordia dominorum domus; Sed quot homines, tot sententiae; 
''';

    return text;
  }
}
