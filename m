Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4E96DD2D9
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Apr 2023 08:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjDKGcz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Apr 2023 02:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjDKGcy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Apr 2023 02:32:54 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103B71FC4
        for <linux-i2c@vger.kernel.org>; Mon, 10 Apr 2023 23:32:53 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id i4-20020a056e020d8400b00325a80f683cso5578254ilj.22
        for <linux-i2c@vger.kernel.org>; Mon, 10 Apr 2023 23:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681194772; x=1683786772;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RhvbgZ92JfQcyj0UmcgVBWP+vSEC8CElQHX/vbzW3g=;
        b=F74Sa4EIlryMsMo+g15SLi5VLvrNXR4Eh9pcTpzgGrOEQPRmJ9XEb8WxmPFf/33QOY
         gsxEYHWCzPULmsnppKE4dNN4qDOwD1P8T/G07UbVm0b/xDhMTdBekW2u1FhBNbg9Z23z
         huSc1jwXukGif+W1wU9ZoqVh5IrzAC8EjhvoivUflniz2EVl/7Km704TcK5isGxe281/
         2YOg1pmzXYwnnxE/djuoOyKpr8Mlb+1OxeWaVBCWZK6ZIVZE9zPFoqpP8SzkUf1BBlM0
         vIki6XIRHqqcIZ035gznxWoxEYIdSua6+Lnbqi85uk+E4NRkoEOLGs9kpvtodi0nx6HG
         DOHQ==
X-Gm-Message-State: AAQBX9f4TFSQc1e3485eGDMh4lHHlGa0fKNjeAR9GjLs/BgKBxWGjebO
        OsuRMuZxy2mDHygMF6XP+IW6HNBnLGMYAXFDJJ82u3o0M3bf
X-Google-Smtp-Source: AKy350Yo2m9CJ9QwQwEFZI5S32kpnONQWgKVkxHhuRg97sRrqqz9oX6LUf8/CcMrkvuo/3xiXQ8pozh1YwO4yl4FdzPpgzvMH2vc
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a43:b0:324:5b4c:7087 with SMTP id
 u3-20020a056e021a4300b003245b4c7087mr4715909ilv.0.1681194772406; Mon, 10 Apr
 2023 23:32:52 -0700 (PDT)
Date:   Mon, 10 Apr 2023 23:32:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003528ee05f909a903@google.com>
Subject: [syzbot] [i2c?] KASAN: stack-out-of-bounds Write in i801_isr (2)
From:   syzbot <syzbot+33b0400029edbd2b4377@syzkaller.appspotmail.com>
To:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    99ddf2254feb Merge tag 'trace-v6.3-rc5' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=129f2409c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=adfc55aec6afccdd
dashboard link: https://syzkaller.appspot.com/bug?extid=33b0400029edbd2b4377
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33b0400029edbd2b4377@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:546 [inline]
BUG: KASAN: stack-out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:613 [inline]
BUG: KASAN: stack-out-of-bounds in i801_isr+0xcd8/0xe20 drivers/i2c/busses/i2c-i801.c:594
Write of size 1 at addr ffffc900028e7db0 by tasmbus: error: Unexpected send start condition in state 2

CPU: 0 PID: 53 Comm: kworker/u8:3 Not tainted 6.3.0-rc5-syzkaller-00032-g99ddf2254feb #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Workqueue: bat_events batadv_nc_worker
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 print_address_description.constprop.0+0x2c/0x3c0 mm/kasan/report.c:319
 print_report mm/kasan/report.c:430 [inline]
 kasan_report+0x11c/0x130 mm/kasan/report.c:536
 i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:546 [inline]
 i801_isr drivers/i2c/busses/i2c-i801.c:613 [inline]
 i801_isr+0xcd8/0xe20 drivers/i2c/busses/i2c-i801.c:594
 __handle_irq_event_percpu+0x22b/0x730 kernel/irq/handle.c:158
 handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
 handle_irq_event+0xab/0x1e0 kernel/irq/handle.c:210
 handle_fasteoi_irq+0x233/0x9f0 kernel/irq/chip.c:714
 generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
 handle_irq arch/x86/kernel/irq.c:231 [inline]
 __common_interrupt+0xa1/0x220 arch/x86/kernel/irq.c:250
 common_interrupt+0x51/0xd0 arch/x86/kernel/irq.c:240
 asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:636
