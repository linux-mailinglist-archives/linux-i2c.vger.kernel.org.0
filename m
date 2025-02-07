Return-Path: <linux-i2c+bounces-9342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A21A2C220
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 13:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9A1168894
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 12:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE0A1DEFDC;
	Fri,  7 Feb 2025 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AW5e00tc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C82417C7;
	Fri,  7 Feb 2025 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929738; cv=none; b=ikMIKJpN6B7tI405rcjqeOzkn1nyicRO7aTGINYiTzIaLHicrLTtYuZyeVsmKIABIOmpyLT4TAoE/0IAHiddv9O3uqBkrDZAQoQLM7sCgzHvxmNcrHypS1pfyV288/6ovtaUgKgVD2QILnVHhXNMMFCTvqfH/fym1T+8zv5djCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929738; c=relaxed/simple;
	bh=1gbqzvtIyhZ2LOlMJiVsOC0kg7QFg2HRd5SIYjSn6Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1/swxvr6DiWIxhd6det5wUMl5Zi0+rBPsZk4Ff4ODxTX4+0hjTnoqRlKzSP6QsJU9ooSz6e6FpA6SOaokuZ/DojIudt+1Wh6alE3FAKSn7c89oMUgQKraG2aM8z1XNgb2lF9df6N3+SmsrMdBLveUObRosff56gFrnIhiqgPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AW5e00tc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8A26F0C;
	Fri,  7 Feb 2025 13:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738929654;
	bh=1gbqzvtIyhZ2LOlMJiVsOC0kg7QFg2HRd5SIYjSn6Hc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AW5e00tczGFBIY8ZeewWJss6JBPOsjlbjoedObCb2LHKtNfI9HJ/AKysiFvvWEVFr
	 oBQazn93Ov7pBSpDbW9528lzlqs5B3vNwUVUreO8AGGSDtHl4ZrKTkul0Wv+dlZljG
	 +2HFMWI3FKOC9t7tP1pdTECIFCpk+2qpAULLeEYY=
Message-ID: <8b0f0743-03d6-4b2a-a2c2-37b05b854fb8@ideasonboard.com>
Date: Fri, 7 Feb 2025 14:02:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] misc: Support TI FPC202 dual-port controller
To: Romain Gantois <romain.gantois@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Cosmin Tanislav <demonsingur@gmail.com>
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/02/2025 11:29, Romain Gantois wrote:
> Hello everyone,
> 
> This is version seven of my series which adds support for the TI FPC202
> dual-port controller. This is an unusual kind of device which is used as a
> low-speed signal aggregator for various types of SFP-like hardware ports.
> 
> The FPC202 exposes an I2C, or SPI (not supported in this series) control
> interface, which can be used to access two downstream I2C busses, along
> with a set of low-speed GPIO signals for each port. It also has I2C address
> translation (ATR) features, which allow multiple I2C devices with the same
> address (e.g. SFP EEPROMs at address 0x50) to be accessed from the upstream
> control interface on different addresses.
> 
> I've chosen to add this driver to the misc subsystem, as it doesn't
> strictly belong in either the i2c or gpio sybsystem, and as far as I know
> it is the first device of its kind to be added to the kernel.
> 
> Along with the FPC202 driver itself, this series also adds support for
> dynamic address translation to the i2c-atr module. This allows I2C address
> translators to update their translation table on-the-fly when they receive
> transactions to unmapped clients. This feature is needed by the FPC202
> driver to access up to three logical I2C devices per-port, given that the
> FPC202 address translation table only has two address slots.
> 
> Best Regards,
> 
> Romain

I tested this series on my ds90ub960 setup (with plenty of patches on 
top of mainline to get full multi-streaming), and it works fine for me. So:

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

This series does conflict with the ub960 changes I've sent resently. 
Nothing difficult, but just something to be aware of.

I'll try to do an actual review next week.

We also still have the GMSL i2c-atr questions to sort out. Cosmin 
recently sent out this series to add a few patches which help on GMSL:

https://lore.kernel.org/all/20250203121629.2027871-1-demonsingur%40gmail.com/

  Tomi

> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
> Changes in v7:
> - Removed a superfluous log message
> - Link to v6: https://lore.kernel.org/r/20250115-fpc202-v6-0-d47a34820753@bootlin.com
> 
> Changes in v6:
> - Replaced spaces with tabs in misc Makefile
> - Link to v5: https://lore.kernel.org/r/20250108-fpc202-v5-0-a439ab999d5a@bootlin.com
> 
> Changes in v5:
> - Used mutex guards in ub960 and fpc202 drivers
> - Changed wording of some i2c-atr logs
> - Link to v4: https://lore.kernel.org/r/20241230-fpc202-v4-0-761b297dc697@bootlin.com
> 
> Changes in v4:
> - Fixed unbalanced refcounting in FPC202 port probing path
> - Fixed KASAN bug by setting alias_pool "shared" flag properly
> - Dropped requirement for both FPC202 ports to be described in the DT
> - Enabled dynamic translation by default, dropped support for non dynamic translation
> - Used aliased_addrs list instead of insufficient bitmap in ub960 driver
> - Added i2c_atr_destroy_c2a() function matching i2c_atr_create_c2a()
> - Fixed list corruption bug in dynamic address translation
> - Indented Kconfig entry with tabs instead of spaces
> - Link to v3: https://lore.kernel.org/r/20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com
> 
> Changes in v3:
> - Described the "reg" property of downstream ports in the FPC202 bindings
> - Link to v2: https://lore.kernel.org/r/20241118-fpc202-v2-0-744e4f192a2d@bootlin.com
> 
> Changes in v2:
> - Renamed port nodes to match i2c adapter bindings.
> - Declared atr ops struct as static const.
> - Free downstream ports during FPC202 removal.
> - Link to v1: https://lore.kernel.org/r/20241108-fpc202-v1-0-fe42c698bc92@bootlin.com
> 
> ---
> Romain Gantois (9):
>        dt-bindings: misc: Describe TI FPC202 dual port controller
>        media: i2c: ds90ub960: Replace aliased clients list with address list
>        media: i2c: ds90ub960: Protect alias_use_mask with a mutex
>        i2c: use client addresses directly in ATR interface
>        i2c: move ATR alias pool to a separate struct
>        i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
>        i2c: support per-channel ATR alias pools
>        i2c: Support dynamic address translation
>        misc: add FPC202 dual port controller driver
> 
>   .../devicetree/bindings/misc/ti,fpc202.yaml        |  94 ++++
>   MAINTAINERS                                        |   7 +
>   drivers/i2c/i2c-atr.c                              | 483 ++++++++++++++-------
>   drivers/media/i2c/ds90ub913.c                      |   9 +-
>   drivers/media/i2c/ds90ub953.c                      |   9 +-
>   drivers/media/i2c/ds90ub960.c                      |  49 ++-
>   drivers/misc/Kconfig                               |  11 +
>   drivers/misc/Makefile                              |   1 +
>   drivers/misc/ti_fpc202.c                           | 438 +++++++++++++++++++
>   include/linux/i2c-atr.h                            |  54 ++-
>   10 files changed, 964 insertions(+), 191 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241017-fpc202-6f0b739c2078
> 
> Best regards,


