#!/usr/bin/python
# -*- coding: utf-8 -*-

# (c) 2015, Trond Hindenes <trond@hindenes.com>, and others
#
# This file is part of Ansible
#
# Ansible is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ansible is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ansible.  If not, see <http://www.gnu.org/licenses/>.

# this is a windows documentation stub.  actual code lives in the .ps1
# file of the same name

DOCUMENTATION = '''
---
module: win_pendingreboot
version_added: "2.2"
short_description: Checks if the computer has a pending reboot
description:
      - Result object contains an attribute called "pending_reboot" which will be "True" if a reboot is required.

options:

author:
    - "Trond Hindenes (@trondhindenes)"
'''

EXAMPLES = '''
ansible -i hosts -m win_pendingreboot all

# Playbook example
  - name: Check if node requires a reboot
    win_pendingreboot:
'''

