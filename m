Return-Path: <linux-i2c+bounces-2747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370D896AB9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 11:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C217728A4BA
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 09:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED038136648;
	Wed,  3 Apr 2024 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCjOu78d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B6134759;
	Wed,  3 Apr 2024 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136663; cv=none; b=Ee7MS4a3z33xRjGuyL1xZfasgBLeY2o8aYLb0h+klFbcS2JxEDhF9kqSYOiv+KrubHO7FDWCsD8Wt+MWFxcExLpfjj37f5LAY/LgstNdIuufCJ4F+kfwTBG2zFArC2keMj6sNzc4xM1QdWTc3gK0YHOKAx4BdMGZOGegWFMW4OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136663; c=relaxed/simple;
	bh=hdQyq38njeULYK9VdARbiJym46CETAEk7WigcOJGITQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnH8sj3AWGU/P1ZkjJ3CS5RoLPyuVHFsemDLhXFpnR149l7sgKV4veWY92dhkQ7gd0ZXsIwH/xJf5MoJVBey3QzyGJ6i4GA34Yu/ihEiuf1MnBYpkMlPtaxjO+69Jqvkyq6uM6DCB+k4Xmq1gWM3efaDiOiBYTskzkf+4mZjrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCjOu78d; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136662; x=1743672662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hdQyq38njeULYK9VdARbiJym46CETAEk7WigcOJGITQ=;
  b=PCjOu78dpbeK2v4+j7un//zzf72olDNQe4XY6y1MPAOLCXquqvvDkkdH
   YIQ4TME0+UuSV/r42hAp+z7QXMM+JREXnm6DjsmLtV82Q87Ja/px0ErYH
   AYYuPboeiTeU8fmUGgTbktl5Ya/lAKdNO6SekDck5qLLIQNURvDujJCLe
   Sar2FBzvgl4TUi1maHC5kTfxCCWv5e3yEoaCmdnW1vLLdAseIsKjKbY96
   rJg2BOTIsQb3DjJ5sIBx55WXiKLcGym9M8B26aGUwcPcaASj8F0XnU73o
   v8m8yBh4zTf/qyn4h1eMFqWQqWT7HwYHKn959euQSlr7J9jE5kU4VrUd1
   A==;
X-CSE-ConnectionGUID: OJWbZ5bMT+6dX8xZHd9S8A==
X-CSE-MsgGUID: f/nedbYdQMa/rZ6PnpO38A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218636"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218636"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915175962"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="915175962"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:30:49 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rrwxA-000000014hw-2roE;
	Wed, 03 Apr 2024 12:30:44 +0300
Date: Wed, 3 Apr 2024 12:30:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Corey Minyard <minyard@acm.org>,
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
Message-ID: <Zg0hxMZGlwfXV2RA@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-34-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 03, 2024 at 10:06:51AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
> warnings enabled, a lot of driver cause a warning about an unused
> ID table:
> 
> drivers/char/tpm/tpm_ftpm_tee.c:356:34: error: unused variable 'of_ftpm_tee_ids' [-Werror,-Wunused-const-variable]
> drivers/dma/img-mdc-dma.c:863:34: error: unused variable 'mdc_dma_of_match' [-Werror,-Wunused-const-variable]
> drivers/fpga/versal-fpga.c:62:34: error: unused variable 'versal_fpga_of_match' [-Werror,-Wunused-const-variable]
> drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
> drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
> drivers/memory/pl353-smc.c:62:34: error: unused variable 'pl353_smc_supported_children' [-Werror,-Wunused-const-variable]
> drivers/regulator/pbias-regulator.c:136:34: error: unused variable 'pbias_of_match' [-Werror,-Wunused-const-variable]
> drivers/regulator/twl-regulator.c:552:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> drivers/regulator/twl6030-regulator.c:645:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3635:36: error: unused variable 'sas_v2_acpi_match' [-Werror,-Wunused-const-variable]
> drivers/staging/pi433/pi433_if.c:1359:34: error: unused variable 'pi433_dt_ids' [-Werror,-Wunused-const-variable]
> drivers/tty/serial/amba-pl011.c:2945:34: error: unused variable 'sbsa_uart_of_match' [-Werror,-Wunused-const-variable]
> 
> The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
> that remove the reference, rather than adding another #ifdef just for build
> testing for a configuration that doesn't matter in practice.

> I considered splitting up the large patch into per subsystem patches, but since
> it's really just the same thing everywhere it feels better to do it all at once.

