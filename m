Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7716332061
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 09:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhCIIUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 03:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhCIIUI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 03:20:08 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F958C06174A;
        Tue,  9 Mar 2021 00:20:08 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id p10so11401576ils.9;
        Tue, 09 Mar 2021 00:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MSMjMCqP63jDMehRjkPECi23yTB9JQhxuj3AVIVNIhI=;
        b=Jpb6PBZZPSNdGJ/67sPwdbiWJ+tyIU0KIqh01E0Hn+4QFSzd4XHV3zxmHb2ZFvcrfE
         qoxW3jsMvEIKfaTGClg3+opJ5SyC9VHykJiuKfKonG7Xhbb+E0c3X210+F3PRUXvV4d7
         40duBJI0sR3pCCg9MWzWPbaVLqbqBx/DoZvR2cWfvA6iHQNM5RbRhhKBogUAH6gHebKA
         DhWFKefjGCyJuA5uW/LZ21tOJ9Uy34+LoXK928SI2J4TbnevxXl/TwQmmD8/Rvo2OvJV
         eOQGnvLkIc375vRgAUCj4BHk1NC24l2/QqkkCmk2mJ24dSkYof6z2pHTmJ1vBc8YxV04
         VutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MSMjMCqP63jDMehRjkPECi23yTB9JQhxuj3AVIVNIhI=;
        b=DlxYSO/hXPIEqDK0z2H0F+RskG37JQBXRO1VZvgFlKFiceCu8hGQcy0WUs9Okc9kDe
         m35tcGkm9jl2b9Pr6FxbYagCpoHen6yF0o8mNu0FKjmh1R1ioxPf97nqlPQN3JsZGZtk
         hg6/nv66uZd674eV1FLC4ocWZd+pC+EsHSyMbhtsznUV0y4TEzpAlAXseoI9IRorb/+Y
         v4fE9fh0dxf+spfzUjcScwP4BREa28sEnSQX/EW6NUXcDxcWjNQbHQT6vn6nFs7qSTcc
         ulkxwzbGFEnSHos/g9/wCu7T66SO//HuD8GAFVIaItuG6j/gFpHTu42r/06QSMka9gRR
         uJWQ==
X-Gm-Message-State: AOAM530nFLGP4XvZuvD4b5nMUExmh5+INxWqViZT7oaby8OkUmFCBz6N
        BdfKe5pu1nI9PrEedgCYZig156rVWEFleliyUeM=
X-Google-Smtp-Source: ABdhPJyp8q1w0C35q/KrRn3hEEDi6VIoZhaxT8ePN+NlaJN1rB9ynTKW4tw5Kfz2epmyrDjaNl+f15rVPzEbS04dSsY=
X-Received: by 2002:a05:6e02:d4e:: with SMTP id h14mr23392685ilj.80.1615278007404;
 Tue, 09 Mar 2021 00:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20210208152758.13093-1-mark.jonas@de.bosch.com> <20210308144211.GK4931@dell>
In-Reply-To: <20210308144211.GK4931@dell>
From:   Mark Jonas <toertel@gmail.com>
Date:   Tue, 9 Mar 2021 09:19:56 +0100
Message-ID: <CAEE5dN3DcULAtmQ=4WjT3nD20AVV2sX=Yx1WSS1UuJsBWTgc3g@mail.gmail.com>
Subject: Re: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Adam.Thomson.Opensource@diasemi.com, stwiss.opensource@diasemi.com,
        marek.vasut@gmail.com,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <tingquan.ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

Thank you for having a look at the patch.

