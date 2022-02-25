// To parse this JSON data, do
//
//     final track = trackFromJson(jsonString);

import 'dart:convert';

class TrackResponse {
  TrackResponse({
    required this.track,
  });

  final List<TrackElement>? track;

  factory TrackResponse.fromRawJson(String str) =>
      TrackResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackResponse.fromJson(Map<String, dynamic> json) => TrackResponse(
        track: json["track"] == null
            ? null
            : List<TrackElement>.from(
                json["track"].map((x) => TrackElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track": track == null
            ? null
            : List<dynamic>.from(track!.map((x) => x.toJson())),
      };
}

class TrackElement {
  TrackElement({
    this.idTrack,
    this.idAlbum,
    this.idArtist,
    this.idLyric,
    this.idImvdb,
    this.strTrack,
    this.strAlbum,
    this.strArtist,
    this.strArtistAlternate,
    this.intCd,
    this.intDuration,
    this.strGenre,
    this.strMood,
    this.strStyle,
    this.strTheme,
    this.strDescriptionEn,
    this.strDescriptionDe,
    this.strDescriptionFr,
    this.strDescriptionCn,
    this.strDescriptionIt,
    this.strDescriptionJp,
    this.strDescriptionRu,
    this.strDescriptionEs,
    this.strDescriptionPt,
    this.strDescriptionSe,
    this.strDescriptionNl,
    this.strDescriptionHu,
    this.strDescriptionNo,
    this.strDescriptionIl,
    this.strDescriptionPl,
    this.strTrackThumb,
    this.strTrack3DCase,
    this.strTrackLyrics,
    this.strMusicVid,
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
    this.strMusicBrainzId,
    this.strMusicBrainzAlbumId,
    this.strMusicBrainzArtistId,
    this.strLocked,
  });

  final String? idTrack;
  final String? idAlbum;
  final String? idArtist;
  final String? idLyric;
  final dynamic idImvdb;
  final String? strTrack;
  final String? strAlbum;
  final String? strArtist;
  final dynamic strArtistAlternate;
  final dynamic intCd;
  final String? intDuration;
  final String? strGenre;
  final dynamic strMood;
  final dynamic strStyle;
  final dynamic strTheme;
  final dynamic strDescriptionEn;
  final dynamic strDescriptionDe;
  final dynamic strDescriptionFr;
  final dynamic strDescriptionCn;
  final dynamic strDescriptionIt;
  final dynamic strDescriptionJp;
  final dynamic strDescriptionRu;
  final dynamic strDescriptionEs;
  final dynamic strDescriptionPt;
  final dynamic strDescriptionSe;
  final dynamic strDescriptionNl;
  final dynamic strDescriptionHu;
  final dynamic strDescriptionNo;
  final dynamic strDescriptionIl;
  final dynamic strDescriptionPl;
  final dynamic strTrackThumb;
  final dynamic strTrack3DCase;
  final dynamic strTrackLyrics;
  final dynamic strMusicVid;
  final dynamic intMusicVidViews;
  final dynamic intMusicVidLikes;
  final dynamic intMusicVidDislikes;
  final dynamic intMusicVidFavorites;
  final dynamic intMusicVidComments;
  final String? intTrackNumber;
  final String? intLoved;
  final dynamic intScore;
  final dynamic intScoreVotes;
  final dynamic intTotalListeners;
  final dynamic intTotalPlays;
  final String? strMusicBrainzId;
  final String? strMusicBrainzAlbumId;
  final String? strMusicBrainzArtistId;
  final String? strLocked;

  factory TrackElement.fromRawJson(String str) =>
      TrackElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackElement.fromJson(Map<String, dynamic> json) => TrackElement(
        idTrack: json["idTrack"],
        idAlbum: json["idAlbum"],
        idArtist: json["idArtist"],
        idLyric: json["idLyric"],
        idImvdb: json["idIMVDB"],
        strTrack: json["strTrack"],
        strAlbum: json["strAlbum"],
        strArtist: json["strArtist"],
        strArtistAlternate: json["strArtistAlternate"],
        intCd: json["intCD"],
        intDuration: json["intDuration"],
        strGenre: json["strGenre"],
        strMood: json["strMood"],
        strStyle: json["strStyle"],
        strTheme: json["strTheme"],
        strDescriptionEn: json["strDescriptionEN"],
        strDescriptionDe: json["strDescriptionDE"],
        strDescriptionFr: json["strDescriptionFR"],
        strDescriptionCn: json["strDescriptionCN"],
        strDescriptionIt: json["strDescriptionIT"],
        strDescriptionJp: json["strDescriptionJP"],
        strDescriptionRu: json["strDescriptionRU"],
        strDescriptionEs: json["strDescriptionES"],
        strDescriptionPt: json["strDescriptionPT"],
        strDescriptionSe: json["strDescriptionSE"],
        strDescriptionNl: json["strDescriptionNL"],
        strDescriptionHu: json["strDescriptionHU"],
        strDescriptionNo: json["strDescriptionNO"],
        strDescriptionIl: json["strDescriptionIL"],
        strDescriptionPl: json["strDescriptionPL"],
        strTrackThumb: json["strTrackThumb"],
        strTrack3DCase: json["strTrack3DCase"],
        strTrackLyrics: json["strTrackLyrics"],
        strMusicVid: json["strMusicVid"],
        intMusicVidViews: json["intMusicVidViews"],
        intMusicVidLikes: json["intMusicVidLikes"],
        intMusicVidDislikes: json["intMusicVidDislikes"],
        intMusicVidFavorites: json["intMusicVidFavorites"],
        intMusicVidComments: json["intMusicVidComments"],
        intTrackNumber: json["intTrackNumber"],
        intLoved: json["intLoved"],
        intScore: json["intScore"],
        intScoreVotes: json["intScoreVotes"],
        intTotalListeners: json["intTotalListeners"],
        intTotalPlays: json["intTotalPlays"],
        strMusicBrainzId: json["strMusicBrainzID"],
        strMusicBrainzAlbumId: json["strMusicBrainzAlbumID"],
        strMusicBrainzArtistId: json["strMusicBrainzArtistID"],
        strLocked: json["strLocked"],
      );

  Map<String, dynamic> toJson() => {
        "idTrack": idTrack,
        "idAlbum": idAlbum,
        "idArtist": idArtist,
        "idLyric": idLyric,
        "idIMVDB": idImvdb,
        "strTrack": strTrack,
        "strAlbum": strAlbum,
        "strArtist": strArtist,
        "strArtistAlternate": strArtistAlternate,
        "intCD": intCd,
        "intDuration": intDuration,
        "strGenre": strGenre,
        "strMood": strMood,
        "strStyle": strStyle,
        "strTheme": strTheme,
        "strDescriptionEN": strDescriptionEn,
        "strDescriptionDE": strDescriptionDe,
        "strDescriptionFR": strDescriptionFr,
        "strDescriptionCN": strDescriptionCn,
        "strDescriptionIT": strDescriptionIt,
        "strDescriptionJP": strDescriptionJp,
        "strDescriptionRU": strDescriptionRu,
        "strDescriptionES": strDescriptionEs,
        "strDescriptionPT": strDescriptionPt,
        "strDescriptionSE": strDescriptionSe,
        "strDescriptionNL": strDescriptionNl,
        "strDescriptionHU": strDescriptionHu,
        "strDescriptionNO": strDescriptionNo,
        "strDescriptionIL": strDescriptionIl,
        "strDescriptionPL": strDescriptionPl,
        "strTrackThumb": strTrackThumb,
        "strTrack3DCase": strTrack3DCase,
        "strTrackLyrics": strTrackLyrics,
        "strMusicVid": strMusicVid,
        "intMusicVidViews": intMusicVidViews,
        "intMusicVidLikes": intMusicVidLikes,
        "intMusicVidDislikes": intMusicVidDislikes,
        "intMusicVidFavorites": intMusicVidFavorites,
        "intMusicVidComments": intMusicVidComments,
        "intTrackNumber": intTrackNumber,
        "intLoved": intLoved,
        "intScore": intScore,
        "intScoreVotes": intScoreVotes,
        "intTotalListeners": intTotalListeners,
        "intTotalPlays": intTotalPlays,
        "strMusicBrainzID": strMusicBrainzId,
        "strMusicBrainzAlbumID": strMusicBrainzAlbumId,
        "strMusicBrainzArtistID": strMusicBrainzArtistId,
        "strLocked": strLocked,
      };
}
