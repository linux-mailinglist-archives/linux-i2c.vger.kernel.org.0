Return-Path: <linux-i2c+bounces-9562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4DA43BCD
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B0A819C4A1C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 10:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0A5263F28;
	Tue, 25 Feb 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="p5UhhKpy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uT2FRHTn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58061C84B8;
	Tue, 25 Feb 2025 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479370; cv=none; b=jkv16Wq6o53QD56bF+9pR6XV3DIkg6IEm+KqPUwhUL00xC3yZ96Je7bObCakIg4Sj4IKGVBtHxFBnu9j6WeKklFTCtsPhtoMDInQUHc84sFsA8VUyfJcisgRWiRLdsAiIgp6nLicV2v0FaiAkxARLIXGgHzzMeh/SiIF+kkZGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479370; c=relaxed/simple;
	bh=I0RKKtCl8JKBrAuyOo/XnnS8XBkmCmWoE8pg0B+RPug=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kWRPlrbjKm+lRZSetLKHI73UJVqaXtpRIA5+O/MudCQ6K25YkjVf06emfXsCCJGevW3gptJXdKPNSbeJFdijvH3b5HgCBPuGVeRspJOXk3a6Id7SPjfeO8GM/SH3n4b9BkozVxdTgoaiLtsCqIkyOod+sFXl8eXxQnxzxkkRq9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=p5UhhKpy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uT2FRHTn; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 9CE361140164;
	Tue, 25 Feb 2025 05:29:26 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 05:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740479366;
	 x=1740565766; bh=v0Bvc/5qbggXsAux8ng5LhXLuFuMqxGzZ4t1f2FBJmU=; b=
	p5UhhKpyN7j7wFt0HQNTh8Z/PuacXTYJq4d32JrLutuY3jh6fFbPTXuIdZ8C87dR
	9tXYJEx9Zj/vhS1br+spUFCaYPRhg6TTZJa/p5H78Y6Etsx6VAXHEO/LHglatCTI
	JDjCmSMF/NrQvygKFQUTxJUfHQMGRq2ZN27o9HUC05ZKAH/yv9uN2Oa9TdohbL4t
	FzbGE6NvppLOSbh9z9BjnWnuwm2JAbVMiu9eEy6SAhXRWUTp5t3TM6HAzFNwGA7N
	udoMOuBcT7eqv9/4klpn8uaO4505MIbed5JVJO2fMBfQW92Q7HozfzWwSIruP9o6
	77rhSlGbKiQD4rHvQqSx7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740479366; x=
	1740565766; bh=v0Bvc/5qbggXsAux8ng5LhXLuFuMqxGzZ4t1f2FBJmU=; b=u
	T2FRHTnmEH3iHJZajdkVUhbX9t2Y1bgmY93OhNIYfnVC4AB7bHFDCclUrgtWLZ7Z
	1xXjQbDt2c0mTdyDDeGtc6FBwcMdq1idSw9aG1b8UzZMRvpCQnX53SXupshy49Xy
	x/2xT4wiA7/ypmyADVmT73Hk1ewiG6oiKBESjNoE+Uw7oNgDR2JBqHoR9dq0lUWv
	JydI/RfA4yZjw7KYwvW6KTEs3oqJ0Hb59nK83TPVoTU7b1kR+HK0yQF0aost7Oeq
	yXq2HLBzbMvZHvKPVrDy5GHW+qJjsVQvLIyINGoVbuOb8QdUsHtioB8NrQ3JTuKV
	AfhCm2zlgYJP/0ZH/jdow==
