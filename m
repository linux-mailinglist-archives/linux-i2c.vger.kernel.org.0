Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF7F495DBC
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 11:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344614AbiAUK1h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 05:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbiAUK1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 05:27:36 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B54C061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:27:35 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id pf13so9007315pjb.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KhlrB2SVGbtIKoVBNVPoy+9dR4p29EtqR1X9fQ4Ad8M=;
        b=cq81Gfjb0rILYcu0ZNwDYDwgYbr4f/L5oKASBNnJPbsho/KZ8RE76KnQifYvytvN5W
         LSaOCPLE6chYKNnPiaoTZfg3cBjGijgPKSzB4SerKPypjbFOnE8w2G5djXUWmueG31Bw
         rdNf2j1rUgtQ4GBfjnc0ZyyXKhX5TpYKfYwbJ3QHcJoGz8/qx2IkavB45wJGIQkxlf5E
         HTZLfO8ktymEhaU/uV+dEoRpxYYczalL6rc1LaNoQyefFadKA6+HH6BVmDFdBYCXMO7C
         PE3LI80PBby1pA42dwXVxkFBKxmyMUiKLdwwUgKWk0WIrIfLMWl9VNU0I2TeXdDc95yv
         aIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KhlrB2SVGbtIKoVBNVPoy+9dR4p29EtqR1X9fQ4Ad8M=;
        b=nzxuAXxL47FFvZZ6n/Ybd7o5CScx8QPh1P+p3tAFrkKyzDEnZ+M9a13cQ/R3YVj46t
         edQ1GFNUSusfWQYdudhJlNDohW9MBIlI7WTiKtI5umxIBG4LEoVP9ID6/e1xLlUuOBLc
         a4nK1ar5joGR87MZHqeJK7loCzFUsqUF6P0yEfcW/BtJ/C4bHqlnm5UidBpSqZa6Un3o
         6ZPP3t2quBXHE6TU5qWq0BVRRg/Bhp3L0I8l6LN5u1TcGOa/QizM6fcPv4RJTe9zRpg9
         +KN1GpjeZh4zNdpG6lwEAAgs1t9kIL7GX1I1N8Nkcd56izRjuwdWuOKjsyq42zscYj0T
         eQ0g==
X-Gm-Message-State: AOAM5306QwVFuzpdcogxHSAiY5UViofxvzyAmiMMSPUYRR85oTUV7GGx
        9foSPqpTYnk6FpAvYuH0+isv5GPTX1Sne5yM6xjgaQ==
X-Google-Smtp-Source: ABdhPJwbgq3avXkmdTkDPR9LhAV1GzpXOu4XVHFjsRX8R9WKrzZ9f6D3+Vj+v+SIMXSY/vAllw9UXu0c+Jev/9eoa88=
X-Received: by 2002:a17:902:bb8e:b0:14a:496c:6f2b with SMTP id
 m14-20020a170902bb8e00b0014a496c6f2bmr3112204pls.57.1642760855372; Fri, 21
 Jan 2022 02:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-1-jsd@semihalf.com> <2f7610dc-ab57-ddbf-277f-e84680da71bd@redhat.com>
 <CAOtMz3MDntus2OzRS_QDfnFpzrVjj4swQjTkgkFYMGuwgbZcWA@mail.gmail.com> <7f165170-ed25-7804-b756-4944a4067b8a@redhat.com>
In-Reply-To: <7f165170-ed25-7804-b756-4944a4067b8a@redhat.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 21 Jan 2022 11:27:24 +0100
Message-ID: <CAOtMz3Of4vViOOum5sZ0r4+fP+QP1eOzpv7rz0o7_HCC7DYPgg@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c-designware: Add support for AMD PSP semaphore
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 20 sty 2022 o 16:57 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi,
>
> On 1/20/22 13:29, Jan D=C4=85bro=C5=9B wrote:
> > Hi Hans,
> >
> >
> > czw., 20 sty 2022 o 12:15 Hans de Goede <hdegoede@redhat.com> napisa=C5=
=82(a):
> >>
> >> Hi Jan,
> >>
> >> On 1/20/22 01:16, Jan Dabros wrote:
> >>> This patchset comprises support for new i2c-designware controller set=
up on some
> >>> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the=
 same
