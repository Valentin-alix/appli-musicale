import 'package:application_musicale/screens/model/titles_data.dart';
import 'package:flutter/material.dart';

class TitlesRankingListItem extends StatelessWidget {
  final TitlesData item;

  const TitlesRankingListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
                      return const ColoredBox(color: Colors.black);
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
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
                      color: Color(0xFF8D8D8D),
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
