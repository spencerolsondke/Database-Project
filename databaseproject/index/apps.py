from django.apps import AppConfig
from index.utils import Order_Badge

badges = []
current_badge = Order_Badge((), datetime.utcnow())

def _check_order_process_time():
    for badge in badges:
        if datetime.utcnow() - badge.get_time() >= 60*5:
            dp = DeliveryPerson.objects.filter(area=badge.get_area(), availibility=True).first()
            badge.set_delivery_start_time(datetime.utcnow())
            badge.set_delivery_person(dp)
            badge.set_status('Out for delivery')
            dp.availibility = False
            dp.save()


def _check_badge_and_add_it():
    # Add the current badge to the list
    badges.append(current_badge)
    # Reset the current badge
    current_badge = Order_Badge((), datetime.utcnow())


def _check_order_delivered():
    print('yes')
    print(badges)
    for badge in badges:
        # If it's been more than 30 mins, then the delivery person is available again
        if datetime.utcnow() - badge.get_delivery_start_time() >= 60*30:
            badge.set_delivery_person_available()
            badges.delete(badge)

        # After 15 mins, the order has been delivered
        if datetime.utcnow() - badge.get_delivery_start_time() >= 60*15:
            badge.set_status('Delivered')


class IndexConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'index'

    def ready(self):
        from index.models import Orders, Customer, DeliveryPerson
        from django.utils import timezone
        from index.utils import Order_Badge
        import schedule, time
        import threading

        def run_continuously():
            stop = threading.Event()
            class Schedule_Thread(threading.Thread):  
                def run(cls):
                    while not stop.is_set():
                        schedule.run_pending()
                        time.sleep(1)

            continuous_thread = Schedule_Thread()
            continuous_thread.start()
            return stop
        
        print('entered')
        
        # schedule.every(1).minutes.do(_check_order_process_time)
        # schedule.every(1).minutes.do(_check_order_delivered)
        # schedule.every(1).minutes.do(_check_badge_and_add_it)
        
        stop_running = run_continuously()
