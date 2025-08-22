Return-Path: <linux-i2c+bounces-12384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E15B319C3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 15:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB1F35E49D7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 13:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ADF3043B9;
	Fri, 22 Aug 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h8S/G+uH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D622FDC5D;
	Fri, 22 Aug 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869544; cv=none; b=ufVSmj2Ui+C+FuWXivqlkXWoVv1wFsprDIzLuMVnvvTTC+nBEXYzdUBExpu0HpggWrHkpPrgSM1+L5j2iScCk/zRkVMlo+Dppv9eYq+TZzKFhEe6/8664db43nkCe9SeCuLouta3UZmn6pxz9EmxA4wptUNw/kib8QCs0y9mbcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869544; c=relaxed/simple;
	bh=ZYQ4ILV3RrkPQFj3nv+P9KHAr3nKxw/zqHI0NlcxtTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pgL340Smd7na3cHaGdRpVGqv/DqrVJkJ3MhDbKAy5FRIB0DU7nPM2RA4xQT7tbDcxqZey1udTQ71+xXqBIdiZ6GjRnakSdBBdqcJ1/+Vtc9F3A2+LiHts/O84ofnEgv18fS0AFXPZW1o5q3cllN95l1QanZP7x50hTY7Z5lZQ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=h8S/G+uH; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869543; x=1787405543;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZYQ4ILV3RrkPQFj3nv+P9KHAr3nKxw/zqHI0NlcxtTc=;
  b=h8S/G+uH4RUqFSJMVCZF3wHaFnwPFpbt4iI6FJ2+667Gffr9SVlqNrxN
   SaRy7a0u5RALrdzdobd3FLysj/kZTqZ+dd6SlFh/BRGyE/Ike7jmu/KhM
   MFMvSvVMZ4uoR51JCcscd9HqpcYGXxk7uyAciTAQV2vfJH9JXSqZxKziS
   cUfcOr/u0z3OaHi3o+TxSzVLxUtBKoKyrh6DUw4jXQOBx1lXj57+IpgS0
   eGX6rltlU8LiCMKcIrNZ377Dl+EdQYvM5t18/lP/oXPEZXT1JHiwWdeiL
   LbFu4R6yeKnbO6cRfDpi4rVxfMRfFt8ujOe7VTSPAxPlustupAh01uP3M
   g==;
X-CSE-ConnectionGUID: s1Ub95wTSSmucjb9LrXB/Q==
X-CSE-MsgGUID: 34LNloV2SSqIchEPAj2ZVQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="45530459"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:32:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:32:03 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:31:59 -0700
Message-ID: <d05d7de0-bfc8-4184-bd18-b3ffb50fbb76@microchip.com>
Date: Fri, 22 Aug 2025 15:31:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/9] arm64: lan969x: Add support for Microchip LAN969x
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
 <20250813174720.540015-4-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 at 19:44, Robert Marko wrote:
> This adds support for the Microchip LAN969x ARMv8-based SoC switch family.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> Changes in v9:
> * Select ARCH_MICROCHIP when ARCH_LAN969X is selected as its now hidden
> 
> Changes in v8:
> * Place LAN969x under ARCH_MICROCHIP as suggested by Arnd and drop review
> tags due to this
> 
>   arch/arm64/Kconfig.platforms | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index bfea380100a6..31bddd1a17de 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -177,6 +177,21 @@ menu "Microchip SoC support"
>   config ARCH_MICROCHIP
>          bool
> 
> +config ARCH_LAN969X
> +       bool "Microchip LAN969X SoC family"
> +       select PINCTRL
> +       select DW_APB_TIMER_OF
> +       select ARCH_MICROCHIP
> +       help
> +         This enables support for the Microchip LAN969X ARMv8-based
> +         SoC family of TSN-capable gigabit switches.
> +
> +         The LAN969X Ethernet switch family provides a rich set of
> +         switching features such as advanced TCAM-based VLAN and QoS
> +         processing enabling delivery of differentiated services, and
> +         security through TCAM-based frame processing using versatile
> +         content aware processor (VCAP).
> +
>   config ARCH_SPARX5
>          bool "Microchip Sparx5 SoC family"
>          select PINCTRL
> --
> 2.50.1
> 


