Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC80133D131
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 10:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhCPJy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 05:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbhCPJyH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 05:54:07 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD488C06174A
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 02:54:06 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u16so10112920wrt.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YGgrY+UQz0yyfpooSgNBPEdgM8O/LnKtJy24CPMkDk4=;
        b=J4hILAogY9NYJY2rQsjTFJ2g2+IXUJYSXzpUiwEn66hrnbJWGmq7soF/FqfWTaUdw/
         LEHH9dvCE9vu6aT7VtNMzP+C520L81vILqWt2s7WS/GtDw0qIHakVrJ80gQgOP6AfuHW
         Wj1h/CTcf4WANtB2q6vORaTHqiRoc0d+YP8+FcQ/hWOtjjCnAekHok0dL5FD03BFsn89
         38OwQhPOSspZgy8XTqvaTa77XtrHmIX5A9SpqrYZ0yxMzM/Q104MW8VnhsouQq9Uh+we
         uBxO1kbmaMDRFTke4e2aOCfjMOFh/yzUSHT5Ffxkq50aFKrx5XggpFOyCiCaHD8nXU0Q
         4ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YGgrY+UQz0yyfpooSgNBPEdgM8O/LnKtJy24CPMkDk4=;
        b=ucvXFB4cxuNdnA2LWGUlEvU5QuEtHkz9xiWPJnhToNqI5H0vbBzfIrfZHTPQFuoOfg
         6lDUkTv/tXzQIGil9CPWQtjx9o3kaXa25IWtzg3dfITUnpMl7EBjUbkq19ttXes1L0br
         ZbVgFBIJc+WJeoqW7KuYwwGIU+v5M7yutRIaaBKeeuW7bOHoQhnLBb0AiF6Mfbwq215h
         Hiq+aLtdCOy91bjG/nzKVLU7XdXzBGfsfjlx2US2ej0g5V192JrZAqwcncF9pdnJ2iu+
         2MXZ80/jAnCAabJUFhlJ0nA8s6gppTWEtPjzkIhZEN/CDXpc7A5cWDG7pnCI/S553hLT
         r7jA==
X-Gm-Message-State: AOAM5328plf9omKPEu3GG1TnKLHxpwOKDVBW9r1NgNokm6ktwx46WaQG
        7MbIV4c/76INObkNuNef/mVOIQ==
X-Google-Smtp-Source: ABdhPJwOhbJWr/ukr1KQmlHy6R21fiPxX3G8mrMaAroA5wVQ4ry3KaakIEexLwXRpS1JXDhnOVLjgg==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr4053098wrn.6.1615888445464;
        Tue, 16 Mar 2021 02:54:05 -0700 (PDT)
Received: from dell ([91.110.221.243])
        by smtp.gmail.com with ESMTPSA id m11sm21847679wrz.40.2021.03.16.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 02:54:05 -0700 (PDT)
Date:   Tue, 16 Mar 2021 09:54:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Adam.Thomson.Opensource@diasemi.com" 
        <Adam.Thomson.Opensource@diasemi.com>,
        "stwiss.opensource@diasemi.com" <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v5] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210316095403.GB701493@dell>
References: <20210315160903.799426-1-mark.jonas@de.bosch.com>
 <20210316072143.GA701493@dell>
 <4dbc130e769547508be811e61a348255@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dbc130e769547508be811e61a348255@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Mar 2021, Jonas Mark (BT-FIR/ENG1-Grb) wrote:

> Hi Lee,
> 
> > Code looks good to me now, thanks.
> > 
> > However, this doesn't look like it would pass checkpatch.
> > 
> > Have you tried to build with W=1 and checkpatch?
> 
> Yes, we used checkpatch.pl.
> 
>     $ ./scripts/checkpatch.pl 0001-mfd-da9063-Support-SMBus-and-I2C-mode.v5
>     total: 0 errors, 0 warnings, 25 lines checked
> 
>     0001-mfd-da9063-Support-SMBus-and-I2C-mode.v5 has no obvious style problems and is ready for submission.
> 
> Using the option --strict we get a check hint that the broken line
> of the regmap_clear_bits() is not aligned. We tried but were not
> able to make the tool happy. This matches our experience with this
> check hint and previous patches.

Lining up the first char of the broken line with the open parenthesis
will make checkpatch happy.  It's easier if you configure your editor
to always do this, rather than with strict tabs.

> Also compiling Linux 5.10.14 with our patch and W=1 does not yield a warning.
> 
>     $ make W=1
>       CALL    scripts/checksyscalls.sh
>       CALL    scripts/atomic/check-atomics.sh
>       CHK     include/generated/compile.h
>       CC [M]  drivers/mfd/da9063-i2c.o
>       LD [M]  drivers/mfd/da9063.o
>       Kernel: arch/arm/boot/Image is ready
>       Kernel: arch/arm/boot/zImage is ready
>       MODPOST Module.symvers
>       LD [M]  drivers/mfd/da9063.ko
> 
> > > diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c index
> > > 3781d0bb7786..e8a022e697c5 100644
> > > --- a/drivers/mfd/da9063-i2c.c
> > > +++ b/drivers/mfd/da9063-i2c.c
> > > @@ -442,6 +442,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
> > >  		return ret;
> > >  	}
> > >
> > > +	/* If SMBus is not available and only I2C is possible, enter I2C mode */
> > > +	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> > > +		ret = regmap_clear_bits(da9063->regmap,
> > DA9063_REG_CONFIG_J,
> > > +			  DA9063_TWOWIRE_TO);
> > > +		if (ret < 0) {
> > > +			dev_err(da9063->dev, "Failed to set Two-Wire Bus
> > Mode.\n");
> > > +			return -EIO;
> > > +		}
> > > +	}
> > > +
> > >  	return da9063_device_init(da9063, i2c->irq);  }
> > >
> > > diff --git a/include/linux/mfd/da9063/registers.h
> > > b/include/linux/mfd/da9063/registers.h
> > > index 1dbabf1b3cb8..6e0f66a2e727 100644
> > > --- a/include/linux/mfd/da9063/registers.h
> > > +++ b/include/linux/mfd/da9063/registers.h
> > > @@ -1037,6 +1037,9 @@
> > >  #define		DA9063_NONKEY_PIN_AUTODOWN	0x02
> > >  #define		DA9063_NONKEY_PIN_AUTOFLPRT	0x03
> > >
> > > +/* DA9063_REG_CONFIG_J (addr=0x10F) */
> > > +#define DA9063_TWOWIRE_TO			0x40
> > > +
> > >  /* DA9063_REG_MON_REG_5 (addr=0x116) */
> > >  #define DA9063_MON_A8_IDX_MASK			0x07
> > >  #define		DA9063_MON_A8_IDX_NONE		0x00
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
