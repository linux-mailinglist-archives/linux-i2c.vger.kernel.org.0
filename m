Return-Path: <linux-i2c+bounces-5272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E294D4B0
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 18:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE95D28167A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 16:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB081991C9;
	Fri,  9 Aug 2024 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov4Zyi+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393B1990C4;
	Fri,  9 Aug 2024 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723220843; cv=none; b=HAbuJEtGoz2Rcgsht5KKTygv1e5r5GakQ3RSPghuDkk8i9cmazS3t1zjFSz15GMmIwMRpChiEIwLg/zIM9HR7Zy5Saz48OWD0J9ThX3YTJsisOeaR1Afp7UGYjqaHsLg9ihaNuy0y3bzyEcn1y1ModjdD4JwT2nL3FcCc97p3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723220843; c=relaxed/simple;
	bh=XC2t3eglu+1wwUwBcRuMSErGz59BiCXXn+Jmim/CEUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKqbhVO6XfUF0OGyelFAJqlXch7/EK6pWPV+8DypC1EDUISkqO0aYsJQoZxr+swLzFBeHnVdfAas/JpEP4fHzYLZaZZp8nklEtK4T6Sud15woDouBXnxw2UO8JRBp5MA39Iru9McbUtdEZ0FWnAB0oocdalvATDREZMynK7+YQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov4Zyi+Y; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb7cd6f5f2so1798259a91.2;
        Fri, 09 Aug 2024 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220841; x=1723825641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2vO+BsBv874WQr9+ko25g/qycgoznJt7V/QYU2K3xY=;
        b=Ov4Zyi+YVrqrF541vyg/L6hc8mGDv8q+SNjKVfWNwMNlkTq4I/4Kz4Yuw1BYrO+59c
         AULm/GUeQqjAu5KDaGMqpGIInbGNoKi/IWCthAoGAMPPVVaFqDDkBm7QUioQRu+1tkT7
         KxlaZw+AU2LpBf395uzpsne4egRrIBKKbI1Uc0VmEzA4iHTp192XOybQk+LG403bqOsV
         KBaFawPIPgS13byfi3zGATZCnBGcCDYnYO5BQYEB1R7DXiiMouwmrND5j100UnTOpl1s
         XdcAnIpfiBL22CV6WfCQENjy1QiR4rCb7KMMsIP7b2tnNvRKHeDuIlT64+DfX3gwnrDi
         9iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220841; x=1723825641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2vO+BsBv874WQr9+ko25g/qycgoznJt7V/QYU2K3xY=;
        b=v5ibEkmvcdtr9V8ZrxvVxltZHgHqSNrH8CRljzgOCa6BO1CEt1JXl7VgxjTnoN0coS
         F0WNiILdWEtBmrVRTLJ3kMYZ5vuIbmx2bFuJLUYCKOYF0YTdCCXGbdDIdv0dPY3maoxI
         8PuD2vgmS2LtkkErg/xXvx6f0uufUE0FSqetYz66JQ7L3GrCEmHCSnEj615Pz54JvcCq
         F4Fjng0F350ggUAiC0x+BzxqKW/2ipFwRXa/oHWaF8F/dgfs+jq+KAXCna+w0qdh//pU
         lQ3c62tkQ1JF80yQr/jgAuv/05KlyAk9oPHgYvysmq43hRP+G3O94kB2yJhdBcyzgB8M
         R8jA==
