from django.apps import AppConfig
import schedule, time
from datetime import datetime
import os

badges = []

def _check_order_process_time():
    for badge in badges:
        if datetime.now() - badge.get_time() >= 60*5:
            dp = DeliveryPerson.objects.filter(area=badge.get_area(), availibility=True).first()
            badge.set_delivery_start_time(datetime.now())
            badge.set_delivery_person(dp)
            badge.set_status('Out for delivery')
            dp.availibility = False
            dp.save()

def _check_order_delivered():
    print('yes')
    print(badges)
    for badge in badges:
        # If it's been more than 30 mins, then the delivery person is available again
        if datetime.now() - badge.get_delivery_start_time() >= 60*30:
            badge.set_delivery_person_available()
            badges.delete(badge)

        # After 15 mins, the order has been delivered
        if datetime.now() - badge.get_delivery_start_time() >= 60*15:
            badge.set_status('Delivered')


def _check_badge_and_add_it():
    # Add the current badge to the list
    badges.append(current_badge)
    # Reset the current badge
    current_badge = Order_Badge([], datetime.now())


class IndexConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'index'

    def ready(self):
        if os.environ.get('RUN_MAIN', None) != 'true':
            print('entered')

            from index.models import Orders, Customer, DeliveryPerson
            from django.utils import timezone
            from index.utils import Order_Badge
            from index.utils import current_badge
            import threading

            def _print_current_badge():
                print(current_badge)

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
            
            # schedule.every(1).minutes.do(_check_order_process_time)
            # schedule.every(1).minutes.do(_check_order_delivered)
            schedule.every(1).minutes.do(_check_badge_and_add_it)
            schedule.every(1).seconds.do(_print_current_badge)
            
            stop_running = run_continuously()
