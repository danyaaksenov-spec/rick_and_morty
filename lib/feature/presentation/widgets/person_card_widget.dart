import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/pages/person_detail_screen.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_cahce_image_widget.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({Key? key, required this.person}) : super(key: key);
  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonDetailPage(person: person),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              child: PersonCacheImage(
                width: 166,
                height: 166,
                imageUrl: person.image,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    person.name,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: person.status == 'Alive'
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Text(
                        '${person.status} - ${person.species}',
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Last known location: ',
                    style: TextStyle(color: AppColors.greyColor, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    person.location.name,
                    style: TextStyle(color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Origin:',
                    style: TextStyle(color: AppColors.greyColor, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    person.origin.name,
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }
}
