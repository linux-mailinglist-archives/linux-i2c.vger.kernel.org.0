Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64ACB494DEC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 13:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242280AbiATM37 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 07:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbiATM36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 07:29:58 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E707C061574
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 04:29:58 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id a7so5092953plh.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bJc7E0ZK2JilQOtCTnLnbaOln2zvVu8F3m2cBRki6mg=;
        b=64qhvyb0dK0pjpg+ZKWlzXCu1XNj46fAUmpwCTvrDsRSMSZ3T52tt0/m2CGv5efY3g
         leBpis2cE5RxEeOAwkzExgtcpswZf4/uX6/MZrGYsMGqLUPPdxJbZV85kNDCC5FWcBAb
         yuXRVTtEhpwv/b6bG8zjLgukv8VM2ToH1lODoxRxLiO/UvCGGxbj6kY/zrFbfNpR+o4A
         Ao5vMlJsjgx1evw/di23lhRYi3bMysCKMWNupGYqsehWjOnTP9EOp5Jd14jb+oYyfCEf
         iz51uWtJxzYjpuxsBmSBGrI862pGyLVj2j1PhCDUNAN2v5RtbdMzvlotA20nU9YPk7G7
         eVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bJc7E0ZK2JilQOtCTnLnbaOln2zvVu8F3m2cBRki6mg=;
        b=f1rjB9iWdBCkL0Kw16dK6KBV2TaE/Y38TUKY0UNN7dvEwHnvYuDKXv1nmt12rMcv1M
         NGMHmZWDXK5PhyrKF1uC7tSqX43GGmdQLhZVtbdLA5dUSAqP5OON/VzGfkIlAcge6GTd
         ocqFojyyjgmWuzMNPOE/1/qtfL04WoCbyeB+4haVNeyX4wtWSexDPwHv+OAYJoJO0Xoa
         FKk8l7k5ZtwZpZCreiuPu3BxLB75aRO1QViDD5G/0SfphSepmqvHn/+HxWgRR9EeuhlZ
         bGiVKUGyy+R90i5T1+e5I7wFNI/1mrM2npqzL2/xDXlx8BdS0GH37gJo1RCx04KJuMWN
         wj1w==
X-Gm-Message-State: AOAM5335kM1DRGwOarXuPeygYc3US/IYqGhvG9p0dlISdvGQX/s1c3tH
        2CAfiNFvjVjeQLdC6ZFUyiakOfEZFlpTVXTCrXvYlw==
X-Google-Smtp-Source: ABdhPJwwldgLR3Q8ZK3JlqDBoC69a2fzONh0YE19VpOVYJm+HkSixlLL4VoTULoPUl8unZ+IT10oI5oFLZ78XmnumDw=
X-Received: by 2002:a17:903:2451:b0:14a:8c5c:97fe with SMTP id
 l17-20020a170903245100b0014a8c5c97femr32901956pls.145.1642681797692; Thu, 20
 Jan 2022 04:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-1-jsd@semihalf.com> <2f7610dc-ab57-ddbf-277f-e84680da71bd@redhat.com>
In-Reply-To: <2f7610dc-ab57-ddbf-277f-e84680da71bd@redhat.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Thu, 20 Jan 2022 13:29:46 +0100
Message-ID: <CAOtMz3MDntus2OzRS_QDfnFpzrVjj4swQjTkgkFYMGuwgbZcWA@mail.gmail.com>
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

Hi Hans,


czw., 20 sty 2022 o 12:15 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi Jan,
>
> On 1/20/22 01:16, Jan Dabros wrote:
> > This patchset comprises support for new i2c-designware controller setup=
 on some
> > AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the s=
ame
> > controller and acts as an i2c arbitrator there (x86 is leasing bus from=
 it).
> >
> > First commit aims to improve generic i2c-designware code by adding extr=
a locking
> > on probe() and disable() paths. I would like to ask someone with access=
 to
> > boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to veri=
fy
> > behavior of my changes on such setup.
> >
> > Second commit adds support for new PSP semaphore arbitration mechanism.
> > Implementation is similar to the one from i2c-designware-baytrail.c how=
ever
> > there are two main differences:
> > 1) Add new ACPI ID in order to protect against silent binding of the ol=
d driver
> > to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added=
 to this
> > new _HID allows to recognize setup with PSP.
> > 2) Beside acquire_lock() and release_lock() methods we are also applyin=
g quirks
> > to the lock_bus() and unlock_bus() global adapter methods. With this in=
 place
> > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > transactions (e.g. write-wait-read) without being aware of that such bu=
s is
> > shared with another entity.
> >
> > This patchset is a follow-up to the RFC sent earlier on LKML [1], with =
review
> > comments applied.
> >
> > Looking forward to some feedback.
> >
> > [1] https://lkml.org/lkml/2021/12/22/219
>
>
> Thank you for your patch series.
>
> As you may have seen I've done a lot of work on the Bay Trail semaphore
> thing. I also own several Bay Trail and Cherry Trail based devices which
> use this setup.
>
> I'll add your patches to my personal WIP tree which I regularly run
> on these devices and I'll report back if I notice any issues.

Thanks in advance, this will be really helpful! I don't have Bay
Trail/Cherry Trail, so I've only tested that build of Bay Trail
semaphore isn't broken.

I would like to point to new locks in i2c_dw_disable() method as
something to be the most fragile and error-prone, will be great if you
can verify this thoroughly. This function is invoked on both
dw_i2c_driver.remove() and dw_i2c_plat_suspend() paths. Considering
that Bay Trail semaphore means that i2c bus is shared with PMIC, I'm
not sure whether all corner cases are secured especially on platform
suspend.

>
> One remark, I notice that there are no AMD people in the Cc, it
> would be good if you can find someone from AMD to look at this,
> also see my remarks to the 2nd patch in my reply to that patch.

This was partially discussed with AMD folks and you are right that I
should include someone from AMD to take a look at this. Thanks for all
your comments!

> Regards,
>
> Hans
>
>
>
>
> >
> > Jan Dabros (2):
> >   i2c: designware: Add missing locks
> >   i2c: designware: Add AMD PSP I2C bus support
> >
> >  MAINTAINERS                                  |   1 +
> >  drivers/acpi/acpi_apd.c                      |   1 +
> >  drivers/i2c/busses/Kconfig                   |  10 +
> >  drivers/i2c/busses/Makefile                  |   1 +
> >  drivers/i2c/busses/i2c-designware-amdpsp.c   | 357 +++++++++++++++++++
> >  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
> >  drivers/i2c/busses/i2c-designware-common.c   |  12 +
> >  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
> >  drivers/i2c/busses/i2c-designware-master.c   |   6 +
> >  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 ++++
> >  10 files changed, 469 insertions(+), 8 deletions(-)
> >  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
> >
>
