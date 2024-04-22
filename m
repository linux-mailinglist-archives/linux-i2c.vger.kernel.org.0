Return-Path: <linux-i2c+bounces-3040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2778AC91B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 11:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5391C210E5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 09:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB3B824AB;
	Mon, 22 Apr 2024 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S+pNIIbd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539BD64A98;
	Mon, 22 Apr 2024 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713778814; cv=none; b=POy5crvRabNoKCrkc1Voha1pYx2eJWvn/hjsu/eS8IQFSjoaIWvzMxeUBnliVGBgeGlAF0jBpWC+A0pgBztybxLv7NwA5+SxcUQyDNN+Sp71yvA788vdLMb9U79tusNgyQjM2bmYY11GXe8Gvf6bw5nXHsqhJiKrCs/YQID+J2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713778814; c=relaxed/simple;
	bh=GlLSRRIiVc809HVRdBjHwu3wV54d3OJygCGFqUwLYpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lhf4dilDdl2lEDfzjGz3f32hS5CI1skF5NB8zAcrA0VkrD8dGZ98S0DWNPIanYXIxjU2tCq7Kl2681f20HD6y2yt+2TXk7PGr6TGmgA9cZNDz4jqNy+YGMFB1t7u21IagwpkNFHrDtO2S+9UV8xMpSrsEbETU6vEdGTmb1zp8Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S+pNIIbd; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ADA6240007;
	Mon, 22 Apr 2024 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713778803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RwTZz+QOuJFhVcfuZG7WHposSII0qZDyi7L1Xxt7bUA=;
	b=S+pNIIbddjv1f/2u29qA50eSn2u78IHQoN/yeXQn9kXAkAxKzudzCKTzUBwh806OYKshiC
	XGYhR4UsoJ0QlB3O0AUh1LU1fBv9Y3UF6JuutBlAfd/g6+gu+4UwRgFn2ib0YSsJgcmyCG
	/lnMkpE8r8xkMCye4NTD0jiU49Wjlf3MFmEcL3mVdAcR5gD9sJcM5/uqBb+tdlL8wkj/Yx
	ro+vEj/ipMhhHRpGzc+o8gn5YOKRaRb41slSwYMfQVbvK/vhNFZcNmVT9JwX0RLnisKXtu
	0FAMl2TB1Pr0wTlhu5nFkiJpL2ffcyqpdkWVLP3IVvuD6KXXm8p33rFygEY6VQ==
Message-ID: <cd5d0aa5-ca0c-47a5-8e40-4742bc939cfa@bootlin.com>
Date: Mon, 22 Apr 2024 11:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] i2c: omap: wakeup the controller during
 suspend() callback
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
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
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-2-4b8c46711ded@bootlin.com>
 <eld637v3jvgqrjubwqlsxkafgqiqcfpukfwpcd5qoyvyrhubff@n6gzrwzr2klh>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <eld637v3jvgqrjubwqlsxkafgqiqcfpukfwpcd5qoyvyrhubff@n6gzrwzr2klh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 4/19/24 10:47, Andi Shyti wrote:
> Hi Thomas,
> 
>> +static int omap_i2c_suspend(struct device *dev)
>> +{
>> +	/*
>> +	 * If the controller is autosuspended, there is no way to wakeup it once
>> +	 * runtime pm is disabled (in suspend_late()).
>> +	 * But a device may need the controller up during suspend_noirq() or
>> +	 * resume_noirq().
>> +	 * Wakeup the controller while runtime pm is enabled, so it is available
>> +	 * until its suspend_noirq(), and from resume_noirq().
>> +	 */
>> +	return pm_runtime_resume_and_get(dev);
>> +}
>> +
>> +static int omap_i2c_resume(struct device *dev)
>> +{
>> +	pm_runtime_mark_last_busy(dev);
>> +	pm_runtime_put_autosuspend(dev);
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct dev_pm_ops omap_i2c_pm_ops = {
>>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>  				      pm_runtime_force_resume)
>> +	SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
> 
> If you don't have CONFIG_PM_SLEEP, though, this doesn't compile.

Hello Andi,

Yes indeed, the __maybe_unused attribute is missing for
omap_i2c_suspend() and omap_i2c_resume().

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


