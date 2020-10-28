select `person`.`first_name`,`person`.`last_name`,
        count(distinct `order`.`id`) as `total_orders`,
	sum(`order_item`.`quantity`) as `total_items_bought`,
	sum((`order_item`.`quantity`*`item`.`price`)-`order_item`.`discount`) as `total_money_spent`
from `person`
left join `order` on `person`.`id`=`order`.`person_id`
left join `order_item` on `order`.`id`=`order_item`.`order_id`
left join `item` on `item`.`id`=`order_item`.`item_id`
group by `person`.`id`
order by `person`.`id` asc;
