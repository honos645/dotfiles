#!/bin/bash

function has () {
    command type $1 > /dev/null 2>&1
}
