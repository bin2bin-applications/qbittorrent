#!/usr/bin/python3
from configparser import ConfigParser
from os import urandom, system
from hashlib import pbkdf2_hmac
from base64 import b64encode
from random import choices
from string import ascii_letters
from argparse import ArgumentParser

parser = ArgumentParser()
random_user = ''.join(choices(ascii_letters, k=10)).encode().hex()
parser.add_argument('--user', type=str, required=False, default=random_user)
random_pass = ''.join(choices(ascii_letters, k=10)).encode().hex()
parser.add_argument('--pass', type=str, required=False, default=random_pass)
args = parser.parse_args()
system("mkdir -p /appdata/config/qBittorrent/config")

username = bytes.fromhex(getattr(args, "user")).decode()
password = bytes.fromhex(getattr(args, "pass"))
salt = urandom(16)
hash_salt = b64encode(salt).decode()
hash_key = b64encode(pbkdf2_hmac('sha512', password, salt, 100000, 64)).decode()

config = ConfigParser()
config.optionxform = str
config.read('/appdata/config/qBittorrent/config/qBittorrent.conf')
config.add_section("Preferences") if not config.has_section("Preferences") else None
config.add_section("LegalNotice") if not config.has_section("LegalNotice") else None
config.add_section("BitTorrent") if not config.has_section("BitTorrent") else None
config["BitTorrent"][r"Session\DefaultSavePath"] = "/appdata/downloads"
config["LegalNotice"][r"Accepted"] = "true"
config["Preferences"][r"WebUI\ServerDomains"] = "*"
config["Preferences"][r"WebUI\Address"] = "*"
config["Preferences"][r"WebUI\Port"] = "8080"
config["Preferences"][r"WebUI\Username"] = username
config["Preferences"][r"WebUI\Password_PBKDF2"] = f"@ByteArray({hash_salt}:{hash_key})"
config.write(open('/appdata/config/qBittorrent/config/qBittorrent.conf.reset', 'w'))