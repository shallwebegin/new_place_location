import 'package:chat_app/models/place.dart';
import 'package:chat_app/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaceDetailScreen(
                  place: places[index],
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(places[index].title),
            leading: CircleAvatar(
              backgroundImage: FileImage(places[index].image),
            ),
            subtitle: Text(places[index].location.address),
          ),
        ),
      ),
    );
  }
}
