import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF737373),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                'Nova tarefa',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                autofocus: true,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
