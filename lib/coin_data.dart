import 'package:bitcoin_tracker/network_helper.dart';

const String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';

const String apiKey = 'add your api key';

const List<String> currenciesLists = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getCurrencyPrice(String currency, String crypto) async {
    var decodedData =
        await NetworkHelper(uri: '$baseUrl/$crypto/$currency?apikey=$apiKey')
            .getDataFromAPI();
    var price = decodedData['rate'];

    return price;
  }
}
