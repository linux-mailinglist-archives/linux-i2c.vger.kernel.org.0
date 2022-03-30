Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B778B4ECAED
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 19:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244907AbiC3RpO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 13:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbiC3RpN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 13:45:13 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E185E1262D
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 10:43:26 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id g16-20020a05660226d000b00638d8e1828bso14897683ioo.13
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 10:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=4GCVSF/Voy5rwomprtsngXtMplHy8zS2E/BiciZHSj4=;
        b=uZ+XL341u9ZaZf5wAoXiqBil8byx19UxPoId7FYLjIM6NkKMstXZt0EUuu59nrQ0NU
         d9EKN2XVir7T/j42Ym63107d8/qtX66uk/YSEN0JQ1RKkG+We4NnBpW1LDS49H1nOEzt
         vVhDNq5Tf+OhnhW/J43k5ylsHEbHyNzaABeaR4ASQF46XrbjaD5KmSG6HrPvb/6wZ+v5
         RuDwlRgvs0LuzYsSkl7bWVnZ28nH5B/AqU4FVgpk2F4naYKq45SJ/3OdmRDHi20oMtuu
         vpBbyUeCXN1gyX7PtFQIarzt/YVOr0DK9UWhs06rSXx1MFNnzRii2bx8tdbOqtS6PXF2
         PG0Q==
X-Gm-Message-State: AOAM533c/AyQAn+tkFkU7Gg40iMYHEQ42lYQuw6uimasj0cFDy+R8nck
        rQh9zHqXm1SG0Jrv2NskVLs+D8hc5JpQLKtAwBFBFZQVvc5T
X-Google-Smtp-Source: ABdhPJyqj/a+ZjMe9Y4X1Gk25zpQXzj2t/n6g+O7syjrhfEab2iC1HgkZJu4YrJDUUBuoo1aO1kR6CzGezWXFXeZyZ4za5T/JgxE
MIME-Version: 1.0
X-Received: by 2002:a5d:9c0f:0:b0:645:bc04:fd5 with SMTP id
 15-20020a5d9c0f000000b00645bc040fd5mr12307649ioe.28.1648662206260; Wed, 30
 Mar 2022 10:43:26 -0700 (PDT)
Date:   Wed, 30 Mar 2022 10:43:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000028ae8305db731533@google.com>
Subject: [syzbot] KASAN: use-after-free Read in i2c_put_adapter
From:   syzbot <syzbot+509a39149506f9c2fe34@syzkaller.appspotmail.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f022814633e1 Merge tag 'trace-v5.18-1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10f37405700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ca27d4f6e8fcfba
dashboard link: https://syzkaller.appspot.com/bug?extid=509a39149506f9c2fe34
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+509a39149506f9c2fe34@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in i2c_put_adapter drivers/i2c/i2c-core-base.c:2471 [inline]
BUG: KASAN: use-after-free in i2c_put_adapter+0x4c/0x50 drivers/i2c/i2c-core-base.c:2465
Read of size 8 at addr ffff88801e193010 by task syz-executor.4/32338

CPU: 0 PID: 32338 Comm: syz-executor.4 Tainted: G        W         5.17.0-syzkaller-11138-gf022814633e1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x495 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 i2c_put_adapter drivers/i2c/i2c-core-base.c:2471 [inline]
 i2c_put_adapter+0x4c/0x50 drivers/i2c/i2c-core-base.c:2465
 i2cdev_release+0x55/0xb0 drivers/i2c/i2c-dev.c:619
 __fput+0x277/0x9d0 fs/file_table.c:317
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:190 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:222
 __syscall_exit_to_user_mode_work kernel/entry/common.c:304 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:315
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f73db23bc8b
Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 63 fc ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 a1 fc ff ff 8b 44
RSP: 002b:00007ffdec734390 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 00007f73db23bc8b
RDX: 00007f73db3a12a0 RSI: ffffffffffffffff RDI: 0000000000000003
RBP: 00007f73db39d960 R08: 0000000000000000 R09: 00007f73db3a12a8
R10: 00007ffdec734490 R11: 0000000000000293 R12: 000000000005c3ad
R13: 00007ffdec734490 R14: 00007f73db39c030 R15: 0000000000000032
 </TASK>

