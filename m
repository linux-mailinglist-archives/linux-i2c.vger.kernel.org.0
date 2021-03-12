Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633C63386C3
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 08:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhCLHsL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 02:48:11 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:53885 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbhCLHrl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Mar 2021 02:47:41 -0500
Received: by mail-il1-f199.google.com with SMTP id s12so17507474ilh.20
        for <linux-i2c@vger.kernel.org>; Thu, 11 Mar 2021 23:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=qYwl3F5+cPc1gs3aNSG/oRy7U9IR/KOLouhDtAnEUOE=;
        b=KXUwnMgic9EEgVnBLFzYUEbGNBsX8jmNYM0Piy9KraHkKRcGMW1juKsKIg8EGCeBwk
         ha64IjM+rlDyZfZpZLQ1X75/ddPzHGVCzWkgC2uzyyJ3FOHj9esaCfNtj6vjSnO+LSkP
         Wa5phoRPyD3WZzPqjVNYIQHbWyhRAlOWVMMgOJcDAgUx/+VlU+vedKRwtUlx6hKBnVYl
         kT2eoZT5Q4QGG/bhuZZ7zrQDjfhHfuEmas6MZjpa3FQBLEbCgFJRyqzlzDblCqy7cNk9
         wzF2buPEK5RzZ8X8M1S8pXZSAc9kuyQOqVuPS2/3VD8b7mrkoLN1SH46U8zE3Lw7vvUI
         6GKg==
X-Gm-Message-State: AOAM530Z1lyZoHGxncbh/yG41SX8xdt37wd7vDU2BhMFpK03eZIkH8C7
        7z/+lcPneOqh8ifDQ5dEcWOlLxBQkfhit9CDBuIr4aZTMmdg
X-Google-Smtp-Source: ABdhPJwSADwPwXX6uc2BMJJ/p7Of7hPx+vkQSLIy3Qs+1mYmmArsDe8xpn/qTGob6R4oAQTj4P7H9QEJDKbtl4KLqF0/Xxdv4tIW
MIME-Version: 1.0
X-Received: by 2002:a6b:b447:: with SMTP id d68mr8972981iof.87.1615535237586;
 Thu, 11 Mar 2021 23:47:17 -0800 (PST)
Date:   Thu, 11 Mar 2021 23:47:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f564d305bd521b83@google.com>
Subject: [syzbot] WARNING in __i2c_transfer
From:   syzbot <syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    28806e4d Merge tag 'media/v5.12-2' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11192342d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6bcf96204c1b8e77
dashboard link: https://syzkaller.appspot.com/bug?extid=ffb0b3ffa6cfbc7d7b3f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1083223ad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14345f0ad00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 8406 at drivers/i2c/i2c-core-base.c:2021 __i2c_transfer+0xa87/0x17d0 drivers/i2c/i2c-core-base.c:2021
Modules linked in:
CPU: 0 PID: 8406 Comm: syz-executor613 Not tainted 5.12.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__i2c_transfer+0xa87/0x17d0 drivers/i2c/i2c-core-base.c:2021
Code: 0f 94 c7 31 ff 44 89 fe e8 96 ba c2 fb 45 84 ff 0f 84 b3 fc ff ff e8 d8 b3 c2 fb e8 b2 5a 4f fb e9 a4 fc ff ff e8 c9 b3 c2 fb <0f> 0b 41 bc ea ff ff ff e9 2b fd ff ff e8 b7 b3 c2 fb 44 89 ee bf
RSP: 0018:ffffc900018cfd48 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000010 RCX: 0000000000000000
RDX: ffff88801e4e5340 RSI: ffffffff85b0ea97 RDI: 0000000000000003
RBP: ffff888020870b58 R08: 0000000000000000 R09: ffffffff8faa792f
R10: ffffffff85b0e048 R11: 1ffffffff1ed6964 R12: 0000000000000010
R13: 0000000000000000 R14: ffff888020870b78 R15: 0000000000000000
FS:  000000000226f300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcccc5096c0 CR3: 0000000012e13000 CR4: 0000000000350ef0
Call Trace:
 i2c_transfer+0x1e6/0x3e0 drivers/i2c/i2c-core-base.c:2112
 i2cdev_ioctl_rdwr+0x583/0x6a0 drivers/i2c/i2c-dev.c:297
 i2cdev_ioctl+0x46c/0x780 drivers/i2c/i2c-dev.c:453
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x443469
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffb0c53048 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004004a0 RCX: 0000000000443469
RDX: 0000000020004480 RSI: 0000000000000707 RDI: 0000000000000003
RBP: 0000000000403010 R08: 00232d6332692f76 R09: 00000000004004a0
R10: 000000000000001f R11: 0000000000000246 R12: 00000000004030a0
R13: 0000000000000000 R14: 00000000004b1018 R15: 00000000004004a0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
