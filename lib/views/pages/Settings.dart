import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 1.0;
  int? menuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 1, child: Text('Element 1')),
                  DropdownMenuItem(value: 2, child: Text('Element 2')),
                  DropdownMenuItem(value: 3, child: Text('Element 3')),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () => setState(() {}),
              ),
              Text(controller.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged:
                    (bool? value) => setState(() {
                      isChecked = value;
                    }),
              ),
              CheckboxListTile(
                title: Text('Click me'),
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch(
                value: isSwitched,
                onChanged:
                    (value) => setState(() {
                      isSwitched = value;
                    }),
              ),
              SwitchListTile(
                title: Text('Switch me'),
                value: isSwitched,
                onChanged:
                    (value) => setState(() {
                      isSwitched = value;
                    }),
              ),
              Slider.adaptive(
                value: sliderValue,
                min: 0.0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              Text('Double: $sliderValue'),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('SnackBar'),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text('Snack Bar'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title: Text('Demo'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Text('This a demo'),
                          Text('This a demo')
                        ],),
                        actions: [
                          FilledButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('Close Dialog'))
                        ],
                        icon: Icon(Icons.error, size: 70,),
                      );
                    },
                  );
                },
                child: Text('Open Dialog'),
              ),
              Divider(
                color: Colors.teal,
                thickness: 2.5,
                endIndent: 150,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Click Me')),
              FilledButton(onPressed: () {}, child: Text('Click Me')),
              TextButton(onPressed: () {}, child: Text('Click Me')),
              OutlinedButton(onPressed: () {}, child: Text('Click Me')),
            ],
          ),
        ),
      ),
    );
  }
}
