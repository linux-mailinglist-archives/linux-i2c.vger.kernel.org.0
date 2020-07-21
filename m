Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F5B227EA2
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 13:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbgGULUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 07:20:07 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:46837 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729516AbgGULUG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 07:20:06 -0400
Received: by mail-io1-f70.google.com with SMTP id z65so13222657iof.13
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 04:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=PakZhdVRy00H5Jh4vTqRjEQYSnP47NKLSdT3K911Emg=;
        b=FJi9lZ0o9BZ5QCir13FQpvximAwSrHesxOnFKnO7XCx5Jo+2hC3CdRxJWrfizWVbbP
         8WbshukQp2NUz7dBB1J4O6SoyjF5Qd2sQBNaTOPBMxzTK3S/40ReqlyX7YFhYLCVFeZa
         VvBTyCN+1KJXLsslq/k5dXskLH2pp/5QUBBrc/aSJ1h48BncXNehVBHuPP1p10a7aHIY
         qnYK8VK/Vt/UlMNn5ptpIAabXw/FTEFvE0A8VBYkLqFxSfQF8rFHrR4RdKNsdNQ8AMqt
         bNDKsdsknnfRObHybTZ1sXhdk9I85hq6mAV9XvTUU8NEWDtQwH4sPYwmrtw4SLQ41Ys7
         RtGA==
X-Gm-Message-State: AOAM530t5fZOYMw0aQxSOfssqLV6O3kLMcOwZMqN1bJglbw5Mphz1bZz
        bRGOZbABGwckeaQ2MByW5ajaAntP2SpyyoqaVrEgbnbwqqNc
X-Google-Smtp-Source: ABdhPJx3ptVWWJ4i6pIxXv/78PQF6oVLHXTz3Oh2F4h7h1aMKeQbb1QOTpZj/9jJfd/8b15zRVAz47qSc4jOmZlwHMb2VT1uRibs
MIME-Version: 1.0
X-Received: by 2002:a92:2802:: with SMTP id l2mr27644334ilf.169.1595330405476;
 Tue, 21 Jul 2020 04:20:05 -0700 (PDT)
Date:   Tue, 21 Jul 2020 04:20:05 -0700
In-Reply-To: <20200721111007.hwwdveqxeqcry4wn@pesu.pes.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e30e105aaf1ce89@google.com>
Subject: Re: WARNING in pvr2_i2c_core_done
From:   syzbot <syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com>
To:     bkkarthik@pesu.pes.edu, dan.carpenter@oracle.com,
        gregkh@linuxfoundation.org, isely@pobox.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in kernfs_find_ns

pvrusb2: Invalid write control endpoint
pvrusb2: Invalid write control endpoint
pvrusb2: Invalid write control endpoint
pvrusb2: Invalid write control endpoint
pvrusb2: Invalid write control endpoint
pvrusb2: Invalid write control endpoint
general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
CPU: 0 PID: 78 Comm: pvrusb2-context Not tainted 5.7.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:kernfs_find_ns+0x31/0x370 fs/kernfs/dir.c:829
Code: 49 89 d6 41 55 41 54 55 48 89 fd 53 48 83 ec 08 e8 f4 61 af ff 48 8d 7d 70 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 03 00 00 48 8d bd 98 00 00 00 48 8b 5d 70 48
RSP: 0018:ffff8881d4187938 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffffffff863789c0 RCX: ffffffff85a79ba7
RDX: 000000000000000e RSI: ffffffff81901d1c RDI: 0000000000000070
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff873ed1e7
R10: fffffbfff0e7da3c R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff863790e0
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557f2b45ae48 CR3: 00000001d2762000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 kernfs_find_and_get_ns+0x2f/0x60 fs/kernfs/dir.c:906
 kernfs_find_and_get include/linux/kernfs.h:548 [inline]
 sysfs_unmerge_group+0x5d/0x160 fs/sysfs/group.c:366
 dpm_sysfs_remove+0x62/0xb0 drivers/base/power/sysfs.c:790
 device_del+0x18b/0xd20 drivers/base/core.c:2834
 device_unregister+0x22/0xc0 drivers/base/core.c:2889
 i2c_unregister_device include/linux/err.h:41 [inline]
 i2c_client_dev_release+0x39/0x50 drivers/i2c/i2c-core-base.c:465
 device_release+0x71/0x200 drivers/base/core.c:1559
 kobject_cleanup lib/kobject.c:693 [inline]
 kobject_release lib/kobject.c:722 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x245/0x540 lib/kobject.c:739
 put_device drivers/base/core.c:2779 [inline]
 device_unregister+0x34/0xc0 drivers/base/core.c:2890
 i2c_unregister_device+0x38/0x40 include/linux/err.h:41
 v4l2_i2c_new_subdev_board+0x159/0x2c0 drivers/media/v4l2-core/v4l2-i2c.c:114
 v4l2_i2c_new_subdev+0xb8/0xf0 drivers/media/v4l2-core/v4l2-i2c.c:135
 pvr2_hdw_load_subdev drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2023 [inline]
 pvr2_hdw_load_modules drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2075 [inline]
 pvr2_hdw_setup_low drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2156 [inline]
 pvr2_hdw_setup drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2262 [inline]
 pvr2_hdw_initialize+0xc8d/0x3600 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2339
 pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:109 [inline]
 pvr2_context_thread_func+0x250/0x850 drivers/media/usb/pvrusb2/pvrusb2-context.c:158
 kthread+0x392/0x470 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
Modules linked in:
---[ end trace 9af941b6bcb04b01 ]---
RIP: 0010:kernfs_find_ns+0x31/0x370 fs/kernfs/dir.c:829
Code: 49 89 d6 41 55 41 54 55 48 89 fd 53 48 83 ec 08 e8 f4 61 af ff 48 8d 7d 70 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 03 00 00 48 8d bd 98 00 00 00 48 8b 5d 70 48
RSP: 0018:ffff8881d4187938 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffffffff863789c0 RCX: ffffffff85a79ba7
RDX: 000000000000000e RSI: ffffffff81901d1c RDI: 0000000000000070
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff873ed1e7
R10: fffffbfff0e7da3c R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff863790e0
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557f2b45ae48 CR3: 00000001d2762000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         b791d1bd Merge tag 'locking-kcsan-2020-06-11' of git://git..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16dfe440900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf1899337a6e343
dashboard link: https://syzkaller.appspot.com/bug?extid=e74a998ca8f1df9cc332
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117e281b100000