RIP: 0010:__do_softirq+0x19a/0x905 kernel/softirq.c:557
Code: 00 48 01 f0 48 89 44 24 18 48 c7 c7 40 01 4b 8a e8 1b 80 fc ff 65 66 c7 05 41 a2 01 76 00 00 e8 ec 69 86 f7 fb bb ff ff ff ff <48> c7 c5 c0 a0 40 8c 41 0f bc de 83 c3 01 0f 85 aa 00 00 00 e9 85
RSP: 0000:ffffc90000007f70 EFLAGS: 00000206
RAX: 00000000018f5cd8 RBX: 00000000ffffffff RCX: 1ffffffff22a3f4e
RDX: 0000000000000000 RSI: 0000000000000100 RDI: 0000000000000000
RBP: ffff888013eb40c0 R08: 0000000000000001 R09: ffffffff914c7c6f
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000200 R15: 0000000000000000
 invoke_softirq kernel/softirq.c:445 [inline]
 __irq_exit_rcu+0x114/0x190 kernel/softirq.c:650
 irq_exit_rcu+0x9/0x20 kernel/softirq.c:662
 sysvec_apic_timer_interrupt+0x97/0xc0 arch/x86/kernel/apic/apic.c:1107
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:645
RIP: 0010:lock_acquire+0x1f3/0x520 kernel/locking/lockdep.c:5637
Code: bb 9e 7e 83 f8 01 0f 85 b9 02 00 00 9c 58 f6 c4 02 0f 85 a4 02 00 00 48 83 7c 24 08 00 74 01 fb 48 b8 00 00 00 00 00 fc ff df <48> 01 c3 48 c7 03 00 00 00 00 48 c7 43 08 00 00 00 00 48 8b 84 24
RSP: 0000:ffffc900007e7b28 EFLAGS: 00000206
RAX: dffffc0000000000 RBX: 1ffff920000fcf67 RCX: bbc06d1d311ad187
RDX: 1ffff11002aa1d4e RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff914c7b87
R10: fffffbfff2298f70 R11: 0000000000000000 R12: 0000000000000002
R13: 0000000000000000 R14: ffffffff8c7925c0 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:327 [inline]
 rcu_read_lock include/linux/rcupdate.h:773 [inline]
 batadv_nc_process_nc_paths.part.0+0xec/0x3f0 net/batman-adv/network-coding.c:687
 batadv_nc_process_nc_paths net/batman-adv/network-coding.c:679 [inline]
 batadv_nc_worker+0xc82/0xfe0 net/batman-adv/network-coding.c:728
 process_one_work+0x991/0x15c0 kernel/workqueue.c:2390
 worker_thread+0x669/0x1090 kernel/workqueue.c:2537
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>

The buggy address belongs to the virtual mapping at
 [ffffc900028e0000, ffffc900028e9000) created by:
 kernel_clone+0xeb/0x890 kernel/fork.c:2679

