Return-Path: <linux-i2c+bounces-1002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C681E880
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 17:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A937282FB3
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 16:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A402D4F615;
	Tue, 26 Dec 2023 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EG/5PsFl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FD4F209;
	Tue, 26 Dec 2023 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 983671C0002;
	Tue, 26 Dec 2023 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703609230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpMtIUDRlEAdXOuUM7RrfvoQHPEx0gmuNKvS2j61YTo=;
	b=EG/5PsFlfw3gmirnFS9nxoFJXk+OEa1U/0I0PQggEfYnrdQkdwOjTKxbY7YPNkVrt/kj8R
	hO2vVQEGS3JKeo0WjZyb5q255Pgo+g1O24f3/IBk3cJGC+gF9+/DCbjEH7Ts5oISCPkru2
	2uXIIIfBSnC715npAven87Ei2mvo/KBOwMKb/F1hNhxvrf3xbAq648KsjSSWuwawEF931+
	8PYuXQ15zm8htdbGaY1PtbXZwhnqNdRhd/ZH3jJe/+erSZvc3UzsbJ8nGW4MFw56hiUZbb
	VAWojmcYQaOW7X1WrazdRZpYArwHwW6/edn6ZOHv7HSHRvaMv3ltbNJkJA69Cw==
Message-ID: <dc19f432-afa6-422a-a60e-622e17d646a9@bootlin.com>
Date: Tue, 26 Dec 2023 17:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: omap-i2c: runtime pm issue during suspend to ram
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Tony Lindgren <tony@atomide.com>
Cc: linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Kumar Udit <u-kumar1@ti.com>
References: <f68c9a54-0fde-4709-9d2f-0d23a049341b@bootlin.com>
 <4c31acd8-4edb-44f5-9a90-cb2f2dc530b6@bootlin.com>
 <20231220111415.GZ5166@atomide.com>
 <7b743758-fbc1-4cad-bfbc-d3fd3e69ce17@bootlin.com>
 <CXT7H2RTWJLL.11PFC2VV861BW@bootlin.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CXT7H2RTWJLL.11PFC2VV861BW@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 12/20/23 14:46, Théo Lebrun wrote:
> Hello,
> 
> On Wed Dec 20, 2023 at 12:36 PM CET, Thomas Richard wrote:
>> On 12/20/23 12:14, Tony Lindgren wrote:
>>> * Thomas Richard <thomas.richard@bootlin.com> [231220 10:50]:
>>>> On 12/19/23 18:15, Thomas Richard wrote:
>>>>> Hello,
>>>>
>>>> I add some people in this thread.
>>>>
>>>>>
>>>>> I have a gpio expander (pca953x driver) connected to an i2c controller
>>>>> managed by the omap-i2c driver.
>>>>> And I have some issues with pm_runtime_force_suspend/resume during
>>>>> suspend to ram.
>>>>> For some reasons, related to hardware design, I need to access to this
>>>>> gpio expander during suspend_noirq and resume_noirq. So I had to move
>>>>> the suspend/resume of the pca953x to suspend_noirq/resume_noirq.
>>>
>>> Hmm at noirq level you need to do polling on the i2c controller?
>>
>> Hello Tony,
>>
>> Thanks for your reply.
>>
>> No, irq is still active in suspend_noirq for this i2c controller due to
>> the flag IRQF_NO_SUSPEND [1].
>> If this flag is set, the interrupt is still enabled in suspend_noirq [2].
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.7-rc6/source/drivers/i2c/busses/i2c-omap.c#L1473
>> [2]
>> https://www.kernel.org/doc/html/latest/power/suspend-and-interrupts.html#the-irqf-no-suspend-flag
>>
>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
>>>>> index 42165ef57946..fe79b27b46fd 100644
>>>>> --- a/drivers/i2c/busses/i2c-omap.c
>>>>> +++ b/drivers/i2c/busses/i2c-omap.c
>>>>> @@ -1575,9 +1575,24 @@ static int __maybe_unused
>>>>> omap_i2c_runtime_resume(struct device *dev)
>>>>>         return 0;
>>>>>  }
>>>>>
>>>>> +static int omap_i2c_suspend(struct device *dev)
>>>>> +{
>>>>> +       pm_runtime_get_sync(dev);
>>>>> +       pm_runtime_disable(dev);
>>>>> +       return 0;
>>>>> +}
>>>
>>> If you want the i2c controller enabled during suspend, you can leave it
>>> enabled above, and as we already have SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
>>> doing force_suspend() and force_resume(), you can runtime PM put on
>>> resume. So something like below might do the trick:
>>
>> Ok I'll test it. Thanks
> 
> The issue with this approach is that it requires knowing at suspend-time
> if the controller will be used at resume_noirq-time. Ideally the
> controller's behavior would not be modified until a xfer is done at
> resume_noirq time. There are many platforms that use this driver that
> probably don't need the controller woken up.
> 

@Tony, I tested your patch and it works well. Thanks !!
As Théo mentioned it, we wake up the controller even if noboy need it in
suspend_noirq/resume_noirq.
I don't know if the fact that we cannot wake up a runtime suspended
device in suspend_noirq/resume_noirq (yes I know runtime pm is disabled
in suspend_noirq/resume_noirq) is a bug or not.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


