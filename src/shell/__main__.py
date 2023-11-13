#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import cmd
import gettext

localedir = "locale"
translation = gettext.translation("lang", localedir, languages=["tr"])
translation.install()
_ = translation.gettext

class Shell(cmd.Cmd):
    intro = _("Intro")
    intro = f"{intro}"
    prompt = "> "

    def do_list(self, arg):
        """Hello world"""
        print(_("Main Greeting"))
        print(f"{arg}")

    def do_pwd(self, arg):
        """bash -c pwd"""
        print(os.getcwd())

    def do_exit(self, arg):
        """exit komutu: Kabuktan çık."""
        return True

if __name__ == "__main__":
    shell = Shell()
    shell.cmdloop()