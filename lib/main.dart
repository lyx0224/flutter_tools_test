import 'package:flutter/material.dart';

import 'flutter_tools/lib/src/device.dart';
import 'flutter_tools/lib/src/project.dart';


//这样的导入和上面的一样，系统会提示你2种
//import 'package:test_flutter_tools/flutter_tools/lib/src/device.dart';
void main() => runApp(MyApp());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("this is content"),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("===========MyApp build() invoked==========");
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Device>>(
          future: getDevice(),
          builder: (context, snapshot) {
            debugPrint("devices num: ${snapshot.data}");
          },
        ),
      ),
    );
  }
}

//
Future<List<Device>> getDevice() async {
  final List<Device> devices =
      await deviceManager.getAllConnectedDevices().toList();
  print(("====${devices.length}"));
  return devices;
}

//Future<List<Device>> findTargetDevices() async {
//  print("======start===========");
//  final List<Device> devices =
//      await deviceManager.findTargetDevices(FlutterProject.current());
//  print(("tagert====${devices.length}"));
//  return devices;
//}
