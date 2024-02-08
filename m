Return-Path: <linux-i2c+bounces-1662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80B84E4E2
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 17:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2627128C275
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 16:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDB47EF05;
	Thu,  8 Feb 2024 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QNqfu+Sy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00D87EEF8;
	Thu,  8 Feb 2024 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707409179; cv=none; b=VLzcDaf9I19japxnwwOBSrQr+P8ty3KdVDPgWfyLSfjMYDa2mIU94duIVx0SlLGJbGgGHt6kNUKZ9m0hEkcLv0FUi91DrnfyVvFHy/rTOL5xMy2ampzSLYZYjoKEGaG6wmSP2DO0E1cExFahFzFLhbG2B+rv8jxy8OOZRrqgfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707409179; c=relaxed/simple;
	bh=VvSGNV6b13e7HPMqih9K802mDaoqJaDzuGfo7FTl4pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHyUTYygUbpYb7FmfF/SFRfxOVta4A1S975ZOX0XFX5GGynlhcx8XdFT4EzsE/HV+jgZXGrqwn+J2rDp5pjv8PGukLojFeEebpxcF1BrapmZvLMfzJlbGsiVenLcCQiKc3ml97GVHztmADOm60J+VgYjUnxGcj59wSEz3GPOaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QNqfu+Sy; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ECA340004;
	Thu,  8 Feb 2024 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707409168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2TLPkr/TOdJMNowIWx3rjtlSXIwzGhq1RSaqhd7JXE=;
	b=QNqfu+SyJHYhyGlvwAZsb9NUhHgTVxE3ArJ09CQwC/vdWPX0zKeI6EiZWzY9kjfvj8COxc
	RbVvS+FPBwH6mVflj/a+xeG6nBzagrBVOnxsuU1P4ftNAozaKHz6E94P7KM+5I5Xt+irc2
	wVoDH5jtXIVQgw7ZR3xpEG3vNPmPUv+EgoX/4Oq0rFASzSzplEiqpIioYDlta0lHCcr6DQ
	WXWQ8BNt0m5cWKAP8ne7CScpygoxdJgtMpDfKE6ZJMiuRBWU55NuCOj/AtC3kEzTZ/ZJRq
	Ie5Ym+Lj8MKHGPDFZBwc5YwnluGyQkVPvx03Mn35D4XW7GHaAPo7708x1Ks4VQ==
Message-ID: <95032042-787e-494a-bad9-81b62653de52@bootlin.com>
Date: Thu, 8 Feb 2024 17:19:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to
 suspend_noirq/resume_noirq
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, Haojian Zhuang
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
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
 <20240116074333.GO5185@atomide.com>
 <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com>
 <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/28/24 01:12, Linus Walleij wrote:
> On Fri, Jan 19, 2024 at 6:01 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 1/16/24 08:43, Tony Lindgren wrote:
>>> * Thomas Richard <thomas.richard@bootlin.com> [240115 16:16]:
>>>> Some IOs can be needed during suspend_noirq/resume_noirq.
>>>> So move suspend/resume callbacks to noirq.
>>>
>>> So have you checked that the pca953x_save_context() and restore works
>>> this way? There's i2c traffic and regulators may sleep.. I wonder if
>>> you instead just need to leave gpio-pca953x enabled in some cases
>>> instead?
>>>
>>
>> Yes I tested it, and it works (with my setup).
>> But this patch may have an impact for other people.
>> How could I leave it enabled in some cases ?
> 
> I guess you could define both pca953x_suspend() and
> pca953x_suspend_noirq() and selectively bail out on one
> path on some systems?

Yes.

What do you think if I use a property like for example "ti,pm-noirq" to
select the right path ?
Is a property relevant for this use case ?

Regards,

> 
> Worst case using if (of_machine_is_compatible("my,machine"))...
> 
> Yours,
> Linus Walleij
-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


