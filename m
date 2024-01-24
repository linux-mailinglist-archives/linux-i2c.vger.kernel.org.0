Return-Path: <linux-i2c+bounces-1445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734883AB63
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 15:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91D81F234C5
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 14:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4D17A70C;
	Wed, 24 Jan 2024 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LGo7sy9O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44877A702;
	Wed, 24 Jan 2024 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706105410; cv=none; b=ubjMC6XowjslgqrV/mEkQgzlbyF6D7lMECUjwOyiSXOUOQdilbC+ElmZURgLOPB8kQDbO4mqdW/2emLgAH4ccoXhZh5LGAjYltGB3hGWlaIEpUIHVNyRvjM0LcrurDXPp/VrTxuLDn839igERv948eao9Q8qKQOtz2UOpTFvwNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706105410; c=relaxed/simple;
	bh=SMj/n/Z9fKpBrbi4uiZ+Ws8yfoCXVtmFG6mubuKu1dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4DL00LSPFvb0zTxWmFabIqhpOC+ZrNY3a1m6d7YVmU2V16Ox/xzjg4hpSynJgjfu7zCgp3Y05fivMeLCYf6nB+6/1k8ROOfgPA6oeWo+buedwInnbKadPQFCuGmxqsSLRKnCXUgarh4/cLHhonXMUgXj1KEjZ0okGoraYfL24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LGo7sy9O; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2172EE000D;
	Wed, 24 Jan 2024 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706105400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVQptg6pNr7/Hd/yjH+uKmnG36EBffMLdBd048tdJ9I=;
	b=LGo7sy9O/BrvsaySKByqO5iuOVvbA23QuQBoQKjSjld/7OxJ68DOdIyHmXoc6Za9y19/cx
	SYJq5ney0FY114kRsjbDJMLDAOJqtnwcE7LzQSxff7DK+1rpme72BZ8tdMxoLQvASEiU3X
	Bqdu+yBpbUgaefIxu/lPTMz5LyOCW7pfnD3AI5qNFjDit4K0ygVr7yqSTtUTywmUbGe93/
	du8qimW3Gc78PalZceT1G0i8OWbWMpRwuEajFsDqog7Qsc+Xl448imyv3IdFIOJCNdmAR1
	s1b/TcjdAWcKm8M2IHdo9GurQtybPkNfjCexpdaXnoikr62v6/WBbwaWZQd5CQ==
Message-ID: <830324ea-7fdb-4769-a1c7-08d59905ca4b@bootlin.com>
Date: Wed, 24 Jan 2024 15:09:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] PCI: j721e: add suspend and resume support
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
 <20240102-j7200-pcie-s2r-v1-14-84e55da52400@bootlin.com>
 <CAHp75VfPQz4PWdzFUU_n+R=XohBjyXM0zsjD-bUD2jmb42ds8Q@mail.gmail.com>
 <9cb47f37-bd98-4136-b844-33cf2be593df@bootlin.com>
 <CAHp75Ve30T3t0_vHR7TUVVC_WN23dL_rp1k951Da6Re2DJQezw@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75Ve30T3t0_vHR7TUVVC_WN23dL_rp1k951Da6Re2DJQezw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/22/24 22:36, Andy Shevchenko wrote:
> On Mon, Jan 22, 2024 at 5:30 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 1/15/24 21:13, Andy Shevchenko wrote:
>>> On Mon, Jan 15, 2024 at 6:16 PM Thomas Richard
>>> <thomas.richard@bootlin.com> wrote:
> 
> ...
> 
>>>> +               if (pcie->reset_gpio)
>>>
>>> Dup, why?
>>
>> This pcie->reset_gpio corresponds to PERST# of PCIe endpoints.
>> I assert it during suspend, because I have to deassert it (with a delay)
>> during resume stage [1].
> 
> Ah, sorry for being unclear, I meant that gpiod_set_value*() already
> has that check, you don't need it here.

ok understood, check is useless.

> 
>>>> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> 
> ...
> 
>>>> +               if (pcie->reset_gpio) {
>>>> +                       usleep_range(100, 200);
>>>
>>> fsleep() ?
>>> Btw, why is it needed here, perhaps a comment?
>>
>> The comment should be the same than in the probe [1].
>> Should I copy it? Or should I just add a reference to the probe?
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/pci/controller/cadence/pci-j721e.c#L535
> 
> Either way works for me.
> 
>>>> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 1);
>>>> +               }
> 
> ...
> 
>>>> +#define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
>>>
>>> Is container_of.h included in this file?
>>
>> linux/container_of.h is included in linux/kernel.h.
>> And linux/kernel.h is included in pcie-cadence.h
>> (https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/pci/controller/cadence/pcie-cadence.h#L9).
> 
> Okay, so, try to clean up pcie-cadence.h so it won't use "proxy" headers.
> There is an IWYU (include what you use) principle, please follow it.

In fact, as cdns_pcie_to_rc is only used in pci-j721e.c, no need to have
it in a header file.
I prefer to move cdns_pcie_to_rc definition in pci-j721e.c.
As I don't modify pcie-cadence.h, the cleanup to not use proxy headers
is something that it can be done outside this series.

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


