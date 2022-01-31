Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C1A4A46A6
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 13:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377401AbiAaMKr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 07:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376581AbiAaMKb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 07:10:31 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B41C06174E
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jan 2022 04:10:13 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id t32so12050490pgm.7
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jan 2022 04:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/4FIhrzPl2pkQFAAhaZP7iIv/6qR95SaVWHtftnRGBs=;
        b=05zQRZk3/8/Zb9Roy3RfNfi4qT5k7S7AOipuFtI6WtOtGTjspmvO7tlg3c2klgCKHz
         WFNfFMbZWdyEI7DrNsn5UgaGNRDqgM20I4ETc7qQjCw65G7KqyVpJI9b05LHVtWA6YJF
         K/gQaD1qtTB8+20RCKBYHbMjxgTpHD4ctEix1eNtsZIFUy9faEjaLEMW1tK1ImMSUfh7
         6NU1796vQlWrKPQD/oOvh5HU8y4VgoHPn2+tsHtica0muSsGYES+UwyBI9S63If0vg5w
         /+L9jdI2osyP31IaTAMDd9j/O1jOvKefcpcuQcMtGZIM4/MI29C/KYLiEpAripzriByH
         tVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/4FIhrzPl2pkQFAAhaZP7iIv/6qR95SaVWHtftnRGBs=;
        b=f0ggPvZ7EfUyKExEk13Bb9u4pTly431DADxnJsB2w1vdR2JvhT8QlX4XIBoHg/3ITM
         uBcSgjDfvbAmUZzIKtaaR1eF+5ysvCa1o/iEmquIY6VZtAnBZymCE2iWGb35gKhSrsKc
         4lN9Rz8iQXef4UCt/wvIFCu4/NK948i1YaMtYJnBWyWAmomj7ZaU98HgaLJ4sJgD4gMq
         VF7UBw33gxzABwUClKVDC6FoKiKOi5P/KyDZLPGJzqXZDLGE1WfBSCEBFDFW2fXGqJHx
         oex4yO1P66O0ISKNGdpirnhwDkKk5ViQopIyuoe3Od7DKSs2mOUO9MDYhh7+h9oA1nnl
         7cFw==
X-Gm-Message-State: AOAM533VYxk6cdKljNdRXHshH4JCkdiNqNku4+d2S4wpt7kMqRm88b8S
        /RD9U2RBelFA+CLdgMLJPQDw6YgV96i7nQmnNlap2Q==
X-Google-Smtp-Source: ABdhPJwbMuoHiV/E9jScimyKN6AuHFyCiLezfF1K9b4UTdf4G0bJ2QPrIHpO8qYDcPPMl1BF2HDvuBsI+TxTFZ9vCq0=
X-Received: by 2002:a05:6a00:2408:: with SMTP id z8mr18846694pfh.68.1643631012444;
 Mon, 31 Jan 2022 04:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220128144811.783279-1-jsd@semihalf.com>
 <20220128144811.783279-3-jsd@semihalf.com> <CAOtMz3MnM6knabs0kF6urpE+Thm6rj++6Yy9G=ky2r9uOByH5Q@mail.gmail.com>
 <YfQQeWdciv/JtqLD@smile.fi.intel.com>
In-Reply-To: <YfQQeWdciv/JtqLD@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 31 Jan 2022 13:10:01 +0100
Message-ID: <CAOtMz3P4rOuoLdMjQjAASkvF00XX73geyv9Zzo9-JTZEUhLDig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Aargh.. so if this won't be enough to use wrong email address in v2 -
I not used plain text above. Mailing list (understandably) aren't
happy with this, thus resending my answers to Andy.. Again sorry for
noise.


pt., 28 sty 2022 o 16:50 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Fri, Jan 28, 2022 at 03:59:40PM +0100, Jan D=C4=85bro=C5=9B wrote:
> > Hi,
> >
> > Adding proper Andy's email address (and removing wrong one) in the
> > whole patchset. Sorry for noise!
>
> Thanks!
>
> > pt., 28 sty 2022 o 15:48 Jan Dabros <jsd@semihalf.com> napisa=C5=82(a):
> > >
> > > Implement an I2C controller sharing mechanism between the host (kerne=
l)
> > > and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
> > >
> > > On these platforms we need to implement "software" i2c arbitration.
> > > Default arbitration owner is PSP and kernel asks for acquire as well
> > > as inform about release of the i2c bus via mailbox mechanism.
> > >
> > >             +---------+
> > >  <- ACQUIRE |         |
> > >   +---------|   CPU   |\
> > >   |         |         | \      +----------+  SDA
> > >   |         +---------+  \     |          |-------
> > > MAILBOX                   +--> |  I2C-DW  |  SCL
> > >   |         +---------+        |          |-------
> > >   |         |         |        +----------+
> > >   +---------|   PSP   |
> > >    <- ACK   |         |
> > >             +---------+
> > >
> > >             +---------+
> > >  <- RELEASE |         |
> > >   +---------|   CPU   |
> > >   |         |         |        +----------+  SDA
> > >   |         +---------+        |          |-------
> > > MAILBOX                   +--> |  I2C-DW  |  SCL
> > >   |         +---------+  /     |          |-------
> > >   |         |         | /      +----------+
> > >   +---------|   PSP   |/
> > >    <- ACK   |         |
> > >             +---------+
> > >
> > > The solution is similar to i2c-designware-baytrail.c implementation, =
where
> > > we are using a generic i2c-designware-* driver with a small "wrapper"=
.
> > >
> > > In contrary to baytrail semaphore implementation, beside internal
> > > acquire_lock() and release_lock() methods we are also applying quirks=
 to