Allocated by task 14:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524
 kmalloc include/linux/slab.h:581 [inline]
 kzalloc include/linux/slab.h:714 [inline]
 i2c_tiny_usb_probe+0x5e/0x560 drivers/i2c/busses/i2c-tiny-usb.c:228
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_set_configuration+0x101e/0x1900 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:755
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:785
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:902
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:973
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xb83/0x1e20 drivers/base/core.c:3405
 usb_new_device.cold+0x641/0x1091 drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5507 [inline]
 port_event drivers/usb/core/hub.c:5665 [inline]
 hub_event+0x25c6/0x4680 drivers/usb/core/hub.c:5747
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Freed by task 14:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free+0x166/0x1a0 mm/kasan/common.c:328
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1728 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1754
 slab_free mm/slub.c:3510 [inline]
 kfree+0xd6/0x4d0 mm/slub.c:4552
 i2c_tiny_usb_free drivers/i2c/busses/i2c-tiny-usb.c:215 [inline]
 i2c_tiny_usb_disconnect+0x88/0xf0 drivers/i2c/busses/i2c-tiny-usb.c:285
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 __device_release_driver+0x627/0x760 drivers/base/dd.c:1209
 device_release_driver_internal drivers/base/dd.c:1242 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1265
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:529
 device_del+0x4f3/0xc80 drivers/base/core.c:3592
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1419
 usb_disconnect.cold+0x278/0x6ec drivers/usb/core/hub.c:2228
 hub_port_connect drivers/usb/core/hub.c:5207 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5507 [inline]
 port_event drivers/usb/core/hub.c:5665 [inline]
 hub_event+0x1e74/0x4680 drivers/usb/core/hub.c:5747
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 process_scheduled_works kernel/workqueue.c:2352 [inline]
 worker_thread+0x854/0x1080 kernel/workqueue.c:2438
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Last potentially related work creation:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 __kasan_record_aux_stack+0xbe/0xd0 mm/kasan/generic.c:348
 kvfree_call_rcu+0x74/0x990 kernel/rcu/tree.c:3595
 drop_sysctl_table+0x3c0/0x4e0 fs/proc/proc_sysctl.c:1705
 unregister_sysctl_table fs/proc/proc_sysctl.c:1743 [inline]
 unregister_sysctl_table+0xc0/0x190 fs/proc/proc_sysctl.c:1718
 __devinet_sysctl_unregister net/ipv4/devinet.c:2611 [inline]
 devinet_exit_net+0x186/0x280 net/ipv4/devinet.c:2752
 ops_exit_list+0xb0/0x170 net/core/net_namespace.c:162
 cleanup_net+0x4ea/0xb00 net/core/net_namespace.c:594
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Second to last potentially related work creation:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 __kasan_record_aux_stack+0xbe/0xd0 mm/kasan/generic.c:348
 call_rcu+0x99/0x790 kernel/rcu/tree.c:3074
 netlink_release+0xf08/0x1db0 net/netlink/af_netlink.c:815
 __sock_release net/socket.c:650 [inline]
 sock_release+0x87/0x1b0 net/socket.c:678
 netlink_kernel_release+0x4b/0x60 net/netlink/af_netlink.c:2109
 nl_fib_lookup_exit net/ipv4/fib_frontend.c:1412 [inline]
 fib_net_exit+0x3c/0x80 net/ipv4/fib_frontend.c:1625
 ops_exit_list+0xb0/0x170 net/core/net_namespace.c:162
 cleanup_net+0x4ea/0xb00 net/core/net_namespace.c:594
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

The buggy address belongs to the object at ffff88801e193000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 16 bytes inside of
 2048-byte region [ffff88801e193000, ffff88801e193800)

