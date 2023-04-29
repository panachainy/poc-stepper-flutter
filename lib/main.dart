import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Stepper"),
      ),
      body: Stepper(
        steps: getSteps(),
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepTapped: (int step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: () {
          currentStep > 0 ? setState(() => currentStep -= 1) : null;
        },
        onStepContinue: () {
          currentStep < 2 ? setState(() => currentStep += 1) : null;
        },
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        title: new Text('Personal Info'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
          ],
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ? StepState.editing : StepState.complete,
      ),
      Step(
        title: new Text('Address Details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Home Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mobile No'),
            ),
          ],
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1
            ? StepState.editing
            : currentStep < 1
                ? StepState.disabled
                : StepState.complete,
      ),
      Step(
        title: new Text("Bank Details"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Account No'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'IFSC Code'),
            ),
          ],
        ),
        isActive: currentStep >= 2,
        state: currentStep == 2
            ? StepState.editing
            : currentStep < 2
                ? StepState.disabled
                : StepState.complete,
      ),
    ];
  }
}
