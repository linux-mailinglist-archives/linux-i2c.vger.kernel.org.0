Return-Path: <linux-i2c+bounces-2555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7971886F9C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 16:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFA4D1F235AE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 15:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B4054BF7;
	Fri, 22 Mar 2024 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oqI+5Jmk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74050278;
	Fri, 22 Mar 2024 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711120411; cv=none; b=MwyyFa+w3p5JKt3Dck/fKv9x/l0QqNiGB3CIKjQRt/Pqs5yoUwLWMMvGDpylwopibygB+nR5IzaOOReBgMXgBZDxapPtGinFES4pFdqCsCvQD1qrV3/TWh0RNCcXbb67v2kzSDb6ABwmiO122GU5YhmCfjbiY44IqD02X5/fKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711120411; c=relaxed/simple;
	bh=F50EgZ2lJjv6pHduFkF5MM5IKGV69nz1KM4YNtLhMAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bERKpWRIPHmaAYvgBiwLhczzPBU6tzcEs8IarW4wnLOdSI+M8CCGQQO+4vGVNMNLj2mgqIoej/23P8AP4LnR6/4RhUMfP+91egiety2isyMNfzi9jyEGi5dUGTjGsz6d0zQS5cPbRrUN67Bs/ldGSrWKPmZKDa511kQK7JL1LxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=oqI+5Jmk; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711120408; x=1742656408;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F50EgZ2lJjv6pHduFkF5MM5IKGV69nz1KM4YNtLhMAs=;
  b=oqI+5JmkcBUM+KMCfZdOV1mWAvIN0yr2MPr2ztMKBDZ/xi+MFZ3EG4Z5
   vECsis4cRicHGZaR7NBDldDxnVxUg3vFXh0CeY47KjfZpdJsrKVd5oCH9
   458OqOcmPRL7Vg/agHrzE6SsW2GUv0VMUSqX9c81z8wiSs/Gvv2qVsl4V
   KklX9ZqCKCMb1NF6HtVLtQhF14rB5GyfqY+IqfTRv1ajhdTAKmR0n/nJn
   TtKWqQCGKK9sz8OSE7AT2QtGdJ92EHubg5IeCinIc5B0HV+ILVAB7rla4
   M3slIgljFFp+/4tmffz9FDq44JNtxEyWlrJAK3m07Wt8zrqExn3bZ1Xaw
   A==;
X-CSE-ConnectionGUID: X1l3K2T7QvGR7YYL+xW82w==
X-CSE-MsgGUID: FtnGXb0RSl6ESGuAQ94UKg==
X-IronPort-AV: E=Sophos;i="6.07,146,1708412400"; 
   d="scan'208";a="185306479"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2024 08:13:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 08:13:07 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 08:12:51 -0700
Message-ID: <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
Date: Fri, 22 Mar 2024 16:11:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Content-Language: en-US, fr-FR
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-i2c@vger.kernel.org>
CC: Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K
	<shyam-sundar.s-k@amd.com>, Andi Shyti <andi.shyti@kernel.org>, "Codrin
 Ciubotariu" <codrin.ciubotariu@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins
	<nick.hawkins@hpe.com>, Yicong Yang <yangyicong@hisilicon.com>, "Oleksij
 Rempel" <o.rempel@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Paul Cercueil
	<paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, "Kevin
 Hilman" <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Khalil Blaiech
	<kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang
	<qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	"Benjamin Fair" <benjaminfair@google.com>, Ajay Gupta <ajayg@nvidia.com>,
	"Peter Korsgaard" <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, Robert
 Richter <rric@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Vignesh
 R <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, Sven Peter
	<sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, "Vladimir
 Zapolskiy" <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, "Laxman Dewangan"
	<ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, "Conghui Chen"
	<conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, "Michal
 Simek" <michal.simek@amd.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
	<linux-samsung-soc@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-omap@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<asahi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 at 14:25, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

[..]

>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----

[..]

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
Probably file names themselves will need some care, in a second time.

Thanks. Regards,
   Nicolas

[..]

> --
> 2.43.0
> 


