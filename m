Return-Path: <linux-i2c+bounces-2009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDC867DCD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D06292717
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DA3135413;
	Mon, 26 Feb 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UwCcma0b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0813540B;
	Mon, 26 Feb 2024 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708967123; cv=none; b=J1vNLxJN4EAHzPHYLONOVE8/yyWyp/oGIjb84cnaknsqn5VZ8zg/jHimIDCRIS9TukvkN0XzSmE5/yrs7xXamudT+pPY5C4ey9uxTOuAGPd2um9wwfZGyTynH0kPKNwBcOoX5l6Cs/HPYP4/77tEfxrVLFFyHouRs3FCkC/LTGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708967123; c=relaxed/simple;
	bh=ypNyr0Uoo5ne9ovtpSKtjzM4p27kJo/g2Xvh37ER8Xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyUOHVax9Pip1ii3a7Z6BG6m7+OU4xteOTUJ7tEYIfnL44c24U61QTySxJuW/ZWMqQd6bR7trBUqhwjBaqn4T44RkgQUo8yAF/TlgUA/SmgvB5icElM8Jdg+X24ofQTD+pBbWbYul+urkj3oxtD/Ig0O7u1mdUVaXm528/L2Agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UwCcma0b; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D88B0240004;
	Mon, 26 Feb 2024 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708967118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tn9G+qXphFLUMlqaCdrIW1lI3L/sy7DuNc4RBARSO5c=;
	b=UwCcma0by2RTCLSjDCaPHB11eVl9Hv4E4WFacUMgZUZtZi0PL3lvGYEBvnQRj1nwItn3xV
	FtyUM6pIm2R5EQvStPsW9ZHAPY+m5Cs2ZqCB44BPWuB1DKrC3Z70IpsGQFOSgZs9zVzG5r
	XPasAQae0LgApFmbzOsIWRzK54Q48Qk3NySaufIAiOTAVYhtSJTWLBDRMeHY8IH4FiuTSV
	V0nzgn2/dyDNy41C8LVe5bltpaY6nseXrji9JBI3F9n7HNzSl+e9n7MuT+Cj5CxYqlJGbl
	2Z/rvRso9ouN18O8ajWRzHIZFS/DIJjpsd62nguxkjQdhlOKNsTOlnki4dxT/g==
Message-ID: <e24c77e6-5fcd-42f0-b93c-b4e6ce17e75a@bootlin.com>
Date: Mon, 26 Feb 2024 18:05:16 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/18] PCI: j721e: add reset GPIO to struct j721e_pcie
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-17-5c2e4a3fac1f@bootlin.com>
 <Zc42HIibtoXqLyEA@smile.fi.intel.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Zc42HIibtoXqLyEA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/15/24 17:04, Andy Shevchenko wrote:
> On Thu, Feb 15, 2024 at 04:18:02PM +0100, Thomas Richard wrote:
>> From: Théo Lebrun <theo.lebrun@bootlin.com>
>>
>> Add reset GPIO to struct j721e_pcie, so it can be used at suspend and
>> resume stages.
> 
> ...
> 
>>  	case PCI_MODE_RC:
>> -		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> -		if (IS_ERR(gpiod)) {
>> -			ret = PTR_ERR(gpiod);
>> +		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> +		if (IS_ERR(pcie->reset_gpio)) {
>> +			ret = PTR_ERR(pcie->reset_gpio);
>>  			if (ret != -EPROBE_DEFER)
>>  				dev_err(dev, "Failed to get reset GPIO\n");
>>  			goto err_get_sync;
>> @@ -504,9 +504,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>>  		 * mode is selected while enabling the PHY. So deassert PERST#
>>  		 * after 100 us.
>>  		 */
>> -		if (gpiod) {
>> +		if (pcie->reset_gpio) {
>>  			usleep_range(100, 200);
>> -			gpiod_set_value_cansleep(gpiod, 1);
>> +			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
>>  		}
> 
> Instead of all this, just add one line assignment. Moreover, before or after
> this patch refactor the code to use ret = dev_err_probe(...); pattern that
> eliminates those deferral probe checks.

Hi Andy,

I'm not sure what you exactly want when you write "just add one line
assignment".
For the dev_err_probe() it's okay, it will be fixed in the next iteration.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


