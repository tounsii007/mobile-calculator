class CalculatorModel {
  String displayValue;
  List<String> operations;
  List<String> history;

  CalculatorModel({
    this.displayValue = '0',
    List<String>? operations,
    List<String>? history,
  })  
      : operations = operations ?? [],
        history = history ?? [];

  void addOperation(String operation) {
    operations.add(operation);
  }

  void addToHistory(String entry) {
    history.add(entry);
  }

  void clear() {
    displayValue = '0';
    operations.clear();
    history.clear();
  }
}