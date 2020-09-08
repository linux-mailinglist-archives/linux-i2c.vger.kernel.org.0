Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E6C260C0E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 09:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbgIHHco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 03:32:44 -0400
Received: from mail-io1-f77.google.com ([209.85.166.77]:53004 "EHLO
        mail-io1-f77.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgIHHcY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 03:32:24 -0400
Received: by mail-io1-f77.google.com with SMTP id m4so9188722iov.19
        for <linux-i2c@vger.kernel.org>; Tue, 08 Sep 2020 00:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=B5Ws/Ynq+wCk8d6oGXHx7cxlIQLiWvpyaF11bTnW1Gs=;
        b=Kg/3j1riPcVy1P9UON9B+GK6iu4SBn0h3CKs1iDtql8nUIt97Ico1IFGs9uPacXJdO
         UqlMAZhRlYNlQTfpTCbIAYnDOAnkSLS3SQeKFda32Q0TPbab0b7okxAFanDSNVFpAnWU
         eIGQ9V7FujA/s9WJonHCkAXk0AWLqVfDFDbtvbC8h7sJeFfiASiAkzv3ZQW1+jJIjge+
         mZ174EeGTw/VbNOlRN+oxxdIRhSxbjyktJjckvyAZSxRs9Hx+R5GnnAw6QH9wOUtTHoa
         ptj5tsRy1I77S8ovoojP1h8NDf5r8OT4/t+VogZTVay+4ommcB7rbpFF8aUhY7h7MAG1
         BxBA==
X-Gm-Message-State: AOAM533LyxXVXz6MWel1234W0TLn1o5h6cDCzH7hx1OmpbYkR6UFdVR1
        LHVuyFKlePGaGN+WEVCN69BBrI2/blQTkq//4tCRld62shRy
X-Google-Smtp-Source: ABdhPJzF5RJaWXaK2Wqqm9avurAuHZUABdVz4e0UHscvv8uToevqEacCL+UMhvPjvrECjG05FcRfoB/SZb76YGg+ZVVSSSwKt4fV
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1616:: with SMTP id x22mr10493690jas.110.1599550342906;
 Tue, 08 Sep 2020 00:32:22 -0700 (PDT)
Date:   Tue, 08 Sep 2020 00:32:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fd49fb05aec855a8@google.com>
Subject: KASAN: out-of-bounds Write in i801_isr
From:   syzbot <syzbot+be15dc0b1933f04b043a@syzkaller.appspotmail.com>
To:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    b765a32a Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12d86515900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=669314b9008f6680
dashboard link: https://syzkaller.appspot.com/bug?extid=be15dc0b1933f04b043a
compiler:       gcc (GCC) 10.1.0-syz 20200507
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be15dc0b1933f04b043a@syzkaller.appspotmail.com

BUG: KASAN: out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:593 [inline]
BUG: KASAN: out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:664 [inline]
BUG: KASAN: out-of-bounds in i801_isr+0xb2d/0xbf0 drivers/i2c/busses/i2c-i801.c:645
Write of size 1 at addr ffffc900039c7d7a by task udevd/9302

CPU: 1 PID: 9302 Comm: udevd Not tainted 5.9.0-rc3-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:593 [inline]
 i801_isr drivers/i2c/busses/i2c-i801.c:664 [inline]
 i801_isr+0xb2d/0xbf0 drivers/i2c/busses/i2c-i801.c:645
 __handle_irq_event_percpu+0x223/0xaa0 kernel/irq/handle.c:156
 handle_irq_event_percpu kernel/irq/handle.c:196 [inline]
 handle_irq_event+0x102/0x285 kernel/irq/handle.c:213
 handle_fasteoi_irq+0x22f/0x9f0 kernel/irq/chip.c:714
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:50 [inline]
 handle_irq arch/x86/kernel/irq.c:230 [inline]
 __common_interrupt arch/x86/kernel/irq.c:249 [inline]
 common_interrupt+0x96/0x1f0 arch/x86/kernel/irq.c:239
 asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:572
RIP: 0010:__do_softirq+0x1ba/0xa91 kernel/softirq.c:284
Code: c7 c0 58 3c b6 89 48 c1 e8 03 42 80 3c 30 00 0f 85 ea 07 00 00 48 83 3d ab 3a 96 01 00 0f 84 b7 06 00 00 fb 66 0f 1f 44 00 00 <48> c7 44 24 08 c0 90 a0 89 b8 ff ff ff ff 0f bc 04 24 83 c0 01 89
RSP: 0018:ffffc900004e8f70 EFLAGS: 00000282
RAX: 1ffffffff136c78b RBX: ffff88805ed1d6c0 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 0000000000000100 RDI: 0000000000000000
RBP: ffffc900028e7b50 R08: 0000000000000001 R09: ffffffff8c5f1a87
R10: fffffbfff18be350 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:706
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 do_softirq_own_stack+0x9d/0xd0 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:393 [inline]
 __irq_exit_rcu kernel/softirq.c:423 [inline]
 irq_exit_rcu+0x235/0x280 kernel/softirq.c:435
 sysvec_apic_timer_interrupt+0x51/0xf0 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:581
RIP: 0010:generic_write_check_limits+0x0/0x2a0 mm/filemap.c:3001
Code: 48 2b 04 25 28 00 00 00 75 0e 48 81 c4 a0 00 00 00 5b 5d 41 5c 41 5d c3 e8 7d 34 5f 06 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 <41> 56 49 89 fe 41 55 49 89 f5 41 54 55 48 89 d5 53 e8 fa d2 df ff
RSP: 0018:ffffc900028e7c58 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffc900028e7db8 RCX: ffffffff81957817
RDX: ffffc900028e7ca0 RSI: 0000000000000000 RDI: ffff888027b1fa80
RBP: ffffc900028e7d68 R08: 0000000000000001 R09: ffff888018e7908f
R10: 0000000000000080 R11: 0000000000000000 R12: ffff888018e79080
R13: 1ffff9200051cf90 R14: 00000000ffffff80 R15: ffff888027b1fa80
 generic_write_checks mm/filemap.c:3053 [inline]
 generic_file_write_iter+0x2d3/0x5c0 mm/filemap.c:3562
 call_write_iter include/linux/fs.h:1882 [inline]
 new_sync_write+0x422/0x650 fs/read_write.c:503
 vfs_write+0x5ad/0x730 fs/read_write.c:578
 ksys_write+0x12d/0x250 fs/read_write.c:631
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f292cccc370
Code: 73 01 c3 48 8b 0d c8 4a 2b 00 31 d2 48 29 c2 64 89 11 48 83 c8 ff eb ea 90 90 83 3d 85 a2 2b 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 0e 8a 01 00 48 89 04 24
RSP: 002b:00007ffed324d908 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000000000000001b RCX: 00007f292cccc370
RDX: 000000000000001b RSI: 00007f292d5cb000 RDI: 0000000000000005
RBP: 00007f292d5cb000 R08: 00007f292d5c47a0 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000cb8140
R13: 000000000000001b R14: 00007ffed324d9f0 R15: 0000000000000001


Memory state around the buggy address:
 ffffc900039c7c00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc900039c7c80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc900039c7d00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                                                                ^
 ffffc900039c7d80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc900039c7e00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
