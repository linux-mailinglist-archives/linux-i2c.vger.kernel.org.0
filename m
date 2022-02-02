Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760044A7365
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 15:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241496AbiBBOmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 09:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiBBOmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 09:42:17 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807FDC06173B
        for <linux-i2c@vger.kernel.org>; Wed,  2 Feb 2022 06:42:17 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id m7so3428741pjk.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Feb 2022 06:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wjge9Jzg3BsNzlCYuO9fFbJGJw1RDim9e+0Nkebz6RI=;
        b=hzMv5WDFmCdqZwP3nYdUjkvQutRgOzCV3UbIw1pZsSW8oe9PJ2lPgKS2cHp8jYqhFT
         UL8CH0zBgwu9bcOV7YWRMgV2VVk13aqI+ELA3MUELh3ercHNejB7/7Fn3ZiQslQiHsz6
         qynyQ/Zug4/WFDKgS2dbwrWksJxkqyRlg4yNHCfBAxEtnvSXg3ltZmeqTo5w/TTBOpMA
         MSxerok0B+QY7aIjTq5oezZcxF43asrt+lTMgYFbZv+946Ijg06H6Zp5AFkOdyBdno8m
         1GZ70wIO/500kb1RwKjCwOIY5nDkBJ0dQTI6hq//kLsibO4kWokvWdLRxtTeEynqrX/Q
         61BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wjge9Jzg3BsNzlCYuO9fFbJGJw1RDim9e+0Nkebz6RI=;
        b=nwG7IAW1Px0Wf6VG6EnJr1+GkTMuTQVLBzyDpfj43jkBZoNs1zECmxwY/26VC4PIe6
         RrkWHo7G/Cdc7xur0n4lkuBYtOJyt35LxHonvVZ2sh+bPj8Tk6q7qe3QQHZNHF0XetVK
         TPdRTiRFANn/eOyRyPSmzM9Xfme5uBLChziDjppjULtEBtlQKlUJsgPg0vawMyWen6+j
         /r926xRtPCbFkG9tfwJ8DV4VPPWAQsNF40wDWU7oANTh0TrzImQ2xDbD7moSv/27JeIY
         Wa38gysGdV4kPsgJwqXAoVNK7mvGGLuRoAesTz64fvaWKW1RlTBPUUEeHkH9AZs4MKGc
         l8fA==
X-Gm-Message-State: AOAM533enNy+1nUwYmlJ2L0a7AgSC/IhNTBVoPkVnSpdCBxbB5gHSk85
        oDyuwk7q+C+9xg7y1z9aS4lUnQLNYWAAfjTJShHyUA==
X-Google-Smtp-Source: ABdhPJxwIAcnlCMB7YCJ9mCTx7OSZs+4LI7Dd16OxzmhHEpvld8tOSUrJsgmXxB3sPdbSTxEdVD+aODVlKQshryq748=
X-Received: by 2002:a17:903:24d:: with SMTP id j13mr30332365plh.145.1643812936933;
 Wed, 02 Feb 2022 06:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220128144811.783279-1-jsd@semihalf.com>
 <20220128144811.783279-3-jsd@semihalf.com> <CAOtMz3MnM6knabs0kF6urpE+Thm6rj++6Yy9G=ky2r9uOByH5Q@mail.gmail.com>
 <YfQQeWdciv/JtqLD@smile.fi.intel.com> <CAOtMz3Oryr7mmRKf+secix_6=ZD_Lq+pMUoP=5T6AS6BPoqyQw@mail.gmail.com>
 <YffkwwxtZ/cul5CF@smile.fi.intel.com>
In-Reply-To: <YffkwwxtZ/cul5CF@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Wed, 2 Feb 2022 15:42:06 +0100
Message-ID: <CAOtMz3OCTfp9UO6k81or_eSTn8zkVbP3P03R7Ha+3buNda28cw@mail.gmail.com>
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

