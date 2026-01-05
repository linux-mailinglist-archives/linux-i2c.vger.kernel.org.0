Return-Path: <linux-i2c+bounces-14896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB2CF272C
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 09:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CFBE3029C54
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 08:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224A0333737;
	Mon,  5 Jan 2026 08:31:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEEA333443
	for <linux-i2c@vger.kernel.org>; Mon,  5 Jan 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601886; cv=none; b=Iq6MNUi2KVhKIlHld5UY4bRxdlDBmPZFsvwi0Zwrj451yAfknSmcrxR7dUaZd9J9UUpPS6bN91mZ8XTEAIm8qUAa9cMPYXAlQKYLyft9EeNUHkHWuPQHDiOJ58Dxjt6JRrLmoGkVNMC6kGgCbC5OpBTIBjvx8lvAx1aEwt2oT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601886; c=relaxed/simple;
	bh=HcAlwS+AV2o/A//29DwbmP8bCmpP8X9igXpsqxEwSuE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tw4cNhofKvVuXBk8mpz5Wyslf2BZGbqnVqvBFcrgsPmCSb5HNSBPARwlgD+m9VpPU0TmEhnleKC3WCYadIu6JbkVNFh7aeHgnx/WpxkKQFZpCCgnT59Sgt8y3lsMIk9gbgLqUsnchp7DPdmus3jJ7B1Um+OeAlwLfoHwjJEpGw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6574d564a9eso28948612eaf.2
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jan 2026 00:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601884; x=1768206684;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzqKtV3QrXW4mDqxs+pnEDVVKS7Aapa7xlD3p2eA18o=;
        b=mnG2nzmVUe0WJ5RcCexDg/UYtu6G3RAwzUFdiEsgloxMCKaFD5MeC3MMOwvXKVrUSZ
         3vejeQyAjETOm6Me8Hl5AbeXNCxR+zDNEiYEbyY8pr7AzQALfOqXU7MZRlafdfM1VtfU
         0E3ZexJFqNsLeSFFrzNrKTbH0OYR41HylbYWhHCO3jFC7RGc7ODPJaiHdhmgT58vgotl
         /q3A22WXWUbpz2JZJxoH36EiujBdmJWOYNk220udjnBf37ZsIInKAGsHZ/DN2WuBFWod
         OhX5CpiTmUu+Lp9kN+YsmTnHKzI+TkXSbJEgySJDsqW6DlJtg6nv63QPoZzFxPs841Aa
         Tcqg==
X-Gm-Message-State: AOJu0Yzbo8yI18BDJHhgSoabwOwYyDx3tCyLPRwPwAZFTx6vHgAXrAWc
	uwlkZ9EX4C9ztPfD9thr5g8O4+O8rulo1563QkpePYG7lQ4vFHi7l0qbuljWqUz0CKZRQUzbGrZ
	cRPC/mE8bZElT4Xyq1qsKnCe+AXZ8NhrmtLyQyC0+J5sldAAEA8hfluvdf43hxA==
X-Google-Smtp-Source: AGHT+IGP/IttUT5F4X13TEA97h9+/7FDmpYlZUa6t1PpZtXkSMvqYt/VvLWFwYzY0si8Yf0VzxuAcYsf6IMmuwaC0i1wqTxw5PFx
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2225:b0:65d:4d:422c with SMTP id
 006d021491bc7-65d0eb22dcamr22478023eaf.78.1767601884035; Mon, 05 Jan 2026
 00:31:24 -0800 (PST)
Date: Mon, 05 Jan 2026 00:31:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695b76dc.050a0220.1c9965.0028.GAE@google.com>
Subject: [syzbot] [i2c?] [usb?] INFO: trying to register non-static key in i2c_register_adapter
From: syzbot <syzbot+4718cc0f82054afeea8f@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b69053dd3ffb wifi: mt76: Remove blank line after mt792x fi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=151caa9a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=4718cc0f82054afeea8f
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131caa9a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122377da580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-b69053dd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1b892254af04/vmlinux-b69053dd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/731f0d4ee97f/bzImage-b69053dd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4718cc0f82054afeea8f@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f297d9e5fa0 R14: 00007f297d9e5fa0 R15: 0000000000000003
 </TASK>
i2c-core: adapter 'DigitalNow DVB-T Dual USB': can't register device (-22)
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 5486 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1299
 __lock_acquire+0xae/0x2cf0 kernel/locking/lockdep.c:5112
 lock_acquire+0x107/0x340 kernel/locking/lockdep.c:5868
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:162
 complete_with_flags kernel/sched/completion.c:25 [inline]
 complete+0x28/0x1b0 kernel/sched/completion.c:52
 device_release+0x9e/0x1d0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x228/0x570 lib/kobject.c:737
 i2c_register_adapter+0x75f/0x1150 drivers/i2c/i2c-core-base.c:1576
 dvb_usb_i2c_init+0x202/0x2f0 drivers/media/usb/dvb-usb/dvb-usb-i2c.c:31
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:183 [inline]
 dvb_usb_device_init+0xf23/0x2580 drivers/media/usb/dvb-usb/dvb-usb-init.c:310
 cxusb_probe+0xff/0x700 drivers/media/usb/dvb-usb/cxusb.c:1630
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0xad0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:831
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b8/0x430 drivers/base/dd.c:1031
 proc_ioctl+0x447/0x6c0 drivers/usb/core/devio.c:2368
 proc_ioctl_default+0xbc/0x100 drivers/usb/core/devio.c:2403
 usbdev_do_ioctl drivers/usb/core/devio.c:2767 [inline]
 usbdev_ioctl+0x1367/0x20b0 drivers/usb/core/devio.c:2827
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f297d78f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef89f6238 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f297d9e5fa0 RCX: 00007f297d78f7c9
RDX: 0000200000000200 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007ffef89f6290 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f297d9e5fa0 R14: 00007f297d9e5fa0 R15: 0000000000000003
 </TASK>
