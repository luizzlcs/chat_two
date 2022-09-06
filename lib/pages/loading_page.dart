import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RefreshProgressIndicator(
              backgroundColor: Colors.pink,
              color: Colors.white,
              strokeWidth: 15,
            ),
            Text('Carregando...'),
          ],
        ),
      ),
    );
  }
}
