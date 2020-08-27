Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54F72540D6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 10:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgH0I3Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 04:29:16 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:57053 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbgH0I3P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Aug 2020 04:29:15 -0400
Received: by mail-io1-f69.google.com with SMTP id q62so3168143iof.23
        for <linux-i2c@vger.kernel.org>; Thu, 27 Aug 2020 01:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=mLESpSDEkhDZ4y1aWX8nXwML2t9ZXkQSTNGQdfCDhts=;
        b=ERDt/vFT6LC7+mpei3V8aZRVDDiPNaY0M1PrgTm+D1rVD7fxc4Jy2DL9jITRnkC4dD
         iAWA4aDL8SzJkUWUjDkFTfTkGC/GhYnpwKGc/hcLO4sJ7UYG657jNipKhxT7d1rR9iXU
         nI4fEgkr3JG2MSZnz3sEPR8tXv1sPXsq/7NpJsDDx/kPeYc6oc/hGjr9HOEpE21FfGiL
         law2fKlyq1d4P9aer/BU1n/6F1hFYh/h1VfFhYHwKs10L4CUOopl0C7M0wgyxZbfAv+O
         5/q8SvOmUnUj6mxexPvKj56YTk+Xq86/7PK7SaJ3VcTSPfDr3RSxzGxq9sBBEzM8amss
         DaYw==
X-Gm-Message-State: AOAM531bhzmfuvIJt6a8TFX1quSGzx81kgofL8tFljMN6VosPXwhZd5Y
        +L7anqty5QHoVk0wc+QbSZ3Hkx+D/BkG2EEQRCpmue5wCtcK
X-Google-Smtp-Source: ABdhPJxTRJSBiACMe8R/WuiqKE2iSLdfLYHjBJ6shw2LkaSyu4H99buqPQ2VTayLtwWmzBkiVgabHcHuR847+zlcASm55ZXmbSiZ
MIME-Version: 1.0
X-Received: by 2002:a92:c9cb:: with SMTP id k11mr16274699ilq.194.1598516954725;
 Thu, 27 Aug 2020 01:29:14 -0700 (PDT)
Date:   Thu, 27 Aug 2020 01:29:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004101f705add7bb3e@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in i801_isr (2)
From:   syzbot <syzbot+33f6c360821c399d69eb@syzkaller.appspotmail.com>
To:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    fffe3ae0 Merge tag 'for-linus-hmm' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1653d951900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50463ec6729f9706
dashboard link: https://syzkaller.appspot.com/bug?extid=33f6c360821c399d69eb
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33f6c360821c399d69eb@syzkaller.appspotmail.com

BUG: KASAN: vmalloc-out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:589 [inline]
BUG: KASAN: vmalloc-out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:660 [inline]
BUG: KASAN: vmalloc-out-of-bounds in i801_isr+0xb2d/0xbf0 drivers/i2c/busses/i2c-i801.c:641
Write of size 1 at addr ffffc90002fafda4 by task aoe_tx0/2856

CPU: 3 PID: 2856 Comm: aoe_tx0 Not tainted 5.8.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x436 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:589 [inline]
 i801_isr drivers/i2c/busses/i2c-i801.c:660 [inline]
 i801_isr+0xb2d/0xbf0 drivers/i2c/busses/i2c-i801.c:641
 __handle_irq_event_percpu+0x223/0xa30 kernel/irq/handle.c:156
 handle_irq_event_percpu kernel/irq/handle.c:196 [inline]
 handle_irq_event+0x102/0x285 kernel/irq/handle.c:213
 handle_fasteoi_irq+0x22f/0x9f0 kernel/irq/chip.c:714
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:706
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 handle_irq arch/x86/kernel/irq.c:230 [inline]
 __common_interrupt arch/x86/kernel/irq.c:249 [inline]
 common_interrupt+0x115/0x1f0 arch/x86/kernel/irq.c:239
 asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:572
RIP: 0010:__rhashtable_lookup+0x58c/0x780 include/linux/rhashtable.h:594
Code: ff e8 28 8a f0 f9 48 c7 c2 e0 ee 17 89 be 71 01 00 00 48 c7 c7 40 ef 17 89 c6 05 46 13 27 03 01 e8 9e 0f d7 f9 e9 7d fd ff ff <e8> ff 89 f0 f9 48 8b 3c 24 e8 c6 12 14 fc 31 ff 89 c3 89 c6 e8 6b
RSP: 0018:ffffc90003ab79b0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff87838eae
RDX: 0000000000000000 RSI: ffff88802bfbcf00 RDI: 0000000000000001
RBP: 1ffff92000756f6c R08: 0000000000000000 R09: ffffffff8c5b3a27
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffff8880220ecbc0 R14: ffff888075030c80 R15: ffff888027fac000
 rhltable_lookup include/linux/rhashtable.h:688 [inline]
 sta_info_hash_lookup net/mac80211/sta_info.c:162 [inline]
 sta_info_get+0x13d/0x380 net/mac80211/sta_info.c:174
 ieee80211_select_queue+0x3fe/0x580 net/mac80211/wme.c:210
 netdev_core_pick_tx+0x169/0x2e0 net/core/dev.c:4019
 __dev_queue_xmit+0x7a3/0x2d60 net/core/dev.c:4095
 tx+0x68/0xb0 drivers/block/aoe/aoenet.c:63
 kthread+0x1e2/0x3a0 drivers/block/aoe/aoecmd.c:1239
 kthread+0x3b5/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294


Memory state around the buggy address:
 ffffc90002fafc80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90002fafd00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
>ffffc90002fafd80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                               ^
 ffffc90002fafe00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90002fafe80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
