Return-Path: <linux-i2c+bounces-1418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCB836C14
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 17:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DB01F24BF2
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 16:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2015F574;
	Mon, 22 Jan 2024 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aVCff82c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B53D963;
	Mon, 22 Jan 2024 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937434; cv=none; b=ZcaW5xhWQDpTf2MMTGr73OIl9U8GjY37a/GoJ5+04Ns0gQUCK8f0YSlP9nGK63xJL90k2Z4aas9yj3YahoVkuXUGP76pTh4NPKuG29WPZSCUW5jQg6VWaiInq/zynT4PwOZ+LiHw42cGO54hKD3tcHSuZrmxw+5hgcpjVKg+Tc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937434; c=relaxed/simple;
	bh=gVMMJSucJVrsOQI7wa8WRq4Iqy9YmtcGWO5GPgFu3T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxjCU+cXCOndsPlWnK+JUnyiN+lqPGtP2Q4cWmjVZRi0lJ8gShwsQIFF7dRmxZdekWXVO7Kk0FQrakkWbKCIutFGY0pnAdX5687/fJYFVYrysGdsNQ+3btAWFltSqwQKWHYtRLzCDePYH5ueCvnuJpb9EGV7FaGFd50lQ6+eX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aVCff82c; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E11E740005;
	Mon, 22 Jan 2024 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705937428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ad8iZ7cAOLjC59VsXGmNvP0Dte+iZHPsXSv80mGa8CY=;
	b=aVCff82cAuUdGWnH6XJ5zxRCCb74hOkkbM+j+P+f8CkTkim32vuf+HKFY9Kt2/sX+1eDq1
	3s/POnlwJJi2GuKXxbTIMbWYpV/NbIqDQBnJ4zlAaMiyVmVn+eqSpBsrMxnYcSX2zvNW3k
	3N5pReSGFlppvUTmwSqQxqa1kXzcXd+ErnfpGawcUR4dvFZIJjjwoOyrTuluKifAAp1BNx
	HvdRodBSQRvBf3KlAenpmTj6amh/BRx3m5fsVT8T95utZkNphW4e1R2MINb4jt+L0hVCN7
	vzwZ9lmNs1zn5a1nWyNnE6oYFbm2hZUkfOYNsOfddRAWok8+bjtjY5uUNSOVRA==
Message-ID: <9cb47f37-bd98-4136-b844-33cf2be593df@bootlin.com>
Date: Mon, 22 Jan 2024 16:30:26 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] PCI: j721e: add suspend and resume support
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
 <20240102-j7200-pcie-s2r-v1-14-84e55da52400@bootlin.com>
 <CAHp75VfPQz4PWdzFUU_n+R=XohBjyXM0zsjD-bUD2jmb42ds8Q@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VfPQz4PWdzFUU_n+R=XohBjyXM0zsjD-bUD2jmb42ds8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

Hello Andy,

On 1/15/24 21:13, Andy Shevchenko wrote:
> On Mon, Jan 15, 2024 at 6:16 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> From: Théo Lebrun <theo.lebrun@bootlin.com>
>>
>> Add suspend and resume support for rc mode.
> 
> Same comments as for earlier patches.
> Since it's wide, please, check the whole series for the same issues
> and address them.
> 
> ...
> 
>> +               if (pcie->reset_gpio)
> 
> Dup, why?

This pcie->reset_gpio corresponds to PERST# of PCIe endpoints.
I assert it during suspend, because I have to deassert it (with a delay)
during resume stage [1].

> 
>> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> 
> ...
> 
>> +               if (pcie->reset_gpio) {
>> +                       usleep_range(100, 200);
> 
> fsleep() ?
> Btw, why is it needed here, perhaps a comment?

The comment should be the same than in the probe [1].
Should I copy it? Or should I just add a reference to the probe?

[1]
https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/pci/controller/cadence/pci-j721e.c#L535

> 
>> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 1);
>> +               }
> 
> ...
> 
>> +               ret = cdns_pcie_host_setup(rc, false);
>> +               if (ret < 0) {
>> +                       clk_disable_unprepare(pcie->refclk);
>> +                       return -ENODEV;
> 
> Why is the error code being shadowed?

Yes I should return ret instead.

> 
>> +               }
> 
> ...
> 
>> +#define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
> 
> Is container_of.h included in this file?

linux/container_of.h is included in linux/kernel.h.
And linux/kernel.h is included in pcie-cadence.h
(https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/pci/controller/cadence/pcie-cadence.h#L9).

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


