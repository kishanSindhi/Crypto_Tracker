import 'package:bitcoin_tracker/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double bitcoinAmount = 0.0;
  double ethereumAmount = 0.0;
  CoinData coinData = CoinData();

  void updatePrice(String selectedCurrency) async {
    double temp = await coinData.getCurrencyPrice(selectedCurrency, 'BTC');
    double ethTemp = await coinData.getCurrencyPrice(selectedCurrency, 'ETC');
    setState(() {
      bitcoinAmount = temp;
      ethereumAmount = ethTemp;
    });
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>>? currencyList = [];
    for (String currency in currenciesLists) {
      currencyList.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currencyList,
      onChanged: (String? value) {
        setState(() {
          selectedCurrency = value!;
        });
        updatePrice(selectedCurrency);
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> iosCurrencyList = [];
    for (var currency in currenciesLists) {
      iosCurrencyList.add(
        Text(
          currency,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedCurrency = currenciesLists[value];
        });
        updatePrice(selectedCurrency);
      },
      children: iosCurrencyList,
    );
  }

  @override
  void initState() {
    updatePrice(selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReusableCard(
                textWidget: Text(
                  '1 BTC = ${bitcoinAmount.toInt()} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              ReusableCard(
                textWidget: Text(
                  '1 ETH = ${ethereumAmount.toInt()} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150,
            color: Colors.blue,
            padding: const EdgeInsets.only(bottom: 30),
            alignment: Alignment.center,
            child: Platform.isAndroid ? androidDropdown() : iOSPicker(),
          ),
        ],
      ),
    );
  }
}
