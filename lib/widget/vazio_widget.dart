import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConteudoVazio extends StatelessWidget {
  const ConteudoVazio({super.key});

  @override
  Widget build(BuildContext context) {
    // asset desert-min.jpg
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: Image.asset('assets/images/desert.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Text(
            'Nenhuma doação encontrada.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
