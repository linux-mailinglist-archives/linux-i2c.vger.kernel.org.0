Return-Path: <linux-i2c+bounces-12586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D3B422FC
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 16:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E75F5E5D17
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 14:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DBA3115BE;
	Wed,  3 Sep 2025 14:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kuddoeeB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26102F7441;
	Wed,  3 Sep 2025 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908177; cv=none; b=GhvhDcUwulzJqXbV3X54YusDQZYCKq976Z8B2p0MNfKb2w5uscWW3WKkgtfbLbfqoXM6kAjSq7H8RVjoCKjU0Sla++Y6f4rCpPDtDwnueqpABI4afBuIBzWr6bfJMsznxPUskDG7DT7BkMouHAMc6CTbMTRVykrTFLOPYX0Wz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908177; c=relaxed/simple;
	bh=+Ou7/TJXaHnviKBEr5ILfWD+oVZwfeeOf3QKT9caAkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MEM9EDYXLAK0MnHSXz1I/pArB1ui+oN1N8UXJBSnZIr89BDUHpugwpc8pY7+JDK+qWnUUULCwyFeeL3w4xbSNRDqhBCGGsiK5GBOU7x4mmesIxFLMxyh+QW9A1sMk8l22V4XFcuvVLoktPmafLH1FQjntlP5dgJ6pgdg9UIcTHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kuddoeeB; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756908175; x=1788444175;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+Ou7/TJXaHnviKBEr5ILfWD+oVZwfeeOf3QKT9caAkE=;
  b=kuddoeeB7GToGKL1LyvBq/d4T/ZZAafpK8vfzgitgpd5zSsvaDnqWlNC
   /oYEQuLQwVqp6pMkko5Fc7XMJiDBWwijHcljKRowRNe+w4RJ/gyD3GOCV
   veXb6sgqF3gSAgl5NTS7QC/sFdh7vBgzuxkw7ZQGj4NlQKmpq1tlIHHa1
   PcFgQq4fLz+WkeMJkJoTG6L01uIwFwkZj7K4FojdaDeYgMG49yZlneMGI
   rZrCLf4BmswAFtxUH/WMj4dkbcrTXjgL7lbLg9wHKTwrUW0zMpoSAZyfa
   Ln+K5zuvEUllL9KkUPvV1B1/UjrCTE116DpdFcld6y5xFa0s725N8DkRI
   w==;
X-CSE-ConnectionGUID: v8Jh6wOIR5q2UVBlaHd94g==
X-CSE-MsgGUID: Ky7Vg2BiRuyQ5qmJAKasTw==
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="46572767"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Sep 2025 07:01:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 3 Sep 2025 07:01:14 -0700
Received: from [10.150.206.75] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 3 Sep 2025 07:01:09 -0700
Message-ID: <50ca5062-5bbd-4c72-83c6-1d9abc6bde2e@microchip.com>
Date: Wed, 3 Sep 2025 16:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vinod Koul <vkoul@kernel.org>,
	<linux@armlinux.org.uk>, <alexandre.belloni@bootlin.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <o.rempel@pengutronix.de>,
	<daniel.machon@microchip.com>, Robert Marko <robert.marko@sartura.hr>,
	<luka.perkov@sartura.hr>, Vinod Koul <vinod.koul@intel.com>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
 <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
 <20250903-gratify-sustained-9acc011bc3c9@thorsis.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250903-gratify-sustained-9acc011bc3c9@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 at 15:16, Alexander Dahl wrote:
> Hello,
> 
> Am Thu, Jul 31, 2025 at 11:05:07AM +0300 schrieb Claudiu Beznea:
>> Hi, Vinod,
>>
>> On 23.07.2025 15:29, Vinod Koul wrote:
>>>
>>> On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
>>>> This patch series adds basic support for Microchip LAN969x SoC.
>>>>
>>>> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
>>>> which allows to avoid the need to change dependencies of the drivers that
>>>> are shared for Microchip SoC-s in the future.
>>>>
>>>> DTS and further driver will be added in follow-up series.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
>>>          commit: e56982021f5303b2523ac247e3c79b063459d012
>>
>> As this one depends, as well, on the first 3 patches in the series (Robert,
>> please correct me if I'm wrong), and there are still discussions ongoing,
>> can you please drop it until all is clear on the first 3 patches?
>>
>> Otherwise, applying only this patch will lead to AT91 XDMAC driver not
>> being built for SAMA5{D2, D3, D4}, SAMA7{G5, D65} SoCs. Linux is not
>> booting on SAMA7G5 SoC only with this patch applied.
> 
> Second that.  Just tested v6.17-rc4 on sam9x60 and DMA is not working
> at all because this driver can not be selected anymore.  This must be
> fixed before v6.17 release please!

Yep, I'll try to fast forward patch 02 of this series before 6.17-final 
(this instead of reverting XDMA patch).

Regards,
   Nicolas

