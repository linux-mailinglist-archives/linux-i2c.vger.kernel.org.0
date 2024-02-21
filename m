Return-Path: <linux-i2c+bounces-1896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256C85DE9A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 15:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E211C23BE1
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 14:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4767CF2D;
	Wed, 21 Feb 2024 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BH3RU58z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4A69D38;
	Wed, 21 Feb 2024 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708525173; cv=none; b=s7ySvEIystER1Exlmf7nlxhO7zqogkvTYkVF0bXduOEv8q4nYgDjljihpuZanuvIAwqVUCfQlmHxhIRarxBnOYSHJdOKeXtO+kJIpvWBVpuNemFezceCgjN7g+Fa3HZdg4W1OHZf3rxW3ilWasLWFIUbTg0lWvZdxRhIQpnWA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708525173; c=relaxed/simple;
	bh=7wFKTVlWizL57RttcaVLGrwRB1DayJIhODEBnM4Uul8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qu53vKhUD7q0rP+F1rk6XZ9xzUEhDWZe0P+BPAIjW8RDbUKJHHg8B5vOHfBxrgOZX9V4sxqLct62hRmO3ew40ndCdtnGz9UjD0IcMFapzU7PZmYgLpwQ9PAyZJKZ3jdDIpByagp2ZSPxoGcptHAi8gdMprfh32D0dJrZf2TSBXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BH3RU58z; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 334A660005;
	Wed, 21 Feb 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708525167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djgIwKG8h1E1vBHOq7Yx/ZY0Ehwdq+Fa2OAPhHy5Bg0=;
	b=BH3RU58z7cr7I5bVawgKgfnYC5GysBok+JTGHq7LVbJ85EirfpHA2o2XLzRR+7UrXVwEfR
	/wZa6tcSK+DMxgMWmUsnNDaOR0N1r8YgkoRdYceug+1Yk4JmUTFRDvRCA3/cymZ9XpUHr/
	vd1WaoQ4pQTMeRzCHOJKwuvBlu9/+rOifdvv6q5fqfzwFEr1d5o71iFGgd3kc3AOzFnAO1
	A1snWfe4kw4sZl4URubjBTzCzQTc4uqweCPYbYIuoPmUagYG9LKMcqiXTtnvElDi8wKgo0
	I0H6nXBonAHEME2N7LD4uGH31cYGjo3LmMOeUpuFAYUSps2nLsFC7ihsE8gNUA==
Message-ID: <b0220b02-5058-42ec-ba06-251caa4813dc@bootlin.com>
Date: Wed, 21 Feb 2024 15:19:14 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pinctrl: pinctrl-single: remove dead code in
 suspend() and resume() callbacks
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
 <20240102-j7200-pcie-s2r-v3-2-5c2e4a3fac1f@bootlin.com>
 <Zc4tedAhqYX3bQcw@smile.fi.intel.com>
 <78add459-a96a-46c6-83ff-e2657d4d3db4@bootlin.com>
 <Zc96dSff5Y-dufrJ@smile.fi.intel.com>
 <a2c3c5b9-79a3-4793-892c-b1ab79b71c7d@bootlin.com>
 <ZdX28EJ9LtDWfVmH@smile.fi.intel.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <ZdX28EJ9LtDWfVmH@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/21/24 14:13, Andy Shevchenko wrote:
> On Wed, Feb 21, 2024 at 12:01:43PM +0100, Thomas Richard wrote:
>> On 2/16/24 16:08, Andy Shevchenko wrote:
>>> On Fri, Feb 16, 2024 at 08:59:47AM +0100, Thomas Richard wrote:
>>>> On 2/15/24 16:27, Andy Shevchenko wrote:
>>>>> On Thu, Feb 15, 2024 at 04:17:47PM +0100, Thomas Richard wrote:
>>>>>> No need to check the pointer returned by platform_get_drvdata(), as
>>>>>> platform_set_drvdata() is called during the probe.
>>>>>
>>>>> This patch should go _after_ the next one, otherwise the commit message doesn't
>>>>> tell full story and the code change bring a potential regression.
>>>>
>>>> Hello Andy,
>>>>
>>>> I'm ok to move this patch after the next one.
>>>> But for my understanding, could you explain me why changing the order is
>>>> important in this case ?
>>>
>>> Old PM calls obviously can be called in different circumstances and these
>>> checks are important.
>>>
>>> Just squash these two patches to avoid additional churn and we are done.
>>
>> You mean invert the order instead of squash.
> 
> Either would work, but see how much churn in terms of changing just changed
> lines it adds.

OK thanks.

I'll squash the two patches. And I'll add a comment which explains that
I dropped some dead code.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


