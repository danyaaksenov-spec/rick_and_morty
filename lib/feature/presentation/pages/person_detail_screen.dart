import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_cahce_image_widget.dart';
import 'package:intl/intl.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({super.key, required this.person});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of charecter'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            person.name,
            style: const TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            child: PersonCacheImage(
                imageUrl: person.image, width: 260, height: 260),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: person.status == 'Alive' ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                person.status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ...buidText('Gender:', person.gender),
          ...buidText('Number of episodes:', person.episode.length.toString()),
          ...buidText('Species:', person.species),
          ...buidText('Last known location:', person.location.name),
          ...buidText('Origin:', person.origin.name),
          ...buidText(
              'Date of creation:', DateFormat('yMMMMd').format(person.created))
        ],
      ),
    );
  }

  List<Widget> buidText(String text, String value) {
    return [
      Text(text,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.greyColor,
          )),
      const SizedBox(
        height: 4,
      ),
      Text(value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          )),
      const SizedBox(
        height: 16,
      ),
    ];
  }
}
