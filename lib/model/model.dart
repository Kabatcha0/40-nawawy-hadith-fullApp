class Hadith {
  late String key;
  late String nameHadith;
  late String textHadith;
  late String explanationHadith;
  late String translateNarrator;
  late String audioHadith;
  Hadith(
      {required this.key,
      required this.audioHadith,
      required this.explanationHadith,
      required this.nameHadith,
      required this.textHadith,
      required this.translateNarrator});
  Hadith.fromJson(Map<String, dynamic> json) {
    key = json["key"];
    nameHadith = json["nameHadith"];
    textHadith = json["textHadith"];
    explanationHadith = json["explanationHadith"];
    translateNarrator = json["translateNarrator"];
    audioHadith = json["audioHadith"];
  }
}
