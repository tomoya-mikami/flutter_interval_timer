import 'package:flutter/material.dart';
import 'package:myapp/widgets/Bloc/CounterBlock.dart';
import 'package:myapp/widgets/Components/CounterComponent.dart';
import 'package:provider/provider.dart';

class ConterScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: CounterComponent(),
      dispose: (context, value) => value.dispose(),
    );
  }
}
