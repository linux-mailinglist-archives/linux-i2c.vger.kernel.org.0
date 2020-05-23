Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649691DF85E
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 19:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgEWREQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 13:04:16 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:39004 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728169AbgEWREQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 May 2020 13:04:16 -0400
Received: by mail-il1-f198.google.com with SMTP id q2so11526049ild.6
        for <linux-i2c@vger.kernel.org>; Sat, 23 May 2020 10:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=N8d6QeYPUHpdLo5KPtrA8gD+DQMUAZwou75CTKpAngQ=;
        b=GLHWkgMNqqHzcfSRYWVdzFUxm7C+5AsXC3Mx/uEL+FiAeHo8iYQ8u60JsVB4gMUZ6c
         oudeLHF3v2oV8cg6IATSYUgYCAQJtWCKTVDIja1xhPFOwBfo8JfkN1Q7I7hZAmF55amb
         hCMSNkkctK0oX+7W92ZdCJmAvrHazpAEghgfY2i5ZaaJe7o3HDfmg8DYmRn5rJA/om+L
         rtEYsEORSeuDr5DAlJu1bFFLA6ZMYaq6gwy6sggI5Wrp+pBW48Csjd+18LICGGJGERom
         KEGcu254+A1iZBJe8pNAxJ4/c2+JHIdPM6TByi83Pjwv1IC41YorE+xlPeNPn+yRctBQ
         uynw==
X-Gm-Message-State: AOAM533mibLIX2sugAIdV2rzBjDvlLg7fxPavIoMZyHvWrlrlrzL7tO7
        GA74MuVj0yHDKlse6QS/5jqByayu3u1TyL7XJv2B4p4Jp/NP
X-Google-Smtp-Source: ABdhPJyNRetGuMPRSC3TJJS3852pUoFf/F8dXdiBJXRfxpPhSme4g2h+uCaHK9VPu+dfEtaEbubR0znf4l8NVmSvsuKqMiJpqJQr
MIME-Version: 1.0
X-Received: by 2002:a5d:9f4d:: with SMTP id u13mr7746122iot.113.1590253454748;
 Sat, 23 May 2020 10:04:14 -0700 (PDT)
Date:   Sat, 23 May 2020 10:04:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000045f37205a653bcf8@google.com>
Subject: KASAN: use-after-free Read in put_device
From:   syzbot <syzbot+60f9ee7f99afe29ef9fa@syzkaller.appspotmail.com>
To:     brendanhiggins@google.com, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael.j.wysocki@intel.com,
        rafael@kernel.org, rdunlap@infradead.org,
        syzkaller-bugs@googlegroups.com, wsa@the-dreams.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    c11d28ab Add linux-next specific files for 20200522
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=114e4f06100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
dashboard link: https://syzkaller.appspot.com/bug?extid=60f9ee7f99afe29ef9fa
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ba16e2100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16caefe6100000

The bug was bisected to:

commit 4ef12f7198023c09ad6d25b652bd8748c965c7fa
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Wed May 13 15:18:40 2020 +0000

    kobject: Make sure the parent does not get released before its children

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=140a5cba100000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=160a5cba100000
console output: https://syzkaller.appspot.com/x/log.txt?x=120a5cba100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+60f9ee7f99afe29ef9fa@syzkaller.appspotmail.com
Fixes: 4ef12f719802 ("kobject: Make sure the parent does not get released before its children")

i2c-tiny-usb 1-1:0.0: version 63.ce found at bus 001 address 002
 (null): failure reading functionality
i2c i2c-0: failure reading functionality
i2c i2c-0: connected i2c-tiny-usb device
usb 1-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in kobject_put+0x296/0x2f0 lib/kobject.c:745
Read of size 1 at addr ffff8880a8ce3054 by task kworker/0:7/2516

CPU: 0 PID: 2516 Comm: kworker/0:7 Not tainted 5.7.0-rc6-next-20200522-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x413 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 kobject_put+0x296/0x2f0 lib/kobject.c:745
 put_device+0x1b/0x30 drivers/base/core.c:2761
 i2cdev_detach_adapter.part.0+0x53/0x70 drivers/i2c/i2c-dev.c:689
 i2cdev_detach_adapter drivers/i2c/i2c-dev.c:647 [inline]
 i2cdev_notifier_call+0xad/0xc0 drivers/i2c/i2c-dev.c:704
 notifier_call_chain+0xc0/0x230 kernel/notifier.c:83
 __blocking_notifier_call_chain kernel/notifier.c:284 [inline]
 __blocking_notifier_call_chain kernel/notifier.c:271 [inline]
 blocking_notifier_call_chain kernel/notifier.c:295 [inline]
 blocking_notifier_call_chain+0x85/0xa0 kernel/notifier.c:292
 device_del+0x17e/0xd30 drivers/base/core.c:2813
 device_unregister+0x11/0x30 drivers/base/core.c:2871
 i2c_del_adapter drivers/i2c/i2c-core-base.c:1671 [inline]
 i2c_del_adapter+0x42b/0x590 drivers/i2c/i2c-core-base.c:1610
 i2c_tiny_usb_disconnect+0x3a/0xb0 drivers/i2c/busses/i2c-tiny-usb.c:283
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1113 [inline]
 device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1144
 bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2839
 usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1245
 usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5059 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x17ca/0x38f0 drivers/usb/core/hub.c:5576
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 process_scheduled_works kernel/workqueue.c:2330 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2416
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