The buggy address belongs to the physical page:
page:ffffea0000786400 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1e190
head:ffffea0000786400 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 ffffea0000676200 dead000000000002 ffff888010c42000
raw: 0000000000000000 0000000000080008 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3626, tgid 3626 (syz-executor.5), ts 120584063496, free_ts 120582629324
 prep_new_page mm/page_alloc.c:2438 [inline]
 get_page_from_freelist+0xba2/0x3df0 mm/page_alloc.c:4179
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5405
 alloc_pages+0x1aa/0x310 mm/mempolicy.c:2262
 alloc_slab_page mm/slub.c:1799 [inline]
 allocate_slab+0x26c/0x3c0 mm/slub.c:1944
 new_slab mm/slub.c:2004 [inline]
 ___slab_alloc+0x8df/0xf20 mm/slub.c:3005
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3092
 slab_alloc_node mm/slub.c:3183 [inline]
 __kmalloc_node+0x2cb/0x390 mm/slub.c:4458
 kmalloc_node include/linux/slab.h:604 [inline]
 kzalloc_node include/linux/slab.h:725 [inline]
 qdisc_alloc+0xac/0xa10 net/sched/sch_generic.c:941
 qdisc_create_dflt+0x71/0x4b0 net/sched/sch_generic.c:1000
 attach_one_default_qdisc net/sched/sch_generic.c:1148 [inline]
 netdev_for_each_tx_queue include/linux/netdevice.h:2385 [inline]
 attach_default_qdiscs net/sched/sch_generic.c:1166 [inline]
 dev_activate+0x75d/0xcd0 net/sched/sch_generic.c:1224
 __dev_open+0x388/0x4d0 net/core/dev.c:1434
 __dev_change_flags+0x583/0x750 net/core/dev.c:8423
 dev_change_flags+0x93/0x170 net/core/dev.c:8494
 do_setlink+0x96d/0x3a20 net/core/rtnetlink.c:2731
 __rtnl_newlink+0xdf8/0x1760 net/core/rtnetlink.c:3416
 rtnl_newlink+0x64/0xa0 net/core/rtnetlink.c:3531
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1353 [inline]
 free_pcp_prepare+0x549/0xd20 mm/page_alloc.c:1403
 free_unref_page_prepare mm/page_alloc.c:3325 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3420
 __unfreeze_partials+0x17c/0x1a0 mm/slub.c:2523
 qlink_free mm/kasan/quarantine.c:157 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:446
 kasan_slab_alloc include/linux/kasan.h:224 [inline]
 slab_post_alloc_hook mm/slab.h:749 [inline]
 slab_alloc_node mm/slub.c:3217 [inline]
 slab_alloc mm/slub.c:3225 [inline]
 kmem_cache_alloc_trace+0x26d/0x3f0 mm/slub.c:3256
 kmalloc include/linux/slab.h:581 [inline]
 kzalloc include/linux/slab.h:714 [inline]
 fib6_info_alloc+0xc1/0x210 net/ipv6/ip6_fib.c:156
 ip6_route_info_create+0x33e/0x1aa0 net/ipv6/route.c:3748
 ip6_route_add+0x24/0x150 net/ipv6/route.c:3842
 addrconf_prefix_route+0x30a/0x4e0 net/ipv6/addrconf.c:2418
 add_v4_addrs+0x653/0x890 net/ipv6/addrconf.c:3162
 addrconf_gre_config net/ipv6/addrconf.c:3436 [inline]
 addrconf_notify+0x9b0/0x1ba0 net/ipv6/addrconf.c:3616
 notifier_call_chain+0xb5/0x200 kernel/notifier.c:84
 call_netdevice_notifiers_info+0xb5/0x130 net/core/dev.c:1938
 call_netdevice_notifiers_extack net/core/dev.c:1976 [inline]
 call_netdevice_notifiers net/core/dev.c:1990 [inline]
 __dev_notify_flags+0x110/0x2b0 net/core/dev.c:8461

Memory state around the buggy address:
 ffff88801e192f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88801e192f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88801e193000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88801e193080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801e193100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
