Return-Path: <linux-i2c+bounces-11813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F3AF7658
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 15:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE7B567487
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FB72E7BAB;
	Thu,  3 Jul 2025 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZERsUsfN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584572E7636;
	Thu,  3 Jul 2025 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551065; cv=none; b=fXPSy6735h6i8jUiwgAIpRcGZx1sTZlUp0Ui1/3/lUfKq1wzr7N6zS8Q0qmzqva/2ZVBugWd5eycx3DkxD3huV49CpoXGmBuyanII4Z2MgTkhgKBy8tpL64wdWEaZqWBV5RF6jGlxJZv8FM/qi5lgmXAZfYSoVA51TI2JlAf3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551065; c=relaxed/simple;
	bh=y4ooV2WhBZfJ2d538OTlPKZEGsSC5494XT/RIfWXDLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E+m0V6wRBsTb5j23CrOQ25TwArMn5OVjugdZ9ZOyJ83pU4U9vycRm2A9EM7gIiPZ9WAHItRCsz4SLGc3S5mz+ghIa+4ZWiLtcJ0SYDBHSv81Fs2U4xMj2fXYSPglL0UJ/Xg2Jk6NiR5zeQtUHe+I0JxSl2Sdgo2oO1gkmPYgrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZERsUsfN; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1751551063; x=1783087063;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y4ooV2WhBZfJ2d538OTlPKZEGsSC5494XT/RIfWXDLk=;
  b=ZERsUsfNuaQ/pvQBs6Wv6XZ8iZ5S+hy7W/fLHsLGOllDbh6B3rOMsHEO
   zKbcuZPIF+uBBK5V+oq2nPOGr/dLVZF+MjmyrDvM9VsiJWTT0dq9X0SyM
   noY8AvpV13ubw9KvvIbtEbY8gtjAmjrV792W90zNylzsZjugUfs81mydl
   Ol9xfp6hZXQHg38wvV5E0bFtUzK7U5A+A0GeNdNlFYyalMjnJKjCBLJN4
   G7UrTck6XPftC6V9cEcHdzXjz2nRZAb/iE0QYP/sBX4ZlZkt7SpXtV+7U
   Mfy//vRXb1DL8RDBJxm1FKcJIvFwBA9mJeayxFjFtonA4uc0Qy/dMR6a/
   g==;
X-CSE-ConnectionGUID: bVLJ8fMtTTSJrF3ArC6WlA==
X-CSE-MsgGUID: UqmCzDwdQLKXTFtb/xi4uA==
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="43062061"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2025 06:56:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Jul 2025 06:55:53 -0700
Received: from [10.171.248.31] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 3 Jul 2025 06:55:47 -0700
Message-ID: <421d61db-27eb-4ad2-bd98-eb187fd14b1e@microchip.com>
Date: Thu, 3 Jul 2025 15:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
To: Robert Marko <robert.marko@sartura.hr>, Arnd Bergmann <arnd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Russell King <linux@armlinux.org.uk>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Lee Jones
	<lee@kernel.org>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Machon <daniel.machon@microchip.com>, <luka.perkov@sartura.hr>, "Conor
 Dooley" <Conor.Dooley@microchip.com>, Lars Povlsen - M31675
	<Lars.Povlsen@microchip.com>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
 <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
 <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
Content-Language: en-US, fr
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CA+HBbNHxiU5+xVJTyPQFuCJLyEs5_MpybSBEgxi25bzaGfiVHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Robert, Arnd,

On 03/07/2025 at 14:25, Robert Marko wrote:
> On Wed, Jul 2, 2025 at 9:57 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
>>> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
>>>
>>> However, this means that new Microchip platforms that share drivers need
>>> to constantly keep updating depends on various drivers.
>>>
>>> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
>>> could instead depend on.
>>
>> Thanks for updating the series to my suggestion!
>>
>>> @@ -174,6 +160,27 @@ config ARCH_MESON
>>>          This enables support for the arm64 based Amlogic SoCs
>>>          such as the s905, S905X/D, S912, A113X/D or S905X/D2
>>>
>>> +menuconfig ARCH_MICROCHIP
>>> +     bool "Microchip SoC support"
>>> +
>>> +if ARCH_MICROCHIP
>>> +
>>> +config ARCH_SPARX5
>>> +     bool "Microchip Sparx5 SoC family"
>>
>> This part is the one bit I'm not sure about: The user-visible
>> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
>> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
>> here, or more generally speaking any of the nested ARCH_*
>> symbols.

Well, having a look at arch/arm64/Kconfig.platforms, I like how NXP is 
organized.

SPARX5, LAN969x or other MPU platforms, even if they share some common 
IPs, are fairly different in terms of internal architecture or feature set.
So, to me, different ARCH_SPARX5, ARCH_LAN969X (as Robert proposed) or 
future ones make a lot sense.
It will help in selecting not only different device drivers but 
different PM architectures, cores or TrustZone implementation...

>> This version of your patch is going to be slightly annoying
>> to existing sparx5 users because updating an old .config
>> breaks when ARCH_MICROCHIP is not enabled.

Oh, yeah, indeed. Even if I find Robert's proposal ideal.

Alexandre, Lars, can you evaluate this level of annoyance?

>> The two options that I would prefer here are
>>
>> a) make ARCH_SPARX5 a hidden symbol in order to keep the
>>     series bisectable, remove it entirely once all references
>>     are moved over to ARCH_MICROCHIP
>>
>> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
>>     ARCH_SPARX5 but keep the menu unchanged.
> 
> Hi Arnd,
> Ok, I see the issue, and I would prefer to go with option b and do
> what I did for
> AT91 with the hidden ARCH_MICROCHIP symbol to avoid breaking current configs.

Yep, but at the cost of multiple entries for Microchip arm64 SoCs at the 
"Platform selection" menu level. Nuvoton or Cavium have this already, so 
it's probably fine.

>> Let's see what the sparx5 and at91 maintainers think about
>> these options.
> 
> Sounds good, let's give them some time before I respin this series.

Thanks to both of you. Best regards,
   Nicolas

