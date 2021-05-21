Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B1638C8A2
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 15:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhEUNtq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 09:49:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:54942 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232641AbhEUNtq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 09:49:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F1ABCAD05;
        Fri, 21 May 2021 13:48:21 +0000 (UTC)
Date:   Fri, 21 May 2021 15:48:20 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     syzbot <syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [syzbot] KASAN: out-of-bounds Read in i801_isr
Message-ID: <20210521154820.1ce1d84d@endymion>
In-Reply-To: <00000000000038de1d05c215bf23@google.com>
References: <00000000000038de1d05c215bf23@google.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 11 May 2021 15:52:21 -0700, syzbot wrote:
> syzbot found the following issue on:
> 
> HEAD commit:    e1381380 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10be778ad00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5adab0bdee099d7a
> dashboard link: https://syzkaller.appspot.com/bug?extid=b4d3fd1dfd53e90afd79
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: out-of-bounds in i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:608 [inline]
> BUG: KASAN: out-of-bounds in i801_isr drivers/i2c/busses/i2c-i801.c:668 [inline]
> BUG: KASAN: out-of-bounds in i801_isr+0xc70/0xd60 drivers/i2c/busses/i2c-i801.c:649
> Read of size 1 at addr ffffc90004237d68 by task systemd-udevd/5027
> 
> CPU: 2 PID: 5027 Comm: systemd-udevd Not tainted 5.12.0-rc4-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x141/0x1d7 lib/dump_stack.c:120
>  print_address_description.constprop.0.cold+0x5/0x2f8 mm/kasan/report.c:232
>  __kasan_report mm/kasan/report.c:399 [inline]
>  kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
>  i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:608 [inline]
>  i801_isr drivers/i2c/busses/i2c-i801.c:668 [inline]
>  i801_isr+0xc70/0xd60 drivers/i2c/busses/i2c-i801.c:649
>  __handle_irq_event_percpu+0x303/0x8f0 kernel/irq/handle.c:156
>  handle_irq_event_percpu kernel/irq/handle.c:196 [inline]
>  handle_irq_event+0x102/0x290 kernel/irq/handle.c:213
>  handle_fasteoi_irq+0x22f/0x9f0 kernel/irq/chip.c:714
>  generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
>  handle_irq arch/x86/kernel/irq.c:231 [inline]
>  __common_interrupt+0x9e/0x200 arch/x86/kernel/irq.c:250
>  common_interrupt+0x4c/0xd0 arch/x86/kernel/irq.c:240
>  asm_common_interrupt+0x1e/0x40 arch/x86/include/asm/idtentry.h:623
> RIP: 0010:__do_softirq+0x196/0x9f6 kernel/softirq.c:331
> Code: 00 48 01 f0 48 89 44 24 18 48 c7 c7 80 39 6a 89 e8 7f 8d c6 ff 65 66 c7 05 35 46 c3 76 00 00 e8 00 df 39 f8 fb b8 ff ff ff ff <48> c7 c3 c0 a0 c0 8b 41 0f bc c5 41 89 c7 41 83 c7 01 75 47 e9 d2
> RSP: 0018:ffffc90000550f78 EFLAGS: 00000216
> RAX: 00000000ffffffff RBX: ffff888018491c40 RCX: 1ffffffff1b8be19
> RDX: 0000000000000000 RSI: 0000000000000100 RDI: 0000000000000000
> RBP: ffff888011159c40 R08: 0000000000000001 R09: 0000000000000001
> R10: ffffffff8179e0c8 R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000200 R14: 0000000000000000 R15: 0000000000000000
>  invoke_softirq kernel/softirq.c:221 [inline]
>  __irq_exit_rcu kernel/softirq.c:422 [inline]
>  irq_exit_rcu+0x134/0x200 kernel/softirq.c:434
>  sysvec_apic_timer_interrupt+0x93/0xc0 arch/x86/kernel/apic/apic.c:1100
>  </IRQ>
>  asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:632
> RIP: 0010:check_kcov_mode kernel/kcov.c:163 [inline]
> RIP: 0010:__sanitizer_cov_trace_pc+0x7/0x60 kernel/kcov.c:197
> Code: ff ff b9 ff ff ff ff ba 08 00 00 00 4d 8b 03 48 0f bd ca 49 8b 45 00 48 63 c9 e9 64 ff ff ff 0f 1f 40 00 65 8b 05 49 fe 8d 7e <89> c1 48 8b 34 24 81 e1 00 01 00 00 65 48 8b 14 25 00 f0 01 00 a9
> RSP: 0018:ffffc90009ff7868 EFLAGS: 00000283
> RAX: 0000000080000000 RBX: 0000000000000004 RCX: ffff888018491c40
> RDX: 0000000000000000 RSI: ffff888018491c40 RDI: 0000000000000003
> RBP: ffff8880143aa100 R08: 0000000000000000 R09: 0000000000000004
> R10: ffffffff8392c68a R11: 0000000000000010 R12: 0000000000000002
> R13: 00000000000003e4 R14: dffffc0000000000 R15: 0000000000000000
>  tomoyo_domain_quota_is_ok+0x2f1/0x550 security/tomoyo/util.c:1093
>  tomoyo_supervisor+0x2f2/0xf00 security/tomoyo/common.c:2089
>  tomoyo_audit_path_log security/tomoyo/file.c:168 [inline]
>  tomoyo_path_permission security/tomoyo/file.c:587 [inline]
>  tomoyo_path_permission+0x270/0x3a0 security/tomoyo/file.c:573
>  tomoyo_path_perm+0x2f0/0x400 security/tomoyo/file.c:838
>  security_inode_getattr+0xcf/0x140 security/security.c:1288
>  vfs_getattr fs/stat.c:131 [inline]
>  vfs_statx+0x164/0x390 fs/stat.c:199
>  vfs_fstatat fs/stat.c:217 [inline]
>  vfs_lstat include/linux/fs.h:3240 [inline]
>  __do_sys_newlstat+0x91/0x110 fs/stat.c:372
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7fc3c1a88335
> Code: 69 db 2b 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 0f 1f 40 00 83 ff 01 48 89 f0 77 30 48 89 c7 48 89 d6 b8 06 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 03 f3 c3 90 48 8b 15 31 db 2b 00 f7 d8 64 89
> RSP: 002b:00007ffd4b6fa5c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000006
> RAX: ffffffffffffffda RBX: 0000558fa852a210 RCX: 00007fc3c1a88335
> RDX: 00007ffd4b6fa600 RSI: 00007ffd4b6fa600 RDI: 0000558fa8529210
> RBP: 00007ffd4b6fa6c0 R08: 00007fc3c1d472c8 R09: 0000000000001010
> R10: 0000000000000020 R11: 0000000000000246 R12: 0000558fa8529210
> R13: 0000558fa852923a R14: 0000558fa8501ed1 R15: 0000558fa8501eda
> 
> 
> Memory state around the buggy address:
>  ffffc90004237c00: f2 f2 f2 00 00 f3 f3 00 00 00 00 00 00 00 00 00
>  ffffc90004237c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >ffffc90004237d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  
>                                                           ^
>  ffffc90004237d80: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>  ffffc90004237e00: 00 f2 f2 f2 00 00 00 00 00 00 00 00 00 00 00 f3
> ==================================================================

