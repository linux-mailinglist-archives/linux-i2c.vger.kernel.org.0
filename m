Return-Path: <linux-i2c+bounces-1417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE58836585
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 15:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74C3281560
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01803D972;
	Mon, 22 Jan 2024 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iyDQ3mV2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99E3D546;
	Mon, 22 Jan 2024 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705934033; cv=none; b=qKGFoaake9yXOX8EjMVSaqqRfLHGs+6mgbucwHIAgoMdcFzLZc2nY3YEMgQTvjBMMX8tju25GLENn/9jrrv+0im+TUQvqyDB/q5igh+mwEALd3cQWYeI8FrmPV0uUttAR4HLwbmGfwSCHnGZ7wXhxBLKC5wqhA+/S+wT7asjew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705934033; c=relaxed/simple;
	bh=Rf7Jgcc8Z6wSO7zZHP0dF/g0jawoHIFG5QnvQX8+fDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnI9BZKjacPkRbDG5R5f2bihHLfK7u47tYcxFl4bwIuLf2BqqUCRj8wtxcsnHTGWVc7wiAPIXw/5N8NIa8BMa7rI7dIujXBkEX+Bl3j0fccYT4ceViF+Tki0TglYPp4oztuCsvCRfSu7GdoIj3ZJXsP21MVDQch3xxIq0EOOSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iyDQ3mV2; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9AD3C0005;
	Mon, 22 Jan 2024 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705934029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECi8ka7o1qBq74OdBGRcMDsclI+BCMKdvpZSkSVLU5c=;
	b=iyDQ3mV2HYp9n6jneaoazt/KuPqicWfJiZkwpHsB42dxKDV8a1uDS6ss0GeAMuass4XZhM
	RynadnWy/eWHcEfPdnp6xnFS/nRFlSVsPxhu3zGw5+7itca99ey3jHqb9PKY5tB0Sblduw
	BK4sHegl3lmj6Uz2+oX/9fpruduP/U35zav7+2dMH+/nGHfinVAYM06VL8fD/sMoz+qEWp
	K2waEve2OrLdorRlnfCMTPUgfIzWiR9Ou4I65R8Hr//9gwjVSeOh9JaAqgmfuxPnNBVgy0
	lUt+dPqyOEpAQUpnIYdZG1BWm9x1fP/pacpIWJbdT7Hiud0xlghzcBww476yAg==
Message-ID: <b59067f0-fdba-40d1-bb52-9f66fd833f40@bootlin.com>
Date: Mon, 22 Jan 2024 15:33:47 +0100
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
 <223422cc-2a1c-417b-8fa1-20d3b3eb41ef@bootlin.com>
 <CAHp75VcaABafPh7o1TjrHW2txXRRSxjT443XJe33gfS1YD4bhA@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VcaABafPh7o1TjrHW2txXRRSxjT443XJe33gfS1YD4bhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/19/24 17:11, Andy Shevchenko wrote:
> On Fri, Jan 19, 2024 at 6:08 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 1/15/24 21:02, Andy Shevchenko wrote:
>>> On Mon, Jan 15, 2024 at 6:16 PM Thomas Richard
>>> <thomas.richard@bootlin.com> wrote:
> 
> ...
> 
>>>> +static const struct dev_pm_ops pinctrl_single_pm_ops = {
>>>> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pinctrl_single_suspend_noirq,
>>>> +                                     pinctrl_single_resume_noirq)
>>>> +};
>>>
>>> Use proper / modern macro.
>>
>> fixed, use DEFINE_NOIRQ_DEV_PM_OPS now
> 
> ...
> 
>>>>  #endif
>>>
>>> Why ifdeferry is needed (esp. taking into account pm_ptr() use below)?
>>
>> We may have an "unused variable" warning for pinctrl_single_pm_ops if
>> CONFIG_PM is undefined (due to pm_ptr).
> 
> This is coupled with the above. Fixing above will automatically make
> the right thing.

Yes you're right.
By the way I can use pm_sleep_ptr instead of pm_ptr.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


