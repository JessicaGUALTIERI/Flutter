import 'package:flutter/material.dart';
import 'package:simpson/bart.dart';

class Homer extends StatefulWidget {
  const Homer({super.key});

  @override 
  State<Homer> createState() => _HomerState();
}

class _HomerState extends State<Homer> {
  String messageFromHomer = '';
  final TextEditingController _textEditingController = TextEditingController();

  String messageFromBart = 'Salut papa !';
  bool bartIsTalking = false;

  void talkToBart() {
    setState(() {
      messageFromHomer = _textEditingController.text;
      bartIsTalking = false;
    });
  }

  void bartIsSendingAMessage() {
    setState(() {
      bartIsTalking = true;
      messageFromHomer = '';
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Simpsons',
          style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/Homer.png'),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                    child: TextField( 
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent))
                      ),
                      controller: _textEditingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: talkToBart,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                      ),
                      child: const Text(
                        'Parler à Bart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              bartIsTalking ? 'Bart dit : "$messageFromBart"' : '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Bart(),
            ),
            ElevatedButton(
              onPressed: bartIsSendingAMessage, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.yellow),
              ),
              child: const Text(
                'Parler à Homer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                messageFromHomer.isEmpty ? '' : 'Homer dit : "$messageFromHomer"',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )
              ),
            ),
          ],
        )
      )
    );
  }
}