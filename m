Return-Path: <linux-i2c+bounces-12797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 395EFB4A571
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 10:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526D21893B02
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 08:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3352522A8;
	Tue,  9 Sep 2025 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lYFfQQ0e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91B22157F;
	Tue,  9 Sep 2025 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406951; cv=none; b=bSuGEMZJ6GlJwcA3VUMIy7VssJrQtrIJC5b7fPdteMm6wZyMiiySw85jusgRVEdGqJrijlXW/BrzdFXoKteqHaJDwTNuOo5PskUpoq241OqYb90FcwIn7CAXfxreVBd4tVAjQD+O+1cP2aYE7NeRvdTNF0snAIJW8xFJ4bCb0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406951; c=relaxed/simple;
	bh=CXgkJ6vcEYUjaoEsiVysUMOuZtwcZBJNVprV2+pEVls=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WrG83Qhuot1OtQ+KyT76Rnb5zEBeA0leWyUBHpPWTYNZwgwagZ/4Gzjki9Gbr73XQ+pim9W/T4Ilbu/TUYAu8EdxTRU1SJWIR1vxse9zXc3FHANF4l7eIRrCZxzktOf8TfjeoeFN9iClf01wxMs3PwdzVXuYapd3CgZnA54lBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lYFfQQ0e; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757406949; x=1788942949;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CXgkJ6vcEYUjaoEsiVysUMOuZtwcZBJNVprV2+pEVls=;
  b=lYFfQQ0eYOik+ZNPJYNR53dEizwBJwMaR8aBXcnrDhtIESlu/NTJUgK8
   soNDonOzblOjqiGnJaXDk3xlbtbydBDdNB94jvcCS7fooSIHaS83QtvH5
   pZvVNFIS3olsFqhHXbibIVCsc382bQ0tuOaYUgxWsgQrdrsGehbw1xL3x
   G87EAWKnBa0RetC9fBWwmmlBQ2Q9xH9WPVzcr9Fs9l5lLIiAgnCbMzD2r
   m0TZGeM2EP3tOctGBZ6y5WsyExTST47WxNg5eaUGD1mOr82BJVQKqO9OR
   qZvWkmcDkPt65xo6GnabHW3k2OfmCFnLnOazkDraRX888bcS8qvoCpq1J
   w==;
X-CSE-ConnectionGUID: ofTAqQfWT8OQ6lC0/N7q+g==
X-CSE-MsgGUID: xuRAfyugTWW04SVqJa9bTQ==
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="213640830"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 01:35:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 01:35:17 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 9 Sep 2025 01:35:13 -0700
Message-ID: <1e1b3cbe-ee39-4813-8f17-1844fc9d45f7@microchip.com>
Date: Tue, 9 Sep 2025 10:35:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
To: Lee Jones <lee@kernel.org>
CC: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
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
 <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
 <20250908141633.GB9224@google.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250908141633.GB9224@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2025 at 16:16, Lee Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, 04 Sep 2025, Nicolas Ferre wrote:
> 
>> On 02/09/2025 at 12:02, Lee Jones wrote:
>>> On Wed, 13 Aug 2025, Robert Marko wrote:
>>>
>>>> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
>>>> avoid needing to update depends in future if other Microchip SoC-s use it
>>>> as well.
>>>>
>>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>>> ---
>>>>    drivers/mfd/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>>> index 425c5fba6cb1..8f11b2df1470 100644
>>>> --- a/drivers/mfd/Kconfig
>>>> +++ b/drivers/mfd/Kconfig
>>>> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>>>>    config MFD_AT91_USART
>>>>         tristate "AT91 USART Driver"
>>>>         select MFD_CORE
>>>> -     depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
>>>> +     depends on ARCH_MICROCHIP || COMPILE_TEST
>>>>         help
>>>>           Select this to get support for AT91 USART IP. This is a wrapper
>>>>           over at91-usart-serial driver and usart-spi-driver. Only one function
>>>
>>> Let me know when the deps are in Mainline.
>>
>> Hi Lee,
>>
>> I have tags from other maintainers, how about you give us your and we make
> 
> My?  AB?

Yep ;-)

>> this patch travel through arm-soc like the other ones?
> 
> Sure.
> 
> Acked-by: Lee Jones <lee@kernel.org>

Thanks Lee. Queued for at91 PR to arm-soc.

Regards,
   Nicolas

