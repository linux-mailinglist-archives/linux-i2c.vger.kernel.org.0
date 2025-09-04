Return-Path: <linux-i2c+bounces-12625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B030EB43C6B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 15:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613883AE10C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 13:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4AF2FE04F;
	Thu,  4 Sep 2025 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Dvh4l5Jt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B22C21D4;
	Thu,  4 Sep 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991054; cv=none; b=TOLHGSIQFzRuaKTveVT891E5eWt1wX4vJiYKQ7JJpinnmrkHJZS4gAXpU3xrfpD3UDF6f1sXaSbuf1S2wWdiH2i0x/fjDAygsEzp+s62x+708nNXR+s642jtgLj+ZsxQmiDOhvIwoRoTfkruTn8H/K57+B+hLOz0pcIowvD09Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991054; c=relaxed/simple;
	bh=ipAlB8lz4YhXVB/PahY2cp8VjIBql6JOV7ukszx0QqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CcsdvX6mghXvavma4F/EUL7laFXK8ZrB5bGn+ZhckmxyV8z2wieSKLEh1AVf3tGZtpNzLQUWIvNIvwvzSG+qGQFiUARmERLxfneHttHAmvBgoPOwFpwYpLHXA6tA3t++SCA657/6fkyCvke2n8pL6FM63phbmtmZ/IMboYI+5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Dvh4l5Jt; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756991054; x=1788527054;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ipAlB8lz4YhXVB/PahY2cp8VjIBql6JOV7ukszx0QqM=;
  b=Dvh4l5Jt8cyZqEzJ5wQCG3BOLT7HmcmWXq9Xl33HHvyULqnK95qOOI2S
   iD8Z+vgGIl2aL+Qra2HGBbGK6fRkvO/RDGx+wIFOTfPCrN1QRWuu8NEch
   8yL5+mdTkcc7DADFvjfJu5PFNh+625TSuMDBlOWM2isDdA/d4ixevy+Ca
   yKJozEbR3aT5URJfrmsqD62GlG6vXpApGWaTWSrrqfF8WnmtvWyhTCKFj
   baIADXUUpVkAuWAGhggAuMWRVLPoOPwEBojOXGZZrP2aM9OqgEtLHig+S
   0NOW2Ux6Zewo6+W5s8Qm/Mlh4xCeq8fY1VrnNSjysnkBYK0CnHnXoyxko
   w==;
X-CSE-ConnectionGUID: z3Jne31hRHOgHqAJosZYCg==
X-CSE-MsgGUID: GYbBTcCDRgO2KYf+NwHHtA==
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="277443901"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Sep 2025 06:04:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 4 Sep 2025 06:03:53 -0700
Received: from [10.171.248.16] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 4 Sep 2025 06:03:47 -0700
Message-ID: <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
Date: Thu, 4 Sep 2025 15:03:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
To: Lee Jones <lee@kernel.org>, Robert Marko <robert.marko@sartura.hr>
CC: <linux@armlinux.org.uk>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<olivia@selenic.com>, <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>,
	<luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
 <20250902100254.GD2163762@google.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250902100254.GD2163762@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 at 12:02, Lee Jones wrote:
> On Wed, 13 Aug 2025, Robert Marko wrote:
> 
>> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
>> avoid needing to update depends in future if other Microchip SoC-s use it
>> as well.
>>
>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>> ---
>>   drivers/mfd/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 425c5fba6cb1..8f11b2df1470 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>>   config MFD_AT91_USART
>>        tristate "AT91 USART Driver"
>>        select MFD_CORE
>> -     depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
>> +     depends on ARCH_MICROCHIP || COMPILE_TEST
>>        help
>>          Select this to get support for AT91 USART IP. This is a wrapper
>>          over at91-usart-serial driver and usart-spi-driver. Only one function
> 
> Let me know when the deps are in Mainline.

Hi Lee,

I have tags from other maintainers, how about you give us your and we 
make this patch travel through arm-soc like the other ones?

Regards,
   Nicolas

