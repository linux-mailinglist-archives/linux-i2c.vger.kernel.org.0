Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A155346C713
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 23:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241959AbhLGWJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 17:09:54 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:35559 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhLGWJy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 17:09:54 -0500
Received: by mail-il1-f198.google.com with SMTP id m9-20020a056e021c2900b002a1d679b412so686279ilh.2
        for <linux-i2c@vger.kernel.org>; Tue, 07 Dec 2021 14:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7JWGSwb1iM57j21qzHJU2caGTTpBsLkiIdv7qzfHAyw=;
        b=nXLTdAySSedcLVbTZoYnvOBrq3T64kfTVfzUKrcBn//zKrhT5LZu6I7WH0UA2ntXOR
         wK1J+3Pjf/cQ9YmrJvvAfGmrnD0YfRhW5qdFr1s5vz0TOas4vwS+Nb9AB67cqKrnQEdp
         P/NQkVeNNiN4U1JZ8T2iRlZYoWpfdHQtL6VODxNIRwocCL5xBiOTEX+HY89G/lL48N8v
         jVSjpfYfBdzKFDuc+y0mQg4u3UdG1KNdJDTAal8lMOxQvVPfedGCYuaWyo/TwuhwMTnN
         nNGqWBxNTJHSU8ouKyDEckjthaMNys2cmh89UI0BPgoeI3mB3IpMuTOtcc+NCW4XJQcV
         PmIw==
X-Gm-Message-State: AOAM531ePFR8IDUNYqPz5Sb5nhskwbFLFI9i60fYm+8LQ2lctH67yCHB
        Cos/Ub4O80jYRpRJ8o4JJ5lSSllYLTGJgJu0xvpaShOMttbM
X-Google-Smtp-Source: ABdhPJw9UuoW7uqBPHnv9wpVREqaSs3faXSZRSQzBxuXHRkWpBd7WzD6FFYNQasDKi/Rzi1RaKFLbc9QB4rm7d3/e1142SzY/T1t
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4b:: with SMTP id u11mr2046198ilv.225.1638914783280;
 Tue, 07 Dec 2021 14:06:23 -0800 (PST)
Date:   Tue, 07 Dec 2021 14:06:23 -0800
In-Reply-To: <000000000000b5e7f105d0d2d165@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000079822e05d2959596@google.com>
Subject: Re: [syzbot] WARNING in __i2c_transfer (2)
From:   syzbot <syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    cd8c917a56f2 Makefile: Do not quote value for CONFIG_CC_IM..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139ff2e5b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=221ffc09e39ebbd1
dashboard link: https://syzkaller.appspot.com/bug?extid=e417648b303855b91d8a
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a68531b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b91d89b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e417648b303855b91d8a@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 6516 at drivers/i2c/i2c-core-base.c:2178 __i2c_transfer+0xa14/0x17c0 drivers/i2c/i2c-core-base.c:2178
Modules linked in:
CPU: 1 PID: 6516 Comm: syz-executor214 Not tainted 5.16.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__i2c_transfer+0xa14/0x17c0 drivers/i2c/i2c-core-base.c:2178
Code: 0f 94 c7 31 ff 44 89 fe e8 39 d9 9b fb 45 84 ff 0f 84 26 fd ff ff e8 4b d5 9b fb e8 95 6f 24 fb e9 17 fd ff ff e8 3c d5 9b fb <0f> 0b 41 bc ea ff ff ff e9 9e fd ff ff e8 2a d5 9b fb 44 89 ee bf
RSP: 0018:ffffc900029dfce8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000010 RCX: 0000000000000000
RDX: ffff88807929ba00 RSI: ffffffff85dbd5b4 RDI: 0000000000000003
RBP: ffff888021b94b58 R08: 0000000000000000 R09: ffffffff8ff73acf
R10: ffffffff85dbcbd8 R11: 0000000000000000 R12: 0000000000000010
R13: 0000000000000000 R14: ffff888021b94b78 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9d00000(0063) knlGS:00000000576f92c0
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007fa70f9116c0 CR3: 000000007f540000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 i2c_transfer+0x1e6/0x3e0 drivers/i2c/i2c-core-base.c:2269
 i2cdev_ioctl_rdwr+0x583/0x6a0 drivers/i2c/i2c-dev.c:297
 compat_i2cdev_ioctl+0x419/0x4f0 drivers/i2c/i2c-dev.c:561
 __do_compat_sys_ioctl+0x1c7/0x290 fs/ioctl.c:972
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f41549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000ffd6affc EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000000707
RDX: 0000000020000700 RSI: 00000000ffd6b050 RDI: 00000000f7fe8000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	03 74 c0 01          	add    0x1(%rax,%rax,8),%esi
   4:	10 05 03 74 b8 01    	adc    %al,0x1b87403(%rip)        # 0x1b8740d
   a:	10 06                	adc    %al,(%rsi)
   c:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
  10:	10 07                	adc    %al,(%rdi)
  12:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
  16:	10 08                	adc    %cl,(%rax)
  18:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1c:	00 00                	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	retq
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi

