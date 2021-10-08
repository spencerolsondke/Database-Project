from index.models import Orders, Customer, DeliveryPerson
from django.utils import timezone
from index.utils import Order_Badge
import schedule, time

badges = []

def _check_order_process_time():
    for badge in badges:
        if datetime.utcnow() - badge.get_time() >= 60*5:
            dp = DeliveryPerson.objects.filter(area=badge.get_area(), availibility=True).first()
            badge.set_delivery_start_time(datetime.utcnow())
            badge.set_delivery_person(dp)
            badge.set_status('Out for delivery')
            dp.availibility = False
            dp.save()


# def _check_badges_to_delete():
#     for badge in badges:
#         if badge.get_status() == 'Delivered':
#             badges.remove(badge)

def _check_order_delivered():
    for badge in badges:
        # If it's been more than 30 mins, then the delivery person is available again
        if datetime.utcnow() - badge.get_delivery_start_time() >= 60*30:
            badge.set_delivery_person_available()
            badges.delete(badge)

        # After 15 mins, the order has been delivered
        if datetime.utcnow() - badge.get_delivery_start_time() >= 60*15:
            badge.set_status('Delivered')


schedule.every(1).minutes.do(_check_order_process_time())
schedule.every(1).minutes.do(_check_order_delivered())