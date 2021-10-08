from index.models import Orders, Customer, DeliveryPerson
from django.utils import timezone
from index.utils import Order_Badge
import schedule, time

def _check_order_process_time():
    bades = []  # TODO: Need to access badges
    for badge in badges:
        if datetime.datetime.utcnow() - bade.get_time() >= 60*5:
            dp = DeliveryPerson.objects.filter(area=badge.get_area(), availibility=True).first()
            badge.set_delivery_person(dp)
            badge.set_status('Out for delivery')
            dp.availibility = False

schedule.every(1).minutes.do(_check_order_process_time())