BUG: unable to handle page fault for address: fffffffffffffff8
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD dd3f067 P4D dd3f067 PUD dd41067 PMD 0 
Oops: Oops: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5486 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:swake_up_locked kernel/sched/swait.c:30 [inline]
RIP: 0010:complete_with_flags kernel/sched/completion.c:29 [inline]
RIP: 0010:complete+0x99/0x1b0 kernel/sched/completion.c:52
Code: 89 e7 e8 8a ab 8d 00 4d 8b 3c 24 4d 39 e7 0f 84 d4 00 00 00 49 8d 7f f8 48 89 f8 48 c1 e8 03 80 3c 28 00 74 05 e8 67 ab 8d 00 <49> 8b 7f f8 be 03 00 00 00 31 d2 e8 b7 60 f6 ff 4c 89 ff e8 df 51
RSP: 0018:ffffc900083cf3f8 EFLAGS: 00010046
RAX: 1fffffffffffffff RBX: ffff888040481638 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: fffffffffffffff8
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52001079e6c R12: ffff888040481678
R13: 0000000000000001 R14: 0000000000000286 R15: 0000000000000000
FS:  00005555621b9500(0000) GS:ffff88808d416000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffff8 CR3: 000000001a1ba000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 device_release+0x9e/0x1d0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x228/0x570 lib/kobject.c:737
 i2c_register_adapter+0x75f/0x1150 drivers/i2c/i2c-core-base.c:1576
 dvb_usb_i2c_init+0x202/0x2f0 drivers/media/usb/dvb-usb/dvb-usb-i2c.c:31
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:183 [inline]
 dvb_usb_device_init+0xf23/0x2580 drivers/media/usb/dvb-usb/dvb-usb-init.c:310
 cxusb_probe+0xff/0x700 drivers/media/usb/dvb-usb/cxusb.c:1630
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0xad0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:831
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b8/0x430 drivers/base/dd.c:1031
 proc_ioctl+0x447/0x6c0 drivers/usb/core/devio.c:2368
 proc_ioctl_default+0xbc/0x100 drivers/usb/core/devio.c:2403
 usbdev_do_ioctl drivers/usb/core/devio.c:2767 [inline]
 usbdev_ioctl+0x1367/0x20b0 drivers/usb/core/devio.c:2827
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f297d78f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef89f6238 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f297d9e5fa0 RCX: 00007f297d78f7c9
RDX: 0000200000000200 RSI: 00000000c0105512 RDI: 0000000000000004
RBP: 00007ffef89f6290 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f297d9e5fa0 R14: 00007f297d9e5fa0 R15: 0000000000000003
 </TASK>
Modules linked in:
CR2: fffffffffffffff8
---[ end trace 0000000000000000 ]---
RIP: 0010:swake_up_locked kernel/sched/swait.c:30 [inline]
RIP: 0010:complete_with_flags kernel/sched/completion.c:29 [inline]
RIP: 0010:complete+0x99/0x1b0 kernel/sched/completion.c:52
Code: 89 e7 e8 8a ab 8d 00 4d 8b 3c 24 4d 39 e7 0f 84 d4 00 00 00 49 8d 7f f8 48 89 f8 48 c1 e8 03 80 3c 28 00 74 05 e8 67 ab 8d 00 <49> 8b 7f f8 be 03 00 00 00 31 d2 e8 b7 60 f6 ff 4c 89 ff e8 df 51
RSP: 0018:ffffc900083cf3f8 EFLAGS: 00010046
RAX: 1fffffffffffffff RBX: ffff888040481638 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: fffffffffffffff8
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52001079e6c R12: ffff888040481678
R13: 0000000000000001 R14: 0000000000000286 R15: 0000000000000000
FS:  00005555621b9500(0000) GS:ffff88808d416000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffff8 CR3: 000000001a1ba000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	89 e7                	mov    %esp,%edi
   2:	e8 8a ab 8d 00       	call   0x8dab91
   7:	4d 8b 3c 24          	mov    (%r12),%r15
   b:	4d 39 e7             	cmp    %r12,%r15
   e:	0f 84 d4 00 00 00    	je     0xe8
  14:	49 8d 7f f8          	lea    -0x8(%r15),%rdi
  18:	48 89 f8             	mov    %rdi,%rax
  1b:	48 c1 e8 03          	shr    $0x3,%rax
  1f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
  23:	74 05                	je     0x2a
  25:	e8 67 ab 8d 00       	call   0x8dab91
* 2a:	49 8b 7f f8          	mov    -0x8(%r15),%rdi <-- trapping instruction
  2e:	be 03 00 00 00       	mov    $0x3,%esi
  33:	31 d2                	xor    %edx,%edx
  35:	e8 b7 60 f6 ff       	call   0xfff660f1
  3a:	4c 89 ff             	mov    %r15,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	df                   	.byte 0xdf
  3f:	51                   	push   %rcx


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

