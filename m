Return-Path: <linux-i2c+bounces-1883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A685D634
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 11:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88FE11F2426E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 10:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A213F8FE;
	Wed, 21 Feb 2024 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O2cnQkRk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA53EA77;
	Wed, 21 Feb 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708513159; cv=none; b=IZZ6VoNxOoCq6nkhw3CjBHBM1qqvnUsxfd+2cY+6KjK6sQCmic8acRIN++u0DzxApQxrQ6ioZolRQJl6RbDr3Rd7HmTovB9CEudTZshKds25JN7w9B6kQP0Q6N8Ls8ZaAYmql8ONaohNfplP513ROODq+LAScpYgwqn42PwMIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708513159; c=relaxed/simple;
	bh=SbWS8TbjpElVutllvsK+jzUCsU87COPD50ePr889fXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=To4oFnKBWvcWFK8F6ETQq7aszNxlQvqVRiiNCzXClWuv7fR+NnzkeVlV954nqgjRqJGIdFDbI9dI+sDmJoQb565hhgib+kynqAZ3GAEc+9KwFpIRtJ/aU1npwF9BlmmLJmZ8bsq31iAssmUFQ+BXO4MNDDXhZ/TM8QLY1Axs+tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O2cnQkRk; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23106FF809;
	Wed, 21 Feb 2024 10:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708513149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEHFQ0b81cDkLGXCwktGr5yACT9BYmzY2jUziR5kBWE=;
	b=O2cnQkRkGWcS8AeId+uKeW5crrGFVmgagH9G9AFsXOgr9cYdITOV3qZ7FuVoN8k7d+WuvJ
	pnRsOIxo3yVXZWVIPTLiQNSR171q9h3D/FPpeBY6FCJzbDnihnWWNLnyB6+baU2WvkqGeT
	4XvgzNBTPWtDPBYnc3/VWIzpl59yjELncXzktjt7ydKr5n5QdxeiSwUJWWsqM/y3WIqBOi
	2xdQHYgYfEQNZ7XFePjr4zjIVsMaDmDn3fdPbBd3ewJXLjizpaWX6cxbcvb+DoqGwnO6p2
	RXM1ok5jXdYesnUqM/tetsnKP8xZezDXM3pVm/6OinnHjN+1N6V7oryM6Mrh9g==
Message-ID: <eb37a117-74bd-44fe-b677-89dc7c2aced8@bootlin.com>
Date: Wed, 21 Feb 2024 11:59:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] mux: add mux_chip_resume() function
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
 <20240102-j7200-pcie-s2r-v3-5-5c2e4a3fac1f@bootlin.com>
 <Zc4t82V9czlEqamL@smile.fi.intel.com>
 <f1d2c9b0-238d-4b09-8212-62e00a2192b2@bootlin.com>
 <Zc96Ke_iG_bHIvkP@smile.fi.intel.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Zc96Ke_iG_bHIvkP@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/16/24 16:07, Andy Shevchenko wrote:
> On Fri, Feb 16, 2024 at 08:52:17AM +0100, Thomas Richard wrote:
>> On 2/15/24 16:29, Andy Shevchenko wrote:
>>> On Thu, Feb 15, 2024 at 04:17:50PM +0100, Thomas Richard wrote:
> 
> ...
> 
>>>> +int mux_chip_resume(struct mux_chip *mux_chip)
>>>> +{
>>>> +	int global_ret = 0;
>>>> +	int ret, i;
>>>> +
>>>> +	for (i = 0; i < mux_chip->controllers; ++i) {
>>>> +		struct mux_control *mux = &mux_chip->mux[i];
>>>> +
>>>> +		if (mux->cached_state == MUX_CACHE_UNKNOWN)
>>>> +			continue;
>>>> +
>>>> +		ret = mux_control_set(mux, mux->cached_state);
>>>> +		if (ret < 0) {
>>>> +			dev_err(&mux_chip->dev, "unable to restore state\n");
>>>> +			if (!global_ret)
>>>> +				global_ret = ret;
>>>
>>> Hmm... This will record the first error and continue.
>>
>> In the v2 we talked about this with Peter Rosin.
>>
>> In fact, in the v1 (mux_chip_resume() didn't exists yet, everything was
>> done in the mmio driver) I had the same behavior: try to restore all
>> muxes and in case of error restore the first one.
>>
>> I don't know what is the right solution. I just restored the behavior I
>> had in v1.
> 
> Okay, I believe you know what you are doing, folks. But to me this approach
> sounds at bare minimum "unusual". Because the failures here are not fatal
> and recording the first one may or may not make sense and it's so fragile
> as it completely implementation-dependent.

I guess if there is an error, the resume is completely dead so no need
to continue.
If it's okay for Peter I can return on first failure.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


