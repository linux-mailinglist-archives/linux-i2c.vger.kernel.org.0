Return-Path: <linux-i2c+bounces-1538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93EA84298C
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 17:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6EC1F2BCF7
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 16:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F896129A7B;
	Tue, 30 Jan 2024 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WJnGlYvs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C46B128388;
	Tue, 30 Jan 2024 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632702; cv=none; b=cPkMig5llDg0pMilykzhr+u6+3eTk7nvT3QG99KubRg8DkQB0IRUkivD5scUBYxeKB+vZe0cLqi3VD6Qh60wpkLbGFG9T5aLBj8P5ymd189cMySlqkdIT8JOM3zzk7wPiNzEzdlByyDb2yJDTS9bNsQ901eZOY9ainrZeFGD7fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632702; c=relaxed/simple;
	bh=M2wO7sSvCPR2982vZ06PIUvIfGKMG54QQ49RvdvfJ4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5bGL3U1v8nIb9taC0nv1lBGU9QxIxr0cMEbh7HFu7+ItShq5PtfKKtgceNWE+fiGBzICyCdbfVz1XYqUN7xgofgqNrb0hkgs/+HISMIhbI/4wt3KEfhlVE4EMEHH2M9Ftckjw9fNe6DT701Xd19ITyTF4WHySRgXYPDPze1P/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WJnGlYvs; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C932FF802;
	Tue, 30 Jan 2024 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706632690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TplrVwlT1KQQSHzhl19fkElU89ykPDWXpM5Ja8kRAJg=;
	b=WJnGlYvsLktLg5YVEN9Gc1gRr1+qFsRheBxrdMHtKhX0EhYL6k098CAcruxMCEhyHXGutn
	vFpG6qz/d4LOwRUl4ySVuhnkRWEaRDVB/weY8qLcaLhH4lVfe59poYOcxtBCfQLdIsQgsT
	cr+TW103IMpfivL5fTtM6wDz2VB0cl1yixDpo0WKESic98lfwYdjvkOMTFxJCEyKvUEabW
	mteGb4Ee6jVAsVdMafL7bmIXSQRjTkhrB4gIDXJQJNMh68dL2595yEmPLQCqqJYohbIpan
	ibg0KXyFQrPgV/3vESu7rY8nQo9lUZ651P006nibWUVpZ+tGeyoBDKzZMv5Lvg==
Message-ID: <3fa57200-4218-4ac8-86b9-3f86723d5cd8@bootlin.com>
Date: Tue, 30 Jan 2024 17:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] mux: add mux_chip_resume() function
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
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>
 <CAHp75Ve2K=v=OrNPH0q+K6vp2283HSMBYYSh0hYbw56snGd+xg@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75Ve2K=v=OrNPH0q+K6vp2283HSMBYYSh0hYbw56snGd+xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/26/24 22:28, Andy Shevchenko wrote:
> On Fri, Jan 26, 2024 at 4:37 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> The mux_chip_resume() function restores a mux_chip using the cached state
>> of each mux.
> 
> ...
> 
>> +int mux_chip_resume(struct mux_chip *mux_chip)
>> +{
>> +       int ret, i;
>> +
>> +       for (i = 0; i < mux_chip->controllers; ++i) {
>> +               struct mux_control *mux = &mux_chip->mux[i];
> 
>> +               if (mux->cached_state != MUX_CACHE_UNKNOWN) {
> 
>   if (_state == ...)
>     continue;
> 
> ?

Yes it makes the code easier to read.
Fixed in next iteration.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


