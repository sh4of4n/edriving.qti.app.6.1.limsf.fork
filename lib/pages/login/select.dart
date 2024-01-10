import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  final List<String> groupId;
  final String initialSelectedGroup;
  final String title;
  const Select({
    super.key,
    required this.groupId,
    required this.initialSelectedGroup,
    required this.title
  });

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String? selectedGroup;

  @override
  void initState(){
    super.initState();
    selectedGroup = widget.initialSelectedGroup;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        height: 300,
        width: 200,
        child: ListView.builder(
          itemCount: widget.groupId.length,
          itemBuilder: (BuildContext context, int index) {
            String currentGroup = widget.groupId[index];
            return RadioListTile<String>(
              title: Text(currentGroup),
              value: currentGroup,
              groupValue: selectedGroup,
              onChanged: (String? value) {
                setState(() {
                  selectedGroup = value;
                });
              },
            );
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without selecting anything
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(selectedGroup);
          },
          child: const Text("Done"),
        ),
      ],
    );
  }
}
