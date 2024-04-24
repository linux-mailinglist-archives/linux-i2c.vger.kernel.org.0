Return-Path: <linux-i2c+bounces-3100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E38B0743
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 12:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF03D283379
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 10:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D594B15957D;
	Wed, 24 Apr 2024 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dyD6o43s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E3915956F;
	Wed, 24 Apr 2024 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713954366; cv=none; b=bdix13e7ml+9PLLUc4zAbiyYieSP71TESMr4GgmvrMiOSPpvTEmdHfQPx9hM9H1vQgVaTTiRfuHnvPvwJ6zcQbj/FTct3FAHfjufgENr+30b2fQmThvVcGGVCdAr1CIU7Vbrqqb2ro+JUcydPmjIux+QD7F3JRuYvQu5t3UXyNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713954366; c=relaxed/simple;
	bh=AZWGz/WvtgoCzFOkz9gz6ilvmzSpiEaQFbmh8lEyIyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwF8VdG8fJVGdLH7O99SRBf81PWdilx6m+OQLjYCMdoMWt4aADHXFjcGv1EEe7iGWpmIqqRpHngITO91UzkUerlS/kRN/MadlMVMuLBq3gPkrZhBV74Kvo1Vma5ElXDKoRj2JSzO71d+2d8P+DrR4TmtoyQSYq9sM68iRPyan00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dyD6o43s; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 3784DC670A;
	Wed, 24 Apr 2024 10:24:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A89D6000A;
	Wed, 24 Apr 2024 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713954267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVEm7ob18VpKCaMTFhx5G9Kb6z4kp/qqC4mfGOtfzt0=;
	b=dyD6o43s+X70tu36CaPntCI9S7G6Mpdm4x7hO6BsSEu9+z36dVwBteNQBwwE6iaBeSsi3c
	QQheFRj/aPn5G/WMf+yvs9Pvyqlw7gnKvjlSXYYNjxagiLXQp4uGshTYl4sLZHiPtL+MgE
	s2qOhPMm2usFpwEyyFnNGPXX+zYMyEEpxGsYdUiMcsnGAPgIlfSO7rrotuYJf7jDr2Z2LT
	1g/pbBPsm0EBBk46JMYX/O0CmzfZ9cFAdHFXn0O/JWxV0P9p7bE8I/DuzdVuwIkfxdKMdc
	Mi/GkwbyXIaSvZu9lxr4kZ1I7Da7PbFs5pHVPy69iriR07mtv50BcwN9qZbF3w==
Message-ID: <8d49f316-bb17-4956-a62b-e64d460825d4@bootlin.com>
Date: Wed, 24 Apr 2024 12:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] i2c: omap: wakeup the controller during
 suspend() callback
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Peter Rosin <peda@axentia.se>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240422194423.GA414623@bhelgaas>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240422194423.GA414623@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 4/22/24 21:44, Bjorn Helgaas wrote:
> On Mon, Apr 22, 2024 at 11:40:02AM +0200, Thomas Richard wrote:
>> On 4/19/24 10:47, Andi Shyti wrote:
>>> Hi Thomas,
>>>
>>>> +static int omap_i2c_suspend(struct device *dev)
>>>> +{
>>>> +	/*
>>>> +	 * If the controller is autosuspended, there is no way to wakeup it once
>>>> +	 * runtime pm is disabled (in suspend_late()).
>>>> +	 * But a device may need the controller up during suspend_noirq() or
>>>> +	 * resume_noirq().
>>>> +	 * Wakeup the controller while runtime pm is enabled, so it is available
>>>> +	 * until its suspend_noirq(), and from resume_noirq().
>>>> +	 */
>>>> +	return pm_runtime_resume_and_get(dev);
>>>> +}
>>>> +
>>>> +static int omap_i2c_resume(struct device *dev)
>>>> +{
>>>> +	pm_runtime_mark_last_busy(dev);
>>>> +	pm_runtime_put_autosuspend(dev);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static const struct dev_pm_ops omap_i2c_pm_ops = {
>>>>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>>  				      pm_runtime_force_resume)
>>>> +	SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
>>>
>>> If you don't have CONFIG_PM_SLEEP, though, this doesn't compile.
>>
>> Hello Andi,
>>
>> Yes indeed, the __maybe_unused attribute is missing for
>> omap_i2c_suspend() and omap_i2c_resume().
> 
> Isn't there a way to avoid having to use the __maybe_unused attribute?
> 
> E.g., use DEFINE_SIMPLE_DEV_PM_OPS() as is done by these:
> 
>   82f9cefadac4 ("serial: 8250_exar: switch to DEFINE_SIMPLE_DEV_PM_OPS()")
>   f243df0a0be0 ("media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()")
>   6ccc22a5afcb ("net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()")

Yes you're right, I don't need the __maybe_unused attribute if I use
NOIRQ_SYSTEM_SLEEP_PM_OPS().

By the way I can add a patch in the series to remove all the
__maybe_unused attributes of this driver.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


