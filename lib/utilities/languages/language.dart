class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "தமிழ்", "ta"),
      Language(2, "English", "en"),
      Language(3, "हिंदी", "hi"),
      Language(4, "తెలుగు", "te"),
      Language(5, "ಕನ್ನಡ", "kn")
      //TODO : add Hindi language
    ];
  }
}
