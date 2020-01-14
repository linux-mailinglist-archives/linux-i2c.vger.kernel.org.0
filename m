Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C105D13A107
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 07:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbgANGeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jan 2020 01:34:11 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:42122 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgANGeL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jan 2020 01:34:11 -0500
Received: by mail-io1-f72.google.com with SMTP id e7so7374641iog.9
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2020 22:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=aUpNlfAfsF8Uq95DOJXq3NqDwhlK0hlzVyA6UdfyE2g=;
        b=H336b7O1677+bC2hTFuRhem0BGXnWNLhghEaQom1/9iSwIgbgz2P9FjXb5L9WucH7A
         rIu0UchizjpUSFYDS2Ae0vCiZC/HtlkJGfC7yiw5h4zlZLjjzRnqZ09jMQb/WLFw9X+B
         5rmQmIR7IPxiW7LPiyBRV0PIrIc/N0B99KWO/8CnHPID2m499YF3Dmn+myj27uNlXd8v
         PlQMl7SUSeRL6LmWYZisLLQuYk6sStT+2+NeFl6v0tlN3g4kBNucGyUdLfrWImGgVwhG
         IefxaEPMZzRxZFAepcQePtjfzsXTrdAwDn6Ec8pH5W4P12YQ7Sz6FxWbrGKYSbU4H+iH
         WbSg==
X-Gm-Message-State: APjAAAVX9xcOARbislWFOe6mUN9uxR3AFK+5hz3GICr+Yq4zVPMhrnIO
        OvXsDpeabBgOBhLn/fwIMFArTnSlz0pTa48INYp0jAhK7Iw/
X-Google-Smtp-Source: APXvYqxqLG867GWQ2bc8GhQpnCHohKbJS9wa0VKjDStD0xUcyGa/AS2dAtJXr5gFskSYJhvgukGgOgzdznBcKKD8xcI86hCZLlH4
MIME-Version: 1.0
X-Received: by 2002:a02:7086:: with SMTP id f128mr17035393jac.12.1578983650326;
 Mon, 13 Jan 2020 22:34:10 -0800 (PST)
Date:   Mon, 13 Jan 2020 22:34:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009586b2059c13c7e1@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in i801_isr
From:   syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>
To:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    040a3c33 Merge tag 'iommu-fixes-v5.5-rc5' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16e675e1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e89bd00623fe71e
dashboard link: https://syzkaller.appspot.com/bug?extid=ed71512d469895b5b34e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com

BUG: KASAN: vmalloc-out-of-bounds in i801_isr_byte_done  
drivers/i2c/busses/i2c-i801.c:592 [inline]
BUG: KASAN: vmalloc-out-of-bounds in i801_isr  
drivers/i2c/busses/i2c-i801.c:663 [inline]
BUG: KASAN: vmalloc-out-of-bounds in i801_isr+0xbfd/0xcf0  
drivers/i2c/busses/i2c-i801.c:644
Write of size 1 at addr ffffc90002c07bc9 by task syz-executor.3/9465

CPU: 3 PID: 9465 Comm: syz-executor.3 Not tainted 5.5.0-rc5-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS  
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0x5/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  __asan_report_store1_noabort+0x17/0x20 mm/kasan/generic_report.c:137
  i801_isr_byte_done drivers/i2c/busses/i2c-i801.c:592 [inline]
  i801_isr drivers/i2c/busses/i2c-i801.c:663 [inline]
  i801_isr+0xbfd/0xcf0 drivers/i2c/busses/i2c-i801.c:644
  __handle_irq_event_percpu+0x15d/0x970 kernel/irq/handle.c:149
  handle_irq_event_percpu+0x74/0x160 kernel/irq/handle.c:189
  handle_irq_event+0xa7/0x134 kernel/irq/handle.c:206
  handle_fasteoi_irq+0x281/0x670 kernel/irq/chip.c:725
  generic_handle_irq_desc include/linux/irqdesc.h:156 [inline]
  do_IRQ+0xde/0x280 arch/x86/kernel/irq.c:250
  common_interrupt+0xf/0xf arch/x86/entry/entry_64.S:607
  </IRQ>
RIP: 0010:__sanitizer_cov_trace_const_cmp4+0xd/0x20 kernel/kcov.c:274
Code: d6 0f b7 f7 bf 03 00 00 00 48 89 e5 48 8b 4d 08 e8 d8 fe ff ff 5d c3  
66 0f 1f 44 00 00 55 89 f2 89 fe bf 05 00 00 00 48 89 e5 <48> 8b 4d 08 e8  
ba fe ff ff 5d c3 0f 1f 84 00 00 00 00 00 55 48 89
RSP: 0018:ffffc90001d4f860 EFLAGS: 00000246 ORIG_RAX: ffffffffffffffdc
RAX: ffff88805df60100 RBX: 000000000000000c RCX: 000000000000000c
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
RBP: ffffc90001d4f860 R08: ffff88805df60100 R09: fffff520003a9f23
R10: fffff520003a9f22 R11: 0000000000000000 R12: ffff88802057db00
R13: 0000000000000030 R14: 00000000000002e6 R15: 0000000000000000
  tomoyo_domain_quota_is_ok+0x312/0x540 security/tomoyo/util.c:1071
  tomoyo_supervisor+0x2e8/0xef0 security/tomoyo/common.c:2089
  tomoyo_audit_path_log security/tomoyo/file.c:168 [inline]
  tomoyo_path_permission security/tomoyo/file.c:587 [inline]
  tomoyo_path_permission+0x263/0x360 security/tomoyo/file.c:573
  tomoyo_path_perm+0x318/0x430 security/tomoyo/file.c:838
  tomoyo_path_unlink+0x9b/0xe0 security/tomoyo/tomoyo.c:156
  security_path_unlink+0xfa/0x160 security/security.c:1044
  do_unlinkat+0x3b7/0x6d0 fs/namei.c:4064
  __do_sys_unlink fs/namei.c:4114 [inline]
  __se_sys_unlink fs/namei.c:4112 [inline]
  __x64_sys_unlink+0x42/0x50 fs/namei.c:4112
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45ad27
Code: 00 66 90 b8 58 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 5d b4 fb ff c3  
66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 57 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 3d b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffebdeee5d8 EFLAGS: 00000206 ORIG_RAX: 0000000000000057
RAX: ffffffffffffffda RBX: 00007ffebdeee6a0 RCX: 000000000045ad27
RDX: 00007ffebdeee610 RSI: 00007ffebdeee610 RDI: 00007ffebdeee6a0
RBP: 0000000000000000 R08: 000000000137b983 R09: 0000000000000011
R10: ffffffffffffffff R11: 0000000000000206 R12: 00007ffebdeef730
R13: 000000000137b940 R14: 0000000000390ffe R15: 00000000ffffffff


Memory state around the buggy address:
  ffffc90002c07a80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
  ffffc90002c07b00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
> ffffc90002c07b80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                                               ^
  ffffc90002c07c00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
  ffffc90002c07c80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
