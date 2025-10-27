Return-Path: <linux-i2c+bounces-13825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB8C0BDEC
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 780E33BB329
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 05:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A517C2D6E4A;
	Mon, 27 Oct 2025 05:54:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB80238145
	for <linux-i2c@vger.kernel.org>; Mon, 27 Oct 2025 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544474; cv=none; b=QHMozcwE5FPYVNe10kc1FbFnMB70P06wtbouOiakrQaL9IqE2uaO5CJDnTfk9AcLQpNWjc4AOt+1JP4vKj46c9Ys2mjBJ7FbIAAEljeT8IkRDrLJ0yuYEELyeK9X5xrwaRGVv6lew3XArCMuKuhbnaOOQ8HFdt74yzhEgpsooZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544474; c=relaxed/simple;
	bh=SNmai1IOLY+pup+5LYY/q0U2eZq7K8fuJB8K0RS7rxQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Yg6b+Mov1jOivOf0qB0lswhSTMH3+itmjfoVA+yANpo9MRG7VF1P41nvYgn9WjRYwWSkrgGniJXaokP4VQBoo14j76SU2qwr28HhMyf8vFmiO0H/TEPiHRBaRCcDb/oSJPM7wXz6AOegJgvc8jqnTPznw4IzEYfTRQLFf+ZGe/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-430b0adb3e2so54259325ab.0
        for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 22:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761544472; x=1762149272;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKC11teTiEOM5vQjUmVTNkUGadJpuIO6RJHtwgVzfnQ=;
        b=qpsq2tfyfUCelGcCls6z80f3hKRCKISWt2aKYOPlMRVTdlHBY32o574TTk9rU+oOQ5
         UnVQ4LIDjWGMZOpEQ3P70XUqazOUPdtMOtCas9pEvkgBU0yUaVPq3OcxJFRBPsgUd5Jt
         1jdQngN56/A6GZoHezzGPrWsqQrrGJoQX3yyoM2+jVe503/dbt0w4f7DxSv9pPS0d6rJ
         eesSwBxZvm5kOt5AucZctahVKYQoIpqmkddEj9yzf1YCAQPX11i7xUQp96FlOjekWiRM
         CKbUwzZNab9Ixv8o744YgUlzeqOv8wSwLHZdrGLaH9RTxAObi+3WMKGMtOkThbswB/Z4
         tFdg==
X-Gm-Message-State: AOJu0Yx9/+C4rHt8XYDb9d3bhS6NaZ1/v2y4ryMEC8KjWZQt3ieP3N/a
	Huprh0GlBi/4kSELpnXEaG2tNy+Pe6g+W1RHFl78b7Gl62XYdHhFPyCjGx39KlA+p/SGPcMuvT4
	3aYPitRY7TiU2bY/P/J1GP6uVoyLrgX7JmIe8y/iANN/1mByc1+NQG/4ZPfdxKw==
X-Google-Smtp-Source: AGHT+IFFxWhXZUUoFvo6paTouupqI4Adh7UBpqa2Z4tR45DaNuUz00lT2knpS82K/lGQvBIoUmrin3NOkRlmFo6fQYAfUcRqQ94U
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188f:b0:42f:8bdd:6e9c with SMTP id
 e9e14a558f8ab-431eb66bd70mr135622495ab.14.1761544472098; Sun, 26 Oct 2025
 22:54:32 -0700 (PDT)
Date: Sun, 26 Oct 2025 22:54:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ff0918.050a0220.3344a1.0287.GAE@google.com>
Subject: [syzbot] [i2c?] WARNING: refcount bug in i2c_get_adapter
From: syzbot <syzbot+76501d32a94a432940a8@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    211ddde0823f Linux 6.18-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=156b4d42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=216353986aa62c5d
dashboard link: https://syzkaller.appspot.com/bug?extid=76501d32a94a432940a8
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/07371cf02d4e/disk-211ddde0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/27220c94ca08/vmlinux-211ddde0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12abd01b8291/bzImage-211ddde0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+76501d32a94a432940a8@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: addition on 0; use-after-free.
WARNING: CPU: 1 PID: 6572 at lib/refcount.c:25 refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:25
Modules linked in:
CPU: 1 UID: 0 PID: 6572 Comm: syz.2.237 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:refcount_warn_saturate+0xfa/0x1d0 lib/refcount.c:25
Code: 00 00 e8 e9 f5 3d fd 5b 41 5e c3 cc cc cc cc cc e8 db f5 3d fd c6 05 b8 91 60 0a 01 90 48 c7 c7 a0 9a 3e 8b e8 e7 3d 02 fd 90 <0f> 0b 90 90 eb d7 e8 bb f5 3d fd c6 05 99 91 60 0a 01 90 48 c7 c7
RSP: 0018:ffffc9000cdef6d8 EFLAGS: 00010246
RAX: 07f404c01321b500 RBX: 0000000000000002 RCX: 0000000000080000
RDX: ffffc90005d09000 RSI: 00000000000008d8 RDI: 00000000000008d9
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed101712487b R12: ffffffff8b995c88
R13: dffffc0000000000 R14: ffff88805dd48390 R15: dffffc0000000000
FS:  00007fd67c35e6c0(0000) GS:ffff888126cc2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b3001eff8 CR3: 000000003a534000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:-1 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 kobject_get+0xfd/0x120 lib/kobject.c:643
 i2c_get_adapter+0x6d/0xa0 drivers/i2c/i2c-core-base.c:2612
 i2cdev_open+0x48/0x190 drivers/i2c/i2c-dev.c:604
 chrdev_open+0x4cf/0x5e0 fs/char_dev.c:414
 do_dentry_open+0x9b1/0x1350 fs/open.c:965
 vfs_open+0x3b/0x350 fs/open.c:1097
 do_open fs/namei.c:3975 [inline]
 path_openat+0x2ef1/0x3840 fs/namei.c:4134
 do_filp_open+0x1fa/0x410 fs/namei.c:4161
 do_sys_openat2+0x121/0x1c0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd67e0fd810
Code: 48 89 44 24 20 75 93 44 89 54 24 0c e8 69 95 02 00 44 8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 bc 95 02 00 8b 44
RSP: 002b:00007fd67c35db70 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000002603 RCX: 00007fd67e0fd810
RDX: 0000000000002603 RSI: 00007fd67c35dc10 RDI: 00000000ffffff9c
RBP: 00007fd67c35dc10 R08: 0000000000000000 R09: 00232d6332692f76
R10: 0000000000000000 R11: 0000000000000293 R12: cccccccccccccccd
R13: 00007fd67e356038 R14: 00007fd67e355fa0 R15: 00007ffec547dee8
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

