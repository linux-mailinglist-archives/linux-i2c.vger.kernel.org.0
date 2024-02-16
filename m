Return-Path: <linux-i2c+bounces-1808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D73857701
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 08:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA41C1C21F4C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4D71759D;
	Fri, 16 Feb 2024 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="psvjRJ16"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A514AA7;
	Fri, 16 Feb 2024 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708069947; cv=none; b=EWWBYoO03aSTFW5eGQl/t1bPV7dLn3ua0RgAaUjD0xca3Q5UDOnnGShvOA/C0WVLUMYQVvdg+PkGhlAyr/HYS+PbkiSRK3YCQcw8y/lPmyRZBrqK7uDjTzqA1luJVyxV61ZwVHWsQHmlh7vWYHOKgZGy/gp5wHCQt3187hjj5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708069947; c=relaxed/simple;
	bh=Vynf5DoweuXHHLSE4lGddXqNt/Xoy7UcJ0TOB9VRc/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzOS56j0mTVZbS5Fas+NbBIaKHFFXv5XOzMqxWoE75vLho3eX/tZnLoGlFog4nUw/w9tVdIiiVslLcX5wrvZeh452YXxl3D6nNYxx3JLIrVzXb/YxwzGk5xtx6upoV+4z41d7XsEmsWAiK0P3kos9d75EO1ZBCEtR5iijHcMXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=psvjRJ16; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DA131C0005;
	Fri, 16 Feb 2024 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708069942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVeiECxEmwSLffzbtwy2YG4CyEm4W66/wRiP637DW7E=;
	b=psvjRJ16HrEu/GqFLLL7wMMfKBPT08MCl4ar0FAhJ0EKI6MP0fdlU9/TMRf2aJcPbYuHTT
	Y/XaWJ5OWcn2Ggc41n+8jK67j9PIuW99NYEcgM6cqWyWbdDssXoZ47Z7/Z2Iy53x05h9Eb
	B3p8wByuOej2VhFVfrmVTvV/uJNYxSvZtxPhi08Uq7ysqNY/mn4KsAxzwT0Vnpk33SKyAH
	9YgXPL9T+KdVxh3hEjjdo9kwWrADnu9szuZSYl+ofMyLx2D0BOytKOrgIrdNHN1q9n9t2b
	+MsYZsZV4HOyhZnFWK6rQfV+wPw8aelkKg/RHraSCGZQOpQOZcJmL1zXzqpfMA==
Message-ID: <f1d2c9b0-238d-4b09-8212-62e00a2192b2@bootlin.com>
Date: Fri, 16 Feb 2024 08:52:17 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] mux: add mux_chip_resume() function
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
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Zc4t82V9czlEqamL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/15/24 16:29, Andy Shevchenko wrote:
> On Thu, Feb 15, 2024 at 04:17:50PM +0100, Thomas Richard wrote:
>> The mux_chip_resume() function restores a mux_chip using the cached state
>> of each mux.
> 
> ...
> 
>> +int mux_chip_resume(struct mux_chip *mux_chip)
>> +{
>> +	int global_ret = 0;
>> +	int ret, i;
>> +
>> +	for (i = 0; i < mux_chip->controllers; ++i) {
>> +		struct mux_control *mux = &mux_chip->mux[i];
>> +
>> +		if (mux->cached_state == MUX_CACHE_UNKNOWN)
>> +			continue;
>> +
>> +		ret = mux_control_set(mux, mux->cached_state);
>> +		if (ret < 0) {
>> +			dev_err(&mux_chip->dev, "unable to restore state\n");
>> +			if (!global_ret)
>> +				global_ret = ret;
> 
> Hmm... This will record the first error and continue.

In the v2 we talked about this with Peter Rosin.

In fact, in the v1 (mux_chip_resume() didn't exists yet, everything was
done in the mmio driver) I had the same behavior: try to restore all
muxes and in case of error restore the first one.

I don't know what is the right solution. I just restored the behavior I
had in v1.

> 
>> +		}
>> +	}
>> +	return global_ret;
> 
> So here, we actually will get stale data in case there are > 1 failures.

Yes, indeed. But we will have an error message for each failure.

> 
>> +}
> 
-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


