#!/bin/sh

# create 11110 votes 
ab -n 10 -c 1 -p posta -T "application/x-www-form-urlencoded" ${vote_service_url}
ab -n 100 -c 10 -p postb -T "application/x-www-form-urlencoded" ${vote_service_url}
ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" ${vote_service_url}
ab -n 10000 -c 250 -p postb -T "application/x-www-form-urlencoded" ${vote_service_url}
