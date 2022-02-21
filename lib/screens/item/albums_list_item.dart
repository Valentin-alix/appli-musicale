import 'package:application_musicale/screens/model/albums_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlbumsListItem extends StatelessWidget {
  final AlbumsData item;
  const AlbumsListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      item.picture,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                      errorBuilder: (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return SvgPicture.asset(
                          'asset/icones/Placeholder_album.svg',
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
                          item.album,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.artists,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'SFProText',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8D8D8D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'asset/icones/Fleche_droite.svg',
                      color: const Color(0xFFB9B9B9),
                      width: 9.88,
                      height: 16,
                    ),
                    tooltip: 'Voir cet album',
                    onPressed: () {},
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
