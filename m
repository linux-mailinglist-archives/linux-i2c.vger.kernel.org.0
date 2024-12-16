Return-Path: <linux-i2c+bounces-8516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 045389F2E64
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 11:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4D51885D17
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 10:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7AF204576;
	Mon, 16 Dec 2024 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oqcYIiEa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF2203D53;
	Mon, 16 Dec 2024 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734345732; cv=none; b=QMbf2g+A3PD+T9DbKYtvLeMFeaeKOOdw7Xj+nLz1kSdnBzIwGD1DQIvDHg5o3E8rukl8wK8HpGa4rT5VaUMvMvh7EVef0SjshMnBb2SKDOsLah5WMOg8d2vWySEu3TtGQdVXo6z+jxuuCj2Acu0TMQnqOD3TIALOFE/enivvQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734345732; c=relaxed/simple;
	bh=wYHyds/oC/bIXn1FOZ3FfxUd/venFVAC8H+IayFbp3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtkXSChmdno7FZUD88RKGWX0co0ApuxJ4twtpeqGIYCZrzjVCIF21lmujyBYthM84J0cuEZdClDNcj7DQvKPj6BXAIqwwt7n4mAeCz7rQr33fHJTmPV/3qOCsYE+MA2rrdL91tCalyj5oMOJXEbWOM4e9zYPCB5IF1Kf2UOwdh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oqcYIiEa; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FC2620003;
	Mon, 16 Dec 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734345721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcrvnYxItVVme/Ppg4krYaiv+M+aU8FG8UoKAi5Pjng=;
	b=oqcYIiEad4rgc71cps3pZPHKUjfxnfC/h+9Jwv86EATSIos1zHyfSWk0LI7LT6ruTObGbA
	rOv1o9iGgNyEIPgAc8S1O7SkW7RkpYvZXVM8V5s3aesCLvyN8WouNZu0RvxHl/sCSbokqv
	xSoEHHqTbFg6JTl9ouXJRkPTZKjOy2J7iVx9s/beUky1KvE7Qtsq/4agmdKpBk6Oy8/t9o
	G9YxkPW1ihIBDt/5pydjLpdqmKtPxdZBGXFWoLjaqHTO6l45paRdc1pPAyA6QEVXuwyiwY
	NLG6lYdezTCu25nVlYFS+LuxzTCiwqWiwyvZA1Qu5jfhipEHVRkCSpwH9jwp7A==
Date: Mon, 16 Dec 2024 11:41:58 +0100
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
Subject: Re: [PATCH v3 7/7] rtc: Add Nuvoton NCT6694 RTC support
Message-ID: <202412161041586ed7c0ff@mail.local>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-8-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210104524.2466586-8-tmyu0@nuvoton.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 10/12/2024 18:45:24+0800, Ming Yu wrote:
> +static int nct6694_rtc_probe(struct platform_device *pdev)
> +{
> +	struct nct6694_rtc_data *data;
> +	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +	int ret, irq;
> +
> +	irq = irq_create_mapping(nct6694->domain, NCT6694_IRQ_RTC);
> +	if (!irq)
> +		return -EINVAL;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->xmit_buf = devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> +				      sizeof(unsigned char), GFP_KERNEL);
> +	if (!data->xmit_buf)
> +		return -ENOMEM;
> +
> +	data->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(data->rtc))
> +		return PTR_ERR(data->rtc);
> +
> +	data->nct6694 = nct6694;
> +	data->rtc->ops = &nct6694_rtc_ops;
> +	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +
> +	mutex_init(&data->lock);

You should use rtc_lock/rtc_unlock instead of having your own lock. The
core will take and release the lock appropriately before calling the
rtc_ops so you only have to do it in the irq handler.

> +
> +	device_set_wakeup_capable(&pdev->dev, 1);

This will cause a memory leak later on, see the discussion here:

https://lore.kernel.org/linux-rtc/a88475b6-08bf-4c7c-ad63-efd1f29307e3@pf.is.s.u-tokyo.ac.jp/T/#mf51fdce6036efa3ea12fe75bd5126d4ac0c6813e

> +
> +	platform_set_drvdata(pdev, data);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					nct6694_irq, IRQF_ONESHOT,
> +					"nct6694-rtc", data);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
> +
> +	/* Register rtc device to RTC framework */
> +	return devm_rtc_register_device(data->rtc);
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

