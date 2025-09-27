
-- 1  Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.
select avg(`Sleep duration`) as 'avg_duration' from task33.s_e where Gender='male' and `Sleep duration` >=7.5;
-- Problem 2: Show avg deep sleep time for both gender. Round result at 2 decimal places.
-- Note: sleep time and deep sleep percentage will give you, deep sleep time.
select Gender,round(avg(`Sleep duration` * `Deep sleep percentage` ),2) as 'deep sleep time' from task33.s_e
group by Gender;
/*Problem 3:
Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values are between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.*/
select Age,`Light sleep percentage`,`Deep sleep percentage` from task33.s_e  where `Deep sleep percentage` between 25 and 45 
order by `Light sleep percentage` ASC Limit 10,30 ;
-- Problem 4: Group by on exercise frequency and smoking status and show average deep sleep time, average light sleep time and avg rem sleep time.
-- Note the differences in deep sleep time for smoking and non smoking status
select `Exercise frequency` ,`Smoking status` ,avg(`Deep sleep percentage` * `Sleep duration`) as `Deep sleep time`, Avg(`REM sleep percentage` * `Sleep duration`) as `rem time` ,Avg( `Light sleep percentage` * `Sleep duration`) as 'light sleep time' from task33.s_e
group by `Exercise frequency` ,`Smoking status`;
-- Problem 5: Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol consumption only for people who do exercise atleast 3 days a week. Show result in descending order 
select `AWakenings`,Avg(`Caffeine consumption`),avg(`Deep sleep percentage` * `Sleep duration`) as `Deep sleep time` ,Avg(`Alcohol consumption`) from task33.s_e
where `Exercise frequency`>=3
Group by AWakenings
order by Awakenings desc limit 0,10;
/*6:
Display those power stations which have average 'Monitored Cap.(MW)' (display the values) between 1000 and 2000 and the number of occurance of the power stations (also display these values) are greater than 200. Also sort the result in ascending order.
*/
select `Monitored Cap.(MW)`,count(`Power Station`) as occurnce from task33.powergeneration  where `Monitored Cap.(MW)` between 1000 and 2000 group by `Monitored Cap.(MW)`  having count(*)>200 order by `Monitored Cap.(MW)` asc;
/*
Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021 and type is 'Public In-State'. Also the number of occurance should be between 6 to 10. Display the average value upto 2 decimal places, state names and the occurance of the states.*/
select `State`, round(avg(`Value`),2) as `avg value`,count(State) from task33.charge where Year in (2013,2017,2021) and Type='Public In-State' group by `State` having count(*) between 6 and 10 order by `avg value` asc limit 0,10;
-- 8: Best state in terms of low education cost (Tution Fees) in 'Public' type university.
select `State`,`Value` from task33.charge where Type='Public In-State' or 'Public Out-of-State' 
order by Value asc limit 0,1;
-- 9: 2nd Costliest state for Private education in year 2021. Consider, Tution and Room fee both.
select `State`,`Value` from task33.charge where Year=2021 and Type='Private'
order by `Value` desc limit 1,1;
-- Display total and average values of Discount_offered for all the combinations of 'Mode_of_Shipment' (display this feature) and 'Warehouse_block' (display this feature also) for all male ('M') and 'High' Product_importance. Also sort the values in descending order of Mode_of_Shipment and ascending order of Warehouse_block.
SELECT 
    Warehouse_block,
    Mode_of_Shipment,
    COUNT(Mode_of_Shipment) AS Count_Shipments,
    SUM(Discount_offered) AS Total_Discount,
    ROUND(AVG(Discount_offered), 2) AS Avg_Discount
FROM task33.ecommerce
WHERE Product_importance = 'High' 
  AND Gender = 'M'
GROUP BY Warehouse_block, Mode_of_Shipment
ORDER BY Mode_of_Shipment DESC, Warehouse_block ASC;
