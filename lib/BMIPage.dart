import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

enum Gender { male, female }

class _BMIPageState extends State<BMIPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  Gender selectedGender = Gender.male;
  double bmiResult = 0.0;
  String resultCategory = '';

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        bmiResult = bmi;
        resultCategory = _getCategory(bmi);
      });
    }
  }

  String _getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Kurang Berat';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return 'Berlebih Berat';
    } else {
      return 'Obesitas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text('Jenis Kelamin: '),
                  Radio(
                    value: Gender.male,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value ?? Gender.male;
                      });
                    },
                  ),
                  Text('Pria'),
                  Radio(
                    value: Gender.female,
                    groupValue: selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        selectedGender = value ?? Gender.male;
                      });
                    },
                  ),
                  Text('Wanita'),
                ],
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(labelText: 'Berat (kg)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: InputDecoration(labelText: 'Tinggi (cm)'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text('Hitung BMI'),
              ),
              SizedBox(height: 20),
              Text(
                'BMI: ${bmiResult.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Kategori: $resultCategory',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}