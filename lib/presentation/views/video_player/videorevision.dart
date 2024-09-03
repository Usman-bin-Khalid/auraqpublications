import 'package:flutter/material.dart';

void main() {
  runApp(PaperDropDown());
}

class PaperDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Dropdown Example')),
        body: Center(
          child: ColorDropdown(),
        ),
      ),
    );
  }
}

class ColorDropdown extends StatefulWidget {
  @override
  _ColorDropdownState createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  String? selectedColor;
  TextEditingController resultController = TextEditingController();

  void updateResult() {
    switch (selectedColor) {
      case 'White':
        resultController.text = '30';
        break;
      case 'Cream':
        resultController.text = '40';
        break;
      case 'Offwhite':
        resultController.text = '50';
        break;
      default:
        resultController.text = '';
    }

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: selectedColor,
            hint: Text('Select Color'),
            onChanged: (String? newValue) {
              setState(() {
                selectedColor = newValue;
              });
            },
            items: <String>['White', 'Cream', 'Offwhite']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          TextField(
            controller: resultController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Result',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
             var dv =  resultController.text * 30;
              updateResult();
            },
            child: Text('Get Value'),
          ),
        ],
      ),
    );
  }
}
