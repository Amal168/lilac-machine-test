
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/model/expese.dart';
import 'package:lilac_machine_test/widgets/colors.dart';
import '../database/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expese> expenses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadExpenses();
  }

  Future<void> loadExpenses() async {
    try {
      final data = await DatabaseHelper.instance.getExpenses();

      if (!mounted) return;

      setState(() {
        expenses = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not load expenses: $e')),
      );
    }
  }

  double get totalExpense {
    return expenses.fold(0.0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2F7E79);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F9),

      

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadExpenses,
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'Good afternoon',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sahal Muhammed',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                    const SizedBox(height: 16),
                
                    Card(
                      color: teal,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Expenses',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                
                            const SizedBox(height: 8),
                
                            Text(
                              '₹ ${totalExpense.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                
                            const SizedBox(height: 24),
                
                            Row(
                              children: [
                                Expanded(
                                  child: _buildAmountInfo(
                                    icon: Icons.arrow_downward,
                                    label: 'Income',
                                    amount: r'$48.00',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildAmountInfo(
                                    icon: Icons.arrow_upward,
                                    label: 'Expense',
                                    amount:
                                        '₹ ${totalExpense.toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('DAILY AVERAGE'),
                            SizedBox(height: 10,),
                            Container(
                              // width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text('₹ ${totalExpense.toStringAsFixed(2)}'),
                            )
                          ],
                        ),
                         Column(
                          children: [
                            Text('DAILY AVERAGE'),
                            SizedBox(height: 10,),
                            Container(
                              // width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text('₹ ${totalExpense.toStringAsFixed(2)}'),
                            )
                          ],
                        ),
                      ],
                    ),
                
                    const SizedBox(height: 24),
                
                    const Text(
                      'Recent Expenses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                    const SizedBox(height: 12),
                
                    if (expenses.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: Text(
                            'No expenses yet. Tap + to add one.',
                          ),
                        ),
                      )
                    else
                      ...expenses.map(
                        (expense) => Card(
                          color: Colors.white,
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Color(0xFFE5F2F0),
                              child: Icon(
                                Icons.receipt_long,
                                color: teal,
                              ),
                            ),
                            title: Text(expense.title.toString()),
                            subtitle: Text(
                              '${expense.category} • ${expense.date}',
                            ),
                            trailing: Text(
                              '₹ ${expense.amount.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildAmountInfo({
    required IconData icon,
    required String label,
    required String amount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
