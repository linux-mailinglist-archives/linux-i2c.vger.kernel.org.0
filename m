Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A455332241
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 10:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCIJmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 04:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhCIJmQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 04:42:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55A6C06174A
        for <linux-i2c@vger.kernel.org>; Tue,  9 Mar 2021 01:42:15 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id 7so14497580wrz.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Mar 2021 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+8z683na594yqCX1pdVyG9428Cw3vR0wQavj58NFFZo=;
        b=uZuGomwiZeFsx3ITBzUpfm7pegICvujyD4CKFgnUSbvmW5uXbRTSvDucSDIqLod8Yd
         V83iS+04g3fo36BsTD7ne22jgr+PJnVHcQCYaVcRiTJJigIBut7M2Ob4Vm3v+TQNN82d
         YUelDSLEFuoiafHYhkilNJUad0Dvgc1dDN3xuqVJ1Tp5Y5TLkdKFrQABlTrR7UtWpJu9
         YasUP8wBgS1wBfUQedq8t7BkL/22Yn5QXFo5a3gUN+OlcNp2NyfizrgaScmSFIIg6tPn
         fCZAUWGq+qwFhGyQ/5s12SR5Xp3pl+/UuCKOftBHC4MMtaJqhraQS87vjxo38s1b2qmA
         eptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+8z683na594yqCX1pdVyG9428Cw3vR0wQavj58NFFZo=;
        b=k1DWLdItR2bWVntXu5PnBezw3b8ULmGrxUxmrMaB+obG4tdcpOEb/pt3YieRej1VyP
         0ijRfhd7TffQ80zX/HQn7xVy1Dsl4NEnzeC20iDmYT2uRGaX/lO0OpoBlC0Qd8iu3aVy
         iTRQnAlW1+XGF/viCkh5BUQHbuSbkANGJmIARLgsIGb4atVc3xNZLEdzR8xJIgQJ5hhd
         XCAK0oKL8lUDhiNM/VHIMD1KZCncmhdbiucI8zzYpx5cRHyjVe2DyUFcO2OOsklC30yJ
         9EqG7vVMV7167aipfhd1VCKNChyUe77XGXbf7SWejmT9qKYchBQFsImUkJo4/YUs1Wso
         y0hA==
X-Gm-Message-State: AOAM532yuQbhSWK3huwmqQ5p6Gr1uXkV/HGoqXYExcnsL6Hy9xwajSmo
        COl0TVBETEZbrShQcMIKWnuHiA==
X-Google-Smtp-Source: ABdhPJy9ZOKwri1W96ZaagyjWjomo9RwLfOcbQsi52dwi0VG20S/UVn4GNITZfNVngrfAlCKyqNZvg==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr26460044wrw.411.1615282934319;
        Tue, 09 Mar 2021 01:42:14 -0800 (PST)
Received: from dell ([91.110.221.130])
        by smtp.gmail.com with ESMTPSA id d85sm3223740wmd.15.2021.03.09.01.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 01:42:13 -0800 (PST)
Date:   Tue, 9 Mar 2021 09:42:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Jonas <toertel@gmail.com>
Cc:     Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Adam.Thomson.Opensource@diasemi.com, stwiss.opensource@diasemi.com,
        marek.vasut@gmail.com,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <tingquan.ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210309094211.GN4931@dell>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
 <20210308144211.GK4931@dell>
 <CAEE5dN3DcULAtmQ=4WjT3nD20AVV2sX=Yx1WSS1UuJsBWTgc3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEE5dN3DcULAtmQ=4WjT3nD20AVV2sX=Yx1WSS1UuJsBWTgc3g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 09 Mar 2021, Mark Jonas wrote:

