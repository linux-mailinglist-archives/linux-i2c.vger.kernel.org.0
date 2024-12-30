Return-Path: <linux-i2c+bounces-8837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7119FE7B2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 16:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0483A2465
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 15:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57941AAE33;
	Mon, 30 Dec 2024 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XuvWJtEE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4FE154BE4;
	Mon, 30 Dec 2024 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735573183; cv=none; b=VbjHB7Dv4TRSJ1xvmA5Tt3yuUEta96ZVwi1ZpjGCxjcdA1GiM6b6j/CVyvgBIQjELceRVxzKm/ULQ9UO9y8+cqJonVniR7Bk8bzo65/LmyWo1WFEo6vcxLJAZcWlsX6G7Z1IE29nm24ofgVB8TkO0699JW7pikr3jcMzTYXD5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735573183; c=relaxed/simple;
	bh=z95nvnR0IBfFZgmgFKAM139dJRdkSORpd/LIl6jgSDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjqIVPNLZJwkbM9ku79OKmpRmhZAOeAbx+tqIyaYUJ/2ABgd9UC3MvTnl56VigNtJgptVwcyVOCX7PNVJm60IH/BxImazUCMJsLg9YT+t897c/wrjhWQphuq8lg0/6cUjlxtVX71/4ROs+8uwSnMuk4EArywgrq2K6MTYNy4yes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XuvWJtEE; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C90E1C0002;
	Mon, 30 Dec 2024 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735573178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hA6CvsCmERwL792aXpdy/ULlGDIdsXDMPmDFIsJtA6E=;
	b=XuvWJtEE0++XLT3rjMf9QjyWRB1g9h7vnqPO7uWmXBjocxq+NoCycynxsGKJmKQlDfH9Yx
	1ilV8yt4k+8YgHIF9ToR+BZ6BTDhk/q1w37IAJYbJAodKEVUuzdeulTaOIoA4s6Z0ihmw4
	sRkOi7lOxe30lAVxPMk+2ArnorH0JvtorS92rVthXDsL9+DWX64KZpPNsoWqSinnlfxDDt
	4HmfgAvft3IdMa9U+q2i5XrPI3/K2KZkpmRnHOGIkX76XWqBB6uHPxiSToobxC2KNkZh08
	vAGwy1jwSp7IWTxgauhY3nNw40B+bqmn6IeJSMURelKCAGbwdErgEnq2vtXnMQ==
Date: Mon, 30 Dec 2024 16:39:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 7/7] rtc: Add Nuvoton NCT6694 RTC support
Message-ID: <2024123015393681ee26a3@mail.local>
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-8-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227095727.2401257-8-a0282524688@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 27/12/2024 17:57:27+0800, Ming Yu wrote:
> +	ret = devm_rtc_register_device(data->rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc\n");

There is no error path where the error is silent in
devm_rtc_register_device, the message is unnecessary .

> +
> +	device_init_wakeup(&pdev->dev, true);
> +	return 0;
> +}
> +
> +static struct platform_driver nct6694_rtc_driver = {
> +	.driver = {
> +		.name	= "nct6694-rtc",
> +	},
> +	.probe		= nct6694_rtc_probe,
> +};
> +
> +module_platform_driver(nct6694_rtc_driver);
> +
> +MODULE_DESCRIPTION("USB-RTC driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-rtc");
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

