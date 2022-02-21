import 'package:application_musicale/screens/model/albums_data.dart';
import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlbumsRankingListItem extends StatelessWidget {
  final AlbumsData item;

  const AlbumsRankingListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text(
                item.rank.toString(),
                style: const TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    item.picture,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return SvgPicture.asset(
                        'asset/icones/Placeholder_album.svg',
                        height: 40,
                        width: 40,
                      );
                      ;
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.album,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: UIColors.black,
                    ),
                  ),
                  Text(
                    item.artists,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: UIColors.suvaGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
