//-----------------------------------------------------------------------------
// Copyright (C) 2010 iZsh <izsh at fail0verflow.com>
//
// This code is licensed to you under the terms of the GNU GPL, version 2 or,
// at your option, any later version. See the LICENSE.txt file for the text of
// the license.
//-----------------------------------------------------------------------------
// Low frequency HID commands
//-----------------------------------------------------------------------------

#ifndef CMDLFHID_H__
#define CMDLFHID_H__

#include <stdio.h>
#include <string.h>
#include "proxmark3.h"
#include "ui.h"
#include "graph.h"
#include "cmdparser.h"
#include "util.h"
#include "cmdmain.h"
#include "sleep.h"
#include "lfdemod.h"

int CmdLFHID(const char *Cmd);
//int CmdHIDDemod(const char *Cmd);
int CmdHIDDemodFSK(const char *Cmd);
int CmdHIDSim(const char *Cmd);
int CmdHIDClone(const char *Cmd);
int CmdHIDWiegand(const char *Cmd);
int CmdHIDBrute(const char *Cmd);

int usage_lf_hid_wiegand(void);
int usage_lf_hid_sim(void);
int usage_lf_hid_clone(void);
int usage_lf_hid_brute(void);

void calc26(uint16_t fc, uint32_t cardno, uint8_t *out);
void calcWiegand(uint8_t fmtlen, uint16_t fc, uint64_t cardno, uint8_t *bits);
#endif
