import 'package:flutter/material.dart';
import 'package:poc_stepper_flutter/customStepper.dart';

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
      home: MyHomePage(),
    );
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
        title: const Text("Flutter Stepper"),
      ),
      body: CustomStepper(
        steps: getSteps(),
        type: CustomStepperType.horizontal,
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

  List<CustomStep> getSteps() {
    return [
      CustomStep(
        title: const Text('Personal Info'), content: Container(),
        //   Column(
        //     children: <Widget>[
        //       TextFormField(
        //         decoration: const InputDecoration(labelText: 'Name'),
        //       ),
        //       TextFormField(
        //         decoration: const InputDecoration(labelText: 'Email Address'),
        //       ),
        //     ],
        //   ),
        isActive: currentStep >= 0,
        state: currentStep == 0
            ? CustomStepState.editing
            : CustomStepState.complete,
        //   // label: Icon(Icons.person),
        activeIcon: const Icon(Icons.home),
      ),
      CustomStep(
        title: const Text('Address Details'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Home Address'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mobile No'),
            ),
          ],
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1
            ? CustomStepState.editing
            : currentStep < 1
                ? CustomStepState.disabled
                : CustomStepState.complete,
      ),
      CustomStep(
        title: const Text("Bank Details"),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Account No'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'IFSC Code'),
            ),
          ],
        ),
        isActive: currentStep >= 2,
        state: currentStep == 2
            ? CustomStepState.editing
            : currentStep < 2
                ? CustomStepState.disabled
                : CustomStepState.complete,
      ),
    ];
  }
}
