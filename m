Return-Path: <linux-i2c+bounces-904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5C819E35
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 12:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEE82820EF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D15219EF;
	Wed, 20 Dec 2023 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZDGHwBCP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6221379;
	Wed, 20 Dec 2023 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E3941BF203;
	Wed, 20 Dec 2023 11:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703072162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+sCRFL2UuJ2Inm7d7HF8h3P+fdYtvsGALrrMT6jGy0=;
	b=ZDGHwBCP9C5RS5Mdj3Bjf4D/2IhVYaD4W3rg5u6oSwMrJ0GWyCOrJ2sRMX3unF2JsvYAKU
	9CVKuqW96AzpS7KO+IVyiTTqfRax+kMnYFYarNh0O1Dehie7HRuEaG/qOLpkr21/isUFEF
	u/Sna1FeAFcNGAEydaPDMtk/F1umQbPGCJGbYOD485cJ441usOuviK9um+PeBUoJJWQ7io
	uFDBm7CXpxJrDoaszDFqpGfhER0JhIAVVkA7V2FCGqDelbxqWbWRUmT4doXYFHwvH/H+dp
	g7apDyGkUJPmgKLcXnnml1jG7kPoIerqneXsdfb+riWvgS0IJ7xgbCass/bXhA==
Message-ID: <7b743758-fbc1-4cad-bfbc-d3fd3e69ce17@bootlin.com>
Date: Wed, 20 Dec 2023 12:36:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: omap-i2c: runtime pm issue during suspend to ram
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Kevin Hilman <khilman@kernel.org>, =?UTF-8?Q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Kumar Udit <u-kumar1@ti.com>
References: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
 <4c31acd8-4edb-44f5-9a90-cb2f2dc530b6@bootlin.com>
 <20231220111415.GZ5166@atomide.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20231220111415.GZ5166@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 12/20/23 12:14, Tony Lindgren wrote:
> * Thomas Richard <thomas.richard@bootlin.com> [231220 10:50]:
>> On 12/19/23 18:15, Thomas Richard wrote:
>>> Hello,
>>
>> I add some people in this thread.
>>
>>>
>>> I have a gpio expander (pca953x driver) connected to an i2c controller
>>> managed by the omap-i2c driver.
>>> And I have some issues with pm_runtime_force_suspend/resume during
>>> suspend to ram.
>>> For some reasons, related to hardware design, I need to access to this
>>> gpio expander during suspend_noirq and resume_noirq. So I had to move
>>> the suspend/resume of the pca953x to suspend_noirq/resume_noirq.
> 
> Hmm at noirq level you need to do polling on the i2c controller?

Hello Tony,

Thanks for your reply.

No, irq is still active in suspend_noirq for this i2c controller due to
the flag IRQF_NO_SUSPEND [1].
If this flag is set, the interrupt is still enabled in suspend_noirq [2].

[1]
https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/i2c/busses/i2c-omap.c#L1473
[2]
https://www.kernel.org/doc/html/latest/power/suspend-and-interrupts.html#the-irqf-no-suspend-flag

> 
>>> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
>>> index 42165ef57946..fe79b27b46fd 100644
>>> --- a/drivers/i2c/busses/i2c-omap.c
>>> +++ b/drivers/i2c/busses/i2c-omap.c
>>> @@ -1575,9 +1575,24 @@ static int __maybe_unused
>>> omap_i2c_runtime_resume(struct device *dev)
>>>         return 0;
>>>  }
>>>
>>> +static int omap_i2c_suspend(struct device *dev)
>>> +{
>>> +       pm_runtime_get_sync(dev);
>>> +       pm_runtime_disable(dev);
>>> +       return 0;
>>> +}
> 
> If you want the i2c controller enabled during suspend, you can leave it
> enabled above, and as we already have SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
> doing force_suspend() and force_resume(), you can runtime PM put on
> resume. So something like below might do the trick:

Ok I'll test it. Thanks

> 
> static int omap_i2c_suspend(struct device *dev)
> {
> 	return pm_runtime_resume_and_get(dev);
> }
> 
> static int omap_i2c_resume(struct device *dev)
> {
> 	pm_runtime_mark_last_busy(dev);
> 	pm_runtime_put_autosuspend(dev);
> 
> 	return 0;
> }
> 
>>>  static const struct dev_pm_ops omap_i2c_pm_ops = {
>>>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>                                       pm_runtime_force_resume)
>>> +       SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
>>>         SET_RUNTIME_PM_OPS(omap_i2c_runtime_suspend,
>>>                            omap_i2c_runtime_resume, NULL)
>>>  };
> 
> And with the changes you did to omap_i2c_pm_ops naturally. This way
> the controller should stay active until noirq ops.
> 
> Of course it's possible I did not quite understand what you're trying
> to do, but if so please let me know :)

The context is:
One gpio of this expander is the reset pin of PCIe endpoints.
And this reset pin shall be managed during the suspend_noirq and
resume_noirq of the PCIe controller.
That's why I need to do some i2c accesses during suspend_noirq/resume_noirq.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


