Return-Path: <linux-i2c+bounces-1390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A47CC832D17
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 17:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3503EB2411D
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 16:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390C35578B;
	Fri, 19 Jan 2024 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hjZYzM0k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079D355782;
	Fri, 19 Jan 2024 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705681538; cv=none; b=clwEAws8kY31uA/k5WMlwsh16Xkb5BnF3CwNm1AtqgxeIIazWw/b0ik94t4yWnKVopcl7usxu/Dn+d83mmUILEEsXxMGS8PmdnyuyBfgxk+5FuqFeYbULqgvZp84c2iFpqYxGZfNlYVvXXfpzVZrGhUmtlCpRQ6E5mUe9zFDRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705681538; c=relaxed/simple;
	bh=QE00sVqAMOv90auTG/0kJ8UjMag7rnQLOwAFPBft88c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omhw57z8e9vfaxjsDeIhpBKZPxd+QDaBW6KrtgBUls1QWwQkGjp9DynYNmL5vOkt83BppeDRkCGuaTIMhPb2Vjk1vO+NzhXPQW9nFbsJiLETs+GY6OdUsN28NfkJQeFwJ6C1hsaVSaHATfoALagRKm2e10BCDHh0ani9NMAd+hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hjZYzM0k; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C016B240002;
	Fri, 19 Jan 2024 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705681533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1EvaPvXApBgyAhcuA6NX5wpZMQGqeoo3nUdtJav3rw=;
	b=hjZYzM0kQHuRZNPcdU8ob/JNxW9huON2tGjrVWhmWYsIggW9L/0Bsy6cvtDtllZXtvdQs9
	xE7HL4oEC/LAcvDR9umcjSB13cJboiMZkGSqT4croOz5W7E+lyEA0Ebon8ewkcnllnk489
	cpfKUdcrfL/3cq3CC1XuRM4VLhLQSr0xY4/t5SPbBztssntRCkxEm+bttpGYrugkEBfr70
	sSkhTFovjaSNa7M6u0F5yqTzyT2vTy0IevqKxWeVWImlgl8OBAuaWxF5kqvo9RFvFd6NqM
	kWjZ8Iw9D+540DaTDSNT38aFE+Fz2R2ETVccGuE783UjmK9xBB1t4fZS9O64VQ==
Message-ID: <828dd9ba-60f1-419b-9121-204d622739d3@bootlin.com>
Date: Fri, 19 Jan 2024 17:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] mux: mmio: Add resume support
Content-Language: en-US
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-4-84e55da52400@bootlin.com>
 <c147ae1b-87cc-52b1-4ec7-684d5e7cc5db@axentia.se>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <c147ae1b-87cc-52b1-4ec7-684d5e7cc5db@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

Hello Peter,

Thanks for the review.

On 1/15/24 23:31, Peter Rosin wrote:
> Hi!
> 
> 2024-01-15 at 17:14, Thomas Richard wrote:
>> From: Théo Lebrun <theo.lebrun@bootlin.com>
>>
>> Implement resume support
> 
> What Andy said, and please don't omit punctuation. Try to make it a
> pleasure to read your patches!

Yes my commit message needs to be more verbose, sorry.

> 
>>
>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>>  drivers/mux/mmio.c | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
>> index fd1d121a584b..ab4ef195fc0d 100644
>> --- a/drivers/mux/mmio.c
>> +++ b/drivers/mux/mmio.c
>> @@ -125,13 +125,47 @@ static int mux_mmio_probe(struct platform_device *pdev)
>>  
>>  	mux_chip->ops = &mux_mmio_ops;
>>  
>> +	dev_set_drvdata(dev, mux_chip);
>> +
>>  	return devm_mux_chip_register(dev, mux_chip);
>>  }
>>  
>> +#ifdef CONFIG_PM
>> +static int mux_mmio_resume_noirq(struct device *dev)
>> +{
>> +	struct mux_chip *mux_chip = dev_get_drvdata(dev);
>> +	int global_ret = 0;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < mux_chip->controllers; i++) {
>> +		struct mux_control *mux = &mux_chip->mux[i];
>> +		int val = mux->cached_state;
> 
> You are not supposed to look at (or change) cached_state outside the
> mux core.
> 
>> +		int ret;
>> +
>> +		if (val == MUX_IDLE_AS_IS)
> 
> The cached_state can never be MUX_IDLE_AS_IS. Sure, it happens to have
> the same actual value as the correct MUX_CACHE_UNKNOWN, but abusing
> that is all kinds of wrong.
> 
>> +			continue;
>> +
>> +		ret = mux_mmio_set(mux, val);
>> +		if (ret) {
> 
> If mux_mmio_set() fails, cached_state ends up wrong as it should be set
> to MUX_CACHE_UNKNOWN on failure. Low-level stuff like this needs to be
> done by the mux core, or things becomes a maintenance hazard...
> 
> So, the meat of this function belongs in the mux core since none of
> it looks mmio specific. It could probably be named mux_chip_resume()
> or something such. That makes it simple to use the correct constant,
> and the mux_control_set() helper makes it easy to get the handling of
> cached_state right.
> 

Thanks for the explanations.

So I created a mux_chip_resume function in the mux core.
This function restores each mux using mux_control_set.
The restored state is the cached state.
The muxes with a MUX_CACHE_UNKNOWN cache state are ignored.

So this patch will be splitted, one patch for the core, one for the mmio
driver.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