> > From: Hubert Streidl <hubert.streidl@de.bosch.com>
> >
> > By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> > means the PMIC will automatically reset the interface when the clock
> > signal ceases for more than the SMBus timeout of 35 ms.
> >
> > If the I2C driver / device is not capable of creating atomic I2C
> > transactions, a context change can cause a ceasing of the clock signal.
> > This can happen if for example a real-time thread is scheduled. Then
> > the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> > a write message could end up in the wrong register. This could cause
> > unpredictable system behavior.
> >
> > The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> > interface. This mode does not reset the interface when the clock
> > signal ceases. Thus the problem depicted above does not occur.
> >
> > This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> > reasonably be assumed that the bus cannot obey SMBus timings if
> > this functionality is set. SMBus commands most probably are emulated
> > in this case which is prone to the latency issue described above.
> >
> > This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> > otherwise enables the SMBus mode for a native SMBus controller
> > which doesn't have I2C_FUNC_I2C set.
> >
> > Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > ---
> > Changes in v4:
> >   - Remove logging of selected 2-wire bus mode.
> >
> > Changes in v3:
> >   - busmode now contains the correct bit DA9063_TWOWIRE_TO
> >
> > Changes in v2:
> >   - Implement proposal by Adam Thomson and Wolfram Sang to check for
> >     functionality I2C_FUNC_I2C instead of introducing a new DT property.
> >
> >  drivers/mfd/da9063-i2c.c             | 11 +++++++++++
> >  include/linux/mfd/da9063/registers.h |  3 +++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> > index 3781d0bb7786..9450c95a3741 100644
> > --- a/drivers/mfd/da9063-i2c.c
> > +++ b/drivers/mfd/da9063-i2c.c
> > @@ -355,6 +355,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
> >                           const struct i2c_device_id *id)
> >  {
> >       struct da9063 *da9063;
> > +     unsigned int busmode;
> >       int ret;
> >
> >       da9063 = devm_kzalloc(&i2c->dev, sizeof(struct da9063), GFP_KERNEL);
> > @@ -442,6 +443,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
> >               return ret;
> >       }
> >
> > +     busmode = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C) ?
> > +                   0 : DA9063_TWOWIRE_TO;
>
> Nit: I find ternaries like this tend to complicate matters and
> harm readability rather than the converse.

We can send an update of the patch if required.

> > +     ret = regmap_update_bits(da9063->regmap, DA9063_REG_CONFIG_J,
> > +           DA9063_TWOWIRE_TO, busmode);
> > +     if (ret < 0) {
> > +             dev_err(da9063->dev, "Failed to set 2-wire bus mode.\n");
> > +             return -EIO;
> > +     }
>
> I'm a little confused by this.  It's likely just me, but I would still
> like some clarification.
>
> So you write to the TWOWIRE register despite whether I2C is operable
> not, which I guess is fine.

In our understanding at this point the I2C / SMBus is definitely
operable. Otherwise the call to da9063_get_device_type() would have
already failed because it reads the chip ID via I2C / SMBus.

> But what if I2C is disabled and the update fails.  You seem to complain
> to the user that a failure occurred and return an error even if the
> configuration is invalid in the first place.
>
> Would it not be better to encapsulate the update inside the
> functionality check?

Do you mean i2c_check_functionality() with "functionality check"? I
understood that this function is part of the I2C / SMBus subsystem. It
checks available features of the I2C / SMBus controller. As proposed
during review of this patch we check for I2C_FUNC_I2C to determine
whether the controller can do SMBus or if it is limited to I2C
functionality. If the controller can only do I2C then the DA9063 shall
not expect SMBus.

By default the DA9063 assumes that it is connected to an SMBus. Thus,
even with our patch there are potentially still two (get chip ID, set
2-wire mode) accesses to the DA9063 by an I2C controller but the
DA9063 assumes SMBus. Yet, our patch closes the window of opportunity
for something bad to happen from maybe one accesse per second to two
accesses over the complete lifetime of the driver. I think this is
already pretty good.

If you have a concrete proposal we could try to improve further. But
one write access for setting the twowire mode will always be there.
And without the call to da9063_get_device_type() this would also have
to be "hard-coded" without the use of the regmap.

I consider our patch being already that much better than the current
state that it is worth taking it mainline. Without the patch our
system triggers the fault during normal operation. Even with heavy
stress testing we have not been able to trigger the fault once our
patch was applied.

> >       return da9063_device_init(da9063, i2c->irq);
> >  }
> >
> > diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
> > index 1dbabf1b3cb8..6e0f66a2e727 100644
> > --- a/include/linux/mfd/da9063/registers.h
> > +++ b/include/linux/mfd/da9063/registers.h
> > @@ -1037,6 +1037,9 @@
> >  #define              DA9063_NONKEY_PIN_AUTODOWN      0x02
> >  #define              DA9063_NONKEY_PIN_AUTOFLPRT     0x03
> >
> > +/* DA9063_REG_CONFIG_J (addr=0x10F) */
> > +#define DA9063_TWOWIRE_TO                    0x40
> > +
> >  /* DA9063_REG_MON_REG_5 (addr=0x116) */
> >  #define DA9063_MON_A8_IDX_MASK                       0x07
> >  #define              DA9063_MON_A8_IDX_NONE          0x00

I am currently out of office. In case of change requirements we'll
most likely send an updated patch mid of next week.

Cheers,
Mark
