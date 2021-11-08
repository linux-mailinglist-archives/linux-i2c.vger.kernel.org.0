Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148244499FB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 17:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240010AbhKHQhL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 11:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238873AbhKHQhK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 11:37:10 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E43C061570
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 08:34:26 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id l7-20020a0568302b0700b0055ae988dcc8so23203089otv.12
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 08:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=swiecki.net; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vUoSKyx6vx2aMJ/P/Zv3txQpuFSwAfZbzPU+lhi/RxM=;
        b=a3hZUYhYt4gDnulgAHi1kwvYnrYKxiodnRDXc4fN57FPRmVc500JRPBnKtk9QKlfVP
         iwDfAs8CWbhNAtRG7omnfEcXxpKa/jijs0147iMmTJbBeN9yPuS/CjD9ui5iF9RSSUpI
         VEkSmLJSnpnCPcy3bR4uOZAzwPrHWvzw7pi7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vUoSKyx6vx2aMJ/P/Zv3txQpuFSwAfZbzPU+lhi/RxM=;
        b=q/Vw40f+4uWX1ZwFTBQB9YB74myI44k0LrWw4wB2aXeUKjUyr2ynYa1rLZmmwZ8L0p
         cgIhD+zPWvlJZKrA8UbWcKDCOYB8F3xZvkPvHMaV+6m4LMHAnJhthmipQJXWoPzrPl6s
         YUjvuhRSFjxVrbqcKnIrEtHyVec+uTtXf9PpRHglFsXgHC+XqI2/xsJcnunAzaeGXTy2
         kLCjjpEzP0FHz/RgAYztu2bnK1Jgt89zpMKPYt9uFFRUd+vj2WuKODK8o0jjGeKp1Swm
         dm+0cc2HKd+lbGre/HI73++Smd/g2SmzwDTRMWUjP6gN69SCu221ie3q6WuQBxj6lB2s
         SpvQ==
X-Gm-Message-State: AOAM531fPFAQ2NH6+EyOgEVky6gd+dtOPpr5jRije5XPha4GXs9PRXkB
        Di1XaV9J6x5+HcoIKiRIFybtj35xNErAmHtrzK/w6ki+WHjxKg==
X-Google-Smtp-Source: ABdhPJxQMeI9pTb+WBppyYNTdi6khccrDklR1jGW92vprBlKRu8K+Zyw5dcQZeGwq11wbOiBV46M7xywOmC6FxnvWJU=
X-Received: by 2002:a9d:6854:: with SMTP id c20mr272599oto.190.1636389265627;
 Mon, 08 Nov 2021 08:34:25 -0800 (PST)
MIME-Version: 1.0
References: <CAP145pgwt7svtDwcD=AStKTt_GSN-ZqPL2u74Y63TAY5ghAagQ@mail.gmail.com>
 <CAP145pgrL-tOHrxsKwk_yzQihyk4TMFrgBb6zhNgC1i2wUTCeQ@mail.gmail.com> <CAP145pgdrdiMAT7=-iB1DMgA7t_bMqTcJL4N0=6u8kNY3EU0dw@mail.gmail.com>
In-Reply-To: <CAP145pgdrdiMAT7=-iB1DMgA7t_bMqTcJL4N0=6u8kNY3EU0dw@mail.gmail.com>
From:   =?UTF-8?B?Um9iZXJ0IMWad2nEmWNraQ==?= <robert@swiecki.net>
Date:   Mon, 8 Nov 2021 17:34:14 +0100
Message-ID: <CAP145phj7jEy6tkdFMdW-rzPprMTUckaaSrtrVysE-u+S+=Lcg@mail.gmail.com>
Subject: Re: Crashes in 5.15-git in i2c code
To:     linux-i2c@vger.kernel.org
Cc:     Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi again,

