import 'package:flutter/material.dart';

class CreateTodoView extends StatelessWidget {
  CreateTodoView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new Task"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  label: const Text("Title"),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: "please enter title",
                  labelStyle: Theme.of(context).textTheme.bodyText1),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _descController,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  label: const Text("Description"),
                  hintText: "enter description here",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: Theme.of(context).textTheme.bodyText1),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)));
                    },
                    controller: _dateController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        label: const Text("Date"),
                        hintText: "select date",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    controller: _timeController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        label: const Text("Time"),
                        hintText: "Select time",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