> > > lock_bus() and unlock_bus() global adapter methods. With this in plac=
e
> > > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > > transactions (e.g. write-wait-read) without being aware of that such =
bus
> > > is shared with another entity.
> > >
> > > Modify i2c_dw_probe_lock_support() to select correct semaphore
> > > implementation at runtime, since now we have more than one available.
> > >
> > > Configure new matching ACPI ID "AMDI0019" and register
> > > ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> > > arbitration.
> > >
> > > Add myself as a reviewer for I2C DesignWare in order to help with rev=
iewing
> > > and testing possible changes touching new i2c-designware-amdpsp.c mod=
ule.
> > >
> > > Signed-off-by: Jan Dabros <jsd@semihalf.com>
>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
>
> New feature can't be reported.
> If you want to give a credit to CI, do it in changelog.

OK, will remove this.

> ...
>
> > > +       depends on X86_64
>
> Not sure if it's better than using non-atomic IO helpers.

There are 2 issues reported by kernel robot for my patchset:
1. Lack of <asm/msr.h>;
2. Missing declaration for 'writeq'.
Actually above was my idea to fix first issue, but please see below.

> At least you can't run 32-bit kernels on that platforms
> in order to get this functionality working. Doest it mean
> those platforms do not have 32-bit compatibility mode
> anymore?

Correct, I was focusing too much on my use case, where I'm building
only 64-bit. This isn't right. Furthermore I should rather use
dependency on CONFIG_X86_MSR which is better suited for ensuring above
msr.h header is present.

>
> ...
>
> > > +#include <linux/io-64-nonatomic-lo-hi.h>
>
> Ah, this is not needed if you keep code running exclusively on 64-bit
> platforms.

Will keep this, since switching to "depends on X86_MSR".

> ...
>
> > > +struct psp_mbox {
> > > +       u32 cmd_fields;
>
> > > +       phys_addr_t i2c_req_addr;
>
> But phys_addr_t is platform-dependent type. Perhaps you meant to use u64 =
here
> always?

Once I remove the "depends on X86_64" I believe this should be left
platform-dependent.

> > > +} __packed;
>
> ...
>
> > > +       struct psp_mbox __iomem *mbox =3D (struct psp_mbox __iomem *)=
mbox_iomem;
>
> For void * pointers the cast is implied, i.o.w. it's not needed here.

ACK.

> ...
>
> > > +static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> > > +{
> > > +       if (psp_send_cmd(req))
>
> > > +               return -EIO;
>
> Why is error code shadowed?
>
> > > +       return check_i2c_req_sts(req);
> > > +}

Just as a side note - it wasn't modified in v2 when moving above to
psp_send_check_i2c_req(), but let me explain why I have introduced
this initially.

We have two means of timeouts in the context of this driver:
1. Timeout of internal mailbox, which means we cannot communicate with
a PSP for a programmed timeout. This timeout is encountered inside
psp_send_cmd().
2. Timeout of i2c arbitration - which means that we can communicate
with PSP, but PSP refuses to release i2c bus for too long. This
timeout is returned by psp_send_i2c_req() in case of error.
(side note: both error conditions are very unlikely to happen at runtime)

I wanted to clearly distinguish between these two and thus put all
errors around mailbox into "-EIO category", which is actually true.

> ...
>
> > > +cleanup:
> > > +       mutex_unlock(&psp_i2c_access_mutex);
> > > +       return 0;
>
> Not sure I understand why we ignore all above errors here.

Actually we are not ignoring them, since each error sets
"psp_i2c_mbox_fail =3D true;". This means that if there is any error on
x86-PSP interface, we are ignoring i2c-arbitration and just fall back
to normal (that is no-quirk) operation.

From the i2c-client perspective (who is eventually gathering error
code from above) I think we can claim that everything is fine, since
bus is granted to it. For developers there is an error message in case
some debug will be necessary.

> ...
>
> > > +       if (!dev || !dev->dev)
> > > +               return -ENODEV;
>
> At which circumstances may we get
>         dev !=3D NULL
>         dev->dev =3D=3D NULL
> ?
>
> ...
>
> > >         if (!dev || !dev->dev)
> > > -               return 0;
> > > +               return -ENODEV;
>
> I see the same here, perhaps Hans knows the answer :-)

Right, so I must admit that I simply used *-baytrail.c as a reference
and thinking that additional check shouldn't hurt us (always better
than not enough safety..). Looking more at this now -
`dw_i2c_plat_probe()` will boil-out earlier if `dev->dev =3D=3D NULL`.
Should I remove this extra check in *-baytrail.c in the same commit?

> ...
>
> > > +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> > > +{
> > > +       const struct i2c_dw_semaphore_callbacks *ptr;
> > > +       int i =3D 0;
> > > +       int ret;
> > > +
> > > +       ptr =3D i2c_dw_semaphore_cb_table;
> > > +
> > > +       dev->semaphore_idx =3D -1;
> > > +
> > > +       while (ptr->probe) {
> > > +               ret =3D ptr->probe(dev);
> > > +               if (ret) {
>
> > > +                       /*
> > > +                        * If there is no semaphore device attached t=
o this
> > > +                        * controller, we shouldn't abort general i2c=
_controller
> > > +                        * probe.
> > > +                        */
> > > +                       if (ret =3D=3D -ENODEV) {
> > > +                               i++;
> > > +                               ptr++;
> > > +                               continue;
> > > +                       } else {
>
> Redundant 'else', but see below.
>
> > > +                               return ret;
> > > +                       }
>
> May it be
>
>             if (ret !=3D -ENODEV)
>                 return ret;
>
>             i++;
>             ptr++;
>             continue;
>
> ?

Yes, looks good. Thanks!

Best Regards,
Jan

>
> > > +               }
> > > +
> > > +               dev->semaphore_idx =3D i;
> > > +               break;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
