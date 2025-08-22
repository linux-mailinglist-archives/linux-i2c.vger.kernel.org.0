Return-Path: <linux-i2c+bounces-12383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A042B319AE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 15:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE0FA627EF4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 13:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3E52C0267;
	Fri, 22 Aug 2025 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uIflmQmz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE992FFDE1;
	Fri, 22 Aug 2025 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869426; cv=none; b=K91IYSsp2vHXpisvhlZ3rvSfLl2a1atQV3Zcv/4eVbQRci88u08R0nIH30FToqhn98WHtbc6oDO0SAt8PCrqP9Ntrdt4TLVQeNgpongPwPrQ9LKsaVOO9ReLf4a62VcBLil/B4Dbqk6Kt7+MBMTgBXNub/zgUA/yf8LsQWW4zDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869426; c=relaxed/simple;
	bh=2DH9qi5H2xuATxSxcQMWteVKmv1srr8oRnYkAb20zFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AuYWrs/lKmzsbaxc+d0/LDMEtUoyTttQ4DN0ofa9kLhpB7prWS/YS6WHHG3b2thJMjwQ+WYnv7YYCnzO8lkKskww65X6lWSUDqOEb3nh94yEU5JkSLmTLFHZtkGUzmUP+0ELU0CJjDHXgI0udYOD9hdhOXb5aA7kRiVigc7Mxas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=uIflmQmz; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869425; x=1787405425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2DH9qi5H2xuATxSxcQMWteVKmv1srr8oRnYkAb20zFU=;
  b=uIflmQmzQn4texmAv72EixxnQR3lkPp79TwvA6Yg/SztMEYr8wAT4uSt
   gM83NMkduwp6Iuav7r+pURRFrz6zGkHivpiDvj9FCGQd3l0wZ8ydFELOI
   Wzze7px95p3dFRFMfy/b6IBbWytz7VWcsByn77HhonjOgLUqs/gE/ilX1
   hrxKPE6slt1xWhJo8/DV5eyzouZLDsLve6eIY9zZzgha/ZZSgXTrV9OkG
   yLDT8+gPcXt2Kk1gylT+GnQnF1M+Fs3B1hNcb4AyuBG9tidaqZhZY4Nvo
   Zh4CpqRL4r/G/lWLpsgB/bEfQqOLEFuEqw0v+mKkXfVypaSpDatKwvBM2
   g==;
X-CSE-ConnectionGUID: 11sNJxGJTCmAhZhLDIkO7g==
X-CSE-MsgGUID: PQ+t1yHES5qhKvGsxuqnOg==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="45530272"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:30:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:30:12 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:30:07 -0700
Message-ID: <552bae37-bb1a-4564-9ba7-4fed134c3d78@microchip.com>
Date: Fri, 22 Aug 2025 15:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/9] ARM: at91: select ARCH_MICROCHIP
To: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>
CC: <luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-3-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 at 19:44, Robert Marko wrote:
> Like with the ARM64 Microchip platforms, lets add a generic ARCH_MICROCHIP
> symbol and select it so that drivers that are reused for multiple product
> generation or lines, can just depend on it instead of adding each SoC
> symbol as their dependencies.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   arch/arm/mach-at91/Kconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 04bd91c72521..c5ef27e3cd8f 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -1,4 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +config ARCH_MICROCHIP
> +       bool
> +
>   menuconfig ARCH_AT91
>          bool "AT91/Microchip SoCs"
>          depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
> @@ -8,6 +11,7 @@ menuconfig ARCH_AT91
>          select GPIOLIB
>          select PINCTRL
>          select SOC_BUS
> +       select ARCH_MICROCHIP
> 
>   if ARCH_AT91
>   config SOC_SAMV7
> --
> 2.50.1
> 


