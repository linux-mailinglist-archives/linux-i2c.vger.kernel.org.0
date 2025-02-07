Return-Path: <linux-i2c+bounces-9351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FECCA2CE29
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 21:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ABFB188F3CC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 20:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCC21AE003;
	Fri,  7 Feb 2025 20:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TojjMHz8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855B194C9E;
	Fri,  7 Feb 2025 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960260; cv=none; b=Z0rFEt2j3BrOzwoKKUSYuLQxuj8EP+sOuPadIEmjpE7JocvlJoMW1G23WDnbmky8u63Aw1ArUyDGNGjvINUN/+Gd7Gi65otPIwW3U8QLuYJNn2kw6lhRAg/QdySTuMoGfsD7Zx0ID0oryh+Tpr40dbnziUC1sRqJ5ZS/DBd57ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960260; c=relaxed/simple;
	bh=5xCA2aFRWIHt9UXYtDkyYMN6nBFHc3iGvDF2cYwAjEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ll4eayEtJZBs1D7TdzOIYe1h5PaStTCG6VtlEj7epOJuiISn2Y0fjZ4/yGZs+YJi2P5jFVmrMqnvm+6j6SVKyfKDHiss3FA8Oeo3h2ajHeJ5ILIeMyhgak3haqCS1yfBxS3krZGUtFVz2/I7pKAGEOs7+ktQ+T03UitLC47NveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=TojjMHz8; arc=none smtp.client-ip=80.12.242.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gUzvtE7TuS3EkgUzztx5yo; Fri, 07 Feb 2025 21:30:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738960254;
	bh=v8RzLLz8uCfxpLBta41IG2wNm1yEnnjxj05C5WD4mOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TojjMHz8cfdFXLwbWT8w7XbHMiYM8vP1p/x6JCr68oFMahVzfgu/C1Jf9R/tcBHQs
	 IzuZ4igAg8dwVzx+j7pnBWStOZGD6V5BPZ0fLCnulEhkXNrjHQvPEQ8o7jtKE7VIFB
	 mtEc0AYTo8c4jYo+kKIFVxnQqss2l7fKHMjVI4XpNfycS2zr1pw7XKp1F0qRM/huU4
	 9vHHF9Zi/bMqTgCYlRgNA3qZXveBQ+Oy8BL9U81m5BMqLgJQZppXkW1Ja36P/yOr1u
	 L0oaW6UEtWtJUG0ZWua49q/+8OrFvsziOXBrnKw7Z1vfwS9yTe1jhTeOm3mxWA74Iz
	 LRTMrr3BTIIaA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 07 Feb 2025 21:30:54 +0100
X-ME-IP: 90.11.132.44
Message-ID: <9b451153-41b4-4c15-a586-01cb5126e207@wanadoo.fr>
Date: Fri, 7 Feb 2025 21:30:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-6-a0282524688@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250207074502.1055111-6-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/02/2025 à 08:45, Ming Yu a écrit :
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.

...

> +static int nct6694_wdt_probe(struct platform_device *pdev)
> +{
> +	const struct mfd_cell *cell = mfd_get_cell(pdev);
> +	struct device *dev = &pdev->dev;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	struct nct6694_wdt_data *data;
> +	struct watchdog_device *wdev;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->msg = devm_kzalloc(dev, sizeof(union nct6694_wdt_msg),
> +				 GFP_KERNEL);
> +	if (!data->msg)
> +		return -ENOMEM;
> +
> +	data->dev = dev;
> +	data->nct6694 = nct6694;
> +	data->wdev_idx = cell->id;
> +
> +	wdev = &data->wdev;
> +	wdev->info = &nct6694_wdt_info;
> +	wdev->ops = &nct6694_wdt_ops;
> +	wdev->timeout = timeout;
> +	wdev->pretimeout = pretimeout;
> +	if (timeout < pretimeout) {
> +		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
> +		wdev->pretimeout = 0;
> +	}
> +
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 255;
> +
> +	devm_mutex_init(dev, &data->lock);

Error handling?
(also apply for patch 1/7 and 6/7)

> +
> +	platform_set_drvdata(pdev, data);
> +
> +	watchdog_set_drvdata(&data->wdev, data);
> +	watchdog_set_nowayout(&data->wdev, nowayout);
> +	watchdog_stop_on_reboot(&data->wdev);
> +
> +	return devm_watchdog_register_device(dev, &data->wdev);
> +}

...

CJ

