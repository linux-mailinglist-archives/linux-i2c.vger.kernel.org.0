Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F406647D8F5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 22:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240392AbhLVVvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 16:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbhLVVvp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 16:51:45 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C803BC061574
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 13:51:44 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id m1so3497467pfk.8
        for <linux-i2c@vger.kernel.org>; Wed, 22 Dec 2021 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XR5HZ8sBD6KqfqAJLnZ1oNJ4TBXtR9dqhwDXNbHKhS4=;
        b=lDQIImQaEYK1jwmRfunWLbYIDBg1GuI3zqkgNuH1fnjpbRSMR1KNfyOKDKakfaYnQ0
         QOLssC/vQTxZHaDFrDmYy9wJ81caBoRUsNJA1rAm9ZqdzX0riG2XuFu4umh2hF131hN/
         IA0dVi+upjQVNvwNxMfCPCDXKMFMe4RV4jTwdlFchARJ1PpjO88c2G2mvtPqc1D6IYTW
         ppUl57Tc5yAPQRLrf6bWjPHLuGbUdU7zj3c/Yhb7rJnWP2ZUETmlHsHj16K2GE6ByfyT
         1C8NJvYApyjt7HjNkV5Uu9cKoesDAA1WIbCCpvLuDJbG2yZCxjB2hRu80Y7n0ZNapFw8
         xstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XR5HZ8sBD6KqfqAJLnZ1oNJ4TBXtR9dqhwDXNbHKhS4=;
        b=Zj5oy0OE1INNGnEaRs02YR/AiOXzsKqQCMZ+9bmvEYhsLdrFFjRIYRkpzbsfJ+oifJ
         7lGSsS/0Vxr78LE7Q9FG62g8ZqRkQ5ObSNRLms1nz+rvezPaHeaPJu6rjHA816NYkM6G
         cxAGXs/2jwXY0H3I+va1ufh8ODlCJwJ8s3zZtBTrGmv274wm3+G4oHPiYg/pZZHGFsl+
         8CPUm36m+Bou6AtJM35W/8WNs3s0by7B9wzOFAmUcWmqcHegMaRtAwRNkXuOf4khvXRw
         KXaBJNiF8BIl7WLjTXQAFxwL22HH2os5Nfda5oVt3z4++WlulUsiFOhQ/PigmPFkyKG+
         z0Dg==
X-Gm-Message-State: AOAM533iLm3wxNxxerWiVgrYYAs1MYZ4QOUfFPMGiNXciPyaI4kZ1LaI
        SR0wT9fvE8usGu7HKlMCYzdqf7xn9eQMEluviOLMow==
X-Google-Smtp-Source: ABdhPJxZod9LDceTnU0n582kSTjuCtX6RNUOLx6TN8oPLPDel/u4HZrJdP0Si+DQDkxU59R//YQAGXxW/801byXgnNA=
X-Received: by 2002:a05:6a00:10d3:b0:4a4:e516:826f with SMTP id
 d19-20020a056a0010d300b004a4e516826fmr4755717pfu.70.1640209904258; Wed, 22
 Dec 2021 13:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20211222094558.2098791-1-jsd@semihalf.com> <YcMP/9ATna3/yckC@smile.fi.intel.com>
 <20211222175621.7gikyvqu7xvc2qxb@mobilestation> <YcNsm+/JRJIlo/h2@smile.fi.intel.com>
In-Reply-To: <YcNsm+/JRJIlo/h2@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Wed, 22 Dec 2021 22:51:33 +0100
Message-ID: <CAOtMz3OhB99cyA8dL6r=RJUPcSLbao5QmuiPmPGqDdDbqwFb3g@mail.gmail.com>
Subject: Re: [RFC 0/2] i2c-designware: Add support for AMD PSP semaphore
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Serge, Andy,

Thanks for your comments. Glad to hear that this work may (possibly)
be helpful for even broader audience. For most of the stuff I tried to
create generic code and actually these solutions are already meant to
be shared with platforms using baytrail semaphore.

Best Regards,
Jan


=C5=9Br., 22 gru 2021 o 19:22 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Wed, Dec 22, 2021 at 08:56:21PM +0300, Serge Semin wrote:
> > On Wed, Dec 22, 2021 at 01:46:07PM +0200, Andy Shevchenko wrote:
> > > On Wed, Dec 22, 2021 at 10:45:56AM +0100, Jan Dabros wrote:
> > > > This patchset comprises support for new i2c-designware controller s=
etup on some
> > > > AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses t=
he same
> > > > controller and acts as an i2c arbitrator there (x86 is leasing bus =
from it).
> > > >
> > > > First commit aims to improve generic i2c-designware code by adding =
extra locking
> > > > on probe() and disable() paths. I would like to ask someone with ac=
cess to
> > > > boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to =
verify
> > > > behavior of my changes on such setup.
> > > >
> > > > Second commit adds support for new PSP semaphore arbitration mechan=
ism.
> > > > Implementation is similar to the one from i2c-designware-baytrail.c=
 however
> > > > there are two main differences:
> > > > 1) Add new ACPI ID in order to protect against silent binding of th=
e old driver
> > > > to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE a=
dded to this
> > > > new _HID allows to recognize setup with PSP.
> > > > 2) Beside acquire_lock() and release_lock() methods we are also app=
lying quirks
> > > > to the lock_bus() and unlock_bus() global adapter methods. With thi=
s in place
> > > > all i2c clients drivers may lock i2c bus for a desired number of i2=
c
> > > > transactions (e.g. write-wait-read) without being aware of that suc=
h bus is
> > > > shared with another entity.
> > > >
> > > > Mark this patchset as RFC, since waiting for new ACPI ID value. As =
a temporary
> > > > measure use "AMDI9999". Once proper one will be ready, will re-send=
 this CL for
> > > > review & merge.
> > > >
> > > > Looking forward to some feedback.
> > >
> > > If I am not mistaken something similar happened in Baikal T1.
> > > Perhaps Serge has something to share.
> >
> > No, Baikal-T1 doesn't have such specific interface sharing since it
> > doesn't have any co-processor (though a scenario of booting different
> > kernels on each CPU core was at consideration by some our customers).
> > So the only peculiar things the SoC has got are two interfaces with
> > non-standard access:
> > 1) DW SPI controller with memory mapped 16MB direct EEPROM access. DW
> > SPI CSR/EEPROM mapping are switched by a multiplexer (basically just a
> > flag) embedded into the system controller.
> > 2) DW i2c controller with indirect registers access. Originally it was
> > supposed to be used by the system bootloader for some bootloading
> > stuff, but the actual usage scenario wasn't described by the SoC
> > engineers. The chip initially loads the code from the SPI-flash only,
> > which can be of up to 16MB size. It's more than enough to start pretty
> > complex systems, so an additional i2c interface turned to be not
> > really needed. Anyway other than having an indirectly accessible
> > CSRs it's pretty much normal DW I2C controller.
> >
> > But you are right in a reference to another BE-chip - Baikal-M1. The
> > i2c/spi/gpio/uart interfaces sharing support might get to be needed
> > for it since aside with four 2-cored Cortex-A57 clusters it has got an
> > embedded SCP co-processor which can access the same SoC interfaces as
> > the CPU cores. Though Baikal-M1 isn't supported by the mainline kernel
> > at the moment. We are going to start working on it on the next year.
> > Then we'll most likely need to implement the interface sharing feature
> > like the one introduced in this RFC. But for now alas I can't be much
> > helpful.
>
> Anyway, thanks for your insights!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
