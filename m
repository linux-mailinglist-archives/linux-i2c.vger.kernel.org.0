Return-Path: <linux-i2c+bounces-15275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB46D3BDAD
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 03:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B75A5341AE2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 02:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381FC248886;
	Tue, 20 Jan 2026 02:52:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F119F135
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768877551; cv=none; b=Zxli7AovbpIjTd0k1QeliyWs+H9YLG93Mu/wf0HK0iLRJJOtWfUq1JA91bhrm4vwidI/bOR1hyEZMZS2/MK7NcqylHRoY+xbhqmBR059+i8UGIAX48YtYt8OGkFs2W7A4igwnmv83HjCE6mI7Rf+1EXrArjhjsOAyAbZ2tvXZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768877551; c=relaxed/simple;
	bh=Oh73X5+NQ2jDCCin2sbq8dmzEg6Dok30Nv8VWC+3OWo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jg6Q2rx6bWwZzxcQFOpOcV2T0OkLV+K9XCAMeVOL4YxweiF6flJLp9eN0FhUl72bwL+6JnDeoNj0c/TlRrIWzY6iIsA+fQixpIRqin0vN0Z5PdVwEFqapgp4KB0T/mlQ+rK4wGuTfB37Qyx4rAZtK++wUDpR1rx87+RivFhbGj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-66106988006so12035135eaf.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 18:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877548; x=1769482348;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/G5DWevz9BYgcyAlcdYIBASIOjStNMz7iH3Bs0VvPXQ=;
        b=PJDVePtAmblTHbJLZXOqjmHJ3sETA+MYD8ea3nRP//CmBFLfWl+b3m3xHG7F540D2g
         1Ee7+Ena8T0wgtFkYrLP3Zwey0Ls2kyTPtp/rd0aYrrme7Ps2AgNnCxhYs7vCD7qO4O5
         s17jRE2+QT4TSszg0pcaKuynidt0BZpJyvsCyOtcjMNIBTmIqD8VlfzdHqx8ZYFyLeKT
         SEVd1yJMQxN7BDDioY7pBARKJrrJt67gN9Fp2WxiPEiBCDnJ7NQSpwxStYmZDFh4tf/Q
         6aYd5lWWONemWGV/Fg1zRp6fhVBxbKOUXBXhOfJDbdqdonwk6D8b9jVu5O8WAAzc7wD9
         t4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyKVKS2Yw54BI4ZLJMVpK7VIRuUgM4jzcyHb/eLo2QyQrdpDNv1mFj3K5n+/NdEeerh170QftdZy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnl7fN81tt4wa6fgpbBhKMIt+JaMeNmbjtKvHO7cvLDGLNQrye
	ndQJJVhnilTCsTNNgw7XWVr4y9ceao0nATgbZ5vUm66yvQ7lK5b8R0ppxhqVnnN6mUjU+Ea968/
	h/8gUHlhSYmWGmA0+Q4Iym5SlQgkVFOYEhTRS9H5ozTUYY5rSxLE/SJG8inE=
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae4:b0:659:9a49:8e8a with SMTP id
 006d021491bc7-662affa1216mr230770eaf.14.1768877548186; Mon, 19 Jan 2026
 18:52:28 -0800 (PST)
Date: Mon, 19 Jan 2026 18:52:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696eedec.a00a0220.203946.0001.GAE@google.com>
Subject: [syzbot] [input?] KASAN: stack-out-of-bounds Read in ft260_smbus_write
From: syzbot <syzbot+64ca69977b37604cd6d9@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-i2c@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.zaidman@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    603c05a1639f Merge tag 'nfs-for-6.19-2' of git://git.linux..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120d339a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1859476832863c41
dashboard link: https://syzkaller.appspot.com/bug?extid=64ca69977b37604cd6d9
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161e0852580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13115522580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b694f12a8d6f/disk-603c05a1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/91efc898c41a/vmlinux-603c05a1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d0cbdf66f29d/bzImage-603c05a1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+64ca69977b37604cd6d9@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: stack-out-of-bounds in ft260_smbus_write+0x19b/0x2f0 drivers/hid/hid-ft260.c:486
Read of size 42 at addr ffffc90003427d81 by task syz.2.65/6119