X-ME-Sender: <xms:hpu9ZzPDtAgdDbXDMq4Wj2Xw_9WFHS_c01FoqoW6Ah-nbGaIqb4j6g>
    <xme:hpu9Z98KUZEbsIyMda55uoGTOXZwzGjBtgOGG7mRbObj9MwbriZADVas5-JjOeIv1
    bHpldp5FcC5c5wEomY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpd
    hrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:hpu9ZyRTOg6ThO9ZDY9QxRfIKslUBc7DObfp6llJTK9Zt3xe-uQ32w>
    <xmx:hpu9Z3sqm5cVVirAxp6aPpGbBd_oCZ9BhJjFVg5FOtUcNWv_S9dE2A>
    <xmx:hpu9Z7dc4wR5a4fFh1kOwEz39dWxdjCmIEzkuOptrZwFtoJzwB6FRQ>
    <xmx:hpu9Zz2AtQXZE5JuK_8hCbSFq5ijHadEpdCemUn2Mu31vJA_4Dct1g>
    <xmx:hpu9Z8GCtkM09-4Hblg0gr_2Jp5i0j3EkFGu9HgsWZRyG6tp8xinwJLx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 371EB2220072; Tue, 25 Feb 2025 05:29:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 11:29:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Message-Id: <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
In-Reply-To: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025, at 11:08, Andy Shevchenko wrote:
> These result in a very small reduction in driver size, but at the cost
> of more complex build and slightly harder to read code. In the case of
> of_match_ptr() it also prevents use of PRP0001 ACPI based identification.
> In this particular case we have a valid ACPI/PNP ID that should be used
> in preference to PRP0001 but doesn't mean we should prevent that route.
>
> With this done, drop unneeded of*.h inclusions and __maybe_unused markers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

For reference, see below for a couple of patches in this area that
I have sent in the past. Ideally I think we should try to fix these
all up and enable -Wunused-const-variable, which is useful in its
own right.

Your patch does not address a warning, but it's still a step
in that direction.

      Arnd

From 57d9cdda8306ac53ea4864b9d3c06d291b6a7929 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Mar 2024 10:33:58 +0100
Subject: [PATCH] [SUBMITTED 20240403] spi: remove incorrect of_match_ptr
 annotations

When building with CONFIG_OF  disabled but W=1 extra warnings enabled,
a couple of driver cause a warning about an unused ID table:

drivers/spi/spi-armada-3700.c:806:34: error: unused variable 'a3700_spi_dt_ids' [-Werror,-Wunused-const-variable]
drivers/spi/spi-orion.c:614:34: error: unused variable 'orion_spi_of_match_table' [-Werror,-Wunused-const-variable]
drivers/spi/spi-pic32-sqi.c:673:34: error: unused variable 'pic32_sqi_of_ids' [-Werror,-Wunused-const-variable]
drivers/spi/spi-pic32.c:850:34: error: unused variable 'pic32_spi_of_match' [-Werror,-Wunused-const-variable]
drivers/spi/spi-rockchip.c:1020:34: error: unused variable 'rockchip_spi_dt_match' [-Werror,-Wunused-const-variable]
drivers/spi/spi-s3c64xx.c:1642:34: error: unused variable 's3c64xx_spi_dt_match' [-Werror,-Wunused-const-variable]
drivers/spi/spi-st-ssc4.c:439:34: error: unused variable 'stm_spi_match' [-Werror,-Wunused-const-variable]

These appear to all be copied from the same original driver, so fix them at the
same time by removing the unnecessary of_match_ptr() annotation. As far as I
can tell, all these drivers are only actually used on configurations that
have CONFIG_OF enabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
index 02c1e625742d..c1782dd6f9b7 100644
--- a/drivers/spi/spi-armada-3700.c
+++ b/drivers/spi/spi-armada-3700.c
@@ -902,7 +902,7 @@ static int a3700_spi_probe(struct platform_device *pdev)
 static struct platform_driver a3700_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
-		.of_match_table = of_match_ptr(a3700_spi_dt_ids),
+		.of_match_table = a3700_spi_dt_ids,
 	},
 	.probe		= a3700_spi_probe,
 };
diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
index 168ccf51f6d4..71f38d507661 100644
--- a/drivers/spi/spi-img-spfi.c
+++ b/drivers/spi/spi-img-spfi.c
@@ -753,7 +753,7 @@ static struct platform_driver img_spfi_driver = {
 	.driver = {
 		.name = "img-spfi",
 		.pm = &img_spfi_pm_ops,
-		.of_match_table = of_match_ptr(img_spfi_of_match),
+		.of_match_table = img_spfi_of_match,
 	},
 	.probe = img_spfi_probe,
 	.remove = img_spfi_remove,
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index df74ad5060f8..8e1ba710a3b2 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -952,7 +952,7 @@ static struct platform_driver meson_spicc_driver = {
 	.remove = meson_spicc_remove,
 	.driver  = {
 		.name = "meson-spicc",
-		.of_match_table = of_match_ptr(meson_spicc_of_match),
+		.of_match_table = meson_spicc_of_match,
 	},
 };
 
diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index ef7efeaeee97..a342307ff19e 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -432,7 +432,7 @@ static struct platform_driver meson_spifc_driver = {
 	.remove = meson_spifc_remove,
 	.driver	= {
 		.name		= "meson-spifc",
-		.of_match_table	= of_match_ptr(meson_spifc_dt_match),
+		.of_match_table	= meson_spifc_dt_match,
 		.pm		= &meson_spifc_pm_ops,
 	},
 };
diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 43bd9f21137f..a989ba408de1 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -843,7 +843,7 @@ static struct platform_driver orion_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.pm	= &orion_spi_pm_ops,
-		.of_match_table = of_match_ptr(orion_spi_of_match_table),
+		.of_match_table = orion_spi_of_match_table,
 	},
 	.probe		= orion_spi_probe,
 	.remove		= orion_spi_remove,
diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index fa0c1ee84532..e848f5dc8863 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -679,7 +679,7 @@ MODULE_DEVICE_TABLE(of, pic32_sqi_of_ids);
 static struct platform_driver pic32_sqi_driver = {
 	.driver = {
 		.name = "sqi-pic32",
-		.of_match_table = of_match_ptr(pic32_sqi_of_ids),
+		.of_match_table = pic32_sqi_of_ids,
 	},
 	.probe = pic32_sqi_probe,
 	.remove = pic32_sqi_remove,
diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 369850d14313..9400c9ca5b9d 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -856,7 +856,7 @@ MODULE_DEVICE_TABLE(of, pic32_spi_of_match);
 static struct platform_driver pic32_spi_driver = {
 	.driver = {
 		.name = "spi-pic32",
-		.of_match_table = of_match_ptr(pic32_spi_of_match),
+		.of_match_table = pic32_spi_of_match,
 	},
 	.probe = pic32_spi_probe,
 	.remove = pic32_spi_remove,
diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 1bc012fce7cb..69f9e83c27ed 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -1042,7 +1042,7 @@ static struct platform_driver rockchip_spi_driver = {
 	.driver = {
 		.name	= DRIVER_NAME,
 		.pm = &rockchip_spi_pm,
-		.of_match_table = of_match_ptr(rockchip_spi_dt_match),
+		.of_match_table = rockchip_spi_dt_match,
 	},
 	.probe = rockchip_spi_probe,
 	.remove = rockchip_spi_remove,
diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 9c47f5741c5f..1fddd9258a78 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1680,7 +1680,7 @@ static struct platform_driver s3c64xx_spi_driver = {
 	.driver = {
 		.name	= "s3c64xx-spi",
 		.pm = &s3c64xx_spi_pm,
-		.of_match_table = of_match_ptr(s3c64xx_spi_dt_match),
+		.of_match_table = s3c64xx_spi_dt_match,
 	},
 	.probe = s3c64xx_spi_probe,
 	.remove = s3c64xx_spi_remove,
diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
index 4cff976ab16f..74b94920f1f1 100644
--- a/drivers/spi/spi-st-ssc4.c
+++ b/drivers/spi/spi-st-ssc4.c
@@ -446,7 +446,7 @@ static struct platform_driver spi_st_driver = {
 	.driver = {
 		.name = "spi-st",
 		.pm = &spi_st_pm,
-		.of_match_table = of_match_ptr(stm_spi_match),
+		.of_match_table = stm_spi_match,
 	},
 	.probe = spi_st_probe,
 	.remove = spi_st_remove,

From 7d3464f1a9324fa788a3581527afe9077f481381 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Mar 2024 10:33:58 +0100
Subject: [PATCH] [SUBMITTED 20240403] ASoC: remove incorrect
 of_match_ptr/ACPI_PTR annotations

When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
warnings enabled, a lot of driver cause a warning about an unused
ID table:

sound/soc/atmel/sam9x5_wm8731.c:187:34: error: unused variable 'sam9x5_wm8731_of_match' [-Werror,-Wunused-const-variable]
sound/soc/codecs/rt5514-spi.c:496:34: error: unused variable 'rt5514_of_match' [-Werror,-Wunused-const-variable]
sound/soc/samsung/aries_wm8994.c:524:34: error: unused variable 'samsung_wm8994_of_match' [-Werror,-Wunused-const-variable]

The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
that remove the reference, rather than adding another #ifdef just for build
testing for a configuration that doesn't matter in practice.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 4ca1978020a9..24240e164182 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -541,7 +541,7 @@ MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
 static struct platform_driver acp3x_audio = {
 	.driver = {
 		.name = "acp3x-alc5682-max98357",
-		.acpi_match_table = ACPI_PTR(acp3x_audio_acpi_match),
+		.acpi_match_table = acp3x_audio_acpi_match,
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = acp3x_probe,
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 1b5ef4e9d2b8..254c54ce32f8 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -193,7 +193,7 @@ MODULE_DEVICE_TABLE(of, sam9x5_wm8731_of_match);
 static struct platform_driver sam9x5_wm8731_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.of_match_table = of_match_ptr(sam9x5_wm8731_of_match),
+		.of_match_table = sam9x5_wm8731_of_match,
 	},
 	.probe = sam9x5_wm8731_driver_probe,
 	.remove = sam9x5_wm8731_driver_remove,
diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index f475c8cfadae..da397db8d7d5 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -503,7 +503,7 @@ static struct spi_driver rt5514_spi_driver = {
 	.driver = {
 		.name = "rt5514",
 		.pm = &rt5514_pm_ops,
-		.of_match_table = of_match_ptr(rt5514_of_match),
+		.of_match_table = rt5514_of_match,
 	},
 	.probe = rt5514_spi_probe,
 };
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 7cd3e291382a..b3ea39bd2539 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -441,7 +441,7 @@ MODULE_DEVICE_TABLE(of, sc7280_lpass_cpu_device_id);
 static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7280-lpass-cpu",
-		.of_match_table = of_match_ptr(sc7280_lpass_cpu_device_id),
+		.of_match_table = sc7280_lpass_cpu_device_id,
 		.pm = &sc7280_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 01716df0c842..b96676c50d6b 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -689,7 +689,7 @@ static int aries_audio_probe(struct platform_device *pdev)
 static struct platform_driver aries_audio_driver = {
 	.driver		= {
 		.name	= "aries-audio-wm8994",
-		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
+		.of_match_table = samsung_wm8994_of_match,
 		.pm	= &snd_soc_pm_ops,
 	},
 	.probe		= aries_audio_probe,

From 95b16768b746973b1258a6966d182656e2fb5a6b Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Mar 2024 10:33:58 +0100
Subject: [PATCH] [SUBMITTED 20240403] drivers: remove incorrect
 of_match_ptr/ACPI_PTR annotations

When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
warnings enabled, a lot of driver cause a warning about an unused
ID table:

drivers/char/tpm/tpm_ftpm_tee.c:356:34: error: unused variable 'of_ftpm_tee_ids' [-Werror,-Wunused-const-variable]
drivers/dma/img-mdc-dma.c:863:34: error: unused variable 'mdc_dma_of_match' [-Werror,-Wunused-const-variable]
drivers/fpga/versal-fpga.c:62:34: error: unused variable 'versal_fpga_of_match' [-Werror,-Wunused-const-variable]
drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]
drivers/memory/pl353-smc.c:62:34: error: unused variable 'pl353_smc_supported_children' [-Werror,-Wunused-const-variable]
drivers/regulator/pbias-regulator.c:136:34: error: unused variable 'pbias_of_match' [-Werror,-Wunused-const-variable]
drivers/regulator/twl-regulator.c:552:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
drivers/regulator/twl6030-regulator.c:645:34: error: unused variable 'twl_of_match' [-Werror,-Wunused-const-variable]
drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3635:36: error: unused variable 'sas_v2_acpi_match' [-Werror,-Wunused-const-variable]
drivers/staging/pi433/pi433_if.c:1359:34: error: unused variable 'pi433_dt_ids' [-Werror,-Wunused-const-variable]
drivers/tty/serial/amba-pl011.c:2945:34: error: unused variable 'sbsa_uart_of_match' [-Werror,-Wunused-const-variable]

The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
that remove the reference, rather than adding another #ifdef just for build
testing for a configuration that doesn't matter in practice.

I considered splitting up the large patch into per subsystem patches, but since
it's really just the same thing everywhere it feels better to do it all at once.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index 139556b21cc6..8d9209dfc384 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -362,7 +362,7 @@ MODULE_DEVICE_TABLE(of, of_ftpm_tee_ids);
 static struct platform_driver ftpm_tee_plat_driver = {
 	.driver = {
 		.name = "ftpm-tee",
-		.of_match_table = of_match_ptr(of_ftpm_tee_ids),
+		.of_match_table = of_ftpm_tee_ids,
 	},
 	.shutdown = ftpm_plat_tee_shutdown,
 	.probe = ftpm_plat_tee_probe,
diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index 4127c1bdcca7..fd55bcd060ab 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -1073,7 +1073,7 @@ static struct platform_driver mdc_dma_driver = {
 	.driver = {
 		.name = "img-mdc-dma",
 		.pm = &img_mdc_pm_ops,
-		.of_match_table = of_match_ptr(mdc_dma_of_match),
+		.of_match_table = mdc_dma_of_match,
 	},
 	.probe = mdc_dma_probe,
 	.remove = mdc_dma_remove,
diff --git a/drivers/fpga/versal-fpga.c b/drivers/fpga/versal-fpga.c
index 3710e8f01be2..e6189106c468 100644
--- a/drivers/fpga/versal-fpga.c
+++ b/drivers/fpga/versal-fpga.c
@@ -69,7 +69,7 @@ static struct platform_driver versal_fpga_driver = {
 	.probe = versal_fpga_probe,
 	.driver = {
 		.name = "versal_fpga_manager",
-		.of_match_table = of_match_ptr(versal_fpga_of_match),
+		.of_match_table = versal_fpga_of_match,
 	},
 };
 module_platform_driver(versal_fpga_driver);
diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 4c1ccf7a267a..ac901851f5c0 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -275,21 +275,19 @@ static const struct acpi_device_id cbas_ec_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
 #endif
 
-#ifdef CONFIG_OF
 static const struct of_device_id cbas_ec_of_match[] = {
 	{ .compatible = "google,cros-cbas" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
-#endif
 
 static struct platform_driver cbas_ec_driver = {
 	.probe = cbas_ec_probe,
 	.remove = cbas_ec_remove,
 	.driver = {
 		.name = "cbas_ec",
-		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
-		.of_match_table = of_match_ptr(cbas_ec_of_match),
+		.acpi_match_table = cbas_ec_acpi_ids,
+		.of_match_table = cbas_ec_of_match,
 		.pm = &cbas_ec_pm_ops,
 	},
 };
diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 19a7c370946d..8a87f19bf5d5 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -303,7 +303,7 @@ static void ltc4306_remove(struct i2c_client *client)
 static struct i2c_driver ltc4306_driver = {
 	.driver		= {
 		.name	= "ltc4306",
-		.of_match_table = of_match_ptr(ltc4306_of_match),
+		.of_match_table = ltc4306_of_match,
 	},
 	.probe		= ltc4306_probe,
 	.remove		= ltc4306_remove,
diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index dfa472d514cc..1e566ea92bc9 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -250,7 +250,7 @@ static struct platform_driver i2c_mux_reg_driver = {
 	.remove = i2c_mux_reg_remove,
 	.driver	= {
 		.name	= "i2c-mux-reg",
-		.of_match_table = of_match_ptr(i2c_mux_reg_of_match),
+		.of_match_table = i2c_mux_reg_of_match,
 	},
 };
 
diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 88d376090e6e..3ba11124584d 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1168,7 +1168,7 @@ static struct i2c_driver wdt87xx_driver = {
 		.name = WDT87XX_NAME,
 		.dev_groups = wdt87xx_groups,
 		.pm = pm_sleep_ptr(&wdt87xx_pm_ops),
-		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
+		.acpi_match_table = wdt87xx_acpi_id,
 	},
 };
 module_i2c_driver(wdt87xx_driver);
diff --git a/drivers/mux/adg792a.c b/drivers/mux/adg792a.c
index 4da5aecb9fc6..a5afe29e3cf1 100644
--- a/drivers/mux/adg792a.c
+++ b/drivers/mux/adg792a.c
@@ -141,7 +141,7 @@ MODULE_DEVICE_TABLE(of, adg792a_of_match);
 static struct i2c_driver adg792a_driver = {
 	.driver		= {
 		.name		= "adg792a",
-		.of_match_table = of_match_ptr(adg792a_of_match),
+		.of_match_table = adg792a_of_match,
 	},
 	.probe		= adg792a_probe,
 	.id_table	= adg792a_id,
diff --git a/drivers/net/ethernet/apm/xgene-v2/main.c b/drivers/net/ethernet/apm/xgene-v2/main.c
index 2a91c84aebdb..c5b3903916d9 100644
--- a/drivers/net/ethernet/apm/xgene-v2/main.c
+++ b/drivers/net/ethernet/apm/xgene-v2/main.c
@@ -731,7 +731,7 @@ MODULE_DEVICE_TABLE(acpi, xge_acpi_match);
 static struct platform_driver xge_driver = {
 	.driver = {
 		   .name = "xgene-enet-v2",
-		   .acpi_match_table = ACPI_PTR(xge_acpi_match),
+		   .acpi_match_table = xge_acpi_match,
 	},
 	.probe = xge_probe,
 	.remove = xge_remove,
diff --git a/drivers/net/ethernet/hisilicon/hns_mdio.c b/drivers/net/ethernet/hisilicon/hns_mdio.c
index a1aa6c1f966e..6812be8dc64f 100644
--- a/drivers/net/ethernet/hisilicon/hns_mdio.c
+++ b/drivers/net/ethernet/hisilicon/hns_mdio.c
@@ -640,7 +640,7 @@ static struct platform_driver hns_mdio_driver = {
 	.driver = {
 		   .name = MDIO_DRV_NAME,
 		   .of_match_table = hns_mdio_match,
-		   .acpi_match_table = ACPI_PTR(hns_mdio_acpi_match),
+		   .acpi_match_table = hns_mdio_acpi_match,
 		   },
 };
 
diff --git a/drivers/regulator/pbias-regulator.c b/drivers/regulator/pbias-regulator.c
index cd5a0d7e4455..2eeb99e7b850 100644
--- a/drivers/regulator/pbias-regulator.c
+++ b/drivers/regulator/pbias-regulator.c
@@ -231,7 +231,7 @@ static struct platform_driver pbias_regulator_driver = {
 	.driver		= {
 		.name		= "pbias-regulator",
 		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(pbias_of_match),
+		.of_match_table = pbias_of_match,
 	},
 };
 
diff --git a/drivers/regulator/twl-regulator.c b/drivers/regulator/twl-regulator.c
index 5bacfcebf59a..4ed91e88e1eb 100644
--- a/drivers/regulator/twl-regulator.c
+++ b/drivers/regulator/twl-regulator.c
@@ -656,7 +656,7 @@ static struct platform_driver twlreg_driver = {
 	.driver  = {
 		.name  = "twl4030_reg",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(twl_of_match),
+		.of_match_table = twl_of_match,
 	},
 };
 
diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
index 6eed0f6e0adb..8a84048a66d7 100644
--- a/drivers/regulator/twl6030-regulator.c
+++ b/drivers/regulator/twl6030-regulator.c
@@ -765,7 +765,7 @@ static struct platform_driver twlreg_driver = {
 	.driver  = {
 		.name  = "twl6030_reg",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(twl_of_match),
+		.of_match_table = twl_of_match,
 	},
 };
 
diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index a72c4ad0cec6..12da7d36e520 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -320,7 +320,7 @@ static struct platform_driver ftm_rtc_driver = {
 	.driver		= {
 		.name	= "ftm-alarm",
 		.of_match_table = ftm_rtc_match,
-		.acpi_match_table = ACPI_PTR(ftm_imx_acpi_ids),
+		.acpi_match_table = ftm_imx_acpi_ids,
 	},
 };
 
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
index bb78e53c66e2..6621d633b2cc 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
@@ -1806,7 +1806,7 @@ static struct platform_driver hisi_sas_v1_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = sas_v1_of_match,
-		.acpi_match_table = ACPI_PTR(sas_v1_acpi_match),
+		.acpi_match_table = sas_v1_acpi_match,
 	},
 };
 
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 71cd5b4450c2..3cc4cddcb655 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -3653,7 +3653,7 @@ static struct platform_driver hisi_sas_v2_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = sas_v2_of_match,
-		.acpi_match_table = ACPI_PTR(sas_v2_acpi_match),
+		.acpi_match_table = sas_v2_acpi_match,
 	},
 };
 
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 047fb9f51539..dc092204b472 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -3051,7 +3051,7 @@ static const struct of_device_id sbsa_uart_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sbsa_uart_of_match);
 
-static const struct acpi_device_id __maybe_unused sbsa_uart_acpi_match[] = {
+static const struct acpi_device_id sbsa_uart_acpi_match[] = {
 	{ "ARMH0011", 0 },
 	{ "ARMHB000", 0 },
 	{},
@@ -3064,8 +3064,8 @@ static struct platform_driver arm_sbsa_uart_platform_driver = {
 	.driver	= {
 		.name	= "sbsa-uart",
 		.pm	= &pl011_dev_pm_ops,
-		.of_match_table = of_match_ptr(sbsa_uart_of_match),
-		.acpi_match_table = ACPI_PTR(sbsa_uart_acpi_match),
+		.of_match_table = sbsa_uart_of_match,
+		.acpi_match_table = sbsa_uart_acpi_match,
 		.suppress_bind_attrs = IS_BUILTIN(CONFIG_SERIAL_AMBA_PL011),
 	},
 };
diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 8dcad52eedfd..285b0fe41a86 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -799,7 +799,7 @@ static struct platform_driver ma35d1serial_driver = {
 	.resume     = ma35d1serial_resume,
 	.driver     = {
 		.name   = "ma35d1-uart",
-		.of_match_table = of_match_ptr(ma35d1_serial_of_match),
+		.of_match_table = ma35d1_serial_of_match,
 	},
 };
 
diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index e12b1e96a53a..56c909abbd96 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1151,13 +1151,11 @@ static const struct of_device_id rt1318_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rt1318_of_match);
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1318_acpi_match[] = {
 	{ "10EC1318", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, rt1318_acpi_match);
-#endif
 
 static int rt1318_parse_dt(struct rt1318_priv *rt1318, struct device *dev)
 {
@@ -1340,8 +1338,8 @@ static int rt1318_i2c_probe(struct i2c_client *i2c)
 static struct i2c_driver rt1318_i2c_driver = {
 	.driver = {
 		.name = "rt1318",
-		.of_match_table = of_match_ptr(rt1318_of_match),
-		.acpi_match_table = ACPI_PTR(rt1318_acpi_match),
+		.of_match_table = rt1318_of_match,
+		.acpi_match_table = rt1318_acpi_match,
 	},
 	.probe = rt1318_i2c_probe,
 	.id_table = rt1318_i2c_id,