We get similar reports from Kasan since at least January 2020.
Sometimes about reads, sometimes about writes. Originally in vmalloc'd
area, then on the stack, then in vmalloc's aread again, and now just
"out-of-bound" without the memory type. What all these reports have in
common is that the problem happens in i801_isr_byte_done(). The exact
line differs though. Today's error is on this line:

	} else if (priv->count < priv->len - 1) {
		/* Write next byte, except for IRQ after last byte */
		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));		<<--- HERE
	}

while the previous report was on that line:

		/* Read next byte */
		if (priv->count < priv->len)
			priv->data[priv->count++] = inb(SMBBLKDAT(priv));	<<--- HERE
		else
			dev_dbg(&priv->pci_dev->dev,
				"Discarding extra byte on block read\n");

All reports before that were on either location.

All reports also have in common that a previous transaction before the
bug triggers has failed with a timeout:

[  376.721552][T12286] i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
[  376.743857][T12286] i801_smbus 0000:00:1f.3: Transaction timeout
[  376.766812][T12286] i801_smbus 0000:00:1f.3: Failed terminating the transaction

I think the restoration of the SMBus controller to a working state
after a transaction failed like that never actually worked, typically
the controller would stop responding until next reboot. Most probably
because the problem that caused the timeout (like a broken I2C device
holding either SDA or SCL permanently up or down) is still present. But
it should definitely not cause a memory overrun.

Looking at the ICH9 datasheet, I see the following description for the
KILL bit (which is what we try to use to reset the SMBus controller):

  "Kills the current host transaction taking place, sets the FAILED
   status bit, and asserts the interrupt (or SMI#)."

At the time the recovery code was written, i2c-i801 was a polling-only
driver, interrupts were not supported, so asserting the interrupt had
no effect. Now that the driver does support interrupts, this would call
i801_isr(), right?

So my theory is that our attempt to kill a timed-out byte-by-byte block
transaction triggers an interrupt, which calls in i801_isr() with the
SMBHSTSTS_BYTE_DONE bit set. This in turn causes i801_isr_byte_done()
to be called while we are absolutely not ready nor even supposed to
process the next data byte.

I guess we should clear SMBHSTSTS_BYTE_DONE before issuing a
SMBHSTCNT_KILL. Alternatively we could add a check at the beginning of
i801_isr() to bail out immediately if SMBHSTCNT_KILL is set. While
possibly more robust, this approach has the drawback of increasing the
processing time of all interrupts, even standard/legitimate ones. So
maybe just clearing SMBHSTSTS_BYTE_DONE is more reasonable. Something
like:

--- linux-5.11.orig/drivers/i2c/busses/i2c-i801.c
+++ linux-5.11/drivers/i2c/busses/i2c-i801.c
@@ -393,6 +393,8 @@ static int i801_check_post(struct i801_p
 		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
 		/* try to stop the current command */
 		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
+		/* Clear BYTE_DONE so as to not confuse i801_isr() */
+		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 		outb_p(inb_p(SMBHSTCNT(priv)) | SMBHSTCNT_KILL,
 		       SMBHSTCNT(priv));
 		usleep_range(1000, 2000);

I must say I wonder why SMBHSTCNT_KILL generates an interrupt in the
first place, I can't see who would need this.

Jarkko, Andy, Mika, what do you think? I would appreciate a second pair
of eyes looking at the issue, in case I'm on the wrong track.

Of course, another question is why we hit the timeout in the first
place. But we would need a reproducer to investigate this. Is there any
place where I could see the actual I2C commands being sent by the bot?
The log only traces the bot-level functions, and I could guess how some
of the parameters are being mapped to struct members that are then fed
to i2c-dev, but some of the parameters are still a mystery to me.

To be honest, I find the bot logs pretty hard to read, as apparently a
lot of tests are running in parallel for various subsystems, and
everything ends mixed up in the log. Wouldn't it be more valuable to
serialize the tests on one given virtual host, so that the developers
can then read the log and more easily see what's going on?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
