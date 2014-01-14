#!/bin/sh
gdb -ex run --args /home/kook/picolisp/bin/picolisp /home/kook/picolisp/lib.l /home/kook/picolisp/ext.l "$@" +
