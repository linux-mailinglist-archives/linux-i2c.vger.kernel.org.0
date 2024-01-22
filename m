Return-Path: <linux-i2c+bounces-1415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82091836546
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 15:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 110EAB23EFB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 14:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CC23D39F;
	Mon, 22 Jan 2024 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UCjldjGA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545083D960;
	Mon, 22 Jan 2024 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933449; cv=none; b=Nbn8QO+ZZHWI/YyEJOFoe0adAUOpd9zb3+iSVX6E2gYSVpf7kocOkGRUWvtJ3xdz22xM53dSPULPn128Zq9YaZU/6Se/RIFQL/YXjRvzIcQcwWZctllEjqek7InRJWobfDZl8fTt+u+5OuvTpdXvH7WIxESTbOEsxAzEMXN5Hsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933449; c=relaxed/simple;
	bh=GqwxD3RMhMhLI38AMEY+0N7cBezxiMSYs0jrQ6phPXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzdF+lKNhriw8YFil4/Pc4T53Wbcm7BvxHfC/378JN2D0U8CZ3MDdpQr3qy7shdGg75QDgItk3qFGPmQB97t215o0FgLe2bfDZ6BOolFVjZeMAaFTN7xHY2qdx3UTTBK/+R6jKZJvpWP3Yqftq8W6++TC2ao6tuzNqjKQ+ZHpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UCjldjGA; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 562831BF20E;
	Mon, 22 Jan 2024 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705933445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PrbPm4U9gTUgFkdJBeExNHbmpdtsVHY66VNg0wV3TpI=;
	b=UCjldjGAg35lVQBN0mR/Ja8PzHUW42EQboTIr9Q5NKy+PB/D28qdW1oOc4F5ZQ3/MGfsKu
	2+wCbOhAspaJUoKrzJXTj/fpGlUEHwLMZPqVrE5VeUo0u6ZMn3a9uXf+5m0B3LZ5rDpsYh
	nhBuF/hIsEIUuVeCO7HY3X/NFUT+J3fCfoSqZv/FjddnaMfhqTbIG/s8958X5CdNcqGfQC
	K9b1ACXRkYKCZ36n5YKaTaDCLOCEimcQEo1ghUhX1cw2kqbbnHBXEbejobqdkdGMVh5wdW
	uYszU+SivBh3bBHK9O5iK8tf9oPdXsGCgOTYpLJ6gYFt0l2TZEXtlOPMvgZImw==
Message-ID: <71c7e797-feaa-4285-9399-327b24308a34@bootlin.com>
Date: Mon, 22 Jan 2024 15:24:02 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] phy: cadence-torrent: add suspend and resume
 support
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
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
References: <20240116182244.GA101245@bhelgaas>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20240116182244.GA101245@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

Hello,

On 1/16/24 19:22, Bjorn Helgaas wrote:
> On Mon, Jan 15, 2024 at 05:14:52PM +0100, Thomas Richard wrote:
>> Add suspend and resume support.
>> The alread_configured flag is cleared during suspend stage to force the
>> phy initialization during the resume stage.
> 
> s/alread_configured/already_configured/
> 
> Wrap to fill 75 columns.  Add a blank line if you intend two
> paragraphs.
> 
> I don't know whether there's a strong convention in drivers/phy, but I
> see several commit logs that capitalize "PHY".  "Phy" is not a
> standard English word, so I think the capitalization makes it easier
> to read.
> 

Yes indeed, PHY is used in lots of commit logs.
So I guess I can use it.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