X-Forwarded-Encrypted: i=1; AJvYcCUqol4hOBhxFK8Iy4GtDS9J8OOoXJCSs3eOqBK2J/Z+WqSGvgWOW2jptie8ksgHSYSDRS+tUrs63la8IaBvumI=@vger.kernel.org, AJvYcCV0+LKk4zAK6Jz3tN0EYhu9aRWSxFN5MsUfpVd/PBZJNxFupIqB/Qs+9SrTkCqicMrjlXOXc3ktjbnp3lu9@vger.kernel.org, AJvYcCWNVKL1JawzRKkrEVBE2cWFP3gbRfRRUPTnTsmIIVv+cjOuNnC74AdEHyVxd1fT0TcywGK500ci/KfV@vger.kernel.org, AJvYcCWuUzJRZzLsn8NREieIp1v7EdIDqaqbKhQuiibOtrB4hBLx1RNQIZvrs5FEYkqXEdU9fodgQe6NRLIW@vger.kernel.org
X-Gm-Message-State: AOJu0YxrXVGB+ya1wx1bou9wBVTdWzNlqiuSCTXHPCci3xMCLZbBUjh4
	fodOpmVdlF84MfY7pEtDT1dhyqJeYZEqXn0cShvDNrBs4CRnUuEz
X-Google-Smtp-Source: AGHT+IH8jnctbuqSrq6dqDgvGc4MjSwcpaVVRHBke9TrvYbHFnyuMvCGjc89UybL4VKtI6KrFRwmaA==
X-Received: by 2002:a17:90a:348f:b0:2c9:8650:404 with SMTP id 98e67ed59e1d1-2d1e80565f6mr2236934a91.30.1723220840700;
        Fri, 09 Aug 2024 09:27:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9db3b9asm3190095a91.43.2024.08.09.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:27:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 9 Aug 2024 09:27:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
	thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
Subject: Re: [PATCH 4/5] watchdog: Congatec Board Controller watchdog timer
 driver
Message-ID: <d37e3fea-d35e-4688-a845-02be6ea5eaa3@roeck-us.net>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-4-fec5236270e7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-congatec-board-controller-v1-4-fec5236270e7@bootlin.com>

On Fri, Aug 09, 2024 at 04:52:08PM +0200, Thomas Richard wrote:
> Add watchdog timer support for the Congatec Board Controller.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/watchdog/Kconfig    |  10 ++
>  drivers/watchdog/Makefile   |   1 +
>  drivers/watchdog/cgbc_wdt.c | 217 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bae1d97cce89..07b711fc8bb2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1142,6 +1142,16 @@ config ALIM7101_WDT
>  
>  	  Most people will say N.
>  
> +config CGBC_WDT
> +	tristate "Congatec Board Controller Watchdog Timer"
> +	depends on MFD_CGBC
> +	select WATCHDOG_CORE
> +	help
> +	  Enables watchdog timer support for the Congatec Board Controller.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called cgbc_wdt.
> +
>  config EBC_C384_WDT
>  	tristate "WinSystems EBC-C384 Watchdog Timer"
>  	depends on (X86 || COMPILE_TEST) && HAS_IOPORT
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index b51030f035a6..5aa66ba91346 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -106,6 +106,7 @@ obj-$(CONFIG_ADVANTECH_WDT) += advantechwdt.o
>  obj-$(CONFIG_ADVANTECH_EC_WDT) += advantech_ec_wdt.o
>  obj-$(CONFIG_ALIM1535_WDT) += alim1535_wdt.o
>  obj-$(CONFIG_ALIM7101_WDT) += alim7101_wdt.o
> +obj-$(CONFIG_CGBC_WDT) += cgbc_wdt.o
>  obj-$(CONFIG_EBC_C384_WDT) += ebc-c384_wdt.o
>  obj-$(CONFIG_EXAR_WDT) += exar_wdt.o
>  obj-$(CONFIG_F71808E_WDT) += f71808e_wdt.o
> diff --git a/drivers/watchdog/cgbc_wdt.c b/drivers/watchdog/cgbc_wdt.c
> new file mode 100644
> index 000000000000..9327e87b52e8
> --- /dev/null
> +++ b/drivers/watchdog/cgbc_wdt.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Congatec Board Controller watchdog driver
> + *
> + * Copyright (C) 2024 Bootlin
> + * Author: Thomas Richard <thomas.richard@bootlin.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#include <linux/mfd/cgbc.h>
> +
> +#define CGBC_WDT_CMD_TRIGGER	0x27
> +#define CGBC_WDT_CMD_INIT	0x28
> +#define CGBC_WDT_DISABLE	0x00
> +
> +#define CGBC_WDT_MODE_SINGLE_EVENT 0x02
> +
> +#define DEFAULT_TIMEOUT_SEC	30
> +#define DEFAULT_PRETIMEOUT_SEC	0
> +
> +enum action {
> +	ACTION_INT = 0,
> +	ACTION_SMI,
> +	ACTION_RESET,
> +	ACTION_BUTTON,
> +};
> +
> +static unsigned int timeout = DEFAULT_TIMEOUT_SEC;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout,
> +		 "Watchdog timeout in seconds. (>=0, default="
> +		 __MODULE_STRING(DEFAULT_TIMEOUT_SEC) ")");
> +
> +static unsigned int pretimeout = DEFAULT_PRETIMEOUT_SEC;
> +module_param(pretimeout, uint, 0);
> +MODULE_PARM_DESC(pretimeout,
> +		 "Watchdog pretimeout in seconds. (>=0, default="
> +		 __MODULE_STRING(DEFAULT_PRETIMEOUT_SEC) ")");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +		 "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +struct cgbc_wdt_data {
> +	struct cgbc_device_data	*cgbc;
> +	struct watchdog_device	wdd;
> +	enum action timeout_action;
> +	enum action pretimeout_action;
> +};
> +
> +struct cgbc_wdt_cmd_cfg {
> +	u8 cmd;
> +	u8 mode;
> +	u8 action;
> +	u8 timeout1[3];
> +	u8 timeout2[3];
> +	u8 reserved[3];
> +	u8 delay[3];
> +} __packed;
> +
> +static_assert(sizeof(struct cgbc_wdt_cmd_cfg) == 15);

