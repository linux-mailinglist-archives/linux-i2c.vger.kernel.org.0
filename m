Return-Path: <linux-i2c+bounces-2439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71F880D2D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 09:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEEDA1F2309E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 08:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7079837169;
	Wed, 20 Mar 2024 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YZcI3zZ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B738F94;
	Wed, 20 Mar 2024 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923849; cv=none; b=WusI+gZVUcr7b+W1MELGUxVnFVnRgYRzp+EZU38F37LiEmDBPCpBNC/3uIKxrdBgnwnOF4BJlhhRW2ZoHnyidT2j3cNBOmX2wm0MjyONSKidL+/JwRRHtuVayklN6L9pFH8dqMOvFydl6t1Kj+iSogioHk8JM+ETz4xkK38Ud+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923849; c=relaxed/simple;
	bh=e7sm5KHKe7u07Hsum6EAU2IzxwlcrcHFBumoupR3X0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxuYaJdW8uXRk4Spt+/0QGqZmodE5mBprctzoOqs7tzXP3uZW/x+Q1vhTQGOs7z8b8kgiAHZqOazg9aqIWhtzSpGFQNaj575B9+Wm/sPtJrhD0hy9VuH6LxaU3tWowxOo3bBpwfRTV25kcpFhnDjhuppG+q9Y2cKGQjZvhobZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YZcI3zZ6; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45FB44000B;
	Wed, 20 Mar 2024 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710923843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=STDUP9Qpyn6byZT3Ex4nieAzKGvpxzwoBCLFYRcWYac=;
	b=YZcI3zZ6pCAGbOyaL4vujc3a8ofF3MTLoqFnqYp2nnh6+aION1xaleoyRffG047ewxT09f
	sAbNU86SW5htuCuTQnymVuuwp/9TS+uJ854aCbULiTNRZLut0QO6yurLmTxiWbboBE3Vzm
	idoVKgot7+G7goramB7nNFKAjUuPNJ3KWJB3N0XiT3x8T/NUECF7n64SH3OfaKGlZBGilc
	Rtwp2GMx7wArlXzCFnyM+RVp2pEedhtJy6oDAuH60kBFJK9byFbZNVdqce+2o4QoBChdg2
	WTV5ompOrojR4xHgMsWPjDHilcSja1wX1gZ5i3z5sqYkp3un611thZiP4rQbCg==
Message-ID: <feb63292-8739-41b2-9503-c83a6fd930fd@bootlin.com>
Date: Wed, 20 Mar 2024 09:37:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
Content-Language: en-US
To: Dhruva Gole <d-gole@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
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
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>
 <20240320074431.6yzao3jlyaxuii7c@dhruva>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240320074431.6yzao3jlyaxuii7c@dhruva>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 3/20/24 08:44, Dhruva Gole wrote:
> Hi,
> 
> On Mar 04, 2024 at 16:35:45 +0100, Thomas Richard wrote:
>> The goal is to extend the active period of pinctrl.
>> Some devices may need active pinctrl after suspend() and/or before
>> resume().
>> So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
>> have active pinctrl until suspend_noirq() (included), and from
>> resume_noirq() (included).
>>
>> The deprecated API has been removed to use the new one (dev_pm_ops struct).
>>
>> No need to check the pointer returned by dev_get_drvdata(), as
>> platform_set_drvdata() is called during the probe.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
> 
> I was planning to do this but didn't see particular benefit to it. Do
> you see the benefit on your specific device? Can you help me understand
> how? Not against the patch, just curious.

Hello Dhruva,

We need this patch to support suspend to ram for the PCIe on J7200.
In root complex mode, a gpio is used to reset endpoints.
This gpio shall be managed during suspend_noirq and resume_noirq stages.
On J7200 this gpio is on a gpio expander.
So we need this patch to restore pinctrl to be able to do i2c accesses
in noirq stages.

Best Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


