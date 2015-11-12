# cubietruck-bluetooth

Enable Bluetooth on the Cubietruck including the Bluetooth Low Energy capabilities.

Clone this repository on your Cubietruck:
<pre>git clone https://github.com/interoberlin/cubietruck-bluetooth.git</pre>

Compile it:
<pre>make dependencies all</pre>

Load and test it:
<pre>make load test</pre>

To use bluetooth you must invoke "load" once after every reboot (or you create a startup script for it).

Yes, it is normal that your screen is flooded with hex values.
You can get rid of that by redirecting stdout to /dev/zero.

License: GNU GPL v3
