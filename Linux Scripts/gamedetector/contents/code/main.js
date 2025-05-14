/*
    KWin - the KDE window manager
    This file is part of the KDE project.

    SPDX-FileCopyrightText: 2012 Martin Gräßlin <mgraesslin@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/
var prev = "0"
var applyTo = readConfig("ApplyTo", true);
var whitelist = readConfig("Whitelist", "vlc, xv, vdpau, smplayer, dragon, xine, ffplay, mplayer").toString().toLowerCase().split(",");
for (i = 0; i < whitelist.length; ++i)
    whitelist[i] = whitelist[i].trim();

var ignore = readConfig("Ignore", false);
var blacklist = readConfig("Blacklist", "").toString().toLowerCase().split(",");
for (i = 0; i < blacklist.length; ++i)
    blacklist[i] = blacklist[i].trim();

function isVideoPlayer(client) {
    if (ignore == true && blacklist.indexOf(client.resourceClass.toString()) > -1)
        return false; // required blacklist match hit
    if (ignore == true && whitelist.indexOf(client.resourceClass.toString()) > -1)
        return true; // whitelist match hit
    // if (applyTo == true && whitelist.indexOf(client.resourceClass.toString()) < 0)
    //     return false; // required whitelist match failed
    // if (ignore == true && blacklist.indexOf(client.resourceClass.toString()) > -1)
    //     return false; // required blacklist match hit
    return true;
}

function setup(window) {
    // window.fullScreenChanged.connect(() => {
        if (window) {
            if (window.fullScreen) {
                if (ignore == true && blacklist.indexOf(window.resourceClass.toString()) > -1) {
                    print(" Is fullscreen? " + window.fullScreen + " Is blacklist? true");
                    if (prev != "1") {
                        callHIDService("6");
                        prev = "1"
                    }
                }
                else
                {
                    print(" Is fullscreen? " + window.fullScreen + " Is blacklist? false");
                    if (prev != "1") {
                        callHIDService("1");
                        prev = "1"
                    }
                }
            }
            else if (applyTo == true && whitelist.indexOf(window.resourceClass.toString()) > -1) {
                print(" Is whitelist. prev:" + prev);
                if (prev != "1") {
                    callHIDService("1");
                }
                prev = "1"
            }
            else {
                print(" Is fullscreen? " + window.fullScreen);
                if (prev != "0") {
                    callHIDService("0");
                }
                prev = "0"
            }
            window.fullScreenChanged.connect(() => {
            if (window.fullScreen) {
                if (ignore == true && blacklist.indexOf(window.resourceClass.toString()) > -1) {
                    print(" Is fullscreen? " + window.fullScreen + " Is blacklist? true");
                    if (prev != "1") {
                        callHIDService("6");
                        prev = "1"
                    }
                }
                else
                {
                    print(" Is fullscreen? " + window.fullScreen + " Is blacklist? false");
                    if (prev != "1") {
                        callHIDService("1");
                        prev = "1"
                    }
                }
            }
            else if (applyTo == true && whitelist.indexOf(window.resourceClass.toString()) > -1) {
                print(" Is whitelist? prev:" + prev);
                if (prev != "1") {
                    callHIDService("1");
                }
                prev = "1"
            }
            else {
                print(" Is fullscreen? " + window.fullScreen);
                if (prev != "0") {
                    callHIDService("0");
                }
                prev = "0"
            }
        });
    }
}

function callHIDService(value) {
    callDBus(
        "org.example.HIDExecutor",          // Service name from our Python helper
        "/org/example/HIDExecutor",         // Object path
        "org.example.HIDExecutor",          // Interface name
        "Execute",                          // Method name
        [ value ]                           // The parameter ("1" or "0")
    );
    print("Called HID Executor with value: " + value);
}

// workspace.windowAdded.connect(setup);
workspace.windowActivated.connect(setup);
// workspace.windowList().forEach(setup);
