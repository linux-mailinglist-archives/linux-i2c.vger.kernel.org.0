Return-Path: <linux-i2c+bounces-12412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B715B33671
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 08:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7F9189AF55
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 06:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890BC27FD76;
	Mon, 25 Aug 2025 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="akjIn+wG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6219C569;
	Mon, 25 Aug 2025 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756103301; cv=none; b=IzCm9igTqcFiyncPpae5KFUqy0jl5XqmeP3T+dkTM4cg/SfV4UeGgHsK6nZ1B3osn/OCe1+mGEE5nTU+XGNEsKUDS7nTRcycMDcdeG2xyPlFctzH2HAl8hAMl51e/M6WdKsKtIN310bTgd9EnGrDDvDbKYWGphbWtRNsWXaDYaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756103301; c=relaxed/simple;
	bh=WQVylS92T3jgMm7p84Z04xb25P92PYQug7wH3/uzZMA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1Vp+CXST8Tyoau3lRnM42AAmiRKrA9V6XMG8WwpirBK7pVjqisabFh2W++6Nagj8oYiVOdTgjJrPhRaDngCqEGH3BJKAFcXb4ciUADdmSkEWb7Tw2Z9J+4ZJJrN6v0iq5QRXQqMndyQp7bd6Z9uk3MS0BsnSYi5lQMGLK6YvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=akjIn+wG; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756103300; x=1787639300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WQVylS92T3jgMm7p84Z04xb25P92PYQug7wH3/uzZMA=;
  b=akjIn+wG15LcV1BxG1NwXrF7tftD289/QyhmevycNxc7Ap+TTq27TFgv
   G2wNjzRchclfr8fXicwA+HuEVRcPBkxm0cfccYhRd+h4nUSaWIibrZKx5
   t8dvzwa5fILD+FkPxQfok7GfhXpCsT/o4Hryl5DLELchCDLMwdrtZkRIE
   vzBWaq0ubNayr9kC18v5WbyCMHJDISNdR+493djgNxdyQ+SorYXyEIbr5
   xk9K7UD7lcQWP8cVp19zYqHYSUl9S26a0y+vDC78V/90lems+gWPB1qfJ
   QWOkZL4+OhjfL9u9gXK7g3DPL2cxDsPFOPWQHCgEbnQsxFD/vMDClVCCY
   A==;
X-CSE-ConnectionGUID: E7GoUgAnRxqBfYFECdyUSQ==
X-CSE-MsgGUID: 5apMjYN7Q+GTJVOEPqfVXw==
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45594060"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Aug 2025 23:28:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 24 Aug 2025 23:27:54 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 24 Aug 2025 23:27:50 -0700
Date: Mon, 25 Aug 2025 06:27:49 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <linux@armlinux.org.uk>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <luka.perkov@sartura.hr>
Subject: Re: [PATCH v9 0/9] arm64: lan969x: Add support for Microchip LAN969x
 SoC
Message-ID: <20250825062749.5hjcxwlbmagccqgj@DEN-DL-M70577>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>

> This patch series adds basic support for Microchip LAN969x SoC.
> 
> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> which allows to avoid the need to change dependencies of the drivers that
> are shared for Microchip SoC-s in the future.
> 
> DTS and further driver will be added in follow-up series.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
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
>   arm64: Add config for Microchip SoC platforms
>   ARM: at91: select ARCH_MICROCHIP
>   arm64: lan969x: Add support for Microchip LAN969x SoC
>   mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
>   tty: serial: atmel: make it selectable for ARCH_MICROCHIP
>   spi: atmel: make it selectable for ARCH_MICROCHIP
>   i2c: at91: make it selectable for ARCH_MICROCHIP
>   char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
>   crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
> 
>  arch/arm/mach-at91/Kconfig     |  4 +++
>  arch/arm64/Kconfig.platforms   | 51 ++++++++++++++++++++++++----------
>  drivers/char/hw_random/Kconfig |  2 +-
>  drivers/crypto/Kconfig         |  2 +-
>  drivers/i2c/busses/Kconfig     |  2 +-
>  drivers/mfd/Kconfig            |  2 +-
>  drivers/spi/Kconfig            |  2 +-
>  drivers/tty/serial/Kconfig     |  2 +-
>  8 files changed, 47 insertions(+), 20 deletions(-)
> 
> --
> 2.50.1
>

Acked-by: Daniel Machon <daniel.machon@microchip.com> 

