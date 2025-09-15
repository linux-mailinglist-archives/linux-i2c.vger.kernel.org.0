Return-Path: <linux-i2c+bounces-12955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2087B57B5E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 14:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6EE189C524
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 12:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C801C30C37E;
	Mon, 15 Sep 2025 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pANP/ZnS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0819730B525;
	Mon, 15 Sep 2025 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940135; cv=none; b=IT4hILUY0K/94BnSgaFmx15Mxj0V4Pa2Oxmq8UfsjO7rPr98AjMQA+Mdj5lizbNtHtzqXtWUnuTucI9yIBRUgy6GpmpVouB4F7ARNMCoVyKE8YAKcfZkVio4sjMPtr0afuWdKCOewVk54GlahS7loxN/Wsbi/18dZN6RppUqf3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940135; c=relaxed/simple;
	bh=wabpa/Bn/zIBSd7p273qDFAlQ7rd9ElIYVr2tgBU9nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A8cgHes+kNznqBsztvjDICfhwGGIRPU0L3WX4jwjVpG3aXRZcQ+oW6RgQF9oHszu+sfZUwUMZw0pR7F6ZMd1ovP4cJ0LJ3iNho5lxnMdkLWeu/QI6IsZLgSQA8XY5POkWp52pQ5YsDlgnvUNVfsfYyvCPFPiVYjZ0ySHT3OBSPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pANP/ZnS; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757940132; x=1789476132;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wabpa/Bn/zIBSd7p273qDFAlQ7rd9ElIYVr2tgBU9nE=;
  b=pANP/ZnS8DHj4/bcCyYyHr17EUVbO+x5ioirkkOIpBk2qhIh1Hsrj7EW
   KlEjrlOXxb0gJeH6qUVvHGxFVs3kil2La27LTP1loxXLDC6RUiubqfm8A
   JzSgZK7ykyFOkHrIYC78zygyUqBm5oDjtoS5q9/Xtu9bJxh1wvXDaRSmQ
   4NKxV9U4Kt1YGqUfGv8uSrZBzDzrY6m/ckYRAC+os20OfDFxDLwQy12Zd
   LuP1CezRxIkhWX4rupGJ4bjd/gAF1FhxdDwwTVZxGi+uyeEKbVEA+cYPz
   GqszM6Z9wEeO/se2hYXKikoONQ/Hb1vdmFaogemwI314hWclkgwTHiXtl
   g==;
X-CSE-ConnectionGUID: 1DTnD4bHR5G9Cvo21y5Mrg==
X-CSE-MsgGUID: Ytig52/fSJiTzZ/2C8AsWQ==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="52326574"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 05:42:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 05:42:06 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Sep 2025 05:42:02 -0700
Message-ID: <22f61953-e63f-4bfd-b129-52224cb0d122@microchip.com>
Date: Mon, 15 Sep 2025 14:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] arm64: lan969x: Add support for Microchip LAN969x
 SoC
To: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>, Conor Dooley
	<conor@kernel.org>
CC: <luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 at 19:44, Robert Marko wrote:
> This patch series adds basic support for Microchip LAN969x SoC.
> 
> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> which allows to avoid the need to change dependencies of the drivers that
> are shared for Microchip SoC-s in the future.
> 
> DTS and further driver will be added in follow-up series.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

In linux-next for a few days and pull requests sent to arm-soc.

Thanks Robert and all that reviewed.
Best regards,
   Nicolas

> ---
> Changes in v9:
> * Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 and LAN969x
> directly, this avoids breaking existing configs with ARCH_SPARX5
> 
> Changes in v8:
> * Move to using ARCH_MICROCHIP as suggested by Arnd
> * Dropped any review tags due to changes
> 
> Robert Marko (9):
>    arm64: Add config for Microchip SoC platforms
>    ARM: at91: select ARCH_MICROCHIP
>    arm64: lan969x: Add support for Microchip LAN969x SoC
>    mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
>    tty: serial: atmel: make it selectable for ARCH_MICROCHIP
>    spi: atmel: make it selectable for ARCH_MICROCHIP
>    i2c: at91: make it selectable for ARCH_MICROCHIP
>    char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
>    crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
> 
>   arch/arm/mach-at91/Kconfig     |  4 +++
>   arch/arm64/Kconfig.platforms   | 51 ++++++++++++++++++++++++----------
>   drivers/char/hw_random/Kconfig |  2 +-
>   drivers/crypto/Kconfig         |  2 +-
>   drivers/i2c/busses/Kconfig     |  2 +-
>   drivers/mfd/Kconfig            |  2 +-
>   drivers/spi/Kconfig            |  2 +-
>   drivers/tty/serial/Kconfig     |  2 +-
>   8 files changed, 47 insertions(+), 20 deletions(-)
> 
> --
> 2.50.1
> 


