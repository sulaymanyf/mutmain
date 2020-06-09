class Verses {
  int id;
  int verseNumber;
  int chapterId;
  String verseKey;
  String textMadani;
  String textIndopak;
  String textSimple;
  int juzNumber;
  int hizbNumber;
  int rubNumber;
  String sajdah;
  String sajdahNumber;
  int pageNumber;
  List<Translations> translations;
  List<MediaContents> mediaContents;
  List<Words> words;

  Verses(
      {this.id,
        this.verseNumber,
        this.chapterId,
        this.verseKey,
        this.textMadani,
        this.textIndopak,
        this.textSimple,
        this.juzNumber,
        this.hizbNumber,
        this.rubNumber,
        this.sajdah,
        this.sajdahNumber,
        this.pageNumber,
        this.translations,
        this.mediaContents,
        this.words});

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    chapterId = json['chapter_id'];
    verseKey = json['verse_key'];
    textMadani = json['text_madani'];
    textIndopak = json['text_indopak'];
    textSimple = json['text_simple'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubNumber = json['rub_number'];
    sajdah = json['sajdah'];
    sajdahNumber = json['sajdah_number'];
    pageNumber = json['page_number'];
    if (json['translations'] != null) {
      translations = new List<Translations>();
      json['translations'].forEach((v) {
        translations.add(new Translations.fromJson(v));
      });
    }
    if (json['media_contents'] != null) {
      mediaContents = new List<MediaContents>();
      json['media_contents'].forEach((v) {
        mediaContents.add(new MediaContents.fromJson(v));
      });
    }
    if (json['words'] != null) {
      words = new List<Words>();
      json['words'].forEach((v) {
        words.add(new Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['verse_number'] = this.verseNumber;
    data['chapter_id'] = this.chapterId;
    data['verse_key'] = this.verseKey;
    data['text_madani'] = this.textMadani;
    data['text_indopak'] = this.textIndopak;
    data['text_simple'] = this.textSimple;
    data['juz_number'] = this.juzNumber;
    data['hizb_number'] = this.hizbNumber;
    data['rub_number'] = this.rubNumber;
    data['sajdah'] = this.sajdah;
    data['sajdah_number'] = this.sajdahNumber;
    data['page_number'] = this.pageNumber;
    if (this.translations != null) {
      data['translations'] = this.translations.map((v) => v.toJson()).toList();
    }
    if (this.mediaContents != null) {
      data['media_contents'] =
          this.mediaContents.map((v) => v.toJson()).toList();
    }
    if (this.words != null) {
      data['words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int id;
  String languageName;
  String text;
  String resourceName;
  int resourceId;

  Translations(
      {this.id,
        this.languageName,
        this.text,
        this.resourceName,
        this.resourceId});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageName = json['language_name'];
    text = json['text'];
    resourceName = json['resource_name'];
    resourceId = json['resource_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_name'] = this.languageName;
    data['text'] = this.text;
    data['resource_name'] = this.resourceName;
    data['resource_id'] = this.resourceId;
    return data;
  }
}

class MediaContents {
  String url;
  String embedText;
  String provider;
  String authorName;

  MediaContents({this.url, this.embedText, this.provider, this.authorName});

  MediaContents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    embedText = json['embed_text'];
    provider = json['provider'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['embed_text'] = this.embedText;
    data['provider'] = this.provider;
    data['author_name'] = this.authorName;
    return data;
  }
}

class Words {
  int id;
  int position;
  String textMadani;
  String textIndopak;
  String textSimple;
  String verseKey;
  String className;
  int lineNumber;
  int pageNumber;
  String code;
  String codeV3;
  String charType;
  Audio audio;
  Translation translation;
  Translation transliteration;

  Words(
      {this.id,
        this.position,
        this.textMadani,
        this.textIndopak,
        this.textSimple,
        this.verseKey,
        this.className,
        this.lineNumber,
        this.pageNumber,
        this.code,
        this.codeV3,
        this.charType,
        this.audio,
        this.translation,
        this.transliteration});

  Words.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
    textMadani = json['text_madani'];
    textIndopak = json['text_indopak'];
    textSimple = json['text_simple'];
    verseKey = json['verse_key'];
    className = json['class_name'];
    lineNumber = json['line_number'];
    pageNumber = json['page_number'];
    code = json['code'];
    codeV3 = json['code_v3'];
    charType = json['char_type'];
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
    translation = json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null;
    transliteration = json['transliteration'] != null
        ? new Translation.fromJson(json['transliteration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    data['text_madani'] = this.textMadani;
    data['text_indopak'] = this.textIndopak;
    data['text_simple'] = this.textSimple;
    data['verse_key'] = this.verseKey;
    data['class_name'] = this.className;
    data['line_number'] = this.lineNumber;
    data['page_number'] = this.pageNumber;
    data['code'] = this.code;
    data['code_v3'] = this.codeV3;
    data['char_type'] = this.charType;
    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration.toJson();
    }
    return data;
  }
}

class Audio {
  String url;

  Audio({this.url});

  Audio.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Translation {
  int id;
  String languageName;
  String text;
  String resourceName;
  int resourceId;

  Translation(
      {this.id,
        this.languageName,
        this.text,
        this.resourceName,
        this.resourceId});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageName = json['language_name'];
    text = json['text'];
    resourceName = json['resource_name'];
    resourceId = json['resource_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_name'] = this.languageName;
    data['text'] = this.text;
    data['resource_name'] = this.resourceName;
    data['resource_id'] = this.resourceId;
    return data;
  }
}