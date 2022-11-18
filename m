Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D1362F2B5
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 11:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbiKRKh7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 05:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiKRKh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 05:37:58 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3ED193CC7;
        Fri, 18 Nov 2022 02:37:56 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id i10so11991378ejg.6;
        Fri, 18 Nov 2022 02:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H/8HhcxVRT2QDi4GrGRzCn45E2AgIZ1W3KKLrrG0O/g=;
        b=CEAFddyS6HLfs36AdGEOYidRyXU3OPvY0H46pSXnxzJRQsVG4K2zjQIr8GEKlX1PP5
         9pNgltn15yZ+W1djxd12xAFyU0SFCbYsCHdG95UQp7Rg4G7kyw+C8po4KaMMk+cUzFVf
         dQtm3/Pcdd9HIWGKlFc+n2ikcHBn9YPcpjpW6T6WFa8QnlG/e1wkP3O/qyWCXRS+XNSr
         k2GIpLKqjesfsoEhd7ns4tpHviqYEQdAfmpv5jxg0XNuihCXr5Og9tQ3iHpbuBB/BgnS
         44lmbH4wHiZpFdE4dUatTsP00YERtWX8bQEDzSZceDj0mKz/uiwslBaIgXuUGsr3YPaN
         Mqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/8HhcxVRT2QDi4GrGRzCn45E2AgIZ1W3KKLrrG0O/g=;
        b=697QN0YjTHbrH/PuJR6CAB2B9H+eHnXbxuFXb2JG4kuuYkxbAk2tcPPnKzf64cWQ7e
         hcNX3+fRjRDPJux7vP2V5D2+5N0NT0kUk5ZDJzY8849yySzt8QIiViMIA4hAeLgkCMDB
         8/uAvSmMNHEOkySFFvnztaHuas9Hto3fdgZEXtQ9ZF6o2wiFVLuy9B6FiCE2hP7iRSw5
         1CYVQyp83Ysb8VZz1Ws64asslcVAQvYb/xMu7mIA1sXkIuHvbVD3p1guFTKRc6nXEBus
         ww2eWDbLtNt/mDzIOAEa1q83Mjo3si+uh65m3OiGW4ALFGXiXxV+h24NQT4Dm6XHBtF1
         3omQ==
X-Gm-Message-State: ANoB5pkIpPs2rgyj0DWJC1iCmoH9O7zt+eEEfkE2XHO0qNXtvzVMBhA1
        /gJ8lqEsma+/KuOnO5pz3RwoW8kwtblSzBnEnBg=
X-Google-Smtp-Source: AA0mqf7fMv0Rin5bM7t7Ty1voQeLQyQ0zi2u0LRON4Ae8lTP36pxRAwKd0XkGKJEZuzOajkvxYAs655nW4AFOOGDZjY=
X-Received: by 2002:a17:907:3ac5:b0:78d:5d4a:c12f with SMTP id
 fi5-20020a1709073ac500b0078d5d4ac12fmr5620148ejc.421.1668767875230; Fri, 18
 Nov 2022 02:37:55 -0800 (PST)
MIME-Version: 1.0
From:   Wei Chen <harperchen1110@gmail.com>
Date:   Fri, 18 Nov 2022 18:37:21 +0800
Message-ID: <CAO4mrfcPHB5aQJO=mpqV+p8mPLNg-Fok0gw8gZ=zemAfMGTzMg@mail.gmail.com>
Subject: general protection fault in az6027_i2c_xfer
To:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Linux Developer,

Recently when using our tool to fuzz kernel, the following crash was
triggered. The bug persists in the latest upstream v6.1-rc5.

HEAD commit: 4fe89d07 Linux v6.0
git tree: upstream
compiler: clang 12.0.0
console output:
https://drive.google.com/file/d/1-hqsu5AQ5qqXwh8lZM0BTDfGPfR5ZZKQ/view?usp=share_link
Syzlang reproducer:
https://drive.google.com/file/d/1IsxrV9gGdgkM9sgLTy7k8ntYLDpwm7vZ/view?usp=share_link
C reproducer: https://drive.google.com/file/d/1mS8bp9_OWNs_RS04UwzzZPU1IWwyKSSk/view?usp=share_link
kernel config: https://drive.google.com/file/d/1ZHRxVTXHL9mENdAPmQYS1DtgbflZ9XsD/view?usp=sharing

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: Wei Chen <harperchen1110@gmail.com>

