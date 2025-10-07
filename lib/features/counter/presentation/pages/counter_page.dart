import 'package:ecommerce_app/features/counter/presentation/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CounterProvider>(
          builder: (context, CounterProvider provider, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FutureBuilder(
              //   future: provider.fetchCounter(),
              //   builder: (context, snapshot) {
              //     return const SizedBox.shrink();
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => provider.decrementCounter(),
                      icon: Icon(Icons.remove)),
                  Text('${provider.counterModel.count}'),
                  IconButton(
                      onPressed: () => provider.incrementCounter(),
                      icon: Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
