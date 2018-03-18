synthesize: demo.bin

test.v: test.vhd
	vhd2vl test.vhd test.v

clk_devider.v: clk_devider.vhd
	vhd2vl clk_devider.vhd clk_devider.v

counter.v: counter.vhd
	vhd2vl counter.vhd counter.v

demo.blif: test.v clk_devider.v counter.v
	yosys -q -p "synth_ice40 -blif demo.blif" test.v clk_devider.v counter.v

demo.asc: demo.blif demo.pcf
	arachne-pnr -d 1k -P vq100 -p demo.pcf $< -o $@

demo.bin: demo.asc
	icepack $< $@

run: demo.bin
	scp demo.bin pi@192.168.0.230:/home/pi/ice40/data.bin
	ssh pi@192.168.0.230 "/home/pi/ice40/upload.sh"

clean:
	rm *.{v,asc,bin,blif}

.PHONY: synthesize
