Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53C11A6482
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Apr 2020 11:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgDMJOs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Apr 2020 05:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727847AbgDMJOm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Apr 2020 05:14:42 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1D7C0A3BDC
        for <linux-i2c@vger.kernel.org>; Mon, 13 Apr 2020 02:06:03 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id s195so116498vkb.11
        for <linux-i2c@vger.kernel.org>; Mon, 13 Apr 2020 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=44uWwUjMyF5Db1li+/hUZJmO8U4y17xbM04MF0Gj90Y=;
        b=AMnJ/aA1k+bYzw4UOmmYxHr+2daJ7cdrFGGTDPJvXALak1hy3U/vrjZs48XuiyfLIJ
         rqsmyPT8E5/dgO+CeWGTkx/QRdJ+dY//ei8U7TSYV3TeC+g4i5jcJXREzzKKCuxw9k4H
         a1RKTE0bAY7oq/DnE+0iWAJt933EETTDjgXA7wm+UsCWcXv0yXzHQ18B0r509lB/l9In
         MXBKIQ2utYzYSXKghta2zn5qo1uVM5mly8MMD+Y/2G44SgSdPEqODnr4iH1UHO+c5kWU
         OX5+kzrrsLnp8IqtbemFiWXpcyc+7Lng/8osQluiXeyYs9mc843gjbnbZJ+/mwgcKzjo
         JQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=44uWwUjMyF5Db1li+/hUZJmO8U4y17xbM04MF0Gj90Y=;
        b=EVi1H2PMH8GZuV7QBYCcksakn6w7xnuAoCcfW4XhkbM9YEdYG1xlS7B4iwAb0wXfNX
         N9iDzFCbKt23EqIUXD0rh+IIECYOxss4fKbGvaWgvfyb1GN2XgateLxteAIiQlIQQKeH
         oARVt5XT+ppJC3mQg/d2ZB9lrjgveg1b3f+SNpj4i1Ywa3pq0Vztc9k8XFl3BPrH7PSQ
         0o/mTZeRJR50ISX+hMZtZJfq5VGnSa3zuAwPr6SmhcebQkEKhF3JEObn72RMzLHY6To2
         rwwjAMe0Ao/b5vPnOqznm2ol/1HgDtnxkpurNwdV+1V/sPuX7aoFfTM55P2zhYH0pjX2
         VDIA==
X-Gm-Message-State: AGi0Pubmil9PHnSzucjDj5jQWCUmruxPKQpx/ka9USj6VPvPJkD2vUps
        0HVEzAFqJTQgS8oE2PJFsVprTKQnSgCpppqlzG69Gg==
X-Google-Smtp-Source: APiQypKbBeCYZCfknNxcUxKjtUOVj4WHHzMNAae4ToWmQTXbNQbnC9NvvjxSGmC6HHUNlWpewDV49mk+qRTGOO2eZY8=
X-Received: by 2002:a1f:3056:: with SMTP id w83mr5389723vkw.56.1586768762080;
 Mon, 13 Apr 2020 02:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpJ_edj++oy7_EDN95tM+BPdYFOztpCrRh-cfzFrY6unJb1Rw@mail.gmail.com>
 <20200402103447.GD1886416@kuha.fi.intel.com> <BYAPR12MB272705C6DEE5182159B0EF26DCC60@BYAPR12MB2727.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB272705C6DEE5182159B0EF26DCC60@BYAPR12MB2727.namprd12.prod.outlook.com>