Can we split to three groups:
- Dropping ACPI_PTR()
- Dropping of_match_ptr() (which I won't review in depth, for example)
- Dropping both
?

...

> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -364,7 +364,7 @@ MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
>  static struct i2c_driver ipmb_driver = {
>  	.driver = {
>  		.name = "ipmb-dev",
> -		.acpi_match_table = ACPI_PTR(acpi_ipmb_id),
> +		.acpi_match_table = acpi_ipmb_id,
>  	},
>  	.probe = ipmb_probe,
>  	.remove = ipmb_remove,

acpi.h --> mod_devicetable.h.

...

> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -275,21 +275,19 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id cbas_ec_of_match[] = {
>  	{ .compatible = "google,cros-cbas" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
> -#endif
>  
>  static struct platform_driver cbas_ec_driver = {
>  	.probe = cbas_ec_probe,
>  	.remove = cbas_ec_remove,
>  	.driver = {
>  		.name = "cbas_ec",
> -		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
> -		.of_match_table = of_match_ptr(cbas_ec_of_match),
> +		.acpi_match_table = cbas_ec_acpi_ids,
> +		.of_match_table = cbas_ec_of_match,
>  		.pm = &cbas_ec_pm_ops,
>  	},
>  };

Ditto, and likely of.h can be also dropped.

...

> --- a/drivers/input/touchscreen/wdt87xx_i2c.c
> +++ b/drivers/input/touchscreen/wdt87xx_i2c.c
> @@ -1166,7 +1166,7 @@ static struct i2c_driver wdt87xx_driver = {
>  		.name = WDT87XX_NAME,
>  		.dev_groups = wdt87xx_groups,
>  		.pm = pm_sleep_ptr(&wdt87xx_pm_ops),
> -		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
> +		.acpi_match_table = wdt87xx_acpi_id,
>  	},
>  };
>  module_i2c_driver(wdt87xx_driver);

Ditto.

...

> --- a/drivers/net/ethernet/apm/xgene-v2/main.c
> +++ b/drivers/net/ethernet/apm/xgene-v2/main.c
> @@ -731,7 +731,7 @@ MODULE_DEVICE_TABLE(acpi, xge_acpi_match);
>  static struct platform_driver xge_driver = {
>  	.driver = {
>  		   .name = "xgene-enet-v2",
> -		   .acpi_match_table = ACPI_PTR(xge_acpi_match),
> +		   .acpi_match_table = xge_acpi_match,
>  	},
>  	.probe = xge_probe,
>  	.remove_new = xge_remove,

Ditto. And remove forward declaration of the variable as well.

...

> --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -320,7 +320,7 @@ static struct platform_driver ftm_rtc_driver = {
>  	.driver		= {
>  		.name	= "ftm-alarm",
>  		.of_match_table = ftm_rtc_match,
> -		.acpi_match_table = ACPI_PTR(ftm_imx_acpi_ids),
> +		.acpi_match_table = ftm_imx_acpi_ids,
>  	},
>  };

Ditto.

...

>  	.driver = {
>  		.name =		"pi433",
>  		.owner =	THIS_MODULE,

Oh-oh.

> -		.of_match_table = of_match_ptr(pi433_dt_ids),
> +		.of_match_table = pi433_dt_ids,
>  	},

...

> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -2948,7 +2948,7 @@ static const struct of_device_id sbsa_uart_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, sbsa_uart_of_match);
>  
> -static const struct acpi_device_id __maybe_unused sbsa_uart_acpi_match[] = {
> +static const struct acpi_device_id sbsa_uart_acpi_match[] = {
>  	{ "ARMH0011", 0 },
>  	{ "ARMHB000", 0 },
>  	{},
> @@ -2961,8 +2961,8 @@ static struct platform_driver arm_sbsa_uart_platform_driver = {
>  	.driver	= {
>  		.name	= "sbsa-uart",
>  		.pm	= &pl011_dev_pm_ops,
> -		.of_match_table = of_match_ptr(sbsa_uart_of_match),
> -		.acpi_match_table = ACPI_PTR(sbsa_uart_acpi_match),
> +		.of_match_table = sbsa_uart_of_match,
> +		.acpi_match_table = sbsa_uart_acpi_match,
>  		.suppress_bind_attrs = IS_BUILTIN(CONFIG_SERIAL_AMBA_PL011),
>  	},
>  };

Ditto.

...

As mentioned above, I haven't and won't look into of_match_ptr() cases, but you
got the idea.

For the above, if addressed as suggested,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



