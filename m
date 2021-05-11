Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AC137B1C2
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 00:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhEKWx3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 18:53:29 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:54047 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhEKWx3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 18:53:29 -0400
Received: by mail-io1-f70.google.com with SMTP id i187-20020a6b3bc40000b029043a2c9683dfso1688952ioa.20
        for <linux-i2c@vger.kernel.org>; Tue, 11 May 2021 15:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=iFvBW93H3GxUz4ol2a9eUiJ+8eQ+nf3gAZme2mIPX/E=;
        b=Gc9Monn76SnaQJI97Cm2SruvbIjnG4WVH85YpgRG1pcNw7ToGYY9mqasS9CntY9BOT
         D2dCW8X1rCUdSgQmmWHMuqb5ssfmfQ5S48aVk08BztXwkQkRM0KQELIQiDpF2NOXvOuI
         FJTPNjJEFcwREwK53MoOaAreAEiJG0Xk6ND1oGqMd9tbcMgBE/pyk9EgVhus6hN5oITx
         xtDzue2W0oi2lRAq5TbEa6q0pvcqD6BtZIebx2upFUYzopOCqzrdWBwU9uhTKekRg2k/
         ANphKFxY/z71tjTHMXmx5NDX4Dg5GpKfrp4QuRwotV5/BRfS4kJkJkEdHwWhpH1AUkGm
         QR6A==
X-Gm-Message-State: AOAM532rDBUNKBiHGEdv4IKkDhWeebASCUDLtebb0Tjz1Z8V3ZHIvOht
        ESN4GppSvh62DJ7N4mQtV4+PZj9+2OfvXclMzQvoJtiHGnx5
X-Google-Smtp-Source: ABdhPJzWUIhx2Xap9qjWbL8cjYSMk3mpxrzNRcBcbhmz9E5r4oCmfTDrNWlBQ9nf/6/iZ1JoOfu9HvuGnPOpNFXaggg9bAMIvKY4
MIME-Version: 1.0
X-Received: by 2002:a92:2c02:: with SMTP id t2mr28306034ile.233.1620773541828;
 Tue, 11 May 2021 15:52:21 -0700 (PDT)
Date:   Tue, 11 May 2021 15:52:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000038de1d05c215bf23@google.com>
Subject: [syzbot] KASAN: out-of-bounds Read in i801_isr
From:   syzbot <syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com>
To:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e1381380 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10be778ad00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5adab0bdee099d7a
dashboard link: https://syzkaller.appspot.com/bug?extid=b4d3fd1dfd53e90afd79
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:608 [inline]
BUG: KASAN: out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:668 [inline]
BUG: KASAN: out-of-bounds in i801_isr+0xc70/0xd60 drivers/i2c/busses/i2c-i801.c:649
Read of size 1 at addr ffffc90004237d68 by task systemd-udevd/5027

CPU: 2 PID: 5027 Comm: systemd-udevd Not tainted 5.12.0-rc4-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x141/0x1d7 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5/0x2f8 mm/kasan/report.c:232
 __kasan_report mm/kasan/report.c:399 [inline]
 kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
 i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:608 [inline]
 i801_isr drivers/i2c/busses/i2c-i801.c:668 [inline]
 i801_isr+0xc70/0xd60 drivers/i2c/busses/i2c-i801.c:649
 __handle_irq_event_percpu+0x303/0x8f0 kernel/irq/handle.c:156
 handle_irq_event_percpu kernel/irq/handle.c:196 [inline]
 handle_irq_event+0x102/0x290 kernel/irq/handle.c:213
 handle_fasteoi_irq+0x22f/0x9f0 kernel/irq/chip.c:714
 generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
 handle_irq arch/x86/kernel/irq.c:231 [inline]
 __common_interrupt+0x9e/0x200 arch/x86/kernel/irq.c:250
 common_interrupt+0x4c/0xd0 arch/x86/kernel/irq.c:240
 asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:623
