import 'package:flutter/material.dart';
import 'package:myapp/widgets/Bloc/CounterBlock.dart';
import 'package:provider/provider.dart';

class CounterComponent extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CounterBloc _block = Provider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder(stream: _block.onCountDown, builder: (context, AsyncSnapshot<int> snapshot) {
          int? currentCount = snapshot.hasData ? snapshot.data : -1;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                snapshot.hasData ? snapshot.data.toString() : 'ready',
                style: TextStyle(color: Colors.greenAccent, fontSize: 120),
              ),
              CircularProgressIndicator(
                value: currentCount != null ? currentCount / 60 : 100,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
              ElevatedButton(
                child: const Text('Stop'),
                onPressed: () { _block.stop(); }
              ),
              ElevatedButton(
                child: const Text('Restart'),
                onPressed: () { _block.restart(); },
              )
            ],
          );
        })
      ),
    );
  }
}