> >>> controller and acts as an i2c arbitrator there (x86 is leasing bus fr=
om it).
> >>>
> >>> First commit aims to improve generic i2c-designware code by adding ex=
tra locking
> >>> on probe() and disable() paths. I would like to ask someone with acce=
ss to
> >>> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to ve=
rify
> >>> behavior of my changes on such setup.
> >>>
> >>> Second commit adds support for new PSP semaphore arbitration mechanis=
m.
> >>> Implementation is similar to the one from i2c-designware-baytrail.c h=
owever
> >>> there are two main differences:
> >>> 1) Add new ACPI ID in order to protect against silent binding of the =
old driver
> >>> to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE add=
ed to this
> >>> new _HID allows to recognize setup with PSP.
> >>> 2) Beside acquire_lock() and release_lock() methods we are also apply=
ing quirks
> >>> to the lock_bus() and unlock_bus() global adapter methods. With this =
in place
> >>> all i2c clients drivers may lock i2c bus for a desired number of i2c
> >>> transactions (e.g. write-wait-read) without being aware of that such =
bus is
> >>> shared with another entity.
> >>>
> >>> This patchset is a follow-up to the RFC sent earlier on LKML [1], wit=
h review
> >>> comments applied.
> >>>
> >>> Looking forward to some feedback.
> >>>
> >>> [1] https://lkml.org/lkml/2021/12/22/219
> >>
> >>
> >> Thank you for your patch series.
> >>
> >> As you may have seen I've done a lot of work on the Bay Trail semaphor=
e
> >> thing. I also own several Bay Trail and Cherry Trail based devices whi=
ch
> >> use this setup.
> >>
> >> I'll add your patches to my personal WIP tree which I regularly run
> >> on these devices and I'll report back if I notice any issues.
> >
> > Thanks in advance, this will be really helpful! I don't have Bay
> > Trail/Cherry Trail, so I've only tested that build of Bay Trail
> > semaphore isn't broken.
> >
> > I would like to point to new locks in i2c_dw_disable() method as
> > something to be the most fragile and error-prone, will be great if you
> > can verify this thoroughly. This function is invoked on both
> > dw_i2c_driver.remove() and dw_i2c_plat_suspend() paths. Considering
> > that Bay Trail semaphore means that i2c bus is shared with PMIC, I'm
> > not sure whether all corner cases are secured especially on platform
> > suspend.
>
> You are right that the whole sharing of the bus to the PMIC between
> the SoC's internal power-management microcontroller (P-Unit) and
> the OS is a bit fragile (it really is a bit crazy design IMHO).
>
> You are also right that disabling the controller on suspend
> is a problem, because once everything is suspended and we hit
> deeper power-saving states then the P-Unit actually needs the
> controller to tell the PMIC to disable certain regulators; and
> the P-Unit is not prepared for us having turned the controller off,
> therefor dw_i2c_plat_suspend() looks like this:
>
> static int dw_i2c_plat_suspend(struct device *dev)
> {
>         struct dw_i2c_dev *i_dev =3D dev_get_drvdata(dev);
>
>         i_dev->suspended =3D true;
>
>         if (i_dev->shared_with_punit)
>                 return 0;
>
>         ...
>
>
> Note the shared_with_punit flag, so on the Bay Trail case
> i2c_dw_disable() never gets called on suspend, so that should
> not be an issue.

Thanks for pointing this! So actually the only path which is now (with
my patch) altered on the Bay Trails is unbinding driver from the
device which will call dw_i2c_driver.remove().

>
> So all in all I don't really expect any problems, still thank
> you for Cc-ing me.

Thanks a lot for your help with testing and reviewing my code.

>
> Regards,
>
> Hans
>
>
>
> >> One remark, I notice that there are no AMD people in the Cc, it
> >> would be good if you can find someone from AMD to look at this,
> >> also see my remarks to the 2nd patch in my reply to that patch.
> >
> > This was partially discussed with AMD folks and you are right that I
> > should include someone from AMD to take a look at this. Thanks for all
> > your comments!
> >
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>>
> >>> Jan Dabros (2):
> >>>   i2c: designware: Add missing locks
> >>>   i2c: designware: Add AMD PSP I2C bus support
> >>>
> >>>  MAINTAINERS                                  |   1 +
> >>>  drivers/acpi/acpi_apd.c                      |   1 +
> >>>  drivers/i2c/busses/Kconfig                   |  10 +
> >>>  drivers/i2c/busses/Makefile                  |   1 +
> >>>  drivers/i2c/busses/i2c-designware-amdpsp.c   | 357 +++++++++++++++++=
++
> >>>  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
> >>>  drivers/i2c/busses/i2c-designware-common.c   |  12 +
> >>>  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
> >>>  drivers/i2c/busses/i2c-designware-master.c   |   6 +
> >>>  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 ++++
> >>>  10 files changed, 469 insertions(+), 8 deletions(-)
> >>>  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
> >>>
> >>
> >
>
