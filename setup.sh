#!/bin/sh

root="$(pwd)"
rm -rf "$root"/.git/hooks
ln -s "$root/hooks" "$root/.git"
