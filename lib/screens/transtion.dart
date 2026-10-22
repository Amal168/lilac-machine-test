import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lilac_machine_test/screens/homepage.dart';
import 'package:lilac_machine_test/widgets/colors.dart';
import 'package:lilac_machine_test/widgets/customefield.dart';
import 'package:lilac_machine_test/widgets/custometext.dart';

class Transtion extends StatefulWidget {
  const Transtion({super.key});

  @override
  State<Transtion> createState() => _TranstionState();
}

class _TranstionState extends State<Transtion> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController =
      TextEditingController(text: '48.00');

  String transactionType = 'Expense';
  DateTime selectedDate = DateTime(2026, 2, 22);


  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transcation'),
        centerTitle: true,
        backgroundColor: maincolor,
        foregroundColor: textcolor,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(17, 28, 17, 27),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fieldLabel('TRANSACTION TYPE'),
                    DropdownButtonFormField<String>(
                      value: transactionType,
                      decoration: fieldDecoration(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      items: ['Expense', 'Income']
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            transactionType = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    fieldLabel('NAME'),
                    TextField(
                      controller: nameController,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF555555),
                      ),
                      decoration: fieldDecoration().copyWith(
                        hintText: 'Enter name',
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldLabel('AMOUNT'),
                    TextField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(
                        fontSize: 13,
                        color: maincolor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: fieldDecoration(
                        prefixText: '\$ ',
                        suffixIcon: TextButton(
                          onPressed: () {
                            amountController.clear();
                          },
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: maincolor,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 21),
                    fieldLabel('DATE'),
                    InkWell(
                      onTap: selectDate,
                      borderRadius: BorderRadius.circular(9),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                DateFormat('EEE, dd MMM yyyy')
                                    .format(selectedDate),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.calendar_month,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: maincolor,
                  onPressed: () async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );

    if (!mounted) return;


  },
                child: Text(
                  'Save',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textcolor,fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
