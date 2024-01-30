Return-Path: <linux-i2c+bounces-1537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9184290B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 17:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77523B26175
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 16:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74A61272AF;
	Tue, 30 Jan 2024 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TpeOY9Xw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6A0823A7;
	Tue, 30 Jan 2024 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706631909; cv=none; b=XA5uMQKH/ocBBRNGzr2Uv2dDuDtL24WRPLZsOzlKdSEbuZBTHbxEQPRG8NxXDBPwuBaq1GNdwXHDqkxhrvp4bw+TzbslFkjq5tDFrwNk0Q5YfcuzzbDei/jK6V0c5OnHDBm0LOzzrYcOHyQYpjXU0NEf/qaa6TCnF6Dwq65+a0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706631909; c=relaxed/simple;
	bh=pXwScWKaKoX+opoHur9ak2s0rrsf9s6RpeqRH1p4uY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h047Y5VlMWm/v8ah/eC6ZZNlhzdIElOywBo9JlFf0yXv3Im4TIK+CHRRyv5U2pABE2oVje7gGcYOoIFrE1f819qgP8Y20ob2dkHsIbiiiLWZ8FhdxNf2C6exEEQVCvcUD2Zp35NdRPJzbyslpoJAbIGXI2qblkzFCoc8rC2DO8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TpeOY9Xw; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88403E000D;
	Tue, 30 Jan 2024 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706631898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHkqbFk+Vk9oWvO+zXaPrJlPTtbdOjauegS4Logzkxc=;
	b=TpeOY9XwHjybi7vDlZoSJEubrDKOD/C/3lglkP7G//elDe4lrK1vGTAozuHEZQ4rEQV0QV
	Flx7pENaAQoeA8SoDLt8PcmYicrAAYXYxAwigTNFzdysIb6ahwei1RdWUttg8DFN1sgRAM
	/4ND8G2IK8g3pUY6JUog/Z663HyHWnERZ78rVtSngvqy1auUeQ9cuNc/dchqwh0ajmF21u
	MlLLlH0YmN0lWfTOALXCw+P5h5FZpk6iaKN1xwF4Zi1wLWV5Qw7o46kY5TxQTzcrd4HLMb
	z2AKrPREptUMw40VXgqsoTS2IOZJbW29lc787rqvmYUVxdFmpR+Q6ad7tGQpEg==
Message-ID: <344da0db-55ef-4445-8e14-9c2f53e0c33c@bootlin.com>
Date: Tue, 30 Jan 2024 17:24:55 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] mux: add mux_chip_resume() function
Content-Language: en-US
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>
 <6568893d-13c7-ef1f-9c3f-88de0701c7aa@axentia.se>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <6568893d-13c7-ef1f-9c3f-88de0701c7aa@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/30/24 09:25, Peter Rosin wrote:
> Hi!
> 
> 2024-01-26 at 15:36, Thomas Richard wrote:
>> The mux_chip_resume() function restores a mux_chip using the cached state
>> of each mux.
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>>  drivers/mux/core.c         | 27 +++++++++++++++++++++++++++
>>  include/linux/mux/driver.h |  1 +
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
>> index 775816112932..896f74b34eb8 100644
>> --- a/drivers/mux/core.c
>> +++ b/drivers/mux/core.c
>> @@ -215,6 +215,33 @@ void mux_chip_free(struct mux_chip *mux_chip)
>>  }
>>  EXPORT_SYMBOL_GPL(mux_chip_free);
>>  
>> +/**
>> + * mux_chip_resume() - restores the mux-chip state
>> + * @mux_chip: The mux-chip to resume.
>> + *
>> + * Restores the mux-chip state.
>> + *
>> + * Return: Zero on success or a negative errno on error.
>> + */
>> +int mux_chip_resume(struct mux_chip *mux_chip)
>> +{
>> +	int ret, i;
>> +
>> +	for (i = 0; i < mux_chip->controllers; ++i) {
>> +		struct mux_control *mux = &mux_chip->mux[i];
>> +
>> +		if (mux->cached_state != MUX_CACHE_UNKNOWN) {
>> +			ret = mux_control_set(mux, mux->cached_state);
>> +			if (ret < 0) {
>> +				dev_err(&mux_chip->dev, "unable to restore state\n");
>> +				return ret;
> 
> I'm don't know what is expected of the core resume code on error,
> but is it ok to return on first failure? Is it not better to try
> to restore all muxes and return zero if all is well or the first
> failure when something is up?
> 
> But maybe the resume is completely dead anyway if there is any
> failure? In that case the above early return is fine, I guess...
> 

In the first iteration of this series (when it was done in mmio driver),
it restored all muxes and returned zero or the first failure.
I don't know why I changed the behaviour.
For me it's better to try to restores all muxes.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


