Return-Path: <linux-i2c+bounces-2750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F2896F37
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 14:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78758284B2D
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AB8146D57;
	Wed,  3 Apr 2024 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXt607An"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89015C8F4;
	Wed,  3 Apr 2024 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148474; cv=none; b=X0S1OUxSbmWiMiVB58TIGqf3NpsvIs9PsRZHUln//lc1jeDVZd07nnqTIMx+o1Nx6iejSQLp5f6Eo/16q3cZS/XZLRp6FK0AtxOjVEI/FX2xbdLOZ3H94JExVbuSDmIpUg0JLlpUYCHvMtrpu9WbrWa7VUUXT8GkPZWtj8Iwcs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148474; c=relaxed/simple;
	bh=Yaqa4hvoBG8RPxnP1QDyCJ05NplxTgr5jhi1BxYxxCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/gF/lUd1MPW4doglks9DMu8KVMN9nk00Z52XilMYJlMYItnqE8bV9Zr2VoySIr1qFSdnnzaJETgVTxoWCuErkE+Q9pIxxVPEP0G00RqyGs0nU6FBZpBy98ooFbNF2HIGiTHxRNBFOHd2X1zKZg4WCpitceVruwJDNpQnc6jPLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXt607An; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-222b6a05bb1so4453304fac.3;
        Wed, 03 Apr 2024 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712148472; x=1712753272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtecu7pbCOzcU6lg6jomsrlGzCnl9MEDMOfvGJlD74o=;
        b=gXt607Anqa8knPlvNYiQ7EZYUcKiBjT9y07ZPG2JlP0E39pqSICCAh2xk4/kerVR7L
         88Hkl/snfRyKX9mM9FRBwZdyj5EJoMpQciWde3BIg4+Zwkb1jlsYbwtC3oK7A1Tg5b5q
         Tx4ZbJP3ljHdNYVusMU9xEkEvYs0fpwXycfKINeppHq7oSiNQ95kdeTvOBWSYap9jVH6
         CTxfEsO2hb84T7zt20NXdFaCMDMrSiqPbwVFeiddb0/CAwv8X2iNs+81BxzgYp4rIalm
         3LDcS2JwR0OH9droCRTlp2XwBP/VbMaGxkphATmNfXYsbAQAgUKIEmv5VY+OF60eBSJN
         yHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148472; x=1712753272;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rtecu7pbCOzcU6lg6jomsrlGzCnl9MEDMOfvGJlD74o=;
        b=vKUfGa0A4IEzdip8muYSg4+QbJ2s5cXSFd2sHI8tCXKMh4lmEJ6EguRaefXY8q15ak
         cxIybHvvzunnbI816PISmdkWX3zvyUn2C9bR2wmSdRYnG3TKSsXm6kfk+rlC2O2XvcAX
         xuD51kBXNLVB8x+/t9sBuVieH8eVDpxE005Gw+UjvggbHK8AKauPa5zrp7ylxPPgbIMl
         4zt0bE7g6yApCLSXrhEQEq0k4WOb9a3Y1r2VNEZjd6nZ1Q2/o89KQ9gvh3JiDxYLQGJi
         K5O0PMERGYYRYgLUS55NQyrOXz3db7YycpYA+WDEtDMxY/kn8UmtztvFdJZbZ4JHuRcU
         Lt5w==
X-Forwarded-Encrypted: i=1; AJvYcCXJGg21+7h1ozg3odxY9r3GjKFzLywzTM98JkUmgbhYdWKoPm0I0SGjiZOT8FukomItd2/x3DLiFr43eveSE4Cg70PSjMFqz8rIyih14biKAkKnpiFAa43omE7gR6y+NRc9f+4cbuxfLlufjq61uvb4nIqoL1cZgOq5eS/hKjOtsrx/IDfXIRWlbM/+3FI4bPVDNUjArCYbVy8SgRmProG/DGrBS3M8hB6adcFTNwwZka/LBpDYBhL6XQErgq/6/E7zZc47goD+TrankLR3G0FYZtTe4DImH6xgHYKvKpHvR4nO0k5/t6dlMI/a+DWCb0OiJ/RXiRocjvA2yg5ghBK2nxFjKAdlnvGDUE1GtPEZBKvy5w==
X-Gm-Message-State: AOJu0YxcCzJ6toBXfIDL2RWvU8G3fDKc2WT8YuLvh4sJoZlCw0tOStbZ
	/NB+godkqbN4oFz1D6kFPsRoXmz4CKNb4kZYT5n9zrhQIATzvjg=