static_assert() is declared in linux/build_bug.h. Please include all
necessary include files explicitly and do not depend on indirect includes.

> +
> +static int cgbc_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);

Unusual way to get wdt_data instead of using container_of().
Any special reason ?

> +	struct cgbc_device_data *cgbc = wdt_data->cgbc;
> +	unsigned int timeout1 = (wdd->timeout - wdd->pretimeout) * 1000;
> +	unsigned int timeout2 = wdd->pretimeout * 1000;
> +	u8 action;
> +
> +	struct cgbc_wdt_cmd_cfg cmd_start = {
> +		.cmd = CGBC_WDT_CMD_INIT,
> +		.mode = CGBC_WDT_MODE_SINGLE_EVENT,
> +		.timeout1[0] = (u8)timeout1,
> +		.timeout1[1] = (u8)(timeout1 >> 8),
> +		.timeout1[2] = (u8)(timeout1 >> 16),
> +		.timeout2[0] = (u8)timeout2,
> +		.timeout2[1] = (u8)(timeout2 >> 8),
> +		.timeout2[2] = (u8)(timeout2 >> 16),
> +	};
> +
> +	if (wdd->pretimeout) {
> +		action = 2;
> +		action |= wdt_data->pretimeout_action << 2;
> +		action |= wdt_data->timeout_action << 4;
> +	} else {
> +		action = 1;
> +		action |= wdt_data->timeout_action << 2;
> +	}
> +
> +	cmd_start.action = action;
> +
> +	return cgbc_command(cgbc, &cmd_start, sizeof(cmd_start), NULL, 0, NULL);
> +}
> +
> +static int cgbc_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
> +	struct cgbc_device_data *cgbc = wdt_data->cgbc;
> +	struct cgbc_wdt_cmd_cfg cmd_stop = {
> +		.cmd = CGBC_WDT_CMD_INIT,
> +		.mode = CGBC_WDT_DISABLE,
> +	};
> +
> +	return cgbc_command(cgbc, &cmd_stop, sizeof(cmd_stop), NULL, 0, NULL);
> +}
> +
> +static int cgbc_wdt_keepalive(struct watchdog_device *wdd)
> +{
> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
> +	struct cgbc_device_data *cgbc = wdt_data->cgbc;
> +	u8 cmd_ping = CGBC_WDT_CMD_TRIGGER;
> +
> +	return cgbc_command(cgbc, &cmd_ping, sizeof(cmd_ping), NULL, 0, NULL);
> +}
> +
> +static int cgbc_wdt_set_pretimeout(struct watchdog_device *wdd,
> +				   unsigned int pretimeout)
> +{
> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
> +
> +	wdd->pretimeout = pretimeout;
> +	wdt_data->pretimeout_action = ACTION_SMI;
> +
> +	if (watchdog_active(wdd))
> +		return cgbc_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static int cgbc_wdt_set_timeout(struct watchdog_device *wdd,
> +				unsigned int timeout)
> +{
> +	struct cgbc_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
> +
> +	if (timeout < wdd->pretimeout) {
> +		dev_warn(wdd->parent, "timeout <= pretimeout. Setting pretimeout to zero\n");

That is a normal condition which does not warrant a log message.
Also see drivers/watchdog/watchdog_dev.c around line 385.

> +		wdd->pretimeout = 0;
> +	}
> +
> +	wdd->timeout = timeout;
> +	wdt_data->timeout_action = ACTION_RESET;

Both timeout_action and pretimeout_action are set statically.
What is the point of doing that instead of just using
ACTION_RESET and ACTION_SMI as needed irectly ?

> +
> +	if (watchdog_active(wdd))
> +		return cgbc_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info cgbc_wdt_info = {
> +	.identity	= "CGBC Watchdog",
> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> +		WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT
> +};
> +
> +static const struct watchdog_ops cgbc_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= cgbc_wdt_start,
> +	.stop		= cgbc_wdt_stop,
> +	.ping		= cgbc_wdt_keepalive,
> +	.set_timeout	= cgbc_wdt_set_timeout,
> +	.set_pretimeout = cgbc_wdt_set_pretimeout,
> +};
> +
> +static int cgbc_wdt_probe(struct platform_device *pdev)
> +{
> +	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct cgbc_wdt_data *wdt_data;
> +	struct watchdog_device *wdd;
> +	int ret;
> +
> +	wdt_data = devm_kzalloc(dev, sizeof(*wdt_data), GFP_KERNEL);

devm_kzalloc() is declared in linux/device.h. Again, please include all
necessary include files explicitly.

> +	if (!wdt_data)
> +		return -ENOMEM;
> +
> +	wdt_data->cgbc = cgbc;
> +	wdd = &wdt_data->wdd;
> +	wdd->parent = dev;
> +

No limits ? That is unusual. Are you sure the driver accepts all
timeouts from 0 to UINT_MAX ?

> +	wdd->info = &cgbc_wdt_info;
> +	wdd->ops = &cgbc_wdt_ops;
> +
> +	watchdog_set_drvdata(wdd, wdt_data);
> +	watchdog_set_nowayout(wdd, nowayout);
> +
> +	cgbc_wdt_set_timeout(wdd, timeout);
> +	cgbc_wdt_set_pretimeout(wdd, pretimeout);

The more common approach would be to set default limits in wdd->{timout,pretimeout}
and only override the values if needed, ie if provided using module parameters.
That implies initializing the module parameters with 0. YOur call, though.

> +
> +	platform_set_drvdata(pdev, wdt_data);
> +	watchdog_stop_on_reboot(wdd);
> +	watchdog_stop_on_unregister(wdd);
> +
> +	ret = devm_watchdog_register_device(dev, wdd);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Why not just
	return devm_watchdog_register_device(dev, wdd);
?

> +}
> +
> +static struct platform_driver cgbc_wdt_driver = {
> +	.driver		= {
> +		.name	= "cgbc-wdt",
> +	},
> +	.probe		= cgbc_wdt_probe,
> +};
> +
> +module_platform_driver(cgbc_wdt_driver);
> +
> +MODULE_DESCRIPTION("Congatec Board Controller Watchdog Driver");
> +MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.39.2
> 
> 

