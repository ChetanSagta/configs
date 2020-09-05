#!/bin/bash

ifstat -Sz | awk 'NR==3 {print $1}'
