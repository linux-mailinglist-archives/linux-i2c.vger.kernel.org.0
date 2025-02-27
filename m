Return-Path: <linux-i2c+bounces-9605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E29A47799
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 09:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F37188EFC0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 08:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93931224AE8;
	Thu, 27 Feb 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Qo10uA5x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TWKnKn/7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF8223711;
	Thu, 27 Feb 2025 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644373; cv=none; b=h4Ot5er+pB8hhQVXQUO6LynR0kM20dUyehTyxUBtIA+3nskvYvGicSXXZE1rX4jzk5P2rGD5CMdr8eZiFqVECOgMvDacmbXVfSA7uIzePz3uqmwcd8R1ZeZWd3fJvDAHXJ8THA/3hWB8w81x/rMzBviRuSIHfEB2LlE9VUBfwDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644373; c=relaxed/simple;
	bh=WuQI1ITKOPVp5WgRE8s5tzHcfV10x3QWes8eKtMTqKc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Txi/b1mfEqPN1YCrBlOfkxHz/+u8oBd1AluPMZu8DNG54c3ruGPQJJtDAZ9IyKjT6KC4z/19AJ8jiQ8IfVkaTVwBVExuB1zv/OM6/iu7USIY/VGEiS6oSfJmmwqdYf3KiHX6JanNVzZkJ+0P1UoWdK0/mefFmCICFsHiPGfjYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Qo10uA5x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TWKnKn/7; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35FB61140B75;
	Thu, 27 Feb 2025 03:19:30 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Thu, 27 Feb 2025 03:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740644370;
	 x=1740730770; bh=J4sN4a1OZVim1rCZfmG4xp4g6SnKXjn/a7pXMNn9YAQ=; b=
	Qo10uA5xy/QdV/njsAM9pdNEjw9gdlulUParp7/jtuT9MuJiRodwdxBlUC6snmSg
	ZBdlx6cXV/iHQkWo392S+w7QE3H+qFWjKY5bchm6WzJWjNxhrEFId462HWwx79CN
	sRYteNhUaqS32dMohd6VDFhM9lQfPAWOnGyt7MhRrhoex/YtUnHW084K8HaW2zMk
	OSaAqtf4DNc6i/urvFIHNRz9vhzk5mQfcWNlludrlZnPGyfB+e58juv2IIVuCaFT
	4e4nDmbplHcJfptBhw8TOzXGDBGgA7oD3qwRN9bA3PxwMHD4kEw+xBkQmpMxQ8Z1
	xMEp9R/Sz/wEP6SVDoHWLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740644370; x=
	1740730770; bh=J4sN4a1OZVim1rCZfmG4xp4g6SnKXjn/a7pXMNn9YAQ=; b=T
	WKnKn/7oNQpvbT2IVGC+P3eGDtXpBAN5bijQkowGPSB8eXkNztNCbNUU0bDbVy0u
	b3umdtmdPNpNhK2A/XW/XKcqOtpA9US1t27EjAUBRjAAOfMjmXGmKDdVJ+BQ3bHg
	yO3qa1y9EBHSFFJmaZZKSP8xno2jgaD7KY4V+xd4PCy5LcDlJXILVEwiUoP3fQM4
	VpmUhKESwJ98SSu2P65DLCILhk9CZ7FyNcaKxlwFZSbw58vodgeJXlqAniFvLRBa
	9fq5IYnromVRh2RAYuhobfgIh34VCdW5GyKw4nuUA/y5LIAsuPWNcej/C6/ltp5e
	tDjXrsB4zIaEFKnlgW4Jg==
X-ME-Sender: <xms:ESDAZ1Ta1E3WmZDKY9vR2D0E8y7ssuZjUfo5jrXhzt38CB0Oa4VpMA>
    <xme:ESDAZ-yJLsXb8JldwKQJILOIhlrcOFlU9SVWDxKPiFc2MYHxwaWEZ1fkt604fVJja
    KcjB_LmAz5BAGe51LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekieeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehkrhiikheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslh
    hinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkohes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ESDAZ60Zq4ldJJTsAsafBsApk-rilkR5biwtI7okTJaT5M4n45wQvA>
    <xmx:ESDAZ9DISk2aHqS2FwENgsZzDiEI4RtLPZmg5sWW5ZBje8R9Ck8rRg>
    <xmx:ESDAZ-gkRtWDcuawOJx6whFHy25EQoIhY6qzLzND3-aviJCKwbpo4w>
    <xmx:ESDAZxrDzIrAMB0IW_No4w4XaFXLq9ZVGPJGEdv2NyWKEGvXgsV7ug>
    <xmx:EiDAZ5V8PYZR0ip7QkuneVHeCF0OSbc1Gt6YMwHtPbK0cpwX-UEcAkTG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F46D2220076; Thu, 27 Feb 2025 03:19:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 09:18:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Message-Id: <f9b8acf8-7ed5-4d9f-84d1-acdbaa9e96d8@app.fastmail.com>
