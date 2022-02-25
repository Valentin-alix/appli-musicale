class MostLovedTrackResponse {
  List<Loved>? loved;

  MostLovedTrackResponse({this.loved});

  MostLovedTrackResponse.fromJson(Map<String, dynamic> json) {
    if (json['loved'] != null) {
      loved = <Loved>[];
      json['loved'].forEach((v) {
        loved!.add(new Loved.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loved != null) {
      data['loved'] = this.loved!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Loved {
  String? idTrack;
  String? idAlbum;
  String? idArtist;
  String? idLyric;
  String? idIMVDB;
  String? strTrack;
  String? strAlbum;
  String? strArtist;
  String? strArtistAlternate;
  String? intCD;
  String? intDuration;
  String? strGenre;
  String? strMood;
  String? strStyle;
  String? strTheme;
  String? strDescription;
  String? strDescriptionDE;
  String? strDescriptionFR;
  String? strDescriptionCN;
  String? strDescriptionIT;
  String? strDescriptionJP;
  String? strDescriptionRU;
  String? strDescriptionES;
  String? strDescriptionPT;
  String? strDescriptionSE;
  String? strDescriptionNL;
  String? strDescriptionHU;
  String? strDescriptionNO;
  String? strDescriptionIL;
  String? strDescriptionPL;
  String? strTrackThumb;
  String? strTrack3DCase;
  String? strTrackLyrics;
  String? strMusicVid;
  String? strMusicVidDirector;
  String? strMusicVidCompany;
  String? strMusicVidScreen1;
  String? strMusicVidScreen2;
  String? strMusicVidScreen3;
  String? intMusicVidViews;
  String? intMusicVidLikes;
  String? intMusicVidDislikes;
  String? intMusicVidFavorites;
  String? intMusicVidComments;
  String? intTrackNumber;
  String? intLoved;
  String? intScore;
  String? intScoreVotes;
  String? intTotalListeners;
  String? intTotalPlays;
  String? strMusicBrainzID;
  String? strMusicBrainzAlbumID;
  String? strMusicBrainzArtistID;
  String? strLocked;

  Loved(
      {this.idTrack,
      this.idAlbum,
      this.idArtist,
      this.idLyric,
      this.idIMVDB,
      this.strTrack,
      this.strAlbum,
      this.strArtist,
      this.strArtistAlternate,
      this.intCD,
      this.intDuration,
      this.strGenre,
      this.strMood,
      this.strStyle,
      this.strTheme,
      this.strDescription,
      this.strDescriptionDE,
      this.strDescriptionFR,
      this.strDescriptionCN,
      this.strDescriptionIT,
      this.strDescriptionJP,
      this.strDescriptionRU,
      this.strDescriptionES,
      this.strDescriptionPT,
      this.strDescriptionSE,
      this.strDescriptionNL,
      this.strDescriptionHU,
      this.strDescriptionNO,
      this.strDescriptionIL,
      this.strDescriptionPL,
      this.strTrackThumb,
      this.strTrack3DCase,
      this.strTrackLyrics,
      this.strMusicVid,
      this.strMusicVidDirector,
      this.strMusicVidCompany,
      this.strMusicVidScreen1,
      this.strMusicVidScreen2,
      this.strMusicVidScreen3,
      this.intMusicVidViews,
      this.intMusicVidLikes,
      this.intMusicVidDislikes,
      this.intMusicVidFavorites,
      this.intMusicVidComments,
      this.intTrackNumber,
      this.intLoved,
      this.intScore,
      this.intScoreVotes,
      this.intTotalListeners,
      this.intTotalPlays,
      this.strMusicBrainzID,
      this.strMusicBrainzAlbumID,
      this.strMusicBrainzArtistID,
      this.strLocked});

  Loved.fromJson(Map<String, dynamic> json) {
    idTrack = json['idTrack'];
    idAlbum = json['idAlbum'];
    idArtist = json['idArtist'];
    idLyric = json['idLyric'];
    idIMVDB = json['idIMVDB'];
    strTrack = json['strTrack'];
    strAlbum = json['strAlbum'];
    strArtist = json['strArtist'];
    strArtistAlternate = json['strArtistAlternate'];
    intCD = json['intCD'];
    intDuration = json['intDuration'];
    strGenre = json['strGenre'];
    strMood = json['strMood'];
    strStyle = json['strStyle'];
    strTheme = json['strTheme'];
    strDescription = json['strDescription'];
    strDescriptionDE = json['strDescriptionDE'];
    strDescriptionFR = json['strDescriptionFR'];
    strDescriptionCN = json['strDescriptionCN'];
    strDescriptionIT = json['strDescriptionIT'];
    strDescriptionJP = json['strDescriptionJP'];
    strDescriptionRU = json['strDescriptionRU'];
    strDescriptionES = json['strDescriptionES'];
    strDescriptionPT = json['strDescriptionPT'];
    strDescriptionSE = json['strDescriptionSE'];
    strDescriptionNL = json['strDescriptionNL'];
    strDescriptionHU = json['strDescriptionHU'];
    strDescriptionNO = json['strDescriptionNO'];
    strDescriptionIL = json['strDescriptionIL'];
    strDescriptionPL = json['strDescriptionPL'];
    strTrackThumb = json['strTrackThumb'];
    strTrack3DCase = json['strTrack3DCase'];
    strTrackLyrics = json['strTrackLyrics'];
    strMusicVid = json['strMusicVid'];
    strMusicVidDirector = json['strMusicVidDirector'];
    strMusicVidCompany = json['strMusicVidCompany'];
    strMusicVidScreen1 = json['strMusicVidScreen1'];
    strMusicVidScreen2 = json['strMusicVidScreen2'];
    strMusicVidScreen3 = json['strMusicVidScreen3'];
    intMusicVidViews = json['intMusicVidViews'];
    intMusicVidLikes = json['intMusicVidLikes'];
    intMusicVidDislikes = json['intMusicVidDislikes'];
    intMusicVidFavorites = json['intMusicVidFavorites'];
    intMusicVidComments = json['intMusicVidComments'];
    intTrackNumber = json['intTrackNumber'];
    intLoved = json['intLoved'];
    intScore = json['intScore'];
    intScoreVotes = json['intScoreVotes'];
    intTotalListeners = json['intTotalListeners'];
    intTotalPlays = json['intTotalPlays'];
    strMusicBrainzID = json['strMusicBrainzID'];
    strMusicBrainzAlbumID = json['strMusicBrainzAlbumID'];
    strMusicBrainzArtistID = json['strMusicBrainzArtistID'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTrack'] = this.idTrack;
    data['idAlbum'] = this.idAlbum;
    data['idArtist'] = this.idArtist;
    data['idLyric'] = this.idLyric;
    data['idIMVDB'] = this.idIMVDB;
    data['strTrack'] = this.strTrack;
    data['strAlbum'] = this.strAlbum;
    data['strArtist'] = this.strArtist;
    data['strArtistAlternate'] = this.strArtistAlternate;
    data['intCD'] = this.intCD;
    data['intDuration'] = this.intDuration;
    data['strGenre'] = this.strGenre;
    data['strMood'] = this.strMood;
    data['strStyle'] = this.strStyle;
    data['strTheme'] = this.strTheme;
    data['strDescription'] = this.strDescription;
    data['strDescriptionDE'] = this.strDescriptionDE;
    data['strDescriptionFR'] = this.strDescriptionFR;
    data['strDescriptionCN'] = this.strDescriptionCN;
    data['strDescriptionIT'] = this.strDescriptionIT;
    data['strDescriptionJP'] = this.strDescriptionJP;
    data['strDescriptionRU'] = this.strDescriptionRU;
    data['strDescriptionES'] = this.strDescriptionES;
    data['strDescriptionPT'] = this.strDescriptionPT;
    data['strDescriptionSE'] = this.strDescriptionSE;
    data['strDescriptionNL'] = this.strDescriptionNL;
    data['strDescriptionHU'] = this.strDescriptionHU;
    data['strDescriptionNO'] = this.strDescriptionNO;
    data['strDescriptionIL'] = this.strDescriptionIL;
    data['strDescriptionPL'] = this.strDescriptionPL;
    data['strTrackThumb'] = this.strTrackThumb;
    data['strTrack3DCase'] = this.strTrack3DCase;
    data['strTrackLyrics'] = this.strTrackLyrics;
    data['strMusicVid'] = this.strMusicVid;
    data['strMusicVidDirector'] = this.strMusicVidDirector;
    data['strMusicVidCompany'] = this.strMusicVidCompany;
    data['strMusicVidScreen1'] = this.strMusicVidScreen1;
    data['strMusicVidScreen2'] = this.strMusicVidScreen2;
    data['strMusicVidScreen3'] = this.strMusicVidScreen3;
    data['intMusicVidViews'] = this.intMusicVidViews;
    data['intMusicVidLikes'] = this.intMusicVidLikes;
    data['intMusicVidDislikes'] = this.intMusicVidDislikes;
    data['intMusicVidFavorites'] = this.intMusicVidFavorites;
    data['intMusicVidComments'] = this.intMusicVidComments;
    data['intTrackNumber'] = this.intTrackNumber;
    data['intLoved'] = this.intLoved;
    data['intScore'] = this.intScore;
    data['intScoreVotes'] = this.intScoreVotes;
    data['intTotalListeners'] = this.intTotalListeners;
    data['intTotalPlays'] = this.intTotalPlays;
    data['strMusicBrainzID'] = this.strMusicBrainzID;
    data['strMusicBrainzAlbumID'] = this.strMusicBrainzAlbumID;
    data['strMusicBrainzArtistID'] = this.strMusicBrainzArtistID;
    data['strLocked'] = this.strLocked;
    return data;
  }
}
