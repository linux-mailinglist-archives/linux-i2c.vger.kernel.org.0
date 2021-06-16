Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012CD3AA433
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 21:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhFPTXc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 15:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbhFPTXc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Jun 2021 15:23:32 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF1FC061574
        for <linux-i2c@vger.kernel.org>; Wed, 16 Jun 2021 12:21:25 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id e10so4582093ybb.7
        for <linux-i2c@vger.kernel.org>; Wed, 16 Jun 2021 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIyyHg8rOxXHbIaFJjwLfLGJz05HjefUq3ZNeTfPC9I=;
        b=Y4JrWrfZ0azYi3g5h0bLxah2fOOjP+oBBR/bv3qrm6wnV4th/xMCpikxXUkEBpOV1+
         0z7STjvmteDxhndgg02Bn1yRx5ry47rQSPk2Vl+tXuk4zwakJ+h2wSu7ldQww+dwJTON
         Ieukiv0lJxUUjtZqdUfAg3If8GslvOdy6O9XN930yhDPfvpgsylO89cCNEqbJnEIkZq8
         /4E1ZesxV/mTs1kncXJHVV6fM5F7gguCy79poYpFiUqoLi+sB+rW3HZratQTvJ82/Tqb
         HP5OCqzEvjawGYzLWTSed8LxpfxAVpY7O/v0kCmjSp2vu1sXm0lWfsFxcutE/N3vyZWF
         x2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIyyHg8rOxXHbIaFJjwLfLGJz05HjefUq3ZNeTfPC9I=;
        b=rCtvopk1arX0QfB/aK+mIsZqTTU4ji5CB/Z8BKpkEsdOh3vnhbYHVQhJ3LQkGWauoR
         bsZeez2rVKfCuW453PYPjw/gbUsqqp7ouox3o5mUlvInbVv7AuJVRVm1R+Am4LTHKZ+S
         FMJEMACVnzQKB6v/PsE2eeQI/5VBTp3wRtypsTI2bBXaP4PJN72C7m4kvEyu8QyE5hJ9
         4uYbuxJ2l2BdefuzaCJCYjkH/tgx8XE5diytwjCIx09Dk28WMH/cBD7T0Gcg0KDO789y
         2L8MhoHP3eSmjro53EE+7krAc7ORxvtMgaeh4o0HsMxVk72L951dwWO8j/k91h/GgiaJ
         SEfQ==
X-Gm-Message-State: AOAM531lLUT3ERL98OyeDGUkIrtAE3oZUQ2Y85lAbOrDxNkqsn0MK7F6
        ExlWbCcS0C/kUPXLNTeWWRyFgzp3epYaH9VZlDAi4A==
X-Google-Smtp-Source: ABdhPJzacgTS8hHw1ZjQOfNBAr1mTKMWcivsKFDjT9uyNKrKsTpmXdWxGbPNewQjvNMxKTJ6vfoYkrt96NBmSGT//fE=
X-Received: by 2002:a25:8804:: with SMTP id c4mr799996ybl.469.1623871285116;
 Wed, 16 Jun 2021 12:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210602170823.vnshp2gfrcay35nx@yadro.com> <CAMpxmJWa0ZXN--2S84B-Un0WSKM16eKAiWUtKD4V_szZPEi+gg@mail.gmail.com>
 <b2b7be69-eebb-b325-1962-4d45e6d5f088@nvidia.com> <CAMpxmJUnn1e-grUxiMm4T84xBYRi7jQOtOODfSoiBtLmsSjodA@mail.gmail.com>
 <20210616170050.ywh7xbvqxvybtvnb@yadro.com>