> Hi Lee,
> 
> Thank you for having a look at the patch.
> 
> > > From: Hubert Streidl <hubert.streidl@de.bosch.com>
> > >
> > > By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> > > means the PMIC will automatically reset the interface when the clock
> > > signal ceases for more than the SMBus timeout of 35 ms.
> > >
> > > If the I2C driver / device is not capable of creating atomic I2C
> > > transactions, a context change can cause a ceasing of the clock signal.
> > > This can happen if for example a real-time thread is scheduled. Then
> > > the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> > > a write message could end up in the wrong register. This could cause
> > > unpredictable system behavior.
> > >
> > > The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> > > interface. This mode does not reset the interface when the clock
> > > signal ceases. Thus the problem depicted above does not occur.
> > >
> > > This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> > > reasonably be assumed that the bus cannot obey SMBus timings if
> > > this functionality is set. SMBus commands most probably are emulated
> > > in this case which is prone to the latency issue described above.
> > >
> > > This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> > > otherwise enables the SMBus mode for a native SMBus controller
> > > which doesn't have I2C_FUNC_I2C set.
> > >
> > > Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> > > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > > ---
> > > Changes in v4:
> > >   - Remove logging of selected 2-wire bus mode.
> > >
> > > Changes in v3:
> > >   - busmode now contains the correct bit DA9063_TWOWIRE_TO
> > >
> > > Changes in v2:
> > >   - Implement proposal by Adam Thomson and Wolfram Sang to check for
> > >     functionality I2C_FUNC_I2C instead of introducing a new DT property.
> > >
> > >  drivers/mfd/da9063-i2c.c             | 11 +++++++++++
> > >  include/linux/mfd/da9063/registers.h |  3 +++
> > >  2 files changed, 14 insertions(+)
> > >
> > > diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> > > index 3781d0bb7786..9450c95a3741 100644
> > > --- a/drivers/mfd/da9063-i2c.c
> > > +++ b/drivers/mfd/da9063-i2c.c
> > > @@ -355,6 +355,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
> > >                           const struct i2c_device_id *id)
> > >  {
> > >       struct da9063 *da9063;
> > > +     unsigned int busmode;
> > >       int ret;
> > >
> > >       da9063 = devm_kzalloc(&i2c->dev, sizeof(struct da9063), GFP_KERNEL);
> > > @@ -442,6 +443,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
> > >               return ret;
> > >       }
> > >
> > > +     busmode = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C) ?
> > > +                   0 : DA9063_TWOWIRE_TO;
> >
> > Nit: I find ternaries like this tend to complicate matters and
> > harm readability rather than the converse.
> 
> We can send an update of the patch if required.
> 
> > > +     ret = regmap_update_bits(da9063->regmap, DA9063_REG_CONFIG_J,
> > > +           DA9063_TWOWIRE_TO, busmode);
> > > +     if (ret < 0) {
> > > +             dev_err(da9063->dev, "Failed to set 2-wire bus mode.\n");
> > > +             return -EIO;
> > > +     }
> >
> > I'm a little confused by this.  It's likely just me, but I would still
> > like some clarification.
> >
> > So you write to the TWOWIRE register despite whether I2C is operable
> > not, which I guess is fine.
> 
> In our understanding at this point the I2C / SMBus is definitely
> operable. Otherwise the call to da9063_get_device_type() would have
> already failed because it reads the chip ID via I2C / SMBus.
> 
> > But what if I2C is disabled and the update fails.  You seem to complain
> > to the user that a failure occurred and return an error even if the
> > configuration is invalid in the first place.
> >
> > Would it not be better to encapsulate the update inside the
> > functionality check?
> 
> Do you mean i2c_check_functionality() with "functionality check"? I
> understood that this function is part of the I2C / SMBus subsystem. It
> checks available features of the I2C / SMBus controller. As proposed
> during review of this patch we check for I2C_FUNC_I2C to determine
> whether the controller can do SMBus or if it is limited to I2C
> functionality. If the controller can only do I2C then the DA9063 shall
> not expect SMBus.
> 
> By default the DA9063 assumes that it is connected to an SMBus. Thus,
> even with our patch there are potentially still two (get chip ID, set
> 2-wire mode) accesses to the DA9063 by an I2C controller but the
> DA9063 assumes SMBus. Yet, our patch closes the window of opportunity
> for something bad to happen from maybe one accesse per second to two
> accesses over the complete lifetime of the driver. I think this is
> already pretty good.
> 
> If you have a concrete proposal we could try to improve further. But
> one write access for setting the twowire mode will always be there.
> And without the call to da9063_get_device_type() this would also have
> to be "hard-coded" without the use of the regmap.
> 
> I consider our patch being already that much better than the current
> state that it is worth taking it mainline. Without the patch our
> system triggers the fault during normal operation. Even with heavy
> stress testing we have not been able to trigger the fault once our
> patch was applied.

This is my suggestion:

	/* If SMBus Mode is not available, enter Two-Wire Mode */
	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
		ret = regmap_update_bits(da9063->regmap, DA9063_REG_CONFIG_J,
					 DA9063_TWOWIRE_TO, DA9063_TWOWIRE_TO);
		if (ret < 0) {
			dev_err(da9063->dev, "Failed to set Two-Wire Bus Mode\n");
			return -EIO;
		}
	}

> > >       return da9063_device_init(da9063, i2c->irq);
> > >  }
> > >
> > > diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
> > > index 1dbabf1b3cb8..6e0f66a2e727 100644
> > > --- a/include/linux/mfd/da9063/registers.h
> > > +++ b/include/linux/mfd/da9063/registers.h
> > > @@ -1037,6 +1037,9 @@
> > >  #define              DA9063_NONKEY_PIN_AUTODOWN      0x02
> > >  #define              DA9063_NONKEY_PIN_AUTOFLPRT     0x03
> > >
> > > +/* DA9063_REG_CONFIG_J (addr=0x10F) */
> > > +#define DA9063_TWOWIRE_TO                    0x40
> > > +
> > >  /* DA9063_REG_MON_REG_5 (addr=0x116) */
> > >  #define DA9063_MON_A8_IDX_MASK                       0x07
> > >  #define              DA9063_MON_A8_IDX_NONE          0x00
> 
> I am currently out of office. In case of change requirements we'll
> most likely send an updated patch mid of next week.
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