RIP: 0010:__do_softirq+0x196/0x9f6 kernel/softirq.c:331
Code: 00 48 01 f0 48 89 44 24 18 48 c7 c7 80 39 6a 89 e8 7f 8d c6 ff 65 66 c7 05 35 46 c3 76 00 00 e8 00 df 39 f8 fb b8 ff ff ff ff <48> c7 c3 c0 a0 c0 8b 41 0f bc c5 41 89 c7 41 83 c7 01 75 47 e9 d2
RSP: 0018:ffffc90000550f78 EFLAGS: 00000216
RAX: 00000000ffffffff RBX: ffff888018491c40 RCX: 1ffffffff1b8be19
RDX: 0000000000000000 RSI: 0000000000000100 RDI: 0000000000000000
RBP: ffff888011159c40 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8179e0c8 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000200 R14: 0000000000000000 R15: 0000000000000000
 invoke_softirq kernel/softirq.c:221 [inline]
 __irq_exit_rcu kernel/softirq.c:422 [inline]
 irq_exit_rcu+0x134/0x200 kernel/softirq.c:434
 sysvec_apic_timer_interrupt+0x93/0xc0 arch/x86/kernel/apic/apic.c:1100
 </IRQ>
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
RIP: 0010:check_kcov_mode kernel/kcov.c:163 [inline]
RIP: 0010:__sanitizer_cov_trace_pc+0x7/0x60 kernel/kcov.c:197
Code: ff ff b9 ff ff ff ff ba 08 00 00 00 4d 8b 03 48 0f bd ca 49 8b 45 00 48 63 c9 e9 64 ff ff ff 0f 1f 40 00 65 8b 05 49 fe 8d 7e <89> c1 48 8b 34 24 81 e1 00 01 00 00 65 48 8b 14 25 00 f0 01 00 a9
RSP: 0018:ffffc90009ff7868 EFLAGS: 00000283
RAX: 0000000080000000 RBX: 0000000000000004 RCX: ffff888018491c40
RDX: 0000000000000000 RSI: ffff888018491c40 RDI: 0000000000000003
RBP: ffff8880143aa100 R08: 0000000000000000 R09: 0000000000000004
R10: ffffffff8392c68a R11: 0000000000000010 R12: 0000000000000002
R13: 00000000000003e4 R14: dffffc0000000000 R15: 0000000000000000
 tomoyo_domain_quota_is_ok+0x2f1/0x550 security/tomoyo/util.c:1093
 tomoyo_supervisor+0x2f2/0xf00 security/tomoyo/common.c:2089
 tomoyo_audit_path_log security/tomoyo/file.c:168 [inline]
 tomoyo_path_permission security/tomoyo/file.c:587 [inline]
 tomoyo_path_permission+0x270/0x3a0 security/tomoyo/file.c:573
 tomoyo_path_perm+0x2f0/0x400 security/tomoyo/file.c:838
 security_inode_getattr+0xcf/0x140 security/security.c:1288
 vfs_getattr fs/stat.c:131 [inline]
 vfs_statx+0x164/0x390 fs/stat.c:199
 vfs_fstatat fs/stat.c:217 [inline]
 vfs_lstat include/linux/fs.h:3240 [inline]
 __do_sys_newlstat+0x91/0x110 fs/stat.c:372
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fc3c1a88335
Code: 69 db 2b 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 0f 1f 40 00 83 ff 01 48 89 f0 77 30 48 89 c7 48 89 d6 b8 06 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 03 f3 c3 90 48 8b 15 31 db 2b 00 f7 d8 64 89
RSP: 002b:00007ffd4b6fa5c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000006
RAX: ffffffffffffffda RBX: 0000558fa852a210 RCX: 00007fc3c1a88335
RDX: 00007ffd4b6fa600 RSI: 00007ffd4b6fa600 RDI: 0000558fa8529210
RBP: 00007ffd4b6fa6c0 R08: 00007fc3c1d472c8 R09: 0000000000001010
R10: 0000000000000020 R11: 0000000000000246 R12: 0000558fa8529210
R13: 0000558fa852923a R14: 0000558fa8501ed1 R15: 0000558fa8501eda


Memory state around the buggy address:
 ffffc90004237c00: f2 f2 f2 00 00 f3 f3 00 00 00 00 00 00 00 00 00
 ffffc90004237c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90004237d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
                                                          ^
 ffffc90004237d80: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
 ffffc90004237e00: 00 f2 f2 f2 00 00 00 00 00 00 00 00 00 00 00 f3
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