general protection fault, probably for non-canonical address
0xdffffc0000000002: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 PID: 14835 Comm: syz-executor.1 Not tainted 6.0.0+ #39
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:az6027_i2c_xfer+0x1b6/0x1bb0 drivers/media/usb/dvb-usb/az6027.c:978
Code: 00 00 00 00 00 fc ff df 80 3c 08 00 74 12 48 89 df e8 7e 09 1b
fb 48 b9 00 00 00 00 00 fc ff df 48 8b 1b 48 89 d8 48 c1 e8 03 <8a> 04
08 84 c0 0f 85 f0 16 00 00 44 0f b6 2b 48 8b 7c 24 20 31 f6
RSP: 0018:ffffc9000c907b20 EFLAGS: 00010202
RAX: 0000000000000002 RBX: 0000000000000010 RCX: dffffc0000000000
RDX: ffff88804f8ac880 RSI: 0000000000000099 RDI: 0000000000000099
RBP: ffff88801e381060 R08: ffffffff86bcdd1c R09: fffffbfff1c8dac6
R10: fffffbfff1c8dac6 R11: 0000000000000000 R12: ffff888021ce4400
R13: ffff88801e381060 R14: 0000000000000000 R15: 1ffff11003c7020c
FS:  00007fd831ffe700(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd834ba5818 CR3: 000000007a775000 CR4: 0000000000750ee0
DR0: 0000000000000000 DR1: 000000000000000c DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 __i2c_transfer+0x77e/0x1930 drivers/i2c/i2c-core-base.c:2109
 i2c_transfer+0x1d5/0x3d0 drivers/i2c/i2c-core-base.c:2170
 i2cdev_ioctl_rdwr+0x393/0x660 drivers/i2c/i2c-dev.c:297
 i2cdev_ioctl+0x75d/0x9f0 drivers/i2c/i2c-dev.c:458
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0x90 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fd834a8bded
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd831ffdc58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fd834babf80 RCX: 00007fd834a8bded
RDX: 0000000020000300 RSI: 0000000000000707 RDI: 0000000000000003
RBP: 00007fd834af8ce0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fd834babf80
R13: 00007fff5701981f R14: 00007fff570199c0 R15: 00007fd831ffddc0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:az6027_i2c_xfer+0x1b6/0x1bb0 drivers/media/usb/dvb-usb/az6027.c:978
Code: 00 00 00 00 00 fc ff df 80 3c 08 00 74 12 48 89 df e8 7e 09 1b
fb 48 b9 00 00 00 00 00 fc ff df 48 8b 1b 48 89 d8 48 c1 e8 03 <8a> 04
08 84 c0 0f 85 f0 16 00 00 44 0f b6 2b 48 8b 7c 24 20 31 f6
RSP: 0018:ffffc9000c907b20 EFLAGS: 00010202
RAX: 0000000000000002 RBX: 0000000000000010 RCX: dffffc0000000000
RDX: ffff88804f8ac880 RSI: 0000000000000099 RDI: 0000000000000099
RBP: ffff88801e381060 R08: ffffffff86bcdd1c R09: fffffbfff1c8dac6
R10: fffffbfff1c8dac6 R11: 0000000000000000 R12: ffff888021ce4400
R13: ffff88801e381060 R14: 0000000000000000 R15: 1ffff11003c7020c
FS:  00007fd831ffe700(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa306d32000 CR3: 000000007a775000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 00000000fffff0fc DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
PKRU: 55555554
----------------
Code disassembly (best guess), 7 bytes skipped:
   0: df 80 3c 08 00 74    filds  0x7400083c(%rax)
   6: 12 48 89              adc    -0x77(%rax),%cl
   9: df e8                fucomip %st(0),%st
   b: 7e 09                jle    0x16
   d: 1b fb                sbb    %ebx,%edi
   f: 48 b9 00 00 00 00 00 movabs $0xdffffc0000000000,%rcx
  16: fc ff df
  19: 48 8b 1b              mov    (%rbx),%rbx
  1c: 48 89 d8              mov    %rbx,%rax
  1f: 48 c1 e8 03          shr    $0x3,%rax
* 23: 8a 04 08              mov    (%rax,%rcx,1),%al <-- trapping instruction
  26: 84 c0                test   %al,%al
  28: 0f 85 f0 16 00 00    jne    0x171e
  2e: 44 0f b6 2b          movzbl (%rbx),%r13d
  32: 48 8b 7c 24 20        mov    0x20(%rsp),%rdi
  37: 31 f6                xor    %esi,%esi


Best,
Wei