In-Reply-To: <Z78itKfsojtMpr_o@smile.fi.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
 <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
 <88ad89bc-9261-4af0-a7ab-28dd760af567@kernel.org>
 <Z78itKfsojtMpr_o@smile.fi.intel.com>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Feb 26, 2025, at 15:18, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 06:21:29PM +0100, Krzysztof Kozlowski wrote:
>> On 25/02/2025 11:29, Arnd Bergmann wrote:
>> 
>> I tried to fix this in SPI, regulator and ASoC 2 years ago and Mark
>> rejected such approach of dropping ACPI/of_match_ptr. AFAIU, Mark wants
>> this to be fixed in more generic way, on the OF and ACPI common code,
>> not per driver.
>> 
>> SPI:
>> https://lore.kernel.org/all/7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk/
>> 
>> regulator:
>> https://lore.kernel.org/all/20230310214553.275450-1-krzysztof.kozlowski@linaro.org/
>> 
>> ASoC:
>> https://lore.kernel.org/all/20230310214333.274903-1-krzysztof.kozlowski@linaro.org/
>
> It was almost two years ago. Things may be changed :-)
> At least I have no impediments so far with converting drivers I'm supporting in
> the SPI. For ASoC there might be a new attempt by Cezary Rojewski in the future
> (he does some cleanups in that area, and we discussed cleaning up ACPI_PTR() at
>  minimum).

I skipped those three subsystems when I sent my backlog. Comparing
what I have left with the version from the patches above I see
that about 40% of the warnings in all three are already addressed
in the meantime, leaving just

 drivers/regulator/pbias-regulator.c   | 2 +-
 drivers/regulator/twl-regulator.c     | 2 +-
 drivers/regulator/twl6030-regulator.c | 2 +-
 drivers/spi/spi-armada-3700.c | 2 +-
 drivers/spi/spi-img-spfi.c    | 2 +-
 drivers/spi/spi-meson-spicc.c | 2 +-
 drivers/spi/spi-meson-spifc.c | 2 +-
 drivers/spi/spi-orion.c       | 2 +-
 drivers/spi/spi-pic32-sqi.c   | 2 +-
 drivers/spi/spi-pic32.c       | 2 +-
 drivers/spi/spi-rockchip.c    | 2 +-
 drivers/spi/spi-s3c64xx.c     | 2 +-
 drivers/spi/spi-st-ssc4.c     | 2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 sound/soc/atmel/sam9x5_wm8731.c      | 2 +-
 sound/soc/codecs/rt1318.c            | 6 ++----
 sound/soc/codecs/rt5514-spi.c        | 2 +-
 sound/soc/qcom/lpass-sc7280.c        | 2 +-
 sound/soc/samsung/aries_wm8994.c     | 2 +-

I send everything else that I have to address the warnings, and
they are slowly making their way into the tree, as of today the
remaining ones are

 drivers/char/apm-emulation.c              | 5 ++---
 drivers/char/tpm/tpm_ftpm_tee.c           | 2 +-
 drivers/comedi/drivers/ni_atmio.c         | 2 +-
 drivers/dma/img-mdc-dma.c                 | 2 +-
 drivers/fpga/versal-fpga.c                | 2 +-
 drivers/input/touchscreen/stmpe-ts.c      | 2 +-
 drivers/mux/adg792a.c                     | 2 +-
 drivers/net/ethernet/apm/xgene-v2/main.c  | 4 +---
 drivers/net/ethernet/hisilicon/hns_mdio.c | 2 +-
 drivers/rtc/rtc-fsl-ftm-alarm.c           | 2 +-
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c    | 2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c    | 2 +-
 drivers/tty/serial/amba-pl011.c           | 6 +++---
 drivers/tty/serial/ma35d1_serial.c        | 2 +-

and I'm optimistic about most of them making it into the
next merge window. Once few enough are left, I can send
it again as a series that turns on the warning by default
and hopefully by that time we can wear down Mark enough
that he takes the patches even if he still disagrees ;-)

      Arnd

