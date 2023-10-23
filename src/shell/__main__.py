#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import cmd
import locale
import gettext

locale.setlocale(locale.LC_ALL, 'tr_TR.utf8')

print(locale.getdefaultlocale())
print(f"{os.getcwd()}/locale")

localedir = "locale"
translation = gettext.translation("lang", localedir, languages=["tr"])
translation.install()
_ = translation.gettext

class Shell(cmd.Cmd):
    intro = "Basit Komut Satırı Kabuğu. 'help' yazarak mevcut komutları görüntüleyebilirsiniz."
    prompt = "> "

    def do_hello(self, arg):
        """Hello world"""
        print(_("Main Greeting"))

    def do_pwd(self, arg):
        """bash -c pwd"""
        print(os.getcwd())

    def do_exit(self, arg):
        """exit komutu: Kabuktan çık."""
        return True

if __name__ == '__main__':
    shell = Shell()
    shell.cmdloop()
