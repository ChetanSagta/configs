#!/bin/bash

spotify_status=$(ps -e | grep spotify | wc -l)

if [[ $spotify_status -le 0 ]] ;
then 
  spotify &
fi
