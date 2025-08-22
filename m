Return-Path: <linux-i2c+bounces-12385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1DB319F8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 15:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A6CB22A35
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 13:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C162E312802;
	Fri, 22 Aug 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RyoCBZAS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56793126B1;
	Fri, 22 Aug 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869645; cv=none; b=JJwEhkKy76R1TmJ+OjybgLk8IvYvKz2iq375SgvZ7nRp/A4YUCFq7BmuRWOi0I7fJvNtc1X7tdaTxpRCAOOaClr37wlHSL5ICFhJNyOQGHJU+Hqx4Z1mrfblEJ9ZL6l10UajpG+qjqaEB20VqdRjq4kWamNptLe1v/sKjkNBsHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869645; c=relaxed/simple;
	bh=DAI+FrUvCc1nd3XaCp1uUHDjiklJsHkKKQ/vP8igNbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LuDltHzZrxaqzKSryofh7adCty6DBrn9BgNJ4WeSrq5Wu32yEmBA4boaps7rRdicPZRGvC6JW8CqpZenWlwMehSEIc1RF5vvsFnMEEqnE5n/5F2PCaSeAQuYtA8gdPW9R/Wmc989KXNokPLHmztm3Ew4DYfPC2mTa2OeVJEgyKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RyoCBZAS; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869643; x=1787405643;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DAI+FrUvCc1nd3XaCp1uUHDjiklJsHkKKQ/vP8igNbE=;
  b=RyoCBZASwahxxp3tQbXfutaPQeH68Va56Ox+XnuhBcnzagPCJk/Mr18c
   adz1N3l9bYxlLbs2/ArAMAZQuMyJ9xTrHIiSIGuuFWBHMzyLCXOT3RAge
   dWD+CTawduPequLzyS8MDHZLo5C6FeIndv/4jGw/AcsPJuON/FwBRU1vf
   h1oRMObKfG0RLNoG8qERrKrzz+9TL4SYj6Q36EKXV6D6foJCMCHVOY2qW
   /+ZSRU29BsOF8rG6on+J+7tTaQddzhHFWQTFoMA+Pd/SivuvW0q+w8/vD
   0wv28fZmk/+/2ngDHkctA57531I5B89cQLIABGY5M30QMehNDrMRehX4m
   g==;
X-CSE-ConnectionGUID: FmqUXuSUTY2CcxMMwy3LVw==
X-CSE-MsgGUID: KxaEALsWRxybjjejTicLnQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="51133476"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:34:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:33:58 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:33:54 -0700
Message-ID: <a59d20d0-5bf5-4bea-9636-1a1afc7cf54a@microchip.com>
Date: Fri, 22 Aug 2025 15:33:54 +0200
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
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>
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

I added explicitly my Ack to the 3 first patches of the series to be 
super-specific, but for the whole series:

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks for your work on this Robert, it's highly appreciated. Best regards,
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


