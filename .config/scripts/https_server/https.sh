#!/bin/bash
set -e; set -u
 
echo -en "Starting $(basename "$0") [ip] [port] [timeout] [user] [password]\n-----\n"
 
ip="${1:-0.0.0.0}"; port="${2:-8443}"; timeout="${3:-15}"
user="${4:-$USER}"; password="${5:-$(head -c18 /dev/urandom | base64)}"
 
tmp="$(mktemp -d)"
openssl_params="-nodes -batch -sha256 -days 5 -subj /CN=localhost"
target_key1="$tmp/key1.pem"; target_cert1="$tmp/cert1.pem"
target_key2="$tmp/key2.pem"; target_cert2="$tmp/cert2.pem"
 
hash() { openssl x509 -in "$1" -pubkey -noout | openssl pkey -pubin -outform der | \
         openssl dgst -sha256 -binary | openssl enc -base64; }
 
openssl ecparam -name prime256v1 -genkey -out "$target_key1"
openssl req -new -x509 -key "$target_key1" -out "$target_cert1" $openssl_params
hash1="$(hash "$target_cert1")";
 
openssl req -x509 -newkey rsa:3072 -keyout "$target_key2" -out "$target_cert2" $openssl_params
hash2="$(hash "$target_cert2")";
 
echo "$password" | python3 "$(cd "$(dirname "$0")" && pwd)/https.py" "$ip" "$port" "$user" \
    "$timeout" "$target_key1" "$target_cert1" "$hash1" "$target_key2" "$target_cert2" "$hash2";
 
shred "$target_key" || true
rm -r "$tmp";
