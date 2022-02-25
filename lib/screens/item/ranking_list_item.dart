import 'package:application_musicale/screens/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RankingListItem extends StatelessWidget {
  final String rank;
  final String picture;
  final String title;
  final String subtitle;
  const RankingListItem({
    Key? key,
    required this.rank,
    required this.picture,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 25,
                child: Text(
                  rank,
                  style: const TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    picture,
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
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                    subtitle,
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
