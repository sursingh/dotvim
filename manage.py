#!/usr/bin/env python3

import cmd
import re
from subprocess import check_output
import logging

logging.basicConfig(level=logging.INFO)

log = logging.getLogger()


class ShellCmd:

    @classmethod
    def run(cls, *args):
        log.debug("CMD: %s", " ".join(args))
        res = check_output(args).decode('utf8')
        log.debug("RESULT: %s", res)
        return res


class Git(ShellCmd):
    '''
        A simple interface to git commands
    '''
    @classmethod
    def submodule(cls, *args):
        cmd = ['git', 'submodule'] + list(args)
        cls.run(*cmd)

    @classmethod
    def get_modules(cls):
        cmd = ['git', 'config', '--file', '.gitmodules', '--get-regexp',
               'path$']
        res = cls.run(*cmd)
        mods = (m.split()[-1] for m in res.strip().split('\n'))
        names = (m.split('/')[-1] for m in mods)
        return dict(zip(names, mods))


class Manager(cmd.Cmd, Git):

    def __init__(self):
        super().__init__()
        self._load_modules()

    def do_EOF(self, line):
        print()
        return True

    def do_add(self, line):
        url = line
        name = url.split('/')[-1]
        name = re.sub(
                r'(vim-)?(.*?)(.vim)?(.git)?$',
                r'bundle/\2',
                name)
        self.submodule('add', url, name)
        self.submodule('update', '--recursive', '--init', name)

        self._load_modules()

    def complete_rm(self, text, line, begidx, endidx):
        return self._complete_modules(text, line, begidx, endidx)

    def do_rm(self, line):
        modname = self._modules[line]
        self.submodule('deinit', "-f", modname)
        self.git('rm', modname)
        self.git('rm', '-f', modname)
        self.run('rm', '-rf', '.git/modules/' + modname)
        self._load_modules()

    def do_ls(self, line):
        print('list of vim plugins:')
        for i, m in enumerate(self._modules.keys()):
            print('   %2d: %s' % (i, m))

    def _complete_modules(self, text, line, begidx, endidx):
        return [m for m in self._modules if m.startswith(text)]

    def _load_modules(self):
        self._modules = self.get_modules()


if __name__ == '__main__':
    mgr = Manager()
    mgr.cmdloop()
