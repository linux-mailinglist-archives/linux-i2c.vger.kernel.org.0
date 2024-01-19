Return-Path: <linux-i2c+bounces-1391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D6832D9F
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 18:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0921F21775
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 17:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F9B5579D;
	Fri, 19 Jan 2024 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n5Ys6O1a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929DF4C624;
	Fri, 19 Jan 2024 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705683703; cv=none; b=tz6DN6+iNuDgHY4b2jozrftYRgynSGXeAJqBEmAPHwEVwlqp41Jghv9rz7Y3qvfUJ3A2UKgXvYG8UjG31msSQqJp3e6YFWsIKplniff0lyw2VSYh2OUZ7t7UKnsrlsrdF/X30AvelzB5B8qso9VDlNAqOM0WC7AodSfKpYD82io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705683703; c=relaxed/simple;
	bh=UsJxvg/7MH4O5ZNxGWY9Nss1M9PXmgccOe40/l1xpxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDTbXpyKeDu3kytuqau2hdwT/TuMSVJjptV60GxwAgu8kDD1MzW3VxjLkQPeS8t2qnQO58ov5txLI6GSYWfuoAC/mOKVkZacY8HmjLKUKoqeNhPpkoIkpo6U6wK4LjzXoRH7PuX+zvipUMEUiN5GDx/X8cELeRr28NEoPlou8jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n5Ys6O1a; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6628760008;
	Fri, 19 Jan 2024 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705683698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eVdcjZzigbSsBwmQGgrwuVfPvylwPhfnV7FRBwbX2os=;
	b=n5Ys6O1a3pgFCD8YPEUweyidUInNABWxqlfLFXid906sTYe60ORvrlbK71CBI/isWeSzOn
	bAJZB48SCZkaCy9IZUrW0gzUBsB+RqFunoD5ps9A3m1I2jeEiVpTmZLudBp9Pcb4asmMWY
	NHMtmXg7wIHSoS6+BWV8qu4wJNhKLPJ8B87VkQd5BjefZ2ZuMnXsAP+0y8c+fmbzp+yEG5
	bw/R/xpdxdvtVzf7gdyey4cBWrQclUNI4U1nSLKOh2tjtre/PiK8Vsnw3l10nkVUp5hlDf
	GMNYIsamhO2Xv3ZeBmLJvyKpy9JyUf2jfZ7mDmgdt0eehFhUNHQs9hTxKH5rWg==
Message-ID: <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com>
Date: Fri, 19 Jan 2024 18:01:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to
 suspend_noirq/resume_noirq
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
 <20240116074333.GO5185@atomide.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240116074333.GO5185@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

Hello Tony,

On 1/16/24 08:43, Tony Lindgren wrote:
> * Thomas Richard <thomas.richard@bootlin.com> [240115 16:16]:
>> Some IOs can be needed during suspend_noirq/resume_noirq.
>> So move suspend/resume callbacks to noirq.
> 
> So have you checked that the pca953x_save_context() and restore works
> this way? There's i2c traffic and regulators may sleep.. I wonder if
> you instead just need to leave gpio-pca953x enabled in some cases
> instead?
> 

Yes I tested it, and it works (with my setup).
But this patch may have an impact for other people.
How could I leave it enabled in some cases ?

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


