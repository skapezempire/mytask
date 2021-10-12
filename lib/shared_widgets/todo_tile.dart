import 'package:flutter/material.dart';
import 'package:todo_app/utils/utils.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.green,
      shadowColor: Theme.of(context).shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListTile(
          leading: Icon(
            status ? Icons.check_circle : Icons.check_circle_outline,
            color: dateColor(date: "Today"),
            size: 30,
          ),
          title: Text(
            "Plan the trip to finland",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
          ),
          subtitle: const Text("The family\'s trip to Finland next summer"),
          trailing: TextButton.icon(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: dateColor(date: "Yesterday"),
            ),
            label: Text(
              "Yesterday",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: dateColor(date: "Yesterday"),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
