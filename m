Return-Path: <linux-i2c+bounces-2352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8C87BBCA
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 12:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717AD1C216E6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 11:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C3F6EB4E;
	Thu, 14 Mar 2024 11:17:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26D1A38DD
	for <linux-i2c@vger.kernel.org>; Thu, 14 Mar 2024 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710415044; cv=none; b=lOQJTaozoHNpy/WBQZfQDKG+G1mt+omimjKr6expIodh2K3kdFXRSP6HGJHWuxYkGsQS9nKIdgVyPOIVtjUvKiBoByb887H38cFO3hY2XYQTEhs722jVrnB56TAlrANqGITM/vpXkdbL49BsjtV+evZ5pUROl6EhnU0dlkFzeLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710415044; c=relaxed/simple;
	bh=6AB0v5jCGzQvB/gar0/+UXUmnAOeY8a1E1HcfqGV0c8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cdfvZZs9ZbsM/gqXasLqt3KO/hlbDHY4Bd60IWQ5/NtYRgCb0LQF9v1TG8kf0LoMC25dIkzbrB82UiaeszM52IGcC+eYUnp0U28He9JtAvvncSuzBR8/1T5G63kJrqXGMBa8ENFrcNCNId7XT6CTV5NKcXyQpHvv1IAZd4r/1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c846da7ad2so61078039f.3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Mar 2024 04:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710415041; x=1711019841;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3SqBHAySxd1B2DGXt3MWJOppfcwh7UiW1rbRo/WCxc=;
        b=gdwYCd+0HTwIFflaLHrCjOxZ//5H3dPhKWnkGQqflUPWkDtvdczgFLcwtWKuVMXjI6
         hUPXI3HmR6INBbnjnmXk0iQJuLeMCB+I1VznzrtZtIoiPapS3C9NPERCQY6YiBoeCumo
         em77JuHTrFO1XGxE2BYs8SGAz2GoVoy1HzzigGvyNo1hvxBksbds893pFOck533ZjMSd
         ddC4Xh4aojDRIr5UatGYRgPFMeIFGQGLIhsAGWXXBo05XBKchdpeYI6TbfzXhF1lqI4W
         XaBiLiCfpKFCNGFBolv2cyolkbxIAJezJ8t2c8APzF/dljCch2pKL4/lqMcrERdCdMMo
         ZC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZT6GVg15/+9q8bZTKUrEo9A9nSeKh1cUJ36mMM+5yYRZJChReH5+2S46FYGk9b9vZodNnpzbZpHcyV9TJSggnwnKf2IedCyY6
X-Gm-Message-State: AOJu0Ywlf1DAi6xyt7my5pkqqjQZGc0yLNJvZ3zbOqZX9/SglgklJEhf
	KjFmJEtXr3sxqJrU/s2GWhg3mFc8g5qNfpkkoJBpuJC6qkS78/zv23sTOa852HTZA8kJgSIPc0e
	Wk+1AD7cEvhTJFJtXnzduC3DrntEK+dnmkoS1LKtX4PS6DeUFS6M4rmI=
X-Google-Smtp-Source: AGHT+IFE3QIyveq7XYbXZuOyV98VccdnczMQ//USqqud0KpxKY/wr4lweFl2KHDNdvuZoPfJnBWzqwPYFgunnZoR5bqXHhR8dtSu
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:378e:b0:476:d061:a34a with SMTP id
 w14-20020a056638378e00b00476d061a34amr67300jal.6.1710415041756; Thu, 14 Mar
 2024 04:17:21 -0700 (PDT)
Date: Thu, 14 Mar 2024 04:17:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb929e06139d0879@google.com>
Subject: [syzbot] [i2c?] KASAN: stack-out-of-bounds Write in i801_isr (3)
From: syzbot <syzbot+554a57aa65b47aa16a47@syzkaller.appspotmail.com>
To: andi.shyti@kernel.org, jdelvare@suse.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    005f6f34bd47 Merge tag 'i2c-for-6.8-rc8' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16b0d556180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9711c6169c49ef10
dashboard link: https://syzkaller.appspot.com/bug?extid=554a57aa65b47aa16a47
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-005f6f34.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8a1e40858f35/vmlinux-005f6f34.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9629bd1252c4/bzImage-005f6f34.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+554a57aa65b47aa16a47@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:550 [inline]
BUG: KASAN: stack-out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:617 [inline]
BUG: KASAN: stack-out-of-bounds in i801_isr+0xcfe/0xd10 drivers/i2c/busses/i2c-i801.c:598
Write of size 1 at addr ffffc900070dfd98 by task swapper/3/0

CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.8.0-rc7-syzkaller-00238-g005f6f34bd47 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc4/0x620 mm/kasan/report.c:488
 kasan_report+0xda/0x110 mm/kasan/report.c:601
 i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:550 [inline]
 i801_isr drivers/i2c/busses/i2c-i801.c:617 [inline]
 i801_isr+0xcfe/0xd10 drivers/i2c/busses/i2c-i801.c:598
 __handle_irq_event_percpu+0x22a/0x750 kernel/irq/handle.c:158
 handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
 handle_irq_event+0xab/0x1e0 kernel/irq/handle.c:210
 handle_fasteoi_irq+0x233/0xc20 kernel/irq/chip.c:720
 generic_handle_irq_desc include/linux/irqdesc.h:161 [inline]
 handle_irq arch/x86/kernel/irq.c:238 [inline]
 __common_interrupt+0xde/0x250 arch/x86/kernel/irq.c:257
 common_interrupt+0x52/0xd0 arch/x86/kernel/irq.c:247
 asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:640
RIP: 0010:__do_softirq+0x1e0/0x8e7 kernel/softirq.c:539
Code: 89 44 24 18 44 88 74 24 3b 48 c7 c7 c0 59 0b 8b e8 65 31 fc ff 65 66 c7 05 73 ac 3b 75 00 00 e8 d6 47 ca f6 fb bb ff ff ff ff <49> c7 c6 c0 a0 40 8d 41 0f bc dc 83 c3 01 0f 85 a7 00 00 00 e9 70
RSP: 0018:ffffc900008e8f30 EFLAGS: 00000206
RAX: 00000000007499e4 RBX: 00000000ffffffff RCX: 1ffffffff1f3a679
RDX: 0000000000000000 RSI: ffffffff8b0cb3c0 RDI: ffffffff8b6e9980
RBP: 0000000100013d6f R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8f9d6657 R11: 0000000000000000 R12: 0000000000000280
R13: 000000000000000a R14: 0000000000000001 R15: 0000000000000000
 invoke_softirq kernel/softirq.c:427 [inline]
 __irq_exit_rcu kernel/softirq.c:632 [inline]
 irq_exit_rcu+0xbb/0x120 kernel/softirq.c:644
 sysvec_apic_timer_interrupt+0x95/0xb0 arch/x86/kernel/apic/apic.c:1076
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:649
RIP: 0010:native_irq_disable arch/x86/include/asm/irqflags.h:37 [inline]
RIP: 0010:arch_local_irq_disable arch/x86/include/asm/irqflags.h:72 [inline]
RIP: 0010:default_idle+0xf/0x20 arch/x86/kernel/process.c:743
Code: 4c 01 c7 4c 29 c2 e9 72 ff ff ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d b3 5d 42 00 fb f4 <fa> c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
RSP: 0018:ffffc90000187e08 EFLAGS: 00000246
RAX: 00000000007499dd RBX: 0000000000000003 RCX: ffffffff8ac43eab
RDX: 0000000000000000 RSI: ffffffff8b0cb3c0 RDI: ffffffff8b6e9980
RBP: ffffed1002f51900 R08: 0000000000000001 R09: ffffed100d6a6ded
R10: ffff88806b536f6b R11: 0000000000000000 R12: 0000000000000003
R13: ffff888017a8c800 R14: ffffffff8f9d6650 R15: 0000000000000000
 default_idle_call+0x69/0xa0 kernel/sched/idle.c:97
 cpuidle_idle_call kernel/sched/idle.c:170 [inline]
 do_idle+0x336/0x400 kernel/sched/idle.c:312
 cpu_startup_entry+0x50/0x60 kernel/sched/idle.c:410
 start_secondary+0x220/0x2b0 arch/x86/kernel/smpboot.c:336
 secondary_startup_64_no_verify+0x170/0x17b
 </TASK>