X-Google-Smtp-Source: AGHT+IG0d5T8JXCtfqlx6JtVyEaCsqFpPnvwq2pH9XmJas2+vfFJn39FYAUdlGYyjJjWq/sJ1YaRJQ==
X-Received: by 2002:a05:6871:29c:b0:22e:7c19:5c71 with SMTP id i28-20020a056871029c00b0022e7c195c71mr2548199oae.59.1712148471696;
        Wed, 03 Apr 2024 05:47:51 -0700 (PDT)
Received: from serve.minyard.net ([47.184.176.113])
        by smtp.gmail.com with ESMTPSA id ny21-20020a056871751500b00221df0eb6f9sm3931309oac.28.2024.04.03.05.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 05:47:51 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b::37a])
	by serve.minyard.net (Postfix) with ESMTPSA id F404A1800B7;
	Wed,  3 Apr 2024 12:47:50 +0000 (UTC)
Date: Wed, 3 Apr 2024 07:47:49 -0500
From: Corey Minyard <minyard@acm.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Tom Rix <trix@redhat.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Message-ID: <Zg1P9fpdwPot3Dxj@mail.minyard.net>
Reply-To: minyard@acm.org
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
 <Zg0hxMZGlwfXV2RA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg0hxMZGlwfXV2RA@smile.fi.intel.com>