> Hi linux-i2c.
>
> I'm daily-driving the linux from Linus' git (recompiling every day or
> two), and yesterday it stopped booting. Below is the dmesg from
> pstore. I'm currently at
> https://github.com/torvalds/linux/commit/6b75d88fa81b122cce37ebf17428a849=
ccd3d0f1
>
> My cmdline
> BOOT_IMAGE=3D/vmlinuz-5.15.0+
> root=3DUUID=3D8759fa14-93a4-4dc1-87e6-aa6f5cdbb2ff ro nosplash
> mitigations=3Doff no_file_caps apparmor=3D0 selinux=3D0 audit=3D0
> amdgpu.ppfeaturemask=3D0xffffffff hugepagesz=3D1G default_hugepagesz=3D1G
> hugepages=3D8 amd_iommu=3Don iommu=3Dpt
> vfio-pci.ids=3D10de:1f02,10de:10f9,10de:1ada,10de:1adb
> drm.edid_firmware=3DDP-1:edid/sam-g9.edid isolcpus=3D1,2,5,6,17,18,21,22
> tsc=3Dunstable
>
> I can try bisecting if you think it might, but I haven't done it so
> far with the Linux kernel, so wondering if you can see anything from
> the dmesg. I can also test some patches.

This introduced the bug: 0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4
https://github.com/torvalds/linux/commit/0c5c62ddf88c34bc83b66e4ac9beb2bb0e=
1887d4

CCing Bjorn from https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pc=
i.git