CPU: 0 UID: 0 PID: 6119 Comm: syz.2.65 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:194 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:200
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 ft260_smbus_write+0x19b/0x2f0 drivers/hid/hid-ft260.c:486
 ft260_smbus_xfer+0x22c/0x640 drivers/hid/hid-ft260.c:736
 __i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:591 [inline]
 __i2c_smbus_xfer+0x4f0/0xf60 drivers/i2c/i2c-core-smbus.c:554
 i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:546 [inline]
 i2c_smbus_xfer+0x200/0x3c0 drivers/i2c/i2c-core-smbus.c:536
 i2cdev_ioctl_smbus+0x237/0x990 drivers/i2c/i2c-dev.c:389
 i2cdev_ioctl+0x361/0x840 drivers/i2c/i2c-dev.c:478
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f88dd98f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffeebbe43a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f88ddbe5fa0 RCX: 00007f88dd98f749
RDX: 0000200000000200 RSI: 0000000000000720 RDI: 0000000000000004
RBP: 00007f88dda13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f88ddbe5fa0 R14: 00007f88ddbe5fa0 R15: 0000000000000003
 </TASK>

The buggy address belongs to stack of task syz.2.65/6119
 and is located at offset 49 in frame:
 i2cdev_ioctl_smbus+0x0/0x990 drivers/i2c/i2c-dev.c:632

This frame has 1 object:
 [48, 82) 'temp'

The buggy address belongs to a 8-page vmalloc region starting at 0xffffc90003420000 allocated at kernel_clone+0xfc/0x910 kernel/fork.c:2651
The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x22397
memcg:ffff888074f11282
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 0000000000000000 ffffea000088e5c8 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff ffff888074f11282
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x29c2(GFP_NOWAIT|__GFP_HIGHMEM|__GFP_IO|__GFP_FS|__GFP_ZERO), pid 5928, tgid 5928 (syz-executor), ts 80598654650, free_ts 80595057505
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1af/0x220 mm/page_alloc.c:1884
 prep_new_page mm/page_alloc.c:1892 [inline]
 get_page_from_freelist+0xd0b/0x31a0 mm/page_alloc.c:3945
 __alloc_frozen_pages_noprof+0x25f/0x2430 mm/page_alloc.c:5240
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2486
 alloc_frozen_pages_noprof mm/mempolicy.c:2557 [inline]
 alloc_pages_noprof+0x131/0x390 mm/mempolicy.c:2577
 vm_area_alloc_pages mm/vmalloc.c:3649 [inline]
 __vmalloc_area_node mm/vmalloc.c:3863 [inline]
 __vmalloc_node_range_noprof+0xe6c/0x16b0 mm/vmalloc.c:4051
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4111
 alloc_thread_stack_node kernel/fork.c:354 [inline]
 dup_task_struct kernel/fork.c:923 [inline]
 copy_process+0x619/0x7430 kernel/fork.c:2052
 kernel_clone+0xfc/0x910 kernel/fork.c:2651
 __do_sys_clone+0xce/0x120 kernel/fork.c:2792
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5928 tgid 5928 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0x7df/0x1170 mm/page_alloc.c:2973
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x130/0x170 mm/slub.c:3886
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4c/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 __kmalloc_cache_node_noprof+0x299/0x830 mm/slub.c:5784
 kmalloc_node_noprof include/linux/slab.h:983 [inline]
 __get_vm_area_node+0x101/0x330 mm/vmalloc.c:3208
 __vmalloc_node_range_noprof+0x247/0x16b0 mm/vmalloc.c:4011
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4111
 xt_counters_alloc+0x4c/0x70 net/netfilter/x_tables.c:1381
 __do_replace+0x97/0x9e0 net/ipv4/netfilter/ip_tables.c:1046
 do_replace net/ipv4/netfilter/ip_tables.c:1141 [inline]
 do_ipt_set_ctl+0x93b/0xc40 net/ipv4/netfilter/ip_tables.c:1635
 nf_setsockopt+0x8d/0xf0 net/netfilter/nf_sockopt.c:101
 ip_setsockopt+0xcb/0xf0 net/ipv4/ip_sockglue.c:1424
 tcp_setsockopt+0xa7/0x100 net/ipv4/tcp.c:4164
 do_sock_setsockopt+0xf3/0x1d0 net/socket.c:2322

Memory state around the buggy address:
 ffffc90003427c80: f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90003427d00: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 f1 f1
>ffffc90003427d80: 00 00 00 00 02 f3 f3 f3 f3 f3 00 00 00 00 00 00
                               ^
 ffffc90003427e00: 00 00 00 00 00 00 f1 f1 f1 f1 f1 f1 04 f2 00 00
 ffffc90003427e80: f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


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