From:   Jian-Hong Pan <jian-hong@endlessm.com>
Date:   Mon, 13 Apr 2020 17:05:17 +0800
Message-ID: <CAPpJ_efcchxCmeHe_aiPiq6wqDaB=RJdB_GAa-MP_uQrH+Ju_A@mail.gmail.com>
Subject: Re: [BUG] i2c_nvidia_gpu takes long time and makes system suspend &
 resume failed with NVIDIA cards
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ajay Gupta <ajayg@nvidia.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=883=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=884:59=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Jian
>
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Thursday, April 2, 2020 3:35 AM
> > To: Jian-Hong Pan <jian-hong@endlessm.com>; Ajay Gupta
> > <ajayg@nvidia.com>
> > Cc: linux-i2c@vger.kernel.org; Linux Kernel <linux-kernel@vger.kernel.o=
rg>;
> > linux-usb@vger.kernel.org; Linux Upstreaming Team <linux@endlessm.com>
> > Subject: Re: [BUG] i2c_nvidia_gpu takes long time and makes system
> > suspend & resume failed with NVIDIA cards
> >
> > External email: Use caution opening links or attachments
> >
> >
> > Hi,
> >
> > On Thu, Apr 02, 2020 at 06:22:14PM +0800, Jian-Hong Pan wrote:
> > > Hi,
> > >
> > > We got some machines like Acer desktop equipped with NVIDIA GTX 1660
> > > card, Acer Predator PH315-52 equipped with NVIDIA GeForce RTX 2060
> > > Mobile and ASUS UX581LV equipped with NNVIDIA GeForce RTX 2060.
> > > We found them take long time (more than 50 seconds) to resume after
> > > suspend.  During the resuming time, the screen is blank.  And check
> > > the dmesg, found the error during resume:
> > >
> > > [   28.060831] PM: suspend entry (deep)
> > > [   28.144260] Filesystems sync: 0.083 seconds
> > > [   28.150219] Freezing user space processes ...
> > > [   48.153282] Freezing of tasks failed after 20.003 seconds (1 tasks
> > > refusing to freeze, wq_busy=3D0):
> > > [   48.153447] systemd-udevd   D13440   382    330 0x80004124
> > > [   48.153457] Call Trace:
> > > [   48.153504]  ? __schedule+0x272/0x5a0
> > > [   48.153558]  ? hrtimer_start_range_ns+0x18c/0x2c0
> > > [   48.153622]  schedule+0x45/0xb0
> > > [   48.153668]  schedule_hrtimeout_range_clock+0x8f/0x100
> > > [   48.153738]  ? hrtimer_init_sleeper+0x80/0x80
> > > [   48.153798]  usleep_range+0x5a/0x80
> > > [   48.153850]  gpu_i2c_check_status.isra.0+0x3a/0xa0 [i2c_nvidia_gpu=
]
> > > [   48.153933]  gpu_i2c_master_xfer+0x155/0x20e [i2c_nvidia_gpu]
> > > [   48.154012]  __i2c_transfer+0x163/0x4c0
> > > [   48.154067]  i2c_transfer+0x6e/0xc0
> > > [   48.154120]  ccg_read+0x11f/0x170 [ucsi_ccg]
> > > [   48.154182]  get_fw_info+0x17/0x50 [ucsi_ccg]
> > > [   48.154242]  ucsi_ccg_probe+0xf4/0x200 [ucsi_ccg]
> > > [   48.154312]  ? ucsi_ccg_init+0xe0/0xe0 [ucsi_ccg]
> > > [   48.154377]  i2c_device_probe+0x113/0x210
> > > [   48.154435]  really_probe+0xdf/0x280
> > > [   48.154487]  driver_probe_device+0x4b/0xc0
> > > [   48.154545]  device_driver_attach+0x4e/0x60
> > > [   48.154604]  __driver_attach+0x44/0xb0
> > > [   48.154657]  ? device_driver_attach+0x60/0x60
> > > [   48.154717]  bus_for_each_dev+0x6c/0xb0
> > > [   48.154772]  bus_add_driver+0x172/0x1c0
> > > [   48.154824]  driver_register+0x67/0xb0
> > > [   48.154877]  i2c_register_driver+0x39/0x70
> > > [   48.154932]  ? 0xffffffffc00ac000
> > > [   48.154978]  do_one_initcall+0x3e/0x1d0
> > > [   48.155032]  ? free_vmap_area_noflush+0x8d/0xe0
> > > [   48.155093]  ? _cond_resched+0x10/0x20
> > > [   48.155145]  ? kmem_cache_alloc_trace+0x3a/0x1b0
> > > [   48.155208]  do_init_module+0x56/0x200
> > > [   48.155260]  load_module+0x21fe/0x24e0
> > > [   48.155322]  ? __do_sys_finit_module+0xbf/0xe0
> > > [   48.155381]  __do_sys_finit_module+0xbf/0xe0
> > > [   48.155441]  do_syscall_64+0x3d/0x130
> > > [   48.156841]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > [   48.158074] RIP: 0033:0x7fba3b4bc2a9
> > > [   48.158707] Code: Bad RIP value.
> > > [   48.158990] RSP: 002b:00007ffe1da3a6d8 EFLAGS: 00000246 ORIG_RAX:
> > > 0000000000000139
> > > [   48.159259] RAX: ffffffffffffffda RBX: 000055ca6922c470 RCX:
> > 00007fba3b4bc2a9
> > > [   48.159566] RDX: 0000000000000000 RSI: 00007fba3b3c0cad RDI:
> > 0000000000000010
> > > [   48.159842] RBP: 00007fba3b3c0cad R08: 0000000000000000 R09:
> > 0000000000000000
> > > [   48.160117] R10: 0000000000000010 R11: 0000000000000246 R12:
> > 0000000000000000
> > > [   48.160412] R13: 000055ca6922f940 R14: 0000000000020000 R15:
> > 000055ca6922c470
> > >
> > > I have filed this to bugzilla and more detail:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
> > >
> > > Any comment will be appreciated.
> >
> > You are using an outdated kernel, 5.4.0. Please make sure that you can
> > reproduce the issue with mainline, or at least with the longterm 5.4.x.
> >
> > Ajay, based on the backtrace, the issue seems to be starting from your =
I2C
> > driver. Please take a look at this.
>
> I have replied to Bugzilla
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206653#c5

Thanks for both your reply!

I have commented the test result at
https://bugzilla.kernel.org/show_bug.cgi?id=3D206653#c6

Jian-Hong Pan

> Thanks
> > nvpuclic
> >
> > thanks,
> >
> > --
> > heikki
