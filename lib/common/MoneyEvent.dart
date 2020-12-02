import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class MoneyChangeInEvent {
  double number;

  MoneyChangeInEvent(this.number);
}
