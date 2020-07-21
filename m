Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D763227F61
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 13:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgGULzm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 07:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728782AbgGULzl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 07:55:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A20C061794
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 04:55:41 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so23712986ljn.8
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZVoINjtMGDezcJLO2Zg+Y+JYaakD+WyYlrSO3cxN39E=;
        b=aa8+RFopvlFWXMkD7+eV+fIBRXzv4Pt8JGEJ+BqDGFG/TZB44jBsVKadLiKtcdiHUs
         GjvioRKJDFK2KcgpW97MqhnlHEw5wGT2ZJr81d17irYkbtYW6hrYoaqc86vqEuV8bVHv
         +0ll3jJCUvA5JGwtCDwRBYLNSwUeT11to9awVAssIUVG6T6jpsbIlKslyYevC6NaUOYq
         zsUHn1oAvV+v21iA1LWrNBvpWQGugEoTI7qus5Yoy/tVf0gz2sNsgZ/jWS6Ua0/gAY4J
         Z/gmVwA503RiPiefguw1iNJ4MYbmi5uhfDcMHDwLFBpt9HYD2G52+Ab+VxWjQSSUly0e
         8oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZVoINjtMGDezcJLO2Zg+Y+JYaakD+WyYlrSO3cxN39E=;
        b=hsrvHRE9hYXSFHlWIgMWGjNu+HZA+rgFRatmhl0ahvND1KnbRZZ1v+ieuQDxJLwdq5
         52B1Rum6+7TR1wYVkxs0xUXNo1olL/YxRaenWFUNlMmW+AuMau6jNT8Fu7RimzrCAYZw
         GmCgTCXdr7yXbWDNQUtP/iEMCaaE+hCkA9DpqFYy6OW/FpiD45LU2pS+HKgQ/sZOmMLZ
         JDFUkdSUT/lMDupCHYHx1xOhHNhxtvS4imwfQYgn9i5VyO4RX88iSo1xzljrsCgYzm1B
         tYudhBzg4ENiC37aGj5+g7oLV/ww84JROfGE5hdmBzGOhAbmXCNS6KMOoKYnjQ/mwF24
         8ENw==
X-Gm-Message-State: AOAM531pmHi14hQIOGsUoSavUuImUTZspARD5SwdS5xp6aLHtI021ksx
        kvUp57YA0pXq4CMeWvjY9XZ0nBfncbQzjuDYHVKbJw==
X-Google-Smtp-Source: ABdhPJweVCEg+lAlZfetbFPmgrzJZsHlsZaisRv/zVTnOsUHbVD1AwEcazd0D5dxzyF05L2c+g2C7U8SOV5JY9LHcn4=
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr13050134ljc.443.1595332539804;
 Tue, 21 Jul 2020 04:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200721111007.hwwdveqxeqcry4wn@pesu.pes.edu> <0000000000001e30e105aaf1ce89@google.com>
In-Reply-To: <0000000000001e30e105aaf1ce89@google.com>
From:   B K Karthik <bkkarthik@pesu.pes.edu>
Date:   Tue, 21 Jul 2020 17:25:28 +0530
Message-ID: <CAAhDqq3uSnRMXE3Pn1PjLo+XKXruB7jqkJx70gCPd_=-HJD4Rw@mail.gmail.com>
Subject: Re: WARNING in pvr2_i2c_core_done
To:     syzbot <syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mike Isely <isely@pobox.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 21, 2020 at 4:50 PM syzbot
<syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> general protection fault in kernfs_find_ns
>
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> pvrusb2: Invalid write control endpoint
> general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]

I'm guessing this has to do with kmem_cache_free() called by
i2c_acpi_remove_space_handler()
through acpi_ut_delete_generic_state() in drivers/acpi/osl.c:1708 ?

> CPU: 0 PID: 78 Comm: pvrusb2-context Not tainted 5.7.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:kernfs_find_ns+0x31/0x370 fs/kernfs/dir.c:829
> Code: 49 89 d6 41 55 41 54 55 48 89 fd 53 48 83 ec 08 e8 f4 61 af ff 48 8d 7d 70 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 03 00 00 48 8d bd 98 00 00 00 48 8b 5d 70 48
> RSP: 0018:ffff8881d4187938 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: ffffffff863789c0 RCX: ffffffff85a79ba7
> RDX: 000000000000000e RSI: ffffffff81901d1c RDI: 0000000000000070
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff873ed1e7
> R10: fffffbfff0e7da3c R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff863790e0
> FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000557f2b45ae48 CR3: 00000001d2762000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  kernfs_find_and_get_ns+0x2f/0x60 fs/kernfs/dir.c:906
>  kernfs_find_and_get include/linux/kernfs.h:548 [inline]
>  sysfs_unmerge_group+0x5d/0x160 fs/sysfs/group.c:366
>  dpm_sysfs_remove+0x62/0xb0 drivers/base/power/sysfs.c:790
>  device_del+0x18b/0xd20 drivers/base/core.c:2834
>  device_unregister+0x22/0xc0 drivers/base/core.c:2889
>  i2c_unregister_device include/linux/err.h:41 [inline]
>  i2c_client_dev_release+0x39/0x50 drivers/i2c/i2c-core-base.c:465
>  device_release+0x71/0x200 drivers/base/core.c:1559
>  kobject_cleanup lib/kobject.c:693 [inline]
>  kobject_release lib/kobject.c:722 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x245/0x540 lib/kobject.c:739
>  put_device drivers/base/core.c:2779 [inline]
>  device_unregister+0x34/0xc0 drivers/base/core.c:2890
>  i2c_unregister_device+0x38/0x40 include/linux/err.h:41
>  v4l2_i2c_new_subdev_board+0x159/0x2c0 drivers/media/v4l2-core/v4l2-i2c.c:114
>  v4l2_i2c_new_subdev+0xb8/0xf0 drivers/media/v4l2-core/v4l2-i2c.c:135
>  pvr2_hdw_load_subdev drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2023 [inline]
>  pvr2_hdw_load_modules drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2075 [inline]
>  pvr2_hdw_setup_low drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2156 [inline]
>  pvr2_hdw_setup drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2262 [inline]
>  pvr2_hdw_initialize+0xc8d/0x3600 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2339
>  pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:109 [inline]
>  pvr2_context_thread_func+0x250/0x850 drivers/media/usb/pvrusb2/pvrusb2-context.c:158
>  kthread+0x392/0x470 kernel/kthread.c:291
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
> Modules linked in:
> ---[ end trace 9af941b6bcb04b01 ]---
> RIP: 0010:kernfs_find_ns+0x31/0x370 fs/kernfs/dir.c:829
> Code: 49 89 d6 41 55 41 54 55 48 89 fd 53 48 83 ec 08 e8 f4 61 af ff 48 8d 7d 70 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 1e 03 00 00 48 8d bd 98 00 00 00 48 8b 5d 70 48
> RSP: 0018:ffff8881d4187938 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: ffffffff863789c0 RCX: ffffffff85a79ba7
> RDX: 000000000000000e RSI: ffffffff81901d1c RDI: 0000000000000070
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff873ed1e7
> R10: fffffbfff0e7da3c R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff863790e0
> FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000557f2b45ae48 CR3: 00000001d2762000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
>
> Tested on:
>
> commit:         b791d1bd Merge tag 'locking-kcsan-2020-06-11' of git://git..
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=16dfe440900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf1899337a6e343
> dashboard link: https://syzkaller.appspot.com/bug?extid=e74a998ca8f1df9cc332
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=117e281b100000
>