The buggy address belongs to the virtual mapping at
 [ffffc900070d8000, ffffc900070e1000) created by:
 kernel_clone+0xfd/0x930 kernel/fork.c:2902

The buggy address belongs to the physical page:
page:ffffea0000c2b400 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x30ad0
memcg:ffff88810914d102
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff ffff88810914d102
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x102dc2(GFP_HIGHUSER|__GFP_NOWARN|__GFP_ZERO), pid 11717, tgid 11717 (syz-executor.2), ts 1114592091976, free_ts 1114514350228
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x2d4/0x350 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0xa28/0x3780 mm/page_alloc.c:3311
 __alloc_pages+0x22c/0x2430 mm/page_alloc.c:4569
 alloc_pages_mpol+0x258/0x600 mm/mempolicy.c:2133
 vm_area_alloc_pages mm/vmalloc.c:3063 [inline]
 __vmalloc_area_node mm/vmalloc.c:3139 [inline]
 __vmalloc_node_range+0xa6e/0x1540 mm/vmalloc.c:3320
 alloc_thread_stack_node kernel/fork.c:307 [inline]
 dup_task_struct kernel/fork.c:1112 [inline]
 copy_process+0x150b/0x97b0 kernel/fork.c:2327
 kernel_clone+0xfd/0x930 kernel/fork.c:2902
 __do_sys_clone3+0x1f5/0x270 kernel/fork.c:3203
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77
page last free pid 5219 tgid 5219 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x527/0xb10 mm/page_alloc.c:2346
 free_unref_page+0x33/0x3c0 mm/page_alloc.c:2486
 __folio_put_small mm/swap.c:106 [inline]
 __folio_put+0xc3/0x110 mm/swap.c:129
 folio_put include/linux/mm.h:1494 [inline]
 put_page include/linux/mm.h:1563 [inline]
 free_page_and_swap_cache+0x25a/0x2d0 mm/swap_state.c:304
 __tlb_remove_table arch/x86/include/asm/tlb.h:34 [inline]
 __tlb_remove_table_free mm/mmu_gather.c:154 [inline]
 tlb_remove_table_rcu+0x89/0xe0 mm/mmu_gather.c:209
 rcu_do_batch kernel/rcu/tree.c:2190 [inline]
 rcu_core+0x819/0x1680 kernel/rcu/tree.c:2465
 __do_softirq+0x21c/0x8e7 kernel/softirq.c:553

Memory state around the buggy address:
 ffffc900070dfc80: 00 00 00 00 f1 f1 f1 f1 f1 f1 00 00 00 00 00 00
 ffffc900070dfd00: 00 00 00 f3 f3 f3 f3 f3 00 00 00 00 00 00 00 00
>ffffc900070dfd80: 00 00 00 00 00 f1 f1 f1 f1 04 f3 f3 f3 00 00 00
                            ^
 ffffc900070dfe00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1
 ffffc900070dfe80: f1 f1 00 f2 f2 f2 00 00 f3 f3 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	89 44 24 18          	mov    %eax,0x18(%rsp)
   4:	44 88 74 24 3b       	mov    %r14b,0x3b(%rsp)
   9:	48 c7 c7 c0 59 0b 8b 	mov    $0xffffffff8b0b59c0,%rdi
  10:	e8 65 31 fc ff       	call   0xfffc317a
  15:	65 66 c7 05 73 ac 3b 	movw   $0x0,%gs:0x753bac73(%rip)        # 0x753bac92
  1c:	75 00 00
  1f:	e8 d6 47 ca f6       	call   0xf6ca47fa
  24:	fb                   	sti
  25:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
* 2a:	49 c7 c6 c0 a0 40 8d 	mov    $0xffffffff8d40a0c0,%r14 <-- trapping instruction
  31:	41 0f bc dc          	bsf    %r12d,%ebx
  35:	83 c3 01             	add    $0x1,%ebx
  38:	0f 85 a7 00 00 00    	jne    0xe5
  3e:	e9                   	.byte 0xe9
  3f:	70                   	.byte 0x70


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

