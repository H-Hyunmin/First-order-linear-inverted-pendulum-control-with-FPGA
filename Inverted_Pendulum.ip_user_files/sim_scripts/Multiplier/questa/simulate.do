onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Multiplier_opt

do {wave.do}

view wave
view structure
view signals

do {Multiplier.udo}

run -all

quit -force