In-Reply-To: <20210616170050.ywh7xbvqxvybtvnb@yadro.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Jun 2021 21:21:14 +0200
Message-ID: <CAMpxmJU0Uupdp6hOVhuSERicczFjObin3wk0_QfBEOQwfCmECA@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Support custom device names for AT24 EEPROMs
To:     Alexander Fomichev <fomichev.ru@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>, linux@yadro.com,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 16, 2021 at 7:00 PM Alexander Fomichev
<fomichev.ru@gmail.com> wrote:
>
> On Mon, Jun 07, 2021 at 03:31:55PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jun 7, 2021 at 1:09 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> > >
> > >
> > > On 04/06/2021 11:00, Bartosz Golaszewski wrote:
> > > > On Wed, Jun 2, 2021 at 7:08 PM Alexander Fomichev <fomichev.ru@gmail.com> wrote:
> > >
> > > ...
> > >
> > > >> This change has a serious defect, as it doesn't guarantee a name
> > > >> uniqueness. For my case there are a bunch of NVMEM devices with
> > > >> 'dimm-spd' name. So the module initialization fails with several error
> > > >> dumps in dmesg, like following:
> > > >>
> > > >> [    4.784679] at24 3-0051: supply vcc not found, using dummy regulator
> > > >> [    4.784781] sysfs: cannot create duplicate filename '/bus/nvmem/devices/dimm-spd'
> > > >> [    4.784783] CPU: 24 PID: 1354 Comm: systemd-udevd Not tainted 5.13.0-rc4-at24-catch+ #25
> > > >> [    4.784787] Call Trace:
> > > >> [    4.784789] [c00000003f3eb010] [c000000000914700] dump_stack+0xc4/0x114 (unreliable)
> > > >> [    4.784797] [c00000003f3eb060] [c00000000061c5c8] sysfs_warn_dup+0x88/0xc0
> > > >> [    4.784803] [c00000003f3eb0e0] [c00000000061ccec] sysfs_do_create_link_sd+0x17c/0x190
> > > >> [    4.784809] [c00000003f3eb130] [c000000000ac3014] bus_add_device+0x94/0x1d0
> > > >> [    4.784817] [c00000003f3eb1b0] [c000000000abe7b8] device_add+0x428/0xb90
> > > >> [    4.784822] [c00000003f3eb2a0] [c000000000debbd0] nvmem_register+0x220/0xe00
> > > >> [    4.784829] [c00000003f3eb390] [c000000000dec80c] devm_nvmem_register+0x5c/0xc0
> > > >> [    4.784835] [c00000003f3eb3d0] [c008000016f40c20] at24_probe+0x668/0x940 [at24]
> > > >> [    4.784845] [c00000003f3eb650] [c000000000cfecd4] i2c_device_probe+0x194/0x650
> > > >> [    4.784850] [c00000003f3eb6f0] [c000000000ac4d3c] really_probe+0x1cc/0x790
> > > >> [    4.784855] [c00000003f3eb790] [c000000000ac545c] driver_probe_device+0x15c/0x200
> > > >> [    4.784861] [c00000003f3eb810] [c000000000ac5ecc] device_driver_attach+0x11c/0x130
> > > >> [    4.784866] [c00000003f3eb850] [c000000000ac5fd0] __driver_attach+0xf0/0x200
> > > >> [    4.784873] [c00000003f3eb8d0] [c000000000ac1158] bus_for_each_dev+0xa8/0x130
> > > >> [    4.784879] [c00000003f3eb930] [c000000000ac4104] driver_attach+0x34/0x50
> > > >> [    4.784885] [c00000003f3eb950] [c000000000ac35f0] bus_add_driver+0x1b0/0x2f0
> > > >> [    4.784893] [c00000003f3eb9e0] [c000000000ac70b4] driver_register+0xb4/0x1c0
> > > >> [    4.784900] [c00000003f3eba50] [c000000000cfe498] i2c_register_driver+0x78/0x120
> > > >> [    4.784905] [c00000003f3ebad0] [c008000016f41260] at24_init+0x6c/0x88 [at24]
> > > >> [    4.784914] [c00000003f3ebb30] [c0000000000122c0] do_one_initcall+0x60/0x2c0
> > > >> [    4.784920] [c00000003f3ebc00] [c0000000002537bc] do_init_module+0x7c/0x350
> > > >> [    4.784926] [c00000003f3ebc90] [c000000000257904] __do_sys_finit_module+0xd4/0x160
> > > >> [    4.784932] [c00000003f3ebdb0] [c00000000002c104] system_call_exception+0xf4/0x200
> > > >> [    4.784938] [c00000003f3ebe10] [c00000000000cf70] system_call_vectored_common+0xf0/0x268
> > > >> [    4.784944] --- interrupt: 3000 at 0x7c1adac4b4c4
> > > >> [    4.784948] NIP:  00007c1adac4b4c4 LR: 0000000000000000 CTR: 0000000000000000
> > > >> [    4.784951] REGS: c00000003f3ebe80 TRAP: 3000   Not tainted  (5.13.0-rc4-at24-catch+)
> > > >> [    4.784955] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48222844  XER: 00000000
> > > >> [    4.784976] IRQMASK: 0
> > > >>                GPR00: 0000000000000161 00007fffefc78b90 00007c1adad37000 0000000000000006
> > > >>                GPR04: 00000f6614d56be0 0000000000000000 0000000000000006 0000000000000000
> > > >>                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > >>                GPR12: 0000000000000000 00007c1adafde680 0000000020000000 0000000000000000
> > > >>                GPR16: 0000000000000000 00000f66118b1980 00000f66118b1a18 00000f66118b1948
> > > >>                GPR20: 0000000000000000 00000f6614d60500 00007fffefc78df0 00000f6614d535c0
> > > >>                GPR24: 00000f6614d56be0 00000f6614d60500 000000000000000c 00000f6614d49cb0
> > > >>                GPR28: 00000f6614d56be0 0000000000020000 0000000000000000 00000f6614d60500
> > > >> [    4.785033] NIP [00007c1adac4b4c4] 0x7c1adac4b4c4
> > > >> [    4.785036] LR [0000000000000000] 0x0
> > > >> [    4.785040] --- interrupt: 3000
> > > >> [    4.785146] at24: probe of 3-0051 failed with error -17
> > > >>
> > > >>
> > > >> It needs either to use NVMEM_DEVID_AUTO flag irrespective of the 'label'
> > > >> property or to add a sort of counter suffix to the name field.
> > > >>
> > > >>
> > > >> Reported-by: Alexander Fomichev <fomichev.ru@gmail.com>
> > > >> CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >>
> > > >> --
> > > >> Regards,
> > > >>   Alexander
> > > >
> > > > Alexander: Thanks for your bug report. The counter suffix you suggest
> > > > is precisely what NVMEM_DEVID_AUTO would do so I think we'll need to
> > > > use it. On the other hand, a non-unique label is bad design but
> > > > obviously we can't break working setups.
> > >
> > > Yes the intention was that the label itself would be unique. In our case
> > > we wanted to have something specifically named 'system' or 'module' to
> > > identify a specific eeprom.
> > >
> > > BTW I did a quick grep from 'dimm-spd' and did not find it in the
> > > kernel. Where is the device-tree you are using?
> > >
> > > > Jon: As the author of this patch - do you have any objections/better ideas?
> > >
> > > I would need to check if appending a suffix then has ramifications for
> > > what we were trying to achieve.
> > >
> > > Jon
> > >
> > > --
> > > nvpublic
> >
> > One alternative would be to use the label "as is" for the first device
> > and then append ".x" for each subsequent device with a repeating
> > label. Does this make sense?
> >
>
> This was my second suggestion, which I called 'counter suffix'. But it
> requires additional effort.
>

It looks like we can reuse the id field of nvmem_config and just track
the suffix ourselves in the driver. It's not pretty but I've seen
worse. I'll send a patch tomorrow for you to test - does this sound
ok?

Bart
