import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class MoneyChangeInEvent {
  double number;

  MoneyChangeInEvent(this.number);
}

class UpdateChangeInEvent {
  int version = 0;
  bool all     = true;

  UpdateChangeInEvent(this.version, {this.all = true});
}
