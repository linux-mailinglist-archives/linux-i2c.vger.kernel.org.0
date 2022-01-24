Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164D3497D3A
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 11:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbiAXKdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 05:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbiAXKdj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 05:33:39 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B446FC06173B
        for <linux-i2c@vger.kernel.org>; Mon, 24 Jan 2022 02:33:38 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id l17so8828979plg.1
        for <linux-i2c@vger.kernel.org>; Mon, 24 Jan 2022 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xuZZHkIuEnvDpyJcRake/wQb+VN1KTh62QLAapj5S6A=;
        b=yP3/Yb6xFM6+tLxjq5XcIad0refYGallErDeE9C88nR55gLVvfTPJ88r6MTD++X6WO
         8YHrHPqyc4NtBwhov02CQWHZnBTahB2EwJ2YSVjfSomgxUoPXtA5LHUMzQAGwIR4RpFj
         RpwJbKue+JC1gMUyUcajyC4AcFFV5NNFWAwQsIu0HTIznMdhbGlQ3pfkjUALHHVHnkbD
         J4luQJJR1LdEo4eB228pOZ5o9+lxkTHet1xEtmg2DrQoTSMDPojAQEj0/rA11K9V6kCD
         QVtSjwDQ9/RBV43vgO+0pDKYssXJQVqyw3knC6hckiw9OPSkJSNpHJphUaPWdecd7wz3
         RfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xuZZHkIuEnvDpyJcRake/wQb+VN1KTh62QLAapj5S6A=;
        b=Y5aBnVK9IeuxEQgIVOKiRHqqFZ/TNp1h2YMl5LoOKSIHdSJ+3J3De/n7Lq8d+qc/u/
         Iez3IZsRaETdIi4XVmqQg35rsVd48cYMWGieRjSf9gFwx3DMDKyB5IdnMipJa5XAN2oo
         TyYpJLc/9RhRl2IkhV5qVW3qxLl58C65arr1AnOcnklazNu7kUbdVbSCvmEz/plyJ2nO
         O1+bkO/jLta8gzkKy3b+/LhxSsSfCRxELbbM5rV0tMQtVdGjX8/R8Pe/CP/ojXgi2zFp
         7fopcM05M4w5J50ylBkF514yHusjHlcisuFoJsT7yh9zNZckqP5fLJQZPx+S/FmHkMXW
         j4fg==
X-Gm-Message-State: AOAM533XstFREj2eVSUIBnbEt47syMtKAgAyXyVk23RWxlGBlPJ6R4gN
        QOCPzbvvUYo/MamDC+70TSTm0/1kk+O68AmOGjMELQ==
X-Google-Smtp-Source: ABdhPJwuFbZnb2vERsmDh601w9ewh9vuqyRtmzf3a2qbtmwp4E0LvoNexgMawcQOJKUxEcrYp5o7jRcK77wK63Zw+fY=
X-Received: by 2002:a17:90b:1bcc:: with SMTP id oa12mr1306143pjb.4.1643020418211;
 Mon, 24 Jan 2022 02:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-1-jsd@semihalf.com> <20220120001621.705352-2-jsd@semihalf.com>
 <5bec947e-272b-cfa0-b9b6-4d0d2626153f@redhat.com>
In-Reply-To: <5bec947e-272b-cfa0-b9b6-4d0d2626153f@redhat.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 24 Jan 2022 11:33:27 +0100
Message-ID: <CAOtMz3ONrgq3QCvMqQHxiQhhaGuEY8PG4hLbFt4r9T9+ALG_iA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: designware: Add missing locks
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

czw., 20 sty 2022 o 12:25 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi,
>
> On 1/20/22 01:16, Jan Dabros wrote:
> > All accesses to controller's registers should be protected on
> > probe, disable and xfer paths. This is needed for i2c bus controllers
> > that are shared with but not controller by kernel.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

Best Regards,
Jan

>
>
> Regards,
>
> Hans
>
>
> > ---
> >  drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
> >  drivers/i2c/busses/i2c-designware-master.c |  6 ++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/b=
usses/i2c-designware-common.c
> > index bf2a4920638a..9f8574320eb2 100644
> > --- a/drivers/i2c/busses/i2c-designware-common.c
> > +++ b/drivers/i2c/busses/i2c-designware-common.c
> > @@ -578,7 +578,12 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
> >        * Try to detect the FIFO depth if not set by interface driver,
> >        * the depth could be from 2 to 256 from HW spec.
> >        */
> > +     ret =3D i2c_dw_acquire_lock(dev);
> > +     if (ret)
> > +             return ret;
> > +
> >       ret =3D regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
> > +     i2c_dw_release_lock(dev);
> >       if (ret)
> >               return ret;
> >
> > @@ -607,6 +612,11 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
> >  void i2c_dw_disable(struct dw_i2c_dev *dev)
> >  {
> >       u32 dummy;
> > +     int ret;
> > +
> > +     ret =3D i2c_dw_acquire_lock(dev);
> > +     if (ret)
> > +             return;
> >
> >       /* Disable controller */
> >       __i2c_dw_disable(dev);
> > @@ -614,6 +624,8 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
> >       /* Disable all interrupts */
> >       regmap_write(dev->map, DW_IC_INTR_MASK, 0);
> >       regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
> > +
> > +     i2c_dw_release_lock(dev);
> >  }
> >
> >  void i2c_dw_disable_int(struct dw_i2c_dev *dev)
> > diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/b=
usses/i2c-designware-master.c
> > index 9177463c2cbb..1a4b23556db3 100644
> > --- a/drivers/i2c/busses/i2c-designware-master.c
> > +++ b/drivers/i2c/busses/i2c-designware-master.c
> > @@ -905,7 +905,13 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
> >               irq_flags =3D IRQF_SHARED | IRQF_COND_SUSPEND;
> >       }
> >
> > +     ret =3D i2c_dw_acquire_lock(dev);
> > +     if (ret)
> > +             return ret;
> > +
> >       i2c_dw_disable_int(dev);
> > +     i2c_dw_release_lock(dev);
> > +
> >       ret =3D devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flag=
s,
> >                              dev_name(dev->dev), dev);
> >       if (ret) {
> >
>
