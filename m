Return-Path: <linux-i2c+bounces-1388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEAD832CD9
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 17:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 715141F226EB
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 16:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1967554F86;
	Fri, 19 Jan 2024 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WONIpkeF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D054FBB;
	Fri, 19 Jan 2024 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705680505; cv=none; b=m84GWfpJcHwEXujRuBCjRCDweTB6ZwfOFPhFU8mkdCobaAL9bhbm8wXRPzZKSpoKorVyA/Q/qyNXhcvz5pELYloeRY4WtqmvVj22GCC4RnLU1tG7GAo2L/eIIj4WH1gdyd7Mb4QZpaLth2/iLt8cG5cXSWGL6qazgH2GSqNari0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705680505; c=relaxed/simple;
	bh=f1NTbZpi6beXqIjw6g6+qGt7w9p6IgHNGpWIbTLSFgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxh05/nLCJwSqcpsrtgTcjV5t1tgpJ2Z+v4jWFSqv3mqLaluz+1ElzPkWTkGygPW7NRayKurHATPrx9IC7MMkXx1HyHkmD1lJj/0JaMFV7lCkwtgx50LaqDpdAZxGWC9rTbkq2xbIvPBIR5GqiqhSvkQLn/v5529gjcKLHbOwT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WONIpkeF; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65E85240008;
	Fri, 19 Jan 2024 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705680495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lcPvgWIm/QbVzXxcPjjQvz3cRLruCD/tBqEeHF3XX0=;
	b=WONIpkeF6OM+U5keRwkDYZGMolP5XktgDBB6mIAe8MUTsy79HiG6aPHFRUwt+zvQnJD1yV
	rhimS5Xv0eRylsTuhD2McG83J2YXfxvXNhUbjh/C+EXBuXMvv5+07L8LSuG0ozxWPYlwY/
	aNSMECbf8FnizI8ADDg3l8yKMTxFLFAw5gxxCKPkDelc+OqObRloUw9fEpi35HIqKz+mBP
	wPtcYc/iRsKufncWrvdORBHBKi/t3Zi4ATWX3EAfBtizCbIK5XiiUMupEJBg9I+eWfq8I+
	stz/4f2GuyfGsCnAIosFOmQIF5TolDLgz4bAPmE8Q0y3roHYchplOYTQKxUDog==
Message-ID: <223422cc-2a1c-417b-8fa1-20d3b3eb41ef@bootlin.com>
Date: Fri, 19 Jan 2024 17:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] pinctrl: pinctrl-single: move suspend/resume to
 suspend_noirq/resume_noirq
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
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
 <20240102-j7200-pcie-s2r-v1-2-84e55da52400@bootlin.com>
 <CAHp75Verff06LE0QFaDRoun=ANpGfVU1tHknvvQZd_KyzLVP5Q@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75Verff06LE0QFaDRoun=ANpGfVU1tHknvvQZd_KyzLVP5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/15/24 21:02, Andy Shevchenko wrote:
> On Mon, Jan 15, 2024 at 6:16 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> The goal is to extend the active period of pinctrl.
>> Some devices may need active pinctrl after suspend and/or before resume.
>> So move suspend/resume to suspend_noirq/resume_noirq to have active
>> pinctrl until suspend_noirq (included), and from resume_noirq
>> (included).
> 
> ->...callback...()
> (Same comment I have given for the first patch)

fixed

> 
> ...
> 
>>         struct pcs_device *pcs;
>>
>> -       pcs = platform_get_drvdata(pdev);
>> +       pcs = dev_get_drvdata(dev);
>>         if (!pcs)
>>                 return -EINVAL;
> 
> Drop dead code.
> This should be simple one line after your change.
> 
>        struct pcs_device *pcs = dev_get_drvdata(dev);
> 

dead code dropped

> ...
> 
>>         struct pcs_device *pcs;
>>
>> -       pcs = platform_get_drvdata(pdev);
>> +       pcs = dev_get_drvdata(dev);
>>         if (!pcs)
>>                 return -EINVAL;
> 
> Ditto.
> 
> ...

dead code dropped

> 
>> +static const struct dev_pm_ops pinctrl_single_pm_ops = {
>> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pinctrl_single_suspend_noirq,
>> +                                     pinctrl_single_resume_noirq)
>> +};
> 
> Use proper / modern macro.

fixed, use DEFINE_NOIRQ_DEV_PM_OPS now

> 
> ...
> 
>>  #endif
> 
> Why ifdeferry is needed (esp. taking into account pm_ptr() use below)?

We may have an "unused variable" warning for pinctrl_single_pm_ops if
CONFIG_PM is undefined (due to pm_ptr).

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