> The controller is on the RTX6800RX.
>
> But, when I compile out the designware driver, problems appear
> elsewhere in the i2c code, so it seems to be something more
> fundamental to the i2c subsystem.
>
> 0c:00.3 Serial bus controller [0c80]: Advanced Micro Devices, Inc.
> [AMD/ATI] Navi 21 USB
>         Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Device 0408
>         Flags: bus master, fast devsel, latency 0, IRQ 66, IOMMU group 30
>         Memory at fbb20000 (64-bit, non-prefetchable) [size=3D16K]
>         Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
>         Capabilities: [50] Power Management version 3
>         Capabilities: [64] Express Endpoint, MSI 00
>         Capabilities: [a0] MSI: Enable+ Count=3D1/2 Maskable- 64bit+
>         Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D=
1
> Len=3D010 <?>
>         Capabilities: [150] Advanced Error Reporting
>         Capabilities: [2a0] Access Control Services
>         Kernel driver in use: i2c-designware-pci
>         Kernel modules: i2c_designware_pci
>
> grep 447 dmesg.txt
> <1>[    1.431369][  T447] BUG: kernel NULL pointer dereference,
> address: 0000000000000540
> <1>[    1.431371][  T447] #PF: supervisor read access in kernel mode
> <1>[    1.431375][  T447] #PF: error_code(0x0000) - not-present page
> <6>[    1.431378][  T447] PGD 0 P4D 0
> <4>[    1.431384][  T447] Oops: 0000 [#1] PREEMPT SMP NOPTI
> <4>[    1.431388][  T447] CPU: 12 PID: 447 Comm: systemd-udevd
> Tainted: G            E     5.15.0+ #91
> <4>[    1.431391][  T447] Hardware name: ASUS System Product Name/ROG
> CROSSHAIR VIII FORMULA, BIOS 3801 07/30/2021
> <4>[    1.431392][  T447] RIP: 0010:i2c_dw_pci_resume+0x8/0x40
> [i2c_designware_pci]
> <4>[    1.431399][  T447] Code: 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
> 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00 00 00 00 53 48
> 8b 5f 78 48 89 df <ff> 93 40 05 00 00 c6 83 c0 05 00 00 00 5b c3 66 66
> 2e 0f 1f 84 00
> <4>[    1.431401][  T447] RSP: 0018:ffffb3e740a13ba8 EFLAGS: 00010286
> <4>[    1.431403][  T447] RAX: 0000000000000000 RBX: 0000000000000000
> RCX: 0000000000000000
> <4>[    1.431404][  T447] RDX: ffffffffc07311c0 RSI: 0000000000000000
> RDI: 0000000000000000
> <4>[    1.431406][  T447] RBP: ffffa13f41ea3000 R08: 0000000000000002
> R09: 0000000000008008
> <4>[    1.431406][  T447] R10: 0000000000000000 R11: 000000000000000c
> R12: ffffffffc0732660
> <4>[    1.431407][  T447] R13: 0000000000000000 R14: 0000000000000001
> R15: 0000000000000000
> <4>[    1.431409][  T447] FS:  00007fb5a80228c0(0000)
> GS:ffffa1464ed00000(0000) knlGS:0000000000000000
> <4>[    1.431411][  T447] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> <4>[    1.431412][  T447] CR2: 0000000000000540 CR3: 000000010e630000
> CR4: 0000000000750ee0
> <4>[    1.431413][  T447] PKRU: 55555554
> <4>[    1.431416][  T447] Call Trace:
> <4>[    1.431421][  T447]  <TASK>
> <4>[    1.431422][  T447]  pci_pm_runtime_resume+0xaa/0x100
> <4>[    1.431433][  T447]  ? pci_pm_thaw+0xc0/0xc0
> <4>[    1.431434][  T447]  __rpm_callback+0x3c/0x100
> <4>[    1.431440][  T447]  ? pci_pm_thaw+0xc0/0xc0
> <4>[    1.431442][  T447]  rpm_callback+0x54/0x80
> <4>[    1.431443][  T447]  ? pci_pm_thaw+0xc0/0xc0
> <4>[    1.431445][  T447]  rpm_resume+0x410/0x700
> <4>[    1.431447][  T447]  ? kernfs_activate+0x11/0x100
> <4>[    1.431452][  T447]  ? kernfs_add_one+0xdd/0x140
> <4>[    1.431455][  T447]  __pm_runtime_resume+0x45/0x80
> <4>[    1.431457][  T447]  pci_device_probe+0xa2/0x140
> <4>[    1.431459][  T447]  really_probe+0x1e4/0x400
> <4>[    1.431464][  T447]  __driver_probe_device+0xf9/0x180
> <4>[    1.431466][  T447]  driver_probe_device+0x19/0xc0
> <4>[    1.431468][  T447]  __driver_attach+0xb8/0x1c0
> <4>[    1.431470][  T447]  ? __device_attach_driver+0x100/0x100
> <4>[    1.431472][  T447]  ? __device_attach_driver+0x100/0x100
> <4>[    1.431473][  T447]  bus_for_each_dev+0x6c/0xc0
> <4>[    1.431475][  T447]  bus_add_driver+0x13f/0x200
> <4>[    1.431478][  T447]  driver_register+0x8a/0x100
> <4>[    1.431481][  T447]  ? 0xffffffffc0736000
> <4>[    1.431482][  T447]  do_one_initcall+0x44/0x1c0
> <4>[    1.431487][  T447]  ? load_module+0x9f8/0xac0
> <4>[    1.431491][  T447]  ? kmem_cache_alloc+0x14e/0x340
> <4>[    1.431496][  T447]  do_init_module+0x51/0x240
> <4>[    1.431498][  T447]  __do_sys_finit_module+0xaf/0x140
> <4>[    1.431501][  T447]  do_syscall_64+0x35/0x80
> <4>[    1.431505][  T447]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> <4>[    1.431509][  T447] RIP: 0033:0x7fb5a84d97b9
> <4>[    1.431511][  T447] Code: 48 8d 3d 5a a0 0c 00 0f 05 eb a5 66 0f
> 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c
> 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 87 56 0c 00 f7
> d8 64 89 01 48
> <4>[    1.431512][  T447] RSP: 002b:00007ffcafbc6258 EFLAGS: 00000246
> ORIG_RAX: 0000000000000139
> <4>[    1.431513][  T447] RAX: ffffffffffffffda RBX: 0000563806da65d0
> RCX: 00007fb5a84d97b9
> <4>[    1.431514][  T447] RDX: 0000000000000000 RSI: 00007fb5a8679eed
> RDI: 000000000000000c
> <4>[    1.431515][  T447] RBP: 0000000000020000 R08: 0000000000000000
> R09: 0000563806daecc0
> <4>[    1.431516][  T447] R10: 000000000000000c R11: 0000000000000246
> R12: 00007fb5a8679eed
> <4>[    1.431518][  T447] R13: 0000000000000000 R14: 0000563806d9ca00
> R15: 0000563806da65d0
> <4>[    1.431520][  T447]  </TASK>
> <4>[    1.431520][  T447] Modules linked in: i2c_designware_pci(E+)
> aesni_intel(E+) i2c_piix4(E) i2c_designware_core(E) backlight(E)
> xhci_pci(E+) ice(E+) xhci_pci_renesas(E) nvme(E) wmi(E)
> <4>[    1.431525][  T447] CR2: 0000000000000540
> <4>[    1.431528][  T447] ---[ end trace d5eecb89365b3d11 ]---
> <4>[    1.580240][  T447] RIP: 0010:i2c_dw_pci_resume+0x8/0x40
> [i2c_designware_pci]
> <4>[    1.587403][  T447] Code: 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
> 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00 00 00 00 53 48
> 8b 5f 78 48 89 df <ff> 93 40 05 00 00 c6 83 c0 05 00 00 00 5b c3 66 66
> 2e 0f 1f 84 00
> <4>[    1.588236][  T447] RSP: 0018:ffffb3e740a13ba8 EFLAGS: 00010286
> <4>[    1.589626][  T447]
> <4>[    1.589626][  T447] RAX: 0000000000000000 RBX: 0000000000000000
> RCX: 0000000000000000
> <4>[    1.590245][  T447] RDX: ffffffffc07311c0 RSI: 0000000000000000
> RDI: 0000000000000000
> <4>[    1.590245][  T447] RBP: ffffa13f41ea3000 R08: 0000000000000002
> R09: 0000000000008008
> <4>[    1.590245][  T447] R10: 0000000000000000 R11: 000000000000000c
> R12: ffffffffc0732660
> <4>[    1.590245][  T447] R13: 0000000000000000 R14: 0000000000000001
> R15: 0000000000000000
> <4>[    1.594239][  T447] FS:  00007fb5a80228c0(0000)
> GS:ffffa1464ed00000(0000) knlGS:0000000000000000
> <4>[    1.594239][  T447] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> <4>[    1.594239][  T447] CR2: 0000000000000540 CR3: 000000010e630000
> CR4: 0000000000750ee0
> <4>[    1.596236][  T447] PKRU: 55555554
> <1>[    1.431369][  T447] BUG: kernel NULL pointer dereference,
> address: 0000000000000540
> <1>[    1.431371][  T447] #PF: supervisor read access in kernel mode
> <1>[    1.431375][  T447] #PF: error_code(0x0000) - not-present page
> <6>[    1.431378][  T447] PGD 0 P4D 0
> <4>[    1.431384][  T447] Oops: 0000 [#1] PREEMPT SMP NOPTI
> <4>[    1.431388][  T447] CPU: 12 PID: 447 Comm: systemd-udevd
> Tainted: G            E     5.15.0+ #91
> <4>[    1.431391][  T447] Hardware name: ASUS System Product Name/ROG
> CROSSHAIR VIII FORMULA, BIOS 3801 07/30/2021
> <4>[    1.431392][  T447] RIP: 0010:i2c_dw_pci_resume+0x8/0x40
> [i2c_designware_pci]
> <4>[    1.431399][  T447] Code: 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
> 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 84 00 00 00 00 00 53 48
> 8b 5f 78 48 89 df <ff> 93 40 05 00 00 c6 83 c0 05 00 00 00 5b c3 66 66
> 2e 0f 1f 84 00
> <4>[    1.431401][  T447] RSP: 0018:ffffb3e740a13ba8 EFLAGS: 00010286
> <4>[    1.431403][  T447] RAX: 0000000000000000 RBX: 0000000000000000
> RCX: 0000000000000000
> <4>[    1.431404][  T447] RDX: ffffffffc07311c0 RSI: 0000000000000000
> RDI: 0000000000000000
> <4>[    1.431406][  T447] RBP: ffffa13f41ea3000 R08: 0000000000000002
> R09: 0000000000008008
> <4>[    1.431406][  T447] R10: 0000000000000000 R11: 000000000000000c
> R12: ffffffffc0732660
> <4>[    1.431407][  T447] R13: 0000000000000000 R14: 0000000000000001
> R15: 0000000000000000
> <4>[    1.431409][  T447] FS:  00007fb5a80228c0(0000)
> GS:ffffa1464ed00000(0000) knlGS:0000000000000000
> <4>[    1.431411][  T447] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> <4>[    1.431412][  T447] CR2: 0000000000000540 CR3: 000000010e630000
> CR4: 0000000000750ee0
> <4>[    1.431413][  T447] PKRU: 55555554
> <4>[    1.431416][  T447] Call Trace:
> <4>[    1.431421][  T447]  <TASK>
> <4>[    1.431422][  T447]  pci_pm_runtime_resume+0xaa/0x100
> <4>[    1.431433][  T447]  ? pci_pm_thaw+0xc0/0xc0
> <4>[    1.431434][  T447]  __rpm_callback+0x3c/0x100
> <4>[    1.431440][  T447]  ? pci_pm_thaw+0xc0/0xc0
> <4>[    1.431442][  T447]  rpm_callback+0x54/0x80
> <4>[    1.431443][  T447]  ? pci_pm_thaw+0xc0/0xc0
> <4>[    1.431445][  T447]  rpm_resume+0x410/0x700
> <4>[    1.431447][  T447]  ? kernfs_activate+0x11/0x100
> <4>[    1.431452][  T447]  ? kernfs_add_one+0xdd/0x140
> <4>[    1.431455][  T447]  __pm_runtime_resume+0x45/0x80
> <4>[    1.431457][  T447]  pci_device_probe+0xa2/0x140
> <4>[    1.431459][  T447]  really_probe+0x1e4/0x400
> <4>[    1.431464][  T447]  __driver_probe_device+0xf9/0x180
> <4>[    1.431466][  T447]  driver_probe_device+0x19/0xc0
> <4>[    1.431468][  T447]  __driver_attach+0xb8/0x1c0
> <4>[    1.431470][  T447]  ? __device_attach_driver+0x100/0x100
> <4>[    1.431472][  T447]  ? __device_attach_driver+0x100/0x100
> <4>[    1.431473][  T447]  bus_for_each_dev+0x6c/0xc0
> <4>[    1.431475][  T447]  bus_add_driver+0x13f/0x200
> <4>[    1.431478][  T447]  driver_register+0x8a/0x100
> <4>[    1.431481][  T447]  ? 0xffffffffc0736000
> <4>[    1.431482][  T447]  do_one_initcall+0x44/0x1c0
> <4>[    1.431487][  T447]  ? load_module+0x9f8/0xac0
> <4>[    1.431491][  T447]  ? kmem_cache_alloc+0x14e/0x340
> <4>[    1.431496][  T447]  do_init_module+0x51/0x240
> <4>[    1.431498][  T447]  __do_sys_finit_module+0xaf/0x140
> <4>[    1.431501][  T447]  do_syscall_64+0x35/0x80
> <4>[    1.431505][  T447]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> <4>[    1.431509][  T447] RIP: 0033:0x7fb5a84d97b9
> <4>[    1.431511][  T447] Code: 48 8d 3d 5a a0 0c 00 0f 05 eb a5 66 0f
> 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c
> 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 87 56 0c 00 f7
> d8 64 89 01 48
> <4>[    1.431512][  T447] RSP: 002b:00007ffcafbc6258 EFLAGS: 00000246
> ORIG_RAX: 0000000000000139
> <4>[    1.431513][  T447] RAX: ffffffffffffffda RBX: 0000563806da65d0
> RCX: 00007fb5a84d97b9
> <4>[    1.431514][  T447] RDX: 0000000000000000 RSI: 00007fb5a8679eed
> RDI: 000000000000000c
> <4>[    1.431515][  T447] RBP: 0000000000020000 R08: 0000000000000000
> R09: 0000563806daecc0
> <4>[    1.431516][  T447] R10: 000000000000000c R11: 0000000000000246
> R12: 00007fb5a8679eed
> <4>[    1.431518][  T447] R13: 0000000000000000 R14: 0000563806d9ca00
> R15: 0000563806da65d0
> <4>[    1.431520][  T447]  </TASK>
> <4>[    1.431520][  T447] Modules linked in: i2c_designware_pci(E+)
> aesni_intel(E+) i2c_piix4(E) i2c_designware_core(E) backlight(E)
> xhci_pci(E+) ice(E+) xhci_pci_renesas(E) nvme(E) wmi(E)
> <4>[    1.431525][  T447] CR2: 0000000000000540
> <4>[    1.431528][  T447] ---[ end trace d5eecb89365b3d11 ]---
>
> Hope this helps.



--=20
Robert =C5=9Awi=C4=99cki
