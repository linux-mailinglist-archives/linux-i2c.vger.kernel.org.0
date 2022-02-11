Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D8C4B1A86
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 01:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346406AbiBKAhV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 19:37:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245125AbiBKAhV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 19:37:21 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB3D5F82
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 16:37:20 -0800 (PST)
Received: by mail-io1-f70.google.com with SMTP id q5-20020a0566022f0500b00638278a161fso5223294iow.11
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 16:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=qKOR0YTQopKhjgaydg7pJg6t8RNb5M2L3oCxp86sxFs=;
        b=ivWcucAd05/zdoALc0zG5iM5xo4QLuyo8/D1IY6QtoSMt7vRM9nOXQAQ+oRnwye17U
         tdRIrZkLDwdHlIyDFuajHEX09NNDKKitxuB9vjJ6Dloh0QOUudnyIDfsSOuD+/Q2RTXS
         6qoIWi8/dzotiR9anIb8jjSBjX1JiXjD0T5Bta4NrbFfRqQdyEMzo87tY98EQp9aTed/
         Px/QW1TKSJ2cxFWl7ECABDK00VdKNZNoOp/75yssmlZRCJIX3ANPSEuOHzYqA9ZuMYD4
         +tn0rxhmGwKfQOTkBuSUd3jEBCPe6Iv0Z0nJ5hF4GGPiVnFckdstnXySOGrKJmZTvdYv
         stog==
X-Gm-Message-State: AOAM530Tcn2/62UKS8nm58Q34DUiV98D/klVsnC1Dpq7i5MZDxJoXoMF
        YU3HhQiUkuEEJQISUA+ebQ+EjAISbWgQpgdO06Z0PpOPYFFQ
X-Google-Smtp-Source: ABdhPJxwlS+TIQvVCR4ovg6MqayjzHSbXF78sTlhdePS73FpubtTibEgU62JeXbKJyyBP4WsavUFURRggUkVBGZvA1ibmkjYrRzT
MIME-Version: 1.0
X-Received: by 2002:a92:bf01:: with SMTP id z1mr5044624ilh.18.1644539839598;
 Thu, 10 Feb 2022 16:37:19 -0800 (PST)
Date:   Thu, 10 Feb 2022 16:37:19 -0800
In-Reply-To: <0000000000006e988105d72fbe3f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f5549005d7b3440a@google.com>
Subject: Re: [syzbot] general protection fault in i2c_setup_smbus_alert
From:   syzbot <syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com>
To:     andriy.shevchenko@linux.intel.com, djrscally@gmail.com,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        johan@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, sakari.ailus@linux.intel.com,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    ef6b35306dd8 Add linux-next specific files for 20220204
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15e40d84700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0431e0b00810b4f
dashboard link: https://syzkaller.appspot.com/bug?extid=0591ccf54ee05344e4eb
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1105f472700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16492aa4700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
general protection fault, probably for non-canonical address 0xdffffc000000008a: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000450-0x0000000000000457]
CPU: 1 PID: 35 Comm: kworker/1:1 Not tainted 5.17.0-rc2-next-20220204-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:dev_fwnode drivers/base/property.c:22 [inline]
RIP: 0010:device_property_match_string+0x2c/0xa0 drivers/base/property.c:224
Code: 49 89 d5 41 54 49 89 f4 55 53 48 89 fb e8 bc 01 fa fc 48 8d bb 50 04 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 5a 48 8b ab 50 04 00 00 48 85 ed 74 22 e8 8d 01 fa
RSP: 0018:ffffc900010befd8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 000000000000008a RSI: ffffffff847ea734 RDI: 0000000000000450
RBP: ffff8880127ec038 R08: 0000000000000000 R09: ffff8880127ec1a3
R10: ffffffff85ea3a99 R11: 0000000000000000 R12: ffffffff8a658720
R13: ffffffff8a6586e0 R14: ffff8880127ec660 R15: ffff8880127ec664
FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd0b1f0910 CR3: 000000007f0f9000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 i2c_setup_smbus_alert+0x9c/0x1a0 drivers/i2c/i2c-core-smbus.c:710
 i2c_register_adapter+0x32f/0x1150 drivers/i2c/i2c-core-base.c:1482
 i2c_add_adapter+0x11a/0x1c0 drivers/i2c/i2c-core-base.c:1587
 osif_probe+0x2ae/0x500 drivers/i2c/busses/i2c-robotfuzz-osif.c:164
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:752
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:782
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:899
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:970
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3405
 usb_set_configuration+0x101e/0x1900 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:752
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:782
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:899
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:970
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc17/0x1ee0 drivers/base/core.c:3405
 usb_new_device.cold+0x63f/0x108e drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5362 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5506 [inline]
 port_event drivers/usb/core/hub.c:5664 [inline]
 hub_event+0x25c6/0x4680 drivers/usb/core/hub.c:5746
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>
Modules linked in:
----------------
Code disassembly (best guess):
   0:	49 89 d5             	mov    %rdx,%r13
   3:	41 54                	push   %r12
   5:	49 89 f4             	mov    %rsi,%r12
   8:	55                   	push   %rbp
   9:	53                   	push   %rbx
   a:	48 89 fb             	mov    %rdi,%rbx
   d:	e8 bc 01 fa fc       	callq  0xfcfa01ce
  12:	48 8d bb 50 04 00 00 	lea    0x450(%rbx),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	75 5a                	jne    0x8a
  30:	48 8b ab 50 04 00 00 	mov    0x450(%rbx),%rbp
  37:	48 85 ed             	test   %rbp,%rbp
  3a:	74 22                	je     0x5e
  3c:	e8                   	.byte 0xe8
  3d:	8d 01                	lea    (%rcx),%eax
  3f:	fa                   	cli

