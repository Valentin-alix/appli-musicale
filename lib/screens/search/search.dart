import 'package:application_musicale/models/albums_response.dart';
import 'package:application_musicale/models/artists_response.dart';
import 'package:application_musicale/screens/item/albums_list_item.dart';
import 'package:application_musicale/screens/item/artists_list_item.dart';
import 'package:application_musicale/screens/util/app_icons.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/services/album_service.dart';
import 'package:application_musicale/services/artist_service.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  late Future<ArtistsResponse> futureSearchArtists;
  late Future<AlbumsResponse> futureSearchAlbums;
  final String artistOfMonth = "metallica";

  @override
  void initState() {
    super.initState();
    futureSearchArtists = ArtistServices().searchArtistsByName(artistOfMonth);
    futureSearchAlbums = AlbumServices().searchAlbums(artistOfMonth);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const appBarTitle = 'Rechercher';
    const appBarPlaceholder = 'Taper ici le nom d’un artiste';
    const bodyTitle1 = 'Artistes';
    const bodyTitle2 = 'Albums';
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 110,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    appBarTitle,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: controller,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: UIColors.suvaGrey,
                      onSubmitted: (value) {
                        setState(() {
                          futureSearchArtists = ArtistServices()
                              .searchArtistsByName(controller.text);
                          futureSearchAlbums =
                              AlbumServices().searchAlbums(controller.text);
                        });
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: appBarPlaceholder,
                        hintStyle: const TextStyle(
                          fontFamily: 'SFProText',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            AppIcons.recherche_loupe,
                            color: UIColors.silver,
                            size: 13,
                          ),
                          onPressed: () {
                            setState(() {
                              futureSearchArtists = ArtistServices()
                                  .searchArtistsByName(controller.text);
                              futureSearchAlbums =
                                  AlbumServices().searchAlbums(controller.text);
                            });
                          },
                        ),
                        isCollapsed: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            AppIcons.recherche_annuler,
                            color: UIColors.silver,
                            size: 16,
                          ),
                          onPressed: () {
                            controller.clear();
                          },
                        ),
                        filled: true,
                        fillColor: UIColors.whisper,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  bodyTitle1,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Divider(),
                FutureBuilder<ArtistsResponse>(
                    future: futureSearchArtists,
                    builder:
                        (context, AsyncSnapshot<ArtistsResponse> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  UIColors.suvaGrey),
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Une erreur est survenue !');
                      } else if (!snapshot.hasData) {
                        return const Text('Aucun enregistrement');
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.artists == null
                              ? 0
                              : snapshot.data!.artists!.length,
                          itemBuilder: (BuildContext context, int position) {
                            return ArtistsListItem(
                              picture: snapshot.data!.artists![position]
                                      .strArtistThumb ??
                                  "",
                              title:
                                  snapshot.data!.artists![position].strArtist ??
                                      "",
                              artistId:
                                  snapshot.data!.artists![position].idArtist ??
                                      "",
                            );
                          },
                        );
                      }
                    }),
                const SizedBox(height: 20),
                const Text(
                  bodyTitle2,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Divider(),
                FutureBuilder<AlbumsResponse>(
                    future: futureSearchAlbums,
                    builder: (context, AsyncSnapshot<AlbumsResponse> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.album == null
                                ? 0
                                : snapshot.data!.album!.length,
                            itemBuilder: (BuildContext context, int position) {
                              return AlbumsListItem(
                                picture: snapshot
                                        .data!.album![position].strAlbumThumb ??
                                    "",
                                title:
                                    snapshot.data!.album![position].strAlbum ??
                                        "",
                                subtitle:
                                    snapshot.data!.album![position].strArtist ??
                                        "",
                                albumId:
                                    snapshot.data!.album![position].idAlbum ??
                                        "",
                              );
                            });
                      } else if (snapshot.hasError) {
                        return const Text('Une erreur est survenue !');
                      } else {
                        return const Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  UIColors.suvaGrey),
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