Allocated by task 2516:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc mm/kasan/common.c:494 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:467
 kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 get_free_i2c_dev drivers/i2c/i2c-dev.c:76 [inline]
 i2cdev_attach_adapter.part.0+0x9a/0x3f0 drivers/i2c/i2c-dev.c:651
 i2cdev_attach_adapter drivers/i2c/i2c-dev.c:647 [inline]
 i2cdev_notifier_call drivers/i2c/i2c-dev.c:702 [inline]
 i2cdev_notifier_call+0x9b/0xc0 drivers/i2c/i2c-dev.c:695
 notifier_call_chain+0xc0/0x230 kernel/notifier.c:83
 __blocking_notifier_call_chain kernel/notifier.c:284 [inline]
 __blocking_notifier_call_chain kernel/notifier.c:271 [inline]
 blocking_notifier_call_chain kernel/notifier.c:295 [inline]
 blocking_notifier_call_chain+0x85/0xa0 kernel/notifier.c:292
 device_add+0xa6e/0x1900 drivers/base/core.c:2640
 i2c_register_adapter+0x30d/0xb00 drivers/i2c/i2c-core-base.c:1415
 i2c_add_adapter+0xba/0x100 drivers/i2c/i2c-core-base.c:1528
 i2c_tiny_usb_probe+0x3a8/0x528 drivers/i2c/busses/i2c-tiny-usb.c:265
 usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:374
 really_probe+0x281/0x6d0 drivers/base/dd.c:525
 driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:701
 __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:807
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x360 drivers/base/dd.c:873
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xaf1/0x1900 drivers/base/core.c:2662
 usb_set_configuration+0xec5/0x1740 drivers/usb/core/message.c:2032
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xc6/0x1f0 drivers/usb/core/driver.c:272
 really_probe+0x281/0x6d0 drivers/base/dd.c:525
 driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:701
 __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:807
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x360 drivers/base/dd.c:873
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xaf1/0x1900 drivers/base/core.c:2662
 usb_new_device.cold+0x753/0x103d drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x1eca/0x38f0 drivers/usb/core/hub.c:5576
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

Freed by task 2516:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x109/0x2b0 mm/slab.c:3757
 device_release+0x71/0x200 drivers/base/core.c:1541
 kobject_cleanup lib/kobject.c:701 [inline]
 kobject_release lib/kobject.c:732 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x2f0 lib/kobject.c:749
 cdev_device_del+0x69/0x80 fs/char_dev.c:575
 put_i2c_dev+0x160/0x1b0 drivers/i2c/i2c-dev.c:93
 i2cdev_detach_adapter.part.0+0x53/0x70 drivers/i2c/i2c-dev.c:689
 i2cdev_detach_adapter drivers/i2c/i2c-dev.c:647 [inline]
 i2cdev_notifier_call+0xad/0xc0 drivers/i2c/i2c-dev.c:704
 notifier_call_chain+0xc0/0x230 kernel/notifier.c:83
 __blocking_notifier_call_chain kernel/notifier.c:284 [inline]
 __blocking_notifier_call_chain kernel/notifier.c:271 [inline]
 blocking_notifier_call_chain kernel/notifier.c:295 [inline]
 blocking_notifier_call_chain+0x85/0xa0 kernel/notifier.c:292
 device_del+0x17e/0xd30 drivers/base/core.c:2813
 device_unregister+0x11/0x30 drivers/base/core.c:2871
 i2c_del_adapter drivers/i2c/i2c-core-base.c:1671 [inline]
 i2c_del_adapter+0x42b/0x590 drivers/i2c/i2c-core-base.c:1610
 i2c_tiny_usb_disconnect+0x3a/0xb0 drivers/i2c/busses/i2c-tiny-usb.c:283
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1113 [inline]
 device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1144
 bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2839
 usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1245
 usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5059 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x17ca/0x38f0 drivers/usb/core/hub.c:5576
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 process_scheduled_works kernel/workqueue.c:2330 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2416
 kthread+0x3b5/0x4a0 kernel/kthread.c:291
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

The buggy address belongs to the object at ffff8880a8ce3000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 84 bytes inside of
 2048-byte region [ffff8880a8ce3000, ffff8880a8ce3800)
The buggy address belongs to the page:
page:ffffea0002a338c0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea000240c988 ffffea00027fd2c8 ffff8880aa000e00
raw: 0000000000000000 ffff8880a8ce3000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880a8ce2f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
 ffff8880a8ce2f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880a8ce3000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff8880a8ce3080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a8ce3100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
