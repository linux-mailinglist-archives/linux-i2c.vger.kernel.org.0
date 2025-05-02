Return-Path: <linux-i2c+bounces-10742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B5AA79A0
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 20:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCF309A66AA
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 18:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667831E25F2;
	Fri,  2 May 2025 18:58:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F65194080
	for <linux-i2c@vger.kernel.org>; Fri,  2 May 2025 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212313; cv=none; b=T9IgUI+cYuMzyR+B5JYWhgMdMDNfidPDZfkc0AXItcUOkcEVZT03KxTAM4T1/rKrN3KzRC0pMuDhdMwPL6LnxRCiHihUo/0xwSsgmtQWdap7Pu23rvza2nAqxZvYa7eHKTF7U96njqgt0LgjCXvKggD3XjZvJBLadBM77QTlWnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212313; c=relaxed/simple;
	bh=zoTQVjJ3FyrRRCnyr5OBzcdq2EmPXQ1x0Lb2YQyaxy8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dZ1HaePs8wjY+bL68Im5xlWKapU4Z4CTdiB1nuDDm0JzNFg/hbfdfmK4t1nYgJP3OiiADx864Cn1sZG5KXC/QNTYK/JrVNpNWp/RBIFrKE80RexAdFNSSCHun177WKb60jUoCQe9c6M/Z7nN6i1WT7NvaciNcP+2xzUPMB8hqGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85ed07f832dso243318839f.2
        for <linux-i2c@vger.kernel.org>; Fri, 02 May 2025 11:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746212310; x=1746817110;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAOzJSFBfDSYukAOktP0k0eJ72hAOlOQTKQeME/mnmU=;
        b=FA/Q+bNzlifHJnkwZG6I6RFI73Hvd2h2EAHNzeo+xRLrZ5xYC/6PdT5q595bIoPAnT
         Sa34XE1bx/YuE6qr2P0TjOc4cSgksD9iRRZkFV9qK0YXJ4fBAOuXDQt24VGsFBLnvpAL
         7EOoMZVghWtULhZU0B7gm5794ue/gDu+GKDNXAu8MUDWly3QfGncSZgifuNsO1vXiBOD
         wqTgWv+qyuA8PSpAccxsewdA8uozW86dMvYoC+2qDe//uPS4k6CFS0pmy/rUi9j72xTR
         plwC9D1Ug7esDtC/m78WJ/YVLklzbT6LtD3lax6tOF4LAYGdwQjrBamh2+DCLuoyjLdP
         zr9A==
X-Gm-Message-State: AOJu0YzRgegYVSdt7B6A9hWD4Npu5IRZGmVNjc1a0i+u0F+UDBRfBJm2
	yjCfB6kcSpyvOn0qDHfTpBU+sdawBFd7tIjn8pOIxQWBl8XeaPUpfojcE2tQm6XDyASbg9HrW1S
	g+dJ0sb21bRtb3U9rZNlYlqfGEFaHvYKHCd0z4DlySM0dt2WL/hCsRnPOpA==
X-Google-Smtp-Source: AGHT+IEvo5HzJ1SeLr8XPnomT+eKZlYj0uEg29543xurggx1vIJ1iMF2xCzAsVlfrK4um5l3l1C7o3e3GwCC3f7qXKhuYkxGzjlB
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2d8b:b0:861:c744:5a4a with SMTP id
 ca18e2360f4ac-8670b7d17e6mr27261039f.5.1746212310400; Fri, 02 May 2025
 11:58:30 -0700 (PDT)
Date: Fri, 02 May 2025 11:58:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681515d6.a70a0220.254cdc.0007.GAE@google.com>
Subject: [syzbot] [i2c?] KMSAN: kernel-infoleak in i2cdev_ioctl_smbus
From: syzbot <syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=166989b3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1593b02f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154d41cc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca57f5a3f77/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f23cbc11e68/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73e63afac354/bzImage-02ddfb98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-infoleak in instrument_copy_to_user include/linux/instrumented.h:114 [inline]
BUG: KMSAN: kernel-infoleak in _inline_copy_to_user include/linux/uaccess.h:196 [inline]
BUG: KMSAN: kernel-infoleak in _copy_to_user+0xcc/0x120 lib/usercopy.c:26
 instrument_copy_to_user include/linux/instrumented.h:114 [inline]
 _inline_copy_to_user include/linux/uaccess.h:196 [inline]
 _copy_to_user+0xcc/0x120 lib/usercopy.c:26
 copy_to_user include/linux/uaccess.h:225 [inline]
 i2cdev_ioctl_smbus+0x586/0x660 drivers/i2c/i2c-dev.c:394
 i2cdev_ioctl+0xa14/0xf40 drivers/i2c/i2c-dev.c:478
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0x239/0x400 fs/ioctl.c:892
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:892
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:495 [inline]
 __i2c_smbus_xfer+0x254d/0x2f60 drivers/i2c/i2c-core-smbus.c:607
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

Local variable msgbuf1.i created at:
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:334 [inline]
 __i2c_smbus_xfer+0x86a/0x2f60 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer+0x31d/0x4d0 drivers/i2c/i2c-core-smbus.c:545

Bytes 0-1 of 2 are uninitialized
Memory access of size 2 starts at ffff88812e8b7d06
Data copied to user address 0000200000000080

CPU: 1 UID: 0 PID: 5885 Comm: syz-executor221 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
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