pon., 31 sty 2022 o 14:32 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Jan 31, 2022 at 12:56:27PM +0100, Jan D=C4=85bro=C5=9B wrote:
> > pt., 28 sty 2022 o 16:50 Andy Shevchenko <andriy.shevchenko@linux.intel=
.com>
> > napisa=C5=82(a):
> > > On Fri, Jan 28, 2022 at 03:59:40PM +0100, Jan D=C4=85bro=C5=9B wrote:
> > > > pt., 28 sty 2022 o 15:48 Jan Dabros <jsd@semihalf.com> napisa=C5=82=
(a):
>
> ...
>
> > > > > +struct psp_mbox {
> > > > > +       u32 cmd_fields;
> > >
> > > > > +       phys_addr_t i2c_req_addr;
> > >
> > > But phys_addr_t is platform-dependent type. Perhaps you meant to use =
u64
> > > here
> > > always?
> >
> > Once I remove the "depends on X86_64" I believe this should be left
> > platform-dependent.
>
> If it's a protocol or HW layout, it may not be platform-dependent.

Right you are correct, will keep this as 64bit variable.

>
> > > > > +} __packed;
>
> ...
>
> > > > > +       if (psp_send_cmd(req))
> > >
> > > > > +               return -EIO;
> > >
> > > Why is error code shadowed?
> > >
> >
> > Just as a side note - it wasn't modified in v2 when moving above to
> > psp_send_check_i2c_req(), but let me explain why I have introduced this
> > initially.
> >
> > We have two means of timeouts in the context of this driver:
> > 1. Timeout of internal mailbox, which means we cannot communicate with =
a
> > PSP for a programmed timeout. This timeout is encountered inside
> > psp_send_cmd().
> > 2. Timeout of i2c arbitration - which means that we can communicate wit=
h
> > PSP, but PSP refuses to release i2c bus for too long. This timeout is
> > returned by psp_send_i2c_req() in case of error.
> > (side note: both error conditions are very unlikely to happen at runtim=
e)
> >
> > I wanted to clearly distinguish between these two and thus put all erro=
rs
> > around mailbox into "-EIO category", which is actually true.
>
> At very least this code needs more or less the above to be put as a comme=
nt.

ACK

>
> ...
>
> > > > > +cleanup:
> > > > > +       mutex_unlock(&psp_i2c_access_mutex);
> > > > > +       return 0;
> > >
> > > Not sure I understand why we ignore all above errors here.
> > >
> >
> > Actually we are not ignoring them, since each error sets "psp_i2c_mbox_=
fail
> > =3D true;". This means that if there is any error on x86-PSP interface,=
 we
> > are ignoring i2c-arbitration and just fall back to normal (that is
> > no-quirk) operation.
> >
> > From the i2c-client perspective (who is eventually gathering error code
> > from above) I think we can claim that everything is fine, since bus is
> > granted to it. For developers there is an error message in case some de=
bug
> > will be necessary.
>
> Perhaps needs a comment (sorry, if I overlooked it).

ACK.

>
> ...
>
> > > > > +       if (!dev || !dev->dev)
> > > > > +               return -ENODEV;
> > >
> > > At which circumstances may we get
> > >         dev !=3D NULL
> > >         dev->dev =3D=3D NULL
> > > ?
> > >
> > > ...
> > >
> > > > >         if (!dev || !dev->dev)
> > > > > -               return 0;
> > > > > +               return -ENODEV;
> > >
> > > I see the same here, perhaps Hans knows the answer :-)
> >
> > Right, so I must admit that I simply used *-baytrail.c as a reference a=
nd
> > thinking that additional check shouldn't hurt us (always better than no=
t
> > enough safety..). Looking more at this now - `dw_i2c_plat_probe()` will
> > boil-out earlier if `dev->dev =3D=3D NULL`. Should I remove this extra =
check in
> > *-baytrail.c in the same commit?
>
> Maybe. Please, double check that it's not needed indeed.

Confirmed that this is unnecessary.

Best Regards,
Jan

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
