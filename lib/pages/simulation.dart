import 'package:flutter/material.dart';
import 'dart:math'; // Import the math library for pow method
import 'package:realest/classes/instalment.dart'; // Ensure this import path is correct
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  _SimulationPageState createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  bool showManualFields = false;
  String? selectedBank = 'BCA';
  Instalment? selectedInstalment;
  double propertyPrice = 1000000;
  double downPaymentPercentage = 20;
  double interestManual = 0;
  int yearManual = 0;
  final TextEditingController _percentageController = TextEditingController();

  final List<String> banks = ['BCA', 'Mandiri', 'BNI'];
  final Map<String, List<Instalment>> bankOffers = {
    'BCA': [
      Instalment(
          title: 'KPR Developer Fixed 3.95% 3 years',
          name: 'BCA Offer 1',
          years: 3,
          interestRate: 3.95),
      Instalment(
          title: 'KPR Flexible 5.6% 2 years',
          name: 'BCA Offer 2',
          years: 2,
          interestRate: 5.6),
    ],
    'Mandiri': [
      Instalment(
          title: 'Mandiri KPR 4.5% 3 years',
          name: 'Mandiri Offer 1',
          years: 3,
          interestRate: 4.5),
      Instalment(
          title: 'Mandiri KPR 6.0% 5 years',
          name: 'Mandiri Offer 2',
          years: 5,
          interestRate: 6.0),
    ],
    'BNI': [
      Instalment(
          title: 'BNI Griya 4.0% 3 years',
          name: 'BNI Offer 1',
          years: 3,
          interestRate: 4.0),
      Instalment(
          title: 'BNI Griya 5.5% 5 years',
          name: 'BNI Offer 2',
          years: 5,
          interestRate: 5.5),
    ],
  };

  void _onTileChecked(Instalment instalment) {
    setState(() {
      selectedInstalment = instalment;
    });
  }

  double _calculateMortgagePerMonthInstalment() {
    if (selectedInstalment == null) {
      return 0;
    }
    double loanAmount = propertyPrice - _calculateDownPayment();
    double monthlyRate = selectedInstalment!.interestRate / 100 / 12;
    int totalMonths = selectedInstalment!.years * 12;
    double monthlyPayment =
        loanAmount * monthlyRate / (1 - pow(1 + monthlyRate, -totalMonths));
    return monthlyPayment;
  }

  double _calculateMortgagePerMonthManual(double interest, int year) {
    if (interest == 0) {
      return 0;
    } else if (year == 0) {
      return 0;
    }
    double loanAmount = propertyPrice - _calculateDownPayment();
    double monthlyRate = interest / 100 / 12;
    int totalMonths = year * 12;
    double monthlyPayment =
        loanAmount * monthlyRate / (1 - pow(1 + monthlyRate, -totalMonths));
    return monthlyPayment;
  }

  double _calculateDownPayment() {
    return propertyPrice * (downPaymentPercentage / 100);
  }

  @override
  void initState() {
    super.initState();
    _percentageController.text = downPaymentPercentage.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mortgage Simulation',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF081F5C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.15,
              color: const Color(0xFF081F5C),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Instalment Estimation',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${showManualFields ? _calculateMortgagePerMonthManual(interestManual, yearManual).toStringAsFixed(2) : _calculateMortgagePerMonthInstalment().toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        '/month',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  const Text(
                    'Property Price',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: '\$xxx,xxx,xxx',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        propertyPrice = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Down Payment (DP) Percentage',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText:
                                '\$${_calculateDownPayment().toStringAsFixed(2)}',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        child: TextField(
                          controller: _percentageController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'xx',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              downPaymentPercentage =
                                  double.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.1,
                        height: MediaQuery.sizeOf(context).width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            '%',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Simulation with',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showManualFields = false;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color:
                                  showManualFields ? Colors.grey : Colors.blue,
                              width: 1.0,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10), // Add padding here
                          ),
                          child: Text(
                            'Bank Program',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color:
                                  showManualFields ? Colors.black : Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showManualFields = true;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color:
                                  showManualFields ? Colors.blue : Colors.grey,
                              width: 1.0,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10), // Add padding here
                          ),
                          child: Text(
                            'Fill Manual',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color:
                                  showManualFields ? Colors.blue : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (showManualFields)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: const Text(
                            'Year(s)',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'enter mortage duration',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              yearManual = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: const Text(
                            'Interest Rate',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'enter mortage interest',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              interestManual = double.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: selectedBank,
                          items: banks.map((bank) {
                            return DropdownMenuItem<String>(
                              value: bank,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.account_balance,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    bank,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBank = newValue;
                              selectedInstalment =
                                  null; // Reset selected offer when bank changes
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...bankOffers[selectedBank]!.map((instalment) {
                          return ListTileWidget(
                            title: instalment.title,
                            subtitle:
                                'Interest: ${instalment.interestRate}% for ${instalment.years} years',
                            isSelected: selectedInstalment == instalment,
                            onTap: () => _onTileChecked(instalment),
                          );
                        }).toList(),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 2,
        onTabTapped: (index) {
          if (index == 2) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const SearchPage();
                  case 3:
                    return const SavedPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const SimulationPage();
                }
              },
              transitionsBuilder: (_, animation, __, child) => child,
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const ListTileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(
        isSelected ? Icons.check_circle : Icons.check_circle_outline,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
