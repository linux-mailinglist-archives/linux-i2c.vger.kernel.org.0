Return-Path: <linux-i2c+bounces-6676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A882F977AD0
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18D86B247C8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E047E1D67BA;
	Fri, 13 Sep 2024 08:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ok8aBhxc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="izHokdNR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B31D67AB;
	Fri, 13 Sep 2024 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726215401; cv=none; b=ZQDH8beFxF4yJYUA6Ft3DOM7Pm1JkqqmzpPqONGY4XntoAbrFDGXk6UBTOGhXSrTzah18Iw7yCVmCk1Z6koZM42trLpaxAF9DpMq58pV7+Dv+7qHsUyUPiNIN7TTbeXrufaP7R0taL6gy5s3g3dYidIG2RcBFjT4alJetiy+xEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726215401; c=relaxed/simple;
	bh=uUoSsY1NnkIys1UMzdheF/S15kw8dq1lNSqmq8L8Tq8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PX7G6X1ZKxrYTIWJDVAf31NLXiFPrhavXCScGL+9EQLwkocxrSGaj+XwhevNCTh1B8x04ZrYPP0n6mKlTcdwLV7uSdYEq9VnWp/uyvwiQqpT6ToyII/OW/HVr61FopfzgSaMHVGZFz8tvdmsN7NSr6+Wst1I/0LTVHeds74UZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ok8aBhxc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=izHokdNR; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1B3BF114035D;
	Fri, 13 Sep 2024 04:16:39 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 04:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726215399;
	 x=1726301799; bh=DmcgopRalHSpfJSJRp6mInfsDTCIb/u1Ocp84sQ/qnU=; b=
	Ok8aBhxcdy41m2qJVVQMYWIcphGssuqlUGNvzQ/IUWwyqp6VR1+bwB9SMladGuUy
	UPHsYcREVDUrOTtUvCWsT1AxCd/Z+L3s/amU9tDi7Iec55mEtuVSUMCOpBk8Br4j
	J3IMf0iIcxkgqCm69YQ4hRfXXOBCzSL37+3Jc6Tgsg/jQcRIe23Jq2v3Da7B8fEX
	VQI30waKr1UskN1Wo+FmpUKIrq80+mNWunww+DtCCiEiyscapw7Xkfz3z21Ia9aL
	uKMun/MGJNAzSHIHYXOzN2w8njMI0IckHZmrUy3C2oqEmNHkrpmTevuSnW8sdQV6
	1aOuv+iwrDChzTTIeXsSPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726215399; x=
	1726301799; bh=DmcgopRalHSpfJSJRp6mInfsDTCIb/u1Ocp84sQ/qnU=; b=i
	zHokdNRANzOrerLBZp/qLoKsF7KBrsH92bUrALhxIiLDC6R2XudTO0m1NLlHvdOa
	ooNuqSdpEWhOoNN5fr0izIl8kFlY+RTXm+eYk4ZTwLHQBqA7cZCo5mqXUfN6nqQh
	0usmEYX+qomlvUvRDAfCbTPEDxvYxJKWchnOWGmzMsWA5LYubiEaElcYXUSJ/cmV
	g6nFX4xEWylr6/UsEemks0pXl9wosLOEALXbeTu+lgbprTsAY5WZBM7p1fMmkZcd
	JOas1U+Bh6oLfV+aSqLVmmRHLvQl2pN7wjltYqO+ZfRqd0mgPifQcWffnfFp4jI8
	+xQZC/vbi71i7VGElUmGA==
X-ME-Sender: <xms:5vTjZs3R-1WvIIlt6_BjU2qkXcIfXnfwusSq5IwknFSVrBXaELdJcQ>
    <xme:5vTjZnGeqFF0-LBDB4UObPEsyPcMtOEdZpnx5qXxR-YQ3zAW_08fx-4iIaIjG76Ag
    t_nFZKewvGQZx1Q0RE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfh
    rhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqe
    enucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedu
    geduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuhhtshgrvhdrrghgrghrfigrlhesrghnrg
    hlohhgrdgtohhmpdhrtghpthhtoheprggushhpqdhlihhnuhigsegrnhgrlhhoghdrtgho
    mhdprhgtphhtthhopegrrhhtuhhrshdrrghrthgrmhhonhhovhhssegrnhgrlhhoghdrtg
    homhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhr
    tghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtth
    hopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghnughirdhshhihthhisehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5vTjZk5UsUiD3hYJ--tp-_LsCnqLKXpU19K9p_1NtfwQiVPd-APF8Q>
    <xmx:5vTjZl1lCuZ1beyeNnIuJzoavEtHhd9GP8eK902foullE8Egr2kG9g>
    <xmx:5vTjZvF6fp0VMphy6fRQRkSX3zt6WfDXVbxnVEPCrHr6qw-3QTmpgg>
    <xmx:5vTjZu96YYavyzmC8ziyvBoKE412BnnSlQJYZRSP0oN86MzCWr-UAw>
    <xmx:5_TjZjXLvozQWBUv4Tort-sLQNUvhn_TIwjMe97DCVrC9A2qwJZHr_mw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 37D86222006F; Fri, 13 Sep 2024 04:16:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 08:16:16 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: arturs.artamonovs@analog.com, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Greg Malysa" <greg.malysa@timesys.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Utsav Agarwal" <Utsav.Agarwal@analog.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 adsp-linux@analog.com,
 "Nathan Barrett-Morrison" <nathan.morrison@timesys.com>
Message-Id: <0929c49e-d906-4885-8e4f-b380358ec6c6@app.fastmail.com>
In-Reply-To: <20240912-test-v1-1-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-1-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Add ADSP-SC598 platform.
>

> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -292,6 +292,19 @@ config ARCH_ROCKCHIP
>  	  This enables support for the ARMv8 based Rockchip chipsets,
>  	  like the RK3368.
> 
> +config ARCH_SC59X_64
> +	bool "ADI 64-bit SC59X Platforms"
> +	select TIMER_OF
> +	select GPIOLIB
> +	select PINCTRL
> +	select COMMON_CLK_ADI_SC598
> +	select PINCTRL_ADSP
> +	select ADI_ADSP_IRQ
> +	select COUNTER

You can remove the 'select' statements above and just
make your drivers 'default ARCH_SC59X_64'.

It may also help to pick a more generic name for the platform
in case someone wants to add support for SC57x/SC58x later,
assuming these use some of the same drivers,.

The Kconfig change can normally go into the same patch
as the MAINTAINERS file update, but should be separate
from any of the drivers.

> --- /dev/null
> +++ b/drivers/soc/adi/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# todo modularize; already depends on CONFIG_ARCH_SC59X_64 though
> +
> +obj-y += system.o
> diff --git a/drivers/soc/adi/system.c b/drivers/soc/adi/system.c

I'm confused about the purpose of this driver. Please
split this out into a separate patch and add a detailed
description of how it is actually being used, since it
does not interact with any of the normal subsystems.


> diff --git a/include/linux/soc/adi/adsp-gpio-port.h 
> b/include/linux/soc/adi/adsp-gpio-port.h

> --- /dev/null
> +++ b/include/linux/soc/adi/cpu.h

> --- /dev/null
> +++ b/include/linux/soc/adi/rcu.h
> @@ -0,0 +1,55 @@

> diff --git a/include/linux/soc/adi/sc59x.h 
> b/include/linux/soc/adi/sc59x.h

> --- /dev/null
> +++ b/include/linux/soc/adi/sc59x.h

I don't see these files being included in the driver you add
here, maybe they got added by accident here?

       Arnd

