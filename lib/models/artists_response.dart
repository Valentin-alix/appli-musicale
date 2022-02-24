class ArtistsResponse {
  List<Artists>? artists;

  ArtistsResponse({this.artists});

  ArtistsResponse.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  String? idArtist;
  String? strArtist;
  Null? strArtistStripped;
  String? strArtistAlternate;
  String? strLabel;
  String? idLabel;
  String? intFormedYear;
  String? intBornYear;
  Null? intDiedYear;
  Null? strDisbanded;
  String? strStyle;
  String? strGenre;
  String? strMood;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strBiographyEN;
  String? strBiographyDE;
  String? strBiographyFR;
  String? strBiographyCN;
  String? strBiographyIT;
  String? strBiographyJP;
  String? strBiographyRU;
  String? strBiographyES;
  String? strBiographyPT;
  String? strBiographySE;
  String? strBiographyNL;
  String? strBiographyHU;
  String? strBiographyNO;
  String? strBiographyIL;
  String? strBiographyPL;
  String? strGender;
  String? intMembers;
  String? strCountry;
  String? strCountryCode;
  String? strArtistThumb;
  String? strArtistLogo;
  String? strArtistCutout;
  String? strArtistClearart;
  String? strArtistWideThumb;
  String? strArtistFanart;
  String? strArtistFanart2;
  String? strArtistFanart3;
  String? strArtistFanart4;
  String? strArtistBanner;
  String? strMusicBrainzID;
  Null? strISNIcode;
  String? strLastFMChart;
  String? intCharted;
  String? strLocked;

  Artists(
      {this.idArtist,
      this.strArtist,
      this.strArtistStripped,
      this.strArtistAlternate,
      this.strLabel,
      this.idLabel,
      this.intFormedYear,
      this.intBornYear,
      this.intDiedYear,
      this.strDisbanded,
      this.strStyle,
      this.strGenre,
      this.strMood,
      this.strWebsite,
      this.strFacebook,
      this.strTwitter,
      this.strBiographyEN,
      this.strBiographyDE,
      this.strBiographyFR,
      this.strBiographyCN,
      this.strBiographyIT,
      this.strBiographyJP,
      this.strBiographyRU,
      this.strBiographyES,
      this.strBiographyPT,
      this.strBiographySE,
      this.strBiographyNL,
      this.strBiographyHU,
      this.strBiographyNO,
      this.strBiographyIL,
      this.strBiographyPL,
      this.strGender,
      this.intMembers,
      this.strCountry,
      this.strCountryCode,
      this.strArtistThumb,
      this.strArtistLogo,
      this.strArtistCutout,
      this.strArtistClearart,
      this.strArtistWideThumb,
      this.strArtistFanart,
      this.strArtistFanart2,
      this.strArtistFanart3,
      this.strArtistFanart4,
      this.strArtistBanner,
      this.strMusicBrainzID,
      this.strISNIcode,
      this.strLastFMChart,
      this.intCharted,
      this.strLocked});

  Artists.fromJson(Map<String, dynamic> json) {
    idArtist = json['idArtist'];
    strArtist = json['strArtist'];
    strArtistStripped = json['strArtistStripped'];
    strArtistAlternate = json['strArtistAlternate'];
    strLabel = json['strLabel'];
    idLabel = json['idLabel'];
    intFormedYear = json['intFormedYear'];
    intBornYear = json['intBornYear'];
    intDiedYear = json['intDiedYear'];
    strDisbanded = json['strDisbanded'];
    strStyle = json['strStyle'];
    strGenre = json['strGenre'];
    strMood = json['strMood'];
    strWebsite = json['strWebsite'];
    strFacebook = json['strFacebook'];
    strTwitter = json['strTwitter'];
    strBiographyEN = json['strBiographyEN'];
    strBiographyDE = json['strBiographyDE'];
    strBiographyFR = json['strBiographyFR'];
    strBiographyCN = json['strBiographyCN'];
    strBiographyIT = json['strBiographyIT'];
    strBiographyJP = json['strBiographyJP'];
    strBiographyRU = json['strBiographyRU'];
    strBiographyES = json['strBiographyES'];
    strBiographyPT = json['strBiographyPT'];
    strBiographySE = json['strBiographySE'];
    strBiographyNL = json['strBiographyNL'];
    strBiographyHU = json['strBiographyHU'];
    strBiographyNO = json['strBiographyNO'];
    strBiographyIL = json['strBiographyIL'];
    strBiographyPL = json['strBiographyPL'];
    strGender = json['strGender'];
    intMembers = json['intMembers'];
    strCountry = json['strCountry'];
    strCountryCode = json['strCountryCode'];
    strArtistThumb = json['strArtistThumb'];
    strArtistLogo = json['strArtistLogo'];
    strArtistCutout = json['strArtistCutout'];
    strArtistClearart = json['strArtistClearart'];
    strArtistWideThumb = json['strArtistWideThumb'];
    strArtistFanart = json['strArtistFanart'];
    strArtistFanart2 = json['strArtistFanart2'];
    strArtistFanart3 = json['strArtistFanart3'];
    strArtistFanart4 = json['strArtistFanart4'];
    strArtistBanner = json['strArtistBanner'];
    strMusicBrainzID = json['strMusicBrainzID'];
    strISNIcode = json['strISNIcode'];
    strLastFMChart = json['strLastFMChart'];
    intCharted = json['intCharted'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idArtist'] = this.idArtist;
    data['strArtist'] = this.strArtist;
    data['strArtistStripped'] = this.strArtistStripped;
    data['strArtistAlternate'] = this.strArtistAlternate;
    data['strLabel'] = this.strLabel;
    data['idLabel'] = this.idLabel;
    data['intFormedYear'] = this.intFormedYear;
    data['intBornYear'] = this.intBornYear;
    data['intDiedYear'] = this.intDiedYear;
    data['strDisbanded'] = this.strDisbanded;
    data['strStyle'] = this.strStyle;
    data['strGenre'] = this.strGenre;
    data['strMood'] = this.strMood;
    data['strWebsite'] = this.strWebsite;
    data['strFacebook'] = this.strFacebook;
    data['strTwitter'] = this.strTwitter;
    data['strBiographyEN'] = this.strBiographyEN;
    data['strBiographyDE'] = this.strBiographyDE;
    data['strBiographyFR'] = this.strBiographyFR;
    data['strBiographyCN'] = this.strBiographyCN;
    data['strBiographyIT'] = this.strBiographyIT;
    data['strBiographyJP'] = this.strBiographyJP;
    data['strBiographyRU'] = this.strBiographyRU;
    data['strBiographyES'] = this.strBiographyES;
    data['strBiographyPT'] = this.strBiographyPT;
    data['strBiographySE'] = this.strBiographySE;
    data['strBiographyNL'] = this.strBiographyNL;
    data['strBiographyHU'] = this.strBiographyHU;
    data['strBiographyNO'] = this.strBiographyNO;
    data['strBiographyIL'] = this.strBiographyIL;
    data['strBiographyPL'] = this.strBiographyPL;
    data['strGender'] = this.strGender;
    data['intMembers'] = this.intMembers;
    data['strCountry'] = this.strCountry;
    data['strCountryCode'] = this.strCountryCode;
    data['strArtistThumb'] = this.strArtistThumb;
    data['strArtistLogo'] = this.strArtistLogo;
    data['strArtistCutout'] = this.strArtistCutout;
    data['strArtistClearart'] = this.strArtistClearart;
    data['strArtistWideThumb'] = this.strArtistWideThumb;
    data['strArtistFanart'] = this.strArtistFanart;
    data['strArtistFanart2'] = this.strArtistFanart2;
    data['strArtistFanart3'] = this.strArtistFanart3;
    data['strArtistFanart4'] = this.strArtistFanart4;
    data['strArtistBanner'] = this.strArtistBanner;
    data['strMusicBrainzID'] = this.strMusicBrainzID;
    data['strISNIcode'] = this.strISNIcode;
    data['strLastFMChart'] = this.strLastFMChart;
    data['intCharted'] = this.intCharted;
    data['strLocked'] = this.strLocked;
    return data;
  }
}
