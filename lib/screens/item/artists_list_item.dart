import 'package:application_musicale/screens/util/colors.dart';
import 'package:application_musicale/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ArtistsListItem extends StatelessWidget {
  final String picture;
  final String title;
  const ArtistsListItem({Key? key, required this.picture, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: UIColors.whiteSmoke,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      picture,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                      errorBuilder: (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return SvgPicture.asset(
                          'asset/icones/Placeholder_artiste.svg',
                          height: 50,
                          width: 50,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: UIColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'asset/icones/Fleche_droite.svg',
                      color: UIColors.silver,
                      width: 9.88,
                      height: 16,
                    ),
                    tooltip: 'Voir cet artist',
                    onPressed: () async {
                      await Navigator.of(context).pushNamed(
                        AppRoutes.routeArtist,
                        arguments: "112424",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
