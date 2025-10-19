#!/usr/bin/env python3
import gi
import subprocess

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk

# Load the menu
builder = Gtk.Builder()
builder.add_from_file("/home/nick/.config/waybar/power-menu.xml")
menu = builder.get_object("menu")

# Connect actions
def shutdown(_):
    Gtk.main_quit()
    subprocess.Popen(["systemctl", "poweroff"])

def reboot(_):
    Gtk.main_quit()
    subprocess.Popen(["systemctl", "reboot"])

def sleep(_):
    Gtk.main_quit()
    subprocess.Popen(["systemctl", "suspend"])

builder.get_object("shutdown").connect("activate", shutdown)
builder.get_object("reboot").connect("activate", reboot)
builder.get_object("sleep").connect("activate", sleep)

# Show menu at current pointer position
menu.popup_at_pointer(None)
Gtk.main()