The buggy address belongs to the physical page:
page:ffffea0001bfe780 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x6ff9e
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x102dc2(GFP_HIGHUSER|__GFP_NOWARN|__GFP_ZERO), pid 5172, tgid 5172 (syz-executor.2), ts 889522562513, free_ts 889116806536
 prep_new_page mm/page_alloc.c:2553 [inline]
 get_page_from_freelist+0x1190/0x2e20 mm/page_alloc.c:4326
 __alloc_pages+0x1cb/0x4a0 mm/page_alloc.c:5592
 alloc_pages+0x1aa/0x270 mm/mempolicy.c:2283
 vm_area_alloc_pages mm/vmalloc.c:2953 [inline]
 __vmalloc_area_node mm/vmalloc.c:3029 [inline]
 __vmalloc_node_range+0xafe/0x1390 mm/vmalloc.c:3199
 alloc_thread_stack_node kernel/fork.c:311 [inline]
 dup_task_struct kernel/fork.c:979 [inline]
 copy_process+0x1320/0x7590 kernel/fork.c:2095
 kernel_clone+0xeb/0x890 kernel/fork.c:2679
 __do_sys_clone+0xba/0x100 kernel/fork.c:2820
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1454 [inline]
 free_pcp_prepare+0x5d5/0xa50 mm/page_alloc.c:1504
 free_unref_page_prepare mm/page_alloc.c:3388 [inline]
 free_unref_page+0x1d/0x490 mm/page_alloc.c:3483
 slab_destroy mm/slab.c:1613 [inline]
 slabs_destroy+0x85/0xc0 mm/slab.c:1633
 __cache_free_alien mm/slab.c:773 [inline]
 cache_free_alien mm/slab.c:789 [inline]
 ___cache_free+0x204/0x3d0 mm/slab.c:3417
 qlink_free mm/kasan/quarantine.c:168 [inline]
 qlist_free_all+0x4f/0x1a0 mm/kasan/quarantine.c:187
 kasan_quarantine_reduce+0x192/0x220 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0x63/0x90 mm/kasan/common.c:305
 kasan_slab_alloc include/linux/kasan.h:186 [inline]
 slab_post_alloc_hook mm/slab.h:769 [inline]
 slab_alloc_node mm/slab.c:3257 [inline]
 slab_alloc mm/slab.c:3266 [inline]
 __kmem_cache_alloc_lru mm/slab.c:3443 [inline]
 kmem_cache_alloc+0x1bd/0x3f0 mm/slab.c:3452
 getname_flags.part.0+0x50/0x4f0 fs/namei.c:140
 getname_flags include/linux/audit.h:321 [inline]
 getname+0x92/0xd0 fs/namei.c:219
 do_sys_openat2+0xf5/0x4c0 fs/open.c:1342
 do_sys_open fs/open.c:1364 [inline]
 __do_sys_openat fs/open.c:1380 [inline]
 __se_sys_openat fs/open.c:1375 [inline]
 __x64_sys_openat+0x143/0x1f0 fs/open.c:1375
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Memory state around the buggy address:
 ffffc900028e7c80: f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc900028e7d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc900028e7d80: f1 f1 f1 f1 04 f3 f3 f3 00 00 00 00 00 00 00 00
                                     ^
 ffffc900028e7e00: 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 00 00
 ffffc900028e7e80: 00 00 f3 f3 f3 f3 f3 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	00 48 01             	add    %cl,0x1(%rax)
   3:	f0 48 89 44 24 18    	lock mov %rax,0x18(%rsp)
   9:	48 c7 c7 40 01 4b 8a 	mov    $0xffffffff8a4b0140,%rdi
  10:	e8 1b 80 fc ff       	callq  0xfffc8030
  15:	65 66 c7 05 41 a2 01 	movw   $0x0,%gs:0x7601a241(%rip)        # 0x7601a260
  1c:	76 00 00
  1f:	e8 ec 69 86 f7       	callq  0xf7866a10
  24:	fb                   	sti
  25:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
* 2a:	48 c7 c5 c0 a0 40 8c 	mov    $0xffffffff8c40a0c0,%rbp <-- trapping instruction
  31:	41 0f bc de          	bsf    %r14d,%ebx
  35:	83 c3 01             	add    $0x1,%ebx
  38:	0f 85 aa 00 00 00    	jne    0xe8
  3e:	e9                   	.byte 0xe9
  3f:	85                   	.byte 0x85


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
