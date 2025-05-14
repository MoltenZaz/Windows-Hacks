#!/usr/bin/env python3
import subprocess
import dbus
import dbus.service
import dbus.mainloop.glib
from gi.repository import GLib

SERVICE_NAME = "org.example.HIDExecutor"
OBJECT_PATH = "/org/example/HIDExecutor"
INTERFACE_NAME = "org.example.HIDExecutor"

class HIDExecutor(dbus.service.Object):
    def __init__(self, bus, object_path=OBJECT_PATH):
        super().__init__(bus, object_path)

    @dbus.service.method(INTERFACE_NAME, in_signature="s", out_signature="s")
    def Execute(self, value):
        """
        Executes the HID command with the send-output parameter
        determined by the passed value. For "1" it sends 1,1;
        otherwise it sends 0,0.
        """
        # print(value)
        # If value is a DBus Array, extract the first element.
        if isinstance(value, dbus.Array):
            if len(value) > 0:
                received = str(value[0]).strip()
            else:
                received = ""
        else:
            received = str(value).strip()

        print("HIDExecutor received value: '{}'".format(received))

        # Decide which output to use based on the passed string.
        # print(value)
        if received == "1":
            hid_output = "1,1"
            # subprocess.run(fullscreenmouse, check=True)
            # subprocess.run(reloadmouse, check=True)
        elif received == "6":
            hid_output = "6,6"
            # subprocess.run(fullscreenmouse, check=True)
            # subprocess.run(reloadmouse, check=True)
        else:
            hid_output = "0,0"
            print("before run")
            # subprocess.run(normalmouse, check=True)
            print("after 1st run")
            # subprocess.run(reloadmouse, check=True)
        print(hid_output)
        # Build the command.
        # UPDATE VISUDO WITH PATH TO HIDAPITESTER!!
        command = [
            "kstart5", "--",
            "/bin/sh", "-c",
            "sudo -n /home/mitchell/Documents/gamedetectorhelper/hidapitester --quiet --vidpid 1D50/615E --usage 0x61 --usagePage 0xFF60 --length 2 --open --send-output " + hid_output
        ]

        fullscreenmouse = [
            "kstart5", "--",
            "/bin/sh", "-c",
            "sudo cp /home/mitchell/Documents/gamedetectorhelper/fullscreen.conf /etc/keyd/default.conf"
        ]

        normalmouse = [
            "kstart5", "--",
            "/bin/sh", "-c",
            "sudo cp /home/mitchell/Documents/gamedetectorhelper/normal.conf /etc/keyd/default.conf"
        ]

        reloadmouse = [
            "kstart5", "--",
            "/bin/sh", "-c",
            "sudo keyd reload"
        ]


        try:
            # Execute the command.
            if received == "1":
                subprocess.run(fullscreenmouse, check=True)
            elif received == "6":
                subprocess.run(fullscreenmouse, check=True)
            else:
                subprocess.run(normalmouse, check=True)
            subprocess.run(reloadmouse, check=True)
            subprocess.run(command, check=True)
            return "HID command executed successfully with output " + hid_output
        except Exception as e:
            return "Error: " + str(e)

if __name__ == "__main__":
    # Set up the DBus main loop and register the service.
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    bus = dbus.SessionBus()
    name = dbus.service.BusName(SERVICE_NAME, bus)
    executor = HIDExecutor(bus)
    loop = GLib.MainLoop()
    loop.run()