On Wed, Apr 03, 2024 at 12:30:44PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 03, 2024 at 10:06:51AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
> > warnings enabled, a lot of driver cause a warning about an unused
> > ID table:
> > 
> > drivers/char/tpm/tpm_ftpm_tee.c:356:34: error: unused variable 'of_ftpm_tee_ids' [-Werror,-Wunused-const-variable]
> > drivers/dma/img-mdc-dma.c:863:34: error: unused variable 'mdc_dma_of_match' [-Werror,-Wunused-const-variable]
> > drivers/fpga/versal-fpga.c:62:34: error: unused variable 'versal_fpga_of_match' [-Werror,-Wunused-const-variable]
> > drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
> > drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
> > drivers/memory/pl353-smc.c:62:34: error: unused variable 'pl353_smc_supported_children' [-Werror,-Wunused-const-variable]
> > drivers/regulator/pbias-regulator.c:136:34: error: unused variable 'pbias_of_match' [-Werror,-Wunused-const-variable]
> > drivers/regulator/twl-regulator.c:552:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> > drivers/regulator/twl6030-regulator.c:645:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> > drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3635:36: error: unused variable 'sas_v2_acpi_match' [-Werror,-Wunused-const-variable]
> > drivers/staging/pi433/pi433_if.c:1359:34: error: unused variable 'pi433_dt_ids' [-Werror,-Wunused-const-variable]
> > drivers/tty/serial/amba-pl011.c:2945:34: error: unused variable 'sbsa_uart_of_match' [-Werror,-Wunused-const-variable]
> > 
> > The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
> > that remove the reference, rather than adding another #ifdef just for build
> > testing for a configuration that doesn't matter in practice.
> 
> > I considered splitting up the large patch into per subsystem patches, but since
> > it's really just the same thing everywhere it feels better to do it all at once.
> 
> Can we split to three groups:
> - Dropping ACPI_PTR()
> - Dropping of_match_ptr() (which I won't review in depth, for example)
> - Dropping both
> ?

Why?

-corey

> 
> ...
> 
> > --- a/drivers/char/ipmi/ipmb_dev_int.c
> > +++ b/drivers/char/ipmi/ipmb_dev_int.c
> > @@ -364,7 +364,7 @@ MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
> >  static struct i2c_driver ipmb_driver = {
> >  	.driver = {
> >  		.name = "ipmb-dev",
> > -		.acpi_match_table = ACPI_PTR(acpi_ipmb_id),
> > +		.acpi_match_table = acpi_ipmb_id,
> >  	},
> >  	.probe = ipmb_probe,
> >  	.remove = ipmb_remove,
> 
> acpi.h --> mod_devicetable.h.
> 
> ...
> 
> > --- a/drivers/hid/hid-google-hammer.c
> > +++ b/drivers/hid/hid-google-hammer.c
> > @@ -275,21 +275,19 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
> >  };
> >  MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
> >  
> > -#ifdef CONFIG_OF
> >  static const struct of_device_id cbas_ec_of_match[] = {
> >  	{ .compatible = "google,cros-cbas" },
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
> > -#endif
> >  
> >  static struct platform_driver cbas_ec_driver = {
> >  	.probe = cbas_ec_probe,
> >  	.remove = cbas_ec_remove,
> >  	.driver = {
> >  		.name = "cbas_ec",
> > -		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
> > -		.of_match_table = of_match_ptr(cbas_ec_of_match),
> > +		.acpi_match_table = cbas_ec_acpi_ids,
> > +		.of_match_table = cbas_ec_of_match,
> >  		.pm = &cbas_ec_pm_ops,
> >  	},
> >  };
> 
> Ditto, and likely of.h can be also dropped.
> 
> ...
> 
> > --- a/drivers/input/touchscreen/wdt87xx_i2c.c
> > +++ b/drivers/input/touchscreen/wdt87xx_i2c.c
> > @@ -1166,7 +1166,7 @@ static struct i2c_driver wdt87xx_driver = {
> >  		.name = WDT87XX_NAME,
> >  		.dev_groups = wdt87xx_groups,
> >  		.pm = pm_sleep_ptr(&wdt87xx_pm_ops),
> > -		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
> > +		.acpi_match_table = wdt87xx_acpi_id,
> >  	},
> >  };
> >  module_i2c_driver(wdt87xx_driver);
> 
> Ditto.
> 
> ...
> 
> > --- a/drivers/net/ethernet/apm/xgene-v2/main.c
> > +++ b/drivers/net/ethernet/apm/xgene-v2/main.c
> > @@ -731,7 +731,7 @@ MODULE_DEVICE_TABLE(acpi, xge_acpi_match);
> >  static struct platform_driver xge_driver = {
> >  	.driver = {
> >  		   .name = "xgene-enet-v2",
> > -		   .acpi_match_table = ACPI_PTR(xge_acpi_match),
> > +		   .acpi_match_table = xge_acpi_match,
> >  	},
> >  	.probe = xge_probe,
> >  	.remove_new = xge_remove,
> 
> Ditto. And remove forward declaration of the variable as well.
> 
> ...
> 
> > --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> > +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> > @@ -320,7 +320,7 @@ static struct platform_driver ftm_rtc_driver = {
> >  	.driver		= {
> >  		.name	= "ftm-alarm",
> >  		.of_match_table = ftm_rtc_match,
> > -		.acpi_match_table = ACPI_PTR(ftm_imx_acpi_ids),
> > +		.acpi_match_table = ftm_imx_acpi_ids,
> >  	},
> >  };
> 
> Ditto.
> 
> ...
> 
> >  	.driver = {
> >  		.name =		"pi433",
> >  		.owner =	THIS_MODULE,
> 
> Oh-oh.
> 
> > -		.of_match_table = of_match_ptr(pi433_dt_ids),
> > +		.of_match_table = pi433_dt_ids,
> >  	},
> 
> ...
> 
> > --- a/drivers/tty/serial/amba-pl011.c
> > +++ b/drivers/tty/serial/amba-pl011.c
> > @@ -2948,7 +2948,7 @@ static const struct of_device_id sbsa_uart_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, sbsa_uart_of_match);
> >  
> > -static const struct acpi_device_id __maybe_unused sbsa_uart_acpi_match[] = {
> > +static const struct acpi_device_id sbsa_uart_acpi_match[] = {
> >  	{ "ARMH0011", 0 },
> >  	{ "ARMHB000", 0 },
> >  	{},
> > @@ -2961,8 +2961,8 @@ static struct platform_driver arm_sbsa_uart_platform_driver = {
> >  	.driver	= {
> >  		.name	= "sbsa-uart",
> >  		.pm	= &pl011_dev_pm_ops,
> > -		.of_match_table = of_match_ptr(sbsa_uart_of_match),
> > -		.acpi_match_table = ACPI_PTR(sbsa_uart_acpi_match),
> > +		.of_match_table = sbsa_uart_of_match,
> > +		.acpi_match_table = sbsa_uart_acpi_match,
> >  		.suppress_bind_attrs = IS_BUILTIN(CONFIG_SERIAL_AMBA_PL011),
> >  	},
> >  };
> 
> Ditto.
> 
> ...
> 
> As mentioned above, I haven't and won't look into of_match_ptr() cases, but you
> got the idea.
> 
> For the above, if addressed as suggested,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

