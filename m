Return-Path: <linux-i2c+bounces-1387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF35832C87
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 16:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 549E3286106
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 15:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFF854BDF;
	Fri, 19 Jan 2024 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jAd3/erb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5BF54BCA;
	Fri, 19 Jan 2024 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705679416; cv=none; b=uHGohhPcXngQW+2MAloMPbz29pXPC8sTrwxgBrIJx07MkKfcIBEjntxCgAyhyX6wOtQnU/LMaTiBOmmq4lLy9wC0pjDw7/n7XXbTHEPHx+7MqtMkR1OaziFqHOi5gCzmSO6NELV+2AKZvJstm/B3h4lO8czOhJzkm5BEDe4G87g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705679416; c=relaxed/simple;
	bh=WEVXR1pA/pzCxaNHR1riPhSJRcWD8lgDhDQ+LReDBqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h599hiBpSFHONWN6BLMFXP8hQ0rcbpn9PpVG9x1EU6XLT9vDS2TaaPo1yTkeplopk05XJaKWXgp+hNbaf+Qs+2KSG3asEFMb9km1EqyjzUO7FLinrh18ONPn/ofCpsnJwKjoAkTiV4JOzsMKzNZJS1dpoiKGWwZJxdkatfxX/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jAd3/erb; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26730C000A;
	Fri, 19 Jan 2024 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705679405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no9Zk1+Ofv930fy1IruQYBJcZcLId9qedsWBTajBqLk=;
	b=jAd3/erbItSU8bRgfAurVO1vRfyY/x0FFjkEhN5ogLafuPpdFJlYMmw2mvONe7FjotJExF
	BCJ0M7Lt4+ymTm4ZxxE8hUAKY/pe8tNemwOl1tSMTwHlHpwxf5NQblXa4VMrDmXoQsrNS5
	5b/Rmf+/gXOlw2geifYAL25tJpZnR5yejCKR8gMnrQ17x0KZP6d/kMzlnHMV5f8bI4EVi7
	dkvJwUcXwAyhIksBlz/wEdHtqMQyIg4YOvKycNYAi3OZvUi9otL4B/8Q0qUTWFa7aAlIJM
	jJIjiN22G+zWSX/1su7DBWwGIYuS9eT9gCUYSoahyvjaAQq5ux+PvpfWVOZocw==
Message-ID: <a4627e51-c851-4abf-a3b2-222b2b315d4e@bootlin.com>
Date: Fri, 19 Jan 2024 16:50:00 +0100
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
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
 <CAHp75VezeBp3Umg4prvdS83WrHViyTs-hBV0SejVD2BBnGYEvg@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VezeBp3Umg4prvdS83WrHViyTs-hBV0SejVD2BBnGYEvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/15/24 20:56, Andy Shevchenko wrote:
> On Mon, Jan 15, 2024 at 6:16 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> Some IOs can be needed during suspend_noirq/resume_noirq.
> 
> ->suspend_noirq() / ->resume_noirq()
> 
>> So move suspend/resume callbacks to noirq.
> 
> ...
> 
>> -static DEFINE_SIMPLE_DEV_PM_OPS(pca953x_pm_ops, pca953x_suspend, pca953x_resume);
>> +static const struct dev_pm_ops pca953x_pm_ops = {
>> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pca953x_suspend_noirq, pca953x_resume_noirq)
>> +};
> 
> Please, use correct / modern macro.
> 

Hello Andy,

Thanks for the reviews.

I applied your comments for the next iteration.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


