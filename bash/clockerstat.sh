#!/usr/bin/env bash
if [ "$(clocker status)" != "stopped" ]; then echo "$( clocker list | tail -1 | awk '{print $9}' ) $(clocker status)"; else clocker status;  fi