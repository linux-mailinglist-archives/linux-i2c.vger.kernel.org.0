Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828882532CB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 17:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgHZPFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 11:05:18 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:36037 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgHZPFR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 11:05:17 -0400
Received: by mail-io1-f69.google.com with SMTP id h8so1450297ioa.3
        for <linux-i2c@vger.kernel.org>; Wed, 26 Aug 2020 08:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=C1fBo0AIIoeJmPcNkMxDvmpqmGHM1WeQR4a7YLEupM4=;
        b=m9fzD+YSc/cXpqvCtnuyxZhUC56u2PTc3hsjNwO6ReTLfTMWfbK8qenZlrW6vIn7PY
         EDTz3yFBCpIFbsxK7deKIjfyaUFv5INFzaZAHcRlpQX7h4Qr2IqEPsxJT44bAmcdzz1d
         o3dOnR0KJatSLPsvOux7M0qVfgnAHfoNRWfbfdzmIyec63HELwsBzArxske5dGiIIO30
         NpunFjB1Ed8Yqhaj4XEA2eSvyAN7qNq6LrL9opoCQ1QlhIiltHSNP8gxgGDXRfnfAvk+
         D4Bh/KJ0mFmvYOUhAfP7FAkehBLGF0E470Bq7WYsLj381OlEgIH9LrfZKwtZj8haNN5W
         kRfQ==
X-Gm-Message-State: AOAM530iT9/i2X1rmFnNHzR4XXUXUWQ+SoDHMdTJtGWRs9ItsiDFFo3e
        g7xQkhRP8kn2V4Dwvc5eaWnCNCaTJAFsURjMM05Lqb+9M2jl
X-Google-Smtp-Source: ABdhPJytnBILIqgxXpimiQ1AWt02J0q1PZTp6FhK1UrFX4u/IZbp3zxEFj2yY6KHl12mU7/kfzBBDNyq6xJ9cHXq77eSqrwP2Kbw
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1406:: with SMTP id t6mr13679866iov.184.1598454316811;
 Wed, 26 Aug 2020 08:05:16 -0700 (PDT)
Date:   Wed, 26 Aug 2020 08:05:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000be4b9d05adc925cb@google.com>
Subject: KASAN: stack-out-of-bounds Write in i801_isr
From:   syzbot <syzbot+c8ff0b6d6c73d81b610e@syzkaller.appspotmail.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=158e1f19900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50463ec6729f9706
dashboard link: https://syzkaller.appspot.com/bug?extid=c8ff0b6d6c73d81b610e
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c8ff0b6d6c73d81b610e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:589 [inline]
BUG: KASAN: stack-out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:660 [inline]
BUG: KASAN: stack-out-of-bounds in i801_isr+0xb2d/0xbf0 drivers/i2c/busses/i2c-i801.c:641
Write of size 1 at addr ffffc90006b8fd9e by task swapper/3/0

CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.8.0-syzkaller #0
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
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:50 [inline]
 handle_irq arch/x86/kernel/irq.c:230 [inline]
 __common_interrupt arch/x86/kernel/irq.c:249 [inline]
 common_interrupt+0x96/0x1f0 arch/x86/kernel/irq.c:239
 asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:572
RIP: 0010:__do_softirq+0x1c2/0xa24 kernel/softirq.c:284
Code: c7 c0 18 fb b4 89 48 c1 e8 03 42 80 3c 30 00 0f 85 b9 07 00 00 48 83 3d 63 f9 94 01 00 0f 84 6f 06 00 00 fb 66 0f 1f 44 00 00 <48> c7 44 24 08 c0 90 a0 89 b8 ff ff ff ff 0f bc 04 24 83 c0 01 89
RSP: 0018:ffffc90000598f70 EFLAGS: 00000282
RAX: 1ffffffff1369f63 RBX: ffff88802c238400 RCX: 1ffffffff155e989
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff88200197
RBP: ffffc9000043fd70 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:706
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 do_softirq_own_stack+0x9d/0xd0 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:393 [inline]
 __irq_exit_rcu kernel/softirq.c:423 [inline]
 irq_exit_rcu+0x1f3/0x230 kernel/softirq.c:435
 sysvec_apic_timer_interrupt+0x51/0xf0 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:581
RIP: 0010:native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:61
Code: ff 4c 89 ef e8 03 86 c8 f9 e9 8e fe ff ff 48 89 df e8 f6 85 c8 f9 eb 8a cc cc cc cc e9 07 00 00 00 0f 00 2d d4 9e 5d 00 fb f4 <c3> 90 e9 07 00 00 00 0f 00 2d c4 9e 5d 00 f4 c3 cc cc 55 53 e8 79
RSP: 0018:ffffc9000043fe78 EFLAGS: 00000282
RAX: 1ffffffff1369f64 RBX: ffff88802c238400 RCX: 1ffffffff155e989
RDX: dffffc0000000000 RSI: 0000000000000000 RDI: ffffffff87eb1956
RBP: dffffc0000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000000 R12: ffffed1005847080
R13: 0000000000000003 R14: ffffffff8aaf8888 R15: 0000000000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:150 [inline]
 default_idle+0x40/0x70 arch/x86/kernel/process.c:688
 cpuidle_idle_call kernel/sched/idle.c:163 [inline]
 do_idle+0x38f/0x6d0 kernel/sched/idle.c:276
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:372
 secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:243


Memory state around the buggy address:
 ffffc90006b8fc80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90006b8fd00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
>ffffc90006b8fd80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                            ^
 ffffc90006b8fe00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90006b8fe80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
