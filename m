Return-Path: <linux-i2c+bounces-12382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4964B319AB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 15:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52C0586458
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0ED2FFDDA;
	Fri, 22 Aug 2025 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CoN1EBNR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0B24CEE8;
	Fri, 22 Aug 2025 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869399; cv=none; b=ZiesLgchjYKxvoquf4mqZf8PUvPeMJKjKzY7//ATSiyXzbAOA/OT53oLJnTAIA6MYDuhqgkBROtT4FMeAraU6ir6+yCxnyilpcNVze9tl/MbiEgQKjvYWSPyla07rptESg4yRMRJjwI20qw/6vUT99JLKGS8ELO3APJX4CIEfvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869399; c=relaxed/simple;
	bh=JmipXnXVqs0bo7rBOQEowa8CcQd7VSNge6eEHRVSm0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YodWyMcBOyypHUwvI2maHuKicbj8Xta83Ipzbes5sE6gSf6aNxxC+zVKZeWpGpg2OZQ1Xxo0aoCpZGIlCxlCR+wKlL5vOh9Vb6AHGSpeIe+CCbEU9pI9d8BpaRKPKP8AiUER1VF665o+2fGoarwdWlVl2KhgIJ1wkTDgv31Pl70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CoN1EBNR; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869398; x=1787405398;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JmipXnXVqs0bo7rBOQEowa8CcQd7VSNge6eEHRVSm0g=;
  b=CoN1EBNRuApjOIBGwSTCqkl0wNtrGw5KGLH8BQQhSyf7HzfoA13gq6Bq
   3qvKZR4tJAl0/24VteAr6ZVutVUDi62aYUiOfD/MmRnfA8yqGTX7IKPrx
   LXXZoVMra8Rc4papdCtciEOdx1RpfOGvgQdgfyty3LCfnexTlyX6ZT5Uv
   d67Z3HJDSNRHU96bl/lhDyYocJ2QzrPVQCNstHiXo0+X9o13UWBiUUKpT
   SnVPiqinPAPWD0c8ibXWjuu2eAsUf38ykGjmIRz4+abD3RTcIH1pZloxr
   NWiQITEk+GyYO0gylzJL91Je+MZ/hb1MkjMcLZdDJL+2SCApMnqdsY8Ok
   Q==;
X-CSE-ConnectionGUID: dttGCdfnRrSwT0WQldL3yA==
X-CSE-MsgGUID: AeSCvjSPQYS0LsPuRv0RiQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="276925274"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:29:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:29:25 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:29:21 -0700
Message-ID: <76b1062f-a4e3-4392-9549-86d63616a5ca@microchip.com>
Date: Fri, 22 Aug 2025 15:29:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] arm64: Add config for Microchip SoC platforms
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
 <20250813174720.540015-2-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 at 19:44, Robert Marko wrote:
> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
> 
> However, this means that new Microchip platforms that share drivers need
> to constantly keep updating depends on various drivers.
> 
> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> could instead depend on.
> 
> LAN969x is being worked on and it will be added under ARCH_MICROCHIP.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Ok, according to the compromise that we discussed during v8 that's fine 
with me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Robert! Regards,
   Nicolas

> ---
> Changes in v9:
> * Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 directly,
> this avoids breaking existing configs with ARCH_SPARX5
> 
>   arch/arm64/Kconfig.platforms | 36 ++++++++++++++++++++++--------------
>   1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a88f5ad9328c..bfea380100a6 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -131,20 +131,6 @@ config ARCH_EXYNOS
>          help
>            This enables support for ARMv8 based Samsung Exynos SoC family.
> 
> -config ARCH_SPARX5
> -       bool "Microchip Sparx5 SoC family"
> -       select PINCTRL
> -       select DW_APB_TIMER_OF
> -       help
> -         This enables support for the Microchip Sparx5 ARMv8-based
> -         SoC family of TSN-capable gigabit switches.
> -
> -         The SparX-5 Ethernet switch family provides a rich set of
> -         switching features such as advanced TCAM-based VLAN and QoS
> -         processing enabling delivery of differentiated services, and
> -         security through TCAM-based frame processing using versatile
> -         content aware processor (VCAP).
> -
>   config ARCH_K3
>          bool "Texas Instruments Inc. K3 multicore SoC architecture"
>          select SOC_TI
> @@ -186,6 +172,28 @@ config ARCH_MESON
>            This enables support for the arm64 based Amlogic SoCs
>            such as the s905, S905X/D, S912, A113X/D or S905X/D2
> 
> +menu "Microchip SoC support"
> +
> +config ARCH_MICROCHIP
> +       bool
> +
> +config ARCH_SPARX5
> +       bool "Microchip Sparx5 SoC family"
> +       select PINCTRL
> +       select DW_APB_TIMER_OF
> +       select ARCH_MICROCHIP
> +       help
> +         This enables support for the Microchip Sparx5 ARMv8-based
> +         SoC family of TSN-capable gigabit switches.
> +
> +         The SparX-5 Ethernet switch family provides a rich set of
> +         switching features such as advanced TCAM-based VLAN and QoS
> +         processing enabling delivery of differentiated services, and
> +         security through TCAM-based frame processing using versatile
> +         content aware processor (VCAP).
> +
> +endmenu
> +
>   config ARCH_MMP
>          bool "Marvell MMP SoC Family"
>          select PINCTRL
> --
> 2.50.1
> 


