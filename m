Return-Path: <linux-i2c+bounces-10760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1511AA8CE6
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 09:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9DF03AD2D0
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 07:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F901C863D;
	Mon,  5 May 2025 07:16:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF521ACEAC
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429395; cv=none; b=h+oTWC35cXQN4VEe1YOTQoCP1vAG1ArSOwOCa77CqsBZmRTNFbddmJ1iutMexbElKIS/wavjmJH2T+VYHxzhx8XTIyHeaS4hvbESf6c9E2Pu7J8aPFsLMZzK2Acbz2IkI27K0P14F//sEE9nM7Gjik91oa+m450LRDo50wy9wjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429395; c=relaxed/simple;
	bh=EMSJKUDzSBAb77SoebBMNvAxBP/EkXe/jQiB+gH+Wts=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uPtB7beebeufxftZmsd0jGJmPCHMxZxkX+xdTRT3giCb1atN/BhYjnwdxQpHyv2mx6WHS2gNo7f1gZce2D6ZSOcQ9jawFiioTUHILIKdDCX0dr/4DTYnNXnZRv1QGc8/H7HzNKMT88WZjwpKDre6aud4mplpbgIWDR8egNqnTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d922570570so52654195ab.3
        for <linux-i2c@vger.kernel.org>; Mon, 05 May 2025 00:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429392; x=1747034192;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHfdXx64Ba+sX/D56yZyl1OIE6j4n+qi0pYdDMpu7z8=;
        b=VwrNnuW8N+AZGkRqNJQaRnQjXtihN3vHs4QVvLo9t0ryvfNx2ED7BUt1iIOZawzRJ1
         EOpGTg8xnT3hesM5RZENH6OErwSCKJwpUHzJx5cxDl2YZzRnotaVkPB/c45D06IM5FlD
         NKi9/+lkjBI3METck6hlOsKjh3gz9nalNj86ITmlYX+B1HmgXfZZwQthAkIraTLaaKq6
         65ZqT7hfMt2qvsdfvN5v3aNAWeuG8AvstRn3jJpB//xXAWZUwlWmArPHZhIo1k10+r/h
         Onu8+AQHwH3L0IMpheNZOBFU4CDNzKrqWcvmkhScSfDoIXJi8lkuFiclSltepzlc1qzF
         VHJw==
X-Gm-Message-State: AOJu0Yx18iwFI+6Dtul0lrM2oOJeHKi9Y/k4hIz027+5i/+Mn13N6xgE
	pRESmc1YFDEVAT4PPNnYhOHFFcri/RntPj67vywSR1ie4fF/bQ8Kurq6KZGRRkARMBM6m/FUNoJ
	1uHnnc9xazHIr60ANn5DO4DucxnoHJrTLY1WfvIRSGlTs4nCtZvls+DKVIg==
X-Google-Smtp-Source: AGHT+IEBTI4+qSrx+O/JX6tEl9JoXNB1Mfqno3SpHuC5+Syea8HBrLMkS77b4J+W3VCYhYrS0ENDfIYvhB1GOX3jphb1pXym/Xz5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:250e:b0:3d8:211c:9891 with SMTP id
 e9e14a558f8ab-3da5b23b7e2mr57455755ab.2.1746429392744; Mon, 05 May 2025
 00:16:32 -0700 (PDT)
Date: Mon, 05 May 2025 00:16:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681865d0.a70a0220.254cdc.0048.GAE@google.com>
Subject: [syzbot] [i2c?] KMSAN: uninit-value in __i2c_smbus_xfer
From: syzbot <syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1034139b980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c9df74580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1550f1b3980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca57f5a3f77/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f23cbc11e68/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73e63afac354/bzImage-02ddfb98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:481 [inline]
BUG: KMSAN: uninit-value in __i2c_smbus_xfer+0x23e7/0x2f60 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:481 [inline]
 __i2c_smbus_xfer+0x23e7/0x2f60 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer+0x31d/0x4d0 drivers/i2c/i2c-core-smbus.c:545
 i2cdev_ioctl_smbus+0x4a1/0x660 drivers/i2c/i2c-dev.c:389
 i2cdev_ioctl+0xa14/0xf40 drivers/i2c/i2c-dev.c:478
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0x239/0x400 fs/ioctl.c:892
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:892
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable page created at:
 get_futex_key+0x6f/0x11d0 kernel/futex/core.c:227
 futex_wake+0xfe/0x890 kernel/futex/waitwake.c:166

CPU: 1 UID: 0 PID: 5795 Comm: syz-executor470 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
=====================================================


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

