Return-Path: <linux-i2c+bounces-14304-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD0FC8D27A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7231B348315
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 07:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BB531DDA4;
	Thu, 27 Nov 2025 07:44:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25895239594
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229470; cv=none; b=qRv1BoJR1k1ThloQWF92R8bGNtKoCl11baLMN/9SMuAsTov3Hlsmi4eVR+k+qVoc2fkvL9qESRWnMAubOt9pAVQgerJYiuEI3kDZ14HAhryCHjb5qqeDrkyngRB+qSLZMSP20smSWD0scR4AYtni4xRkX6owKjRuTGfxppCW/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229470; c=relaxed/simple;
	bh=fsMszkeGTcVYN3sFDJPPTtTMk4ajKNVBnjLW4AB0Ie4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tl/AANq2FKCI9Mng9rgN2DIl8dyZaqCkwFpc1l4tVBuK1cASGHzUcjdX6NKgvESe9g3xI1XXAy8F9fqi8e+Ayq5TgQ0WmnC0tHxKkJIGCMFxPQSehOe+1loLsUttGtzluugQBMrwmWKF0ncOIRGn05c5feD6XfZupjAS0NeZerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-948ffb2cd49so39130939f.0
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 23:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229468; x=1764834268;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrPDslZXE/+C296ALo4Sd1air3PJyRjJahHyvz0O+Ww=;
        b=egqXWg6QQ2JlzeMMJM3RTU3oiGkf7nch1C4wmmMeSn8aISg8DYmUdFIukeX+cK+vi/
         dIGCNtyd+z8PfvtYvPZJuc+m8Xmw5MBwidI/MPctzjvUk9kmOTsqn3bBCoROuh03Qoyi
         U1eeu4Oyzd4sDT/WoNygqRSgfN7zs7oi5yyT5q4Oj49c54xwhzXXkNyC8F671uFLFmhJ
         cwjS0tRV0aaaU8dHW5SFhjdibFOzw0o9FqyZy+LJL5F7SV95FIp57EWlvBy6uFQdcg9y
         4c3pz5O+2u+eFHNA0df0xAdqPCmvTcdsYGCibUFU5Mb5bYuXHOgTu5Ixr6qQgm4WqA94
         U6EA==
X-Gm-Message-State: AOJu0Yw1/WO8KvnoXuptsffRM+X8pwW5uXB76gB6+2qX64/kntMmv8CZ
	kXTjGxiYUrJbwfzoLxN0izXs30JaewWNL7L+n4S4c1MISsri559YW+nTt3rAtZ9lK95nPEBlMCP
	FBdARFJcOUBBK1a+V3hLwWZEJG1xtUYCDovIH5uDVl4Mh4Bif28OsQO2BzXkG3A==
X-Google-Smtp-Source: AGHT+IH8+IWl0g+9x3PurPJEqckR3tAsZekqZehr98fUW6xeZvww32cq3wKsdH6wmXa5ycgN/ojnjRcQpH+9S98fieR1Vbm7oy8x
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:48c7:b0:572:4e49:7216 with SMTP id
 8926c6da1cb9f-5b967a8ab47mr14665952173.19.1764229468286; Wed, 26 Nov 2025
 23:44:28 -0800 (PST)
Date: Wed, 26 Nov 2025 23:44:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6928015c.a70a0220.d98e3.00f3.GAE@google.com>
Subject: [syzbot] [i2c?] WARNING: ODEBUG bug in i2c_device_remove
From: syzbot <syzbot+7e6ce34763ef58212c4a@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fd95357fd8c6 Merge tag 'sched_ext-for-6.18-rc6-fixes-2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=174c5742580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=38a0c4cddc846161
dashboard link: https://syzkaller.appspot.com/bug?extid=7e6ce34763ef58212c4a
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3725d56dc16/disk-fd95357f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5ae11d958530/vmlinux-fd95357f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b484995bf333/bzImage-fd95357f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7e6ce34763ef58212c4a@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff88805d740690 object type: work_struct hint: rtl2832_i2c_gate_work+0x0/0xd0 drivers/media/dvb-frontends/rtl2832.c:-1
WARNING: CPU: 1 PID: 1232 at lib/debugobjects.c:615 debug_print_object+0x16b/0x1e0 lib/debugobjects.c:612
Modules linked in:
CPU: 1 UID: 0 PID: 1232 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:debug_print_object+0x16b/0x1e0 lib/debugobjects.c:612
Code: 4c 89 ff e8 07 ad 9d fd 4d 8b 0f 48 c7 c7 80 e9 3d 8b 48 8b 34 24 4c 89 ea 89 e9 4d 89 f0 41 54 e8 2a 35 00 fd 48 83 c4 08 90 <0f> 0b 90 90 ff 05 27 93 53 0a 48 83 c4 08 5b 41 5c 41 5d 41 5e 41
RSP: 0018:ffffc90004eae760 EFLAGS: 00010296
RAX: 9a1ddaa657264c00 RBX: dffffc0000000000 RCX: 0000000000100000
RDX: ffffc9001b1c7000 RSI: 000000000002da78 RDI: 000000000002da79
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101712487b R12: ffffffff8709b290
R13: ffffffff8b3deb00 R14: ffff88805d740690 R15: ffffffff8ae9e880
FS:  0000000000000000(0000) GS:ffff888126ef6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000001f4030 CR3: 000000003179c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x3a2/0x470 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2474 [inline]
 slab_free mm/slub.c:6642 [inline]
 kfree+0x114/0x950 mm/slub.c:6849
 i2c_device_remove+0x88/0x200 drivers/i2c/i2c-core-base.c:631
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1274 [inline]
 device_release_driver_internal+0x46f/0x800 drivers/base/dd.c:1297
 bus_remove_device+0x355/0x420 drivers/base/bus.c:579
 device_del+0x515/0x8e0 drivers/base/core.c:3878
 device_unregister+0x20/0xc0 drivers/base/core.c:3919
 rtl28xxu_frontend_detach+0x167/0x1e0 drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1105
 dvb_usbv2_adapter_frontend_exit drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:732 [inline]
 dvb_usbv2_adapter_exit drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:829 [inline]
 dvb_usbv2_exit+0x435/0x9e0 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:843
 dvb_usbv2_probe+0x4c4/0x41c0 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:993
 usb_probe_interface+0x668/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x254/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2bb/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x188/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x254/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2bb/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x188/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_new_device+0xa29/0x16e0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2958/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

