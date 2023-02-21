import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/dentist.dart';

class Recommendations extends StatefulWidget {
  final List<Dentist> _recommendedDentists;
  const Recommendations(this._recommendedDentists, {super.key});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Recommended dentists',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              backgroundColor: Color.fromARGB(137, 0, 162, 255)),
        ),
        const SizedBox(height: 8.0),
        ListView.builder(
          itemBuilder: (context, index) => ListTile(
              title: Text(widget._recommendedDentists[index].fullName),
              subtitle: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: widget._recommendedDentists[index].description,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage:
                    MemoryImage(widget._recommendedDentists[index].image),
              )),
          itemCount: 1,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        )
      ]),
    );
  }
}
