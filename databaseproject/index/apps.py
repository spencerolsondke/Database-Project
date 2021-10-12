from django.apps import AppConfig
import schedule, time
from datetime import datetime, timedelta
import os

class Busy_Driver_List:
    busy_drivers = []

    def __init__(self):
        self.busy_drivers = []

    def get(self):
        return self.busy_drivers
    
    def append(self, driver, time):
        self.busy_drivers.append((driver, time))

    def free_drivers(self):
        for d in self.busy_drivers:
            if datetime.now() >= d[1] + timedelta(seconds=30):
                self.busy_drivers.remove(d)

class IndexConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'index'

    def ready(self):
        if os.environ.get('RUN_MAIN', None) != 'true':
            from index.models import Orders, Customer, DeliveryPerson
            from django.utils import timezone
            from index.utils import Order_Badge, _get_current_badge, _add_order_to_current_badge, _reset_current_badge
            import threading
            b = Busy_Driver_List()
            for d in DeliveryPerson.objects.all():
                d.availibility = True
                d.save()

            def _check_if_driver_is_available():
                ready_orders = [o for o in Orders.objects.filter(status="In Process", order_time__lte=datetime.now()-timedelta(seconds=5))]
                for i in ready_orders:
                    order_area = Orders.objects.select_related('customer').get(id=i.id).customer.area
                    d = DeliveryPerson.objects.filter(area=order_area, availibility=True)
                    if d.exists:
                        i.status = "Out for Delivery"
                        i.order_delivery_time = datetime.now()
                        i.save()
                        d = d.first()
                        d.availibility = False
                        b.append(d, i.order_delivery_time)
                        d.save()
            
            def _check_if_delivered(): 
                delivered_orders = [o for o in Orders.objects.filter(status="Out for Delivery", order_delivery_time__lte=datetime.now()-timedelta(seconds=15))]
                for i in delivered_orders:
                    i.status = "Delivered"
                    i.save()
                b.free_drivers() 


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

            schedule.every(1).seconds.do(_check_if_driver_is_available)
            schedule.every(1).seconds.do(_check_if_delivered)
            
            stop_running = run_continuously()
