Return-Path: <linux-i2c+bounces-7076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC13398936C
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 09:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85812858CE
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 07:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A71313959D;
	Sun, 29 Sep 2024 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QCmQJ0l/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8A2AEFE
	for <linux-i2c@vger.kernel.org>; Sun, 29 Sep 2024 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727594587; cv=none; b=tJFCXu1rIJ9PKUNG3GisKgRecFiH4MZn31XoXL8kEKEvD9vHGFqFIuie3Uis5whJFdUSiPRrg1uTgixV5dJCEelDIQ6B5Ij3nJK4tmQvE6qEL4awox0OXa86RJl7Ftdtg4QUVWcgn+Sc76kVuVBzFVlSItfyB76W9zH5MESayYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727594587; c=relaxed/simple;
	bh=gCMDe90fTU4V6+QVevw3QT3huZENda/Lp/NFae0HXfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ib81zvJVmuE0EcmSBrwRA0jKfrm412KsD2kjXvW9LnH4fZth15Wdn4wOALf0dnKrWfo2SqEuJ/dKW7CfWmbDA6Iu8Xbg6HA+N41hehLhzeyF+cTnwVfjEub31cPq4ZiA+NrpHGvFI09tvEh2fNc8omUwF2czP/2KLFsa+3TE1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QCmQJ0l/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so533912466b.0
        for <linux-i2c@vger.kernel.org>; Sun, 29 Sep 2024 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727594581; x=1728199381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Frcu8wGlzKi+ZM29jrRW0BEHqjCJtpk6W5bFi2Ivdd8=;
        b=QCmQJ0l/k+jU+4o0dnBjwOGM3PJEs1I+aDDYsY8bw2TE3bS3nOCJseXvrNv8hWLpS1
         tvAkkjNrBUZoSEXCY/1USaBgLjjvBt23Re9wPLrMOilTF5qQTcw0NUNABLjm75Mm55Sx
         P2Ncs9toXgmiKog16eu0RvT5uX3YGxjh2nYVydgN5qOQ8SFyx3ZBv7GhVuf2ogpqaS9O
         Ax2NCTv3AP23wBP7F74x0a4m45cT9rMwiMJwmioyX3DEQv54s317K+qCaeqZPiRU8ACA
         FW7MkOBnlV96HPjwsgQe0ySsOCdRu3CxHdCwPKckKA5Ky5B4mlJ3ZgH5JfQUac2Et0qI
         N/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727594581; x=1728199381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Frcu8wGlzKi+ZM29jrRW0BEHqjCJtpk6W5bFi2Ivdd8=;
        b=LHXAoygeo7cEmmSjI9DwcBQGrY0PePvVehC7k89ECPUr43KvMPPRM4TgF0A42c/pgS
         cHO9Ztejyl0aIUyRceli7ngPUANhX/1NwhoV6bAB7kkZE91u9vtbA1Bbu9oRiTFCWwyR
         2lGC7ozqGTo6p/9MQUq8KPySImf6Li16EfQ+9VJgo/ZArd7cAezL9PNF6prt6C19pAvT
         OIfRH13YUazL6bu+8JTvQK78+RzttrfDIHdV2IyWl9oWJSHb3isYk3zJKy46yw/2WwF/
         1FP6m07q34RMQhO2XTRBYblVN1oazy0+A8ht5mM9i4vYWD1vkjL2T4vRUz/ldBAhWE7B
         ojjg==
X-Gm-Message-State: AOJu0YyZvtcw3kRIA3Ml9sB6gyJ5q8KIxyZwS8gt5E2fC5SbhD1DiXBp
	RrSIFkD59BR353zLASLuzioS4filQvYctz2WPAeXdrCzgMiWhOpXFw23GbZBqew=
X-Google-Smtp-Source: AGHT+IGnLdH5nOBS4m4KrwJvLq2ySzH43KjMIudxy1CKiKBW1Bzq8akWm0YPmBStriJCcOeb1XX0nQ==
X-Received: by 2002:a17:907:26ca:b0:a8d:401b:db85 with SMTP id a640c23a62f3a-a93c492d789mr927621566b.36.1727594579985;
        Sun, 29 Sep 2024 00:22:59 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5002:d45:d639:beab])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882493b74sm2892743a12.79.2024.09.29.00.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 00:22:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: Switch back to struct platform_driver::remove()
Date: Sun, 29 Sep 2024 09:21:57 +0200
Message-ID: <fde732497283c2a4b079731a84be583eafcdc781.1727537108.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=50158; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gCMDe90fTU4V6+QVevw3QT3huZENda/Lp/NFae0HXfE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm+QAVPtJwAUF0ICcm579bS0jTqPsZ7QGdAQQGJ ldGRUd3J8+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZvkAFQAKCRCPgPtYfRL+ TnufCACP1Jj0TcyQeD/HentHMNCfp5xCqWFH2NRvAvQf18UMsHf+RcO2wUXhXnwiDhJDmE3+uzI HZZ7qUuH9N2RYNuNh6qztkTRCh0HLLAPOF0UcQsW2xobG3pkn2PZFrnw8uc3QNGsRMIVq6hoqEx Ko3B/JARgKy4pjNx7GRQMbl9ABZnh2L0Dcme8+3Lp886kz1g0a5i0gbe9FIP+1BRT8LCW0isxgL S/ERltzWgayM18jzHJSnARvgEb4wxXC5BHrfWahrhU/uIijdkCrr3PBRDDMHfqtebfeypwKDc90 X/hDfRe3Md4MhTuw3c6tA/hdgQQrxFz0WZ8bKZM+UsKA6X+F
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/i2c to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. Please tell and I will happily split it.

I based this on Fridays's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/i2c/busses/i2c-altera.c             | 2 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c       | 2 +-
 drivers/i2c/busses/i2c-aspeed.c             | 2 +-
 drivers/i2c/busses/i2c-at91-core.c          | 2 +-
 drivers/i2c/busses/i2c-au1550.c             | 2 +-
 drivers/i2c/busses/i2c-axxia.c              | 2 +-
 drivers/i2c/busses/i2c-bcm-iproc.c          | 2 +-
 drivers/i2c/busses/i2c-bcm-kona.c           | 2 +-
 drivers/i2c/busses/i2c-bcm2835.c            | 2 +-
 drivers/i2c/busses/i2c-brcmstb.c            | 2 +-
 drivers/i2c/busses/i2c-cadence.c            | 2 +-
 drivers/i2c/busses/i2c-cbus-gpio.c          | 2 +-
 drivers/i2c/busses/i2c-cht-wc.c             | 2 +-
 drivers/i2c/busses/i2c-cpm.c                | 2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     | 2 +-
 drivers/i2c/busses/i2c-davinci.c            | 2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 drivers/i2c/busses/i2c-digicolor.c          | 2 +-
 drivers/i2c/busses/i2c-dln2.c               | 2 +-
 drivers/i2c/busses/i2c-emev2.c              | 2 +-
 drivers/i2c/busses/i2c-exynos5.c            | 2 +-
 drivers/i2c/busses/i2c-gpio.c               | 2 +-
 drivers/i2c/busses/i2c-gxp.c                | 2 +-
 drivers/i2c/busses/i2c-highlander.c         | 2 +-
 drivers/i2c/busses/i2c-hix5hd2.c            | 2 +-
 drivers/i2c/busses/i2c-ibm_iic.c            | 2 +-
 drivers/i2c/busses/i2c-img-scb.c            | 2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c          | 2 +-
 drivers/i2c/busses/i2c-imx.c                | 2 +-
 drivers/i2c/busses/i2c-iop3xx.c             | 2 +-
 drivers/i2c/busses/i2c-jz4780.c             | 2 +-
 drivers/i2c/busses/i2c-kempld.c             | 2 +-
 drivers/i2c/busses/i2c-lpc2k.c              | 2 +-
 drivers/i2c/busses/i2c-meson.c              | 2 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c  | 2 +-
 drivers/i2c/busses/i2c-mlxbf.c              | 2 +-
 drivers/i2c/busses/i2c-mlxcpld.c            | 2 +-
 drivers/i2c/busses/i2c-mpc.c                | 2 +-
 drivers/i2c/busses/i2c-mt65xx.c             | 2 +-
 drivers/i2c/busses/i2c-mt7621.c             | 2 +-
 drivers/i2c/busses/i2c-mv64xxx.c            | 2 +-
 drivers/i2c/busses/i2c-mxs.c                | 2 +-
 drivers/i2c/busses/i2c-npcm7xx.c            | 2 +-
 drivers/i2c/busses/i2c-ocores.c             | 2 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c     | 2 +-
 drivers/i2c/busses/i2c-omap.c               | 2 +-
 drivers/i2c/busses/i2c-opal.c               | 2 +-
 drivers/i2c/busses/i2c-pasemi-platform.c    | 2 +-
 drivers/i2c/busses/i2c-pca-platform.c       | 2 +-
 drivers/i2c/busses/i2c-pnx.c                | 2 +-
 drivers/i2c/busses/i2c-powermac.c           | 2 +-
 drivers/i2c/busses/i2c-pxa.c                | 2 +-
 drivers/i2c/busses/i2c-qcom-cci.c           | 2 +-
 drivers/i2c/busses/i2c-qcom-geni.c          | 2 +-
 drivers/i2c/busses/i2c-qup.c                | 2 +-
 drivers/i2c/busses/i2c-rcar.c               | 2 +-
 drivers/i2c/busses/i2c-riic.c               | 2 +-
 drivers/i2c/busses/i2c-rk3x.c               | 2 +-
 drivers/i2c/busses/i2c-rzv2m.c              | 2 +-
 drivers/i2c/busses/i2c-s3c2410.c            | 2 +-
 drivers/i2c/busses/i2c-scmi.c               | 2 +-
 drivers/i2c/busses/i2c-sh7760.c             | 2 +-
 drivers/i2c/busses/i2c-sh_mobile.c          | 2 +-
 drivers/i2c/busses/i2c-simtec.c             | 2 +-
 drivers/i2c/busses/i2c-sprd.c               | 2 +-
 drivers/i2c/busses/i2c-st.c                 | 2 +-
 drivers/i2c/busses/i2c-stm32f4.c            | 2 +-
 drivers/i2c/busses/i2c-stm32f7.c            | 2 +-
 drivers/i2c/busses/i2c-sun6i-p2wi.c         | 2 +-
 drivers/i2c/busses/i2c-synquacer.c          | 2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c         | 2 +-
 drivers/i2c/busses/i2c-tegra.c              | 2 +-
 drivers/i2c/busses/i2c-uniphier-f.c         | 2 +-
 drivers/i2c/busses/i2c-uniphier.c           | 2 +-
 drivers/i2c/busses/i2c-versatile.c          | 2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c         | 2 +-
 drivers/i2c/busses/i2c-viperboard.c         | 2 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c      | 2 +-
 drivers/i2c/busses/i2c-xiic.c               | 2 +-
 drivers/i2c/busses/i2c-xlp9xx.c             | 2 +-
 drivers/i2c/busses/scx200_acb.c             | 2 +-
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c  | 2 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c       | 2 +-
 drivers/i2c/muxes/i2c-mux-gpio.c            | 2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c           | 2 +-
 drivers/i2c/muxes/i2c-mux-mlxcpld.c         | 2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c         | 2 +-
 drivers/i2c/muxes/i2c-mux-reg.c             | 2 +-
 88 files changed, 88 insertions(+), 88 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index f4dde08a3b92..2da73173ce24 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -482,7 +482,7 @@ MODULE_DEVICE_TABLE(of, altr_i2c_of_match);
 
 static struct platform_driver altr_i2c_driver = {
 	.probe = altr_i2c_probe,
-	.remove_new = altr_i2c_remove,
+	.remove = altr_i2c_remove,
 	.driver = {
 		.name = "altera-i2c",
 		.of_match_table = altr_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 6f0ef587e76d..d9dd0e475d1a 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -346,7 +346,7 @@ MODULE_DEVICE_TABLE(acpi, i2c_amd_acpi_match);
 
 static struct platform_driver i2c_amd_plat_driver = {
 	.probe = i2c_amd_probe,
-	.remove_new = i2c_amd_remove,
+	.remove = i2c_amd_remove,
 	.driver = {
 		.name = "i2c_amd_mp2",
 		.acpi_match_table = ACPI_PTR(i2c_amd_acpi_match),
diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index cc5a26637fd5..1550d3d552ae 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1102,7 +1102,7 @@ static void aspeed_i2c_remove_bus(struct platform_device *pdev)
 
 static struct platform_driver aspeed_i2c_bus_driver = {
 	.probe		= aspeed_i2c_probe_bus,
-	.remove_new	= aspeed_i2c_remove_bus,
+	.remove		= aspeed_i2c_remove_bus,
 	.driver		= {
 		.name		= "aspeed-i2c-bus",
 		.of_match_table	= aspeed_i2c_bus_of_table,
diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index dc52b3530725..edc047e3e535 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -330,7 +330,7 @@ static const struct dev_pm_ops __maybe_unused at91_twi_pm = {
 
 static struct platform_driver at91_twi_driver = {
 	.probe		= at91_twi_probe,
-	.remove_new	= at91_twi_remove,
+	.remove		= at91_twi_remove,
 	.id_table	= at91_twi_devtypes,
 	.driver		= {
 		.name	= "at91_i2c",
diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index 902e420e761e..b78b38ddac46 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -368,7 +368,7 @@ static struct platform_driver au1xpsc_smbus_driver = {
 		.pm	= pm_sleep_ptr(&i2c_au1550_pmops),
 	},
 	.probe		= i2c_au1550_probe,
-	.remove_new	= i2c_au1550_remove,
+	.remove		= i2c_au1550_remove,
 };
 
 module_platform_driver(au1xpsc_smbus_driver);
diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index a66f7f67b3b8..48916cf45ff7 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -824,7 +824,7 @@ MODULE_DEVICE_TABLE(of, axxia_i2c_of_match);
 
 static struct platform_driver axxia_i2c_driver = {
 	.probe = axxia_i2c_probe,
-	.remove_new = axxia_i2c_remove,
+	.remove = axxia_i2c_remove,
 	.driver = {
 		.name = "axxia-i2c",
 		.of_match_table = axxia_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 133d02899c6b..15b632a146e1 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1264,7 +1264,7 @@ static struct platform_driver bcm_iproc_i2c_driver = {
 		.pm = pm_sleep_ptr(&bcm_iproc_i2c_pm_ops),
 	},
 	.probe = bcm_iproc_i2c_probe,
-	.remove_new = bcm_iproc_i2c_remove,
+	.remove = bcm_iproc_i2c_remove,
 };
 module_platform_driver(bcm_iproc_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index eb5c46a8f824..340fe1305dd9 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -877,7 +877,7 @@ static struct platform_driver bcm_kona_i2c_driver = {
 		   .of_match_table = bcm_kona_i2c_of_match,
 		   },
 	.probe = bcm_kona_i2c_probe,
-	.remove_new = bcm_kona_i2c_remove,
+	.remove = bcm_kona_i2c_remove,
 };
 module_platform_driver(bcm_kona_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index ae42e37052a8..8554e790f8e3 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -520,7 +520,7 @@ MODULE_DEVICE_TABLE(of, bcm2835_i2c_of_match);
 
 static struct platform_driver bcm2835_i2c_driver = {
 	.probe		= bcm2835_i2c_probe,
-	.remove_new	= bcm2835_i2c_remove,
+	.remove		= bcm2835_i2c_remove,
 	.driver		= {
 		.name	= "i2c-bcm2835",
 		.of_match_table = bcm2835_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 83b85011e377..00f1a046e985 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -744,7 +744,7 @@ static struct platform_driver brcmstb_i2c_driver = {
 		   .pm = pm_sleep_ptr(&brcmstb_i2c_pm),
 		   },
 	.probe = brcmstb_i2c_probe,
-	.remove_new = brcmstb_i2c_remove,
+	.remove = brcmstb_i2c_remove,
 };
 module_platform_driver(brcmstb_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index ee2f32cd54ce..b64026fbca66 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1652,7 +1652,7 @@ static struct platform_driver cdns_i2c_drv = {
 		.pm = &cdns_i2c_dev_pm_ops,
 	},
 	.probe  = cdns_i2c_probe,
-	.remove_new = cdns_i2c_remove,
+	.remove = cdns_i2c_remove,
 };
 
 module_platform_driver(cdns_i2c_drv);
diff --git a/drivers/i2c/busses/i2c-cbus-gpio.c b/drivers/i2c/busses/i2c-cbus-gpio.c
index fdc1758a3275..8065c7e4462e 100644
--- a/drivers/i2c/busses/i2c-cbus-gpio.c
+++ b/drivers/i2c/busses/i2c-cbus-gpio.c
@@ -264,7 +264,7 @@ MODULE_DEVICE_TABLE(of, i2c_cbus_dt_ids);
 
 static struct platform_driver cbus_i2c_driver = {
 	.probe	= cbus_i2c_probe,
-	.remove_new = cbus_i2c_remove,
+	.remove = cbus_i2c_remove,
 	.driver	= {
 		.name	= "i2c-cbus-gpio",
 		.of_match_table = of_match_ptr(i2c_cbus_dt_ids),
diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 52e3000626c5..26a36a65521e 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -546,7 +546,7 @@ MODULE_DEVICE_TABLE(platform, cht_wc_i2c_adap_id_table);
 
 static struct platform_driver cht_wc_i2c_adap_driver = {
 	.probe = cht_wc_i2c_adap_i2c_probe,
-	.remove_new = cht_wc_i2c_adap_i2c_remove,
+	.remove = cht_wc_i2c_adap_i2c_remove,
 	.driver = {
 		.name = "cht_wcove_ext_chgr",
 	},
diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4794ec066eb0..260e1643c2cc 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -701,7 +701,7 @@ MODULE_DEVICE_TABLE(of, cpm_i2c_match);
 
 static struct platform_driver cpm_i2c_driver = {
 	.probe		= cpm_i2c_probe,
-	.remove_new	= cpm_i2c_remove,
+	.remove		= cpm_i2c_remove,
 	.driver = {
 		.name = "fsl-i2c-cpm",
 		.of_match_table = cpm_i2c_match,
diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
index ab2688bd4d33..43bf90d90eeb 100644
--- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
+++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
@@ -304,7 +304,7 @@ MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
 
 static struct platform_driver ec_i2c_tunnel_driver = {
 	.probe = ec_i2c_probe,
-	.remove_new = ec_i2c_remove,
+	.remove = ec_i2c_remove,
 	.driver = {
 		.name = "cros-ec-i2c-tunnel",
 		.acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index c4fb5e9ab506..71dc0a6688b7 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -935,7 +935,7 @@ MODULE_DEVICE_TABLE(platform, davinci_i2c_driver_ids);
 
 static struct platform_driver davinci_i2c_driver = {
 	.probe		= davinci_i2c_probe,
-	.remove_new	= davinci_i2c_remove,
+	.remove		= davinci_i2c_remove,
 	.id_table	= davinci_i2c_driver_ids,
 	.driver		= {
 		.name	= "i2c_davinci",
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index b44c5d1a6748..f722ffc13c22 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -370,7 +370,7 @@ MODULE_DEVICE_TABLE(platform, dw_i2c_platform_ids);
 
 static struct platform_driver dw_i2c_driver = {
 	.probe = dw_i2c_plat_probe,
-	.remove_new = dw_i2c_plat_remove,
+	.remove = dw_i2c_plat_remove,
 	.driver		= {
 		.name	= "i2c_designware",
 		.of_match_table = dw_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 3dc5a46698fc..38d7f31aee79 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -363,7 +363,7 @@ MODULE_DEVICE_TABLE(of, dc_i2c_match);
 
 static struct platform_driver dc_i2c_driver = {
 	.probe   = dc_i2c_probe,
-	.remove_new = dc_i2c_remove,
+	.remove = dc_i2c_remove,
 	.driver  = {
 		.name  = "digicolor-i2c",
 		.of_match_table = dc_i2c_match,
diff --git a/drivers/i2c/busses/i2c-dln2.c b/drivers/i2c/busses/i2c-dln2.c
index 11ed055143d3..bde2ef098862 100644
--- a/drivers/i2c/busses/i2c-dln2.c
+++ b/drivers/i2c/busses/i2c-dln2.c
@@ -245,7 +245,7 @@ static void dln2_i2c_remove(struct platform_device *pdev)
 static struct platform_driver dln2_i2c_driver = {
 	.driver.name	= "dln2-i2c",
 	.probe		= dln2_i2c_probe,
-	.remove_new	= dln2_i2c_remove,
+	.remove		= dln2_i2c_remove,
 };
 
 module_platform_driver(dln2_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index d08be3f3cede..2512cef8e2a2 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -425,7 +425,7 @@ static const struct of_device_id em_i2c_ids[] = {
 
 static struct platform_driver em_i2c_driver = {
 	.probe = em_i2c_probe,
-	.remove_new = em_i2c_remove,
+	.remove = em_i2c_remove,
 	.driver = {
 		.name = "em-i2c",
 		.of_match_table = em_i2c_ids,
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index d8baca9b610c..e330015087ab 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -1009,7 +1009,7 @@ static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
 
 static struct platform_driver exynos5_i2c_driver = {
 	.probe		= exynos5_i2c_probe,
-	.remove_new	= exynos5_i2c_remove,
+	.remove		= exynos5_i2c_remove,
 	.driver		= {
 		.name	= "exynos5-hsi2c",
 		.pm	= pm_sleep_ptr(&exynos5_i2c_dev_pm_ops),
diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index e0bd218e2f14..f4355b17bfbf 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -481,7 +481,7 @@ static struct platform_driver i2c_gpio_driver = {
 		.acpi_match_table = i2c_gpio_acpi_match,
 	},
 	.probe		= i2c_gpio_probe,
-	.remove_new	= i2c_gpio_remove,
+	.remove		= i2c_gpio_remove,
 };
 
 static int __init i2c_gpio_init(void)
diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index efafc0528c44..0fc39caa6c87 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -595,7 +595,7 @@ MODULE_DEVICE_TABLE(of, gxp_i2c_of_match);
 
 static struct platform_driver gxp_i2c_driver = {
 	.probe	= gxp_i2c_probe,
-	.remove_new = gxp_i2c_remove,
+	.remove = gxp_i2c_remove,
 	.driver = {
 		.name = "gxp-i2c",
 		.of_match_table = gxp_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index ec1ebacb9aa8..78c5845e0877 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -454,7 +454,7 @@ static struct platform_driver highlander_i2c_driver = {
 	},
 
 	.probe		= highlander_i2c_probe,
-	.remove_new	= highlander_i2c_remove,
+	.remove		= highlander_i2c_remove,
 };
 
 module_platform_driver(highlander_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 64cade6ba923..370f32974763 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -508,7 +508,7 @@ MODULE_DEVICE_TABLE(of, hix5hd2_i2c_match);
 
 static struct platform_driver hix5hd2_i2c_driver = {
 	.probe		= hix5hd2_i2c_probe,
-	.remove_new	= hix5hd2_i2c_remove,
+	.remove		= hix5hd2_i2c_remove,
 	.driver		= {
 		.name	= "hix5hd2-i2c",
 		.pm	= pm_ptr(&hix5hd2_i2c_pm_ops),
diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 82dedb1bb5be..c76c4116ddc7 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -790,7 +790,7 @@ static struct platform_driver ibm_iic_driver = {
 		.of_match_table = ibm_iic_match,
 	},
 	.probe	= iic_probe,
-	.remove_new = iic_remove,
+	.remove = iic_remove,
 };
 
 module_platform_driver(ibm_iic_driver);
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index e0e87185f6bb..02f75cf310aa 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1497,7 +1497,7 @@ static struct platform_driver img_scb_i2c_driver = {
 		.pm		= pm_ptr(&img_i2c_pm),
 	},
 	.probe = img_i2c_probe,
-	.remove_new = img_i2c_remove,
+	.remove = img_i2c_remove,
 };
 module_platform_driver(img_scb_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 976d43f73f38..8adf2963d764 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -703,7 +703,7 @@ static const struct dev_pm_ops lpi2c_pm_ops = {
 
 static struct platform_driver lpi2c_imx_driver = {
 	.probe = lpi2c_imx_probe,
-	.remove_new = lpi2c_imx_remove,
+	.remove = lpi2c_imx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = lpi2c_imx_of_match,
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 98539313cbc9..c2358356a8ff 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1576,7 +1576,7 @@ static const struct dev_pm_ops i2c_imx_pm_ops = {
 
 static struct platform_driver i2c_imx_driver = {
 	.probe = i2c_imx_probe,
-	.remove_new = i2c_imx_remove,
+	.remove = i2c_imx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.pm = pm_ptr(&i2c_imx_pm_ops),
diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index 859c14e340e7..ce5ca5b90b39 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -524,7 +524,7 @@ MODULE_DEVICE_TABLE(of, i2c_iop3xx_match);
 
 static struct platform_driver iop3xx_i2c_driver = {
 	.probe		= iop3xx_i2c_probe,
-	.remove_new	= iop3xx_i2c_remove,
+	.remove		= iop3xx_i2c_remove,
 	.driver		= {
 		.name	= "IOP3xx-I2C",
 		.of_match_table = i2c_iop3xx_match,
diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 92cc5b091137..664a5471d933 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -847,7 +847,7 @@ static void jz4780_i2c_remove(struct platform_device *pdev)
 
 static struct platform_driver jz4780_i2c_driver = {
 	.probe		= jz4780_i2c_probe,
-	.remove_new	= jz4780_i2c_remove,
+	.remove		= jz4780_i2c_remove,
 	.driver		= {
 		.name	= "jz4780-i2c",
 		.of_match_table = jz4780_i2c_of_matches,
diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index eb66942e0b7d..212196af68ba 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -385,7 +385,7 @@ static struct platform_driver kempld_i2c_driver = {
 		.pm = pm_sleep_ptr(&kempld_i2c_pm_ops),
 	},
 	.probe		= kempld_i2c_probe,
-	.remove_new	= kempld_i2c_remove,
+	.remove		= kempld_i2c_remove,
 };
 
 module_platform_driver(kempld_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 9fb33cbf7419..6943a0de860a 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -462,7 +462,7 @@ MODULE_DEVICE_TABLE(of, lpc2k_i2c_match);
 
 static struct platform_driver i2c_lpc2k_driver = {
 	.probe	= i2c_lpc2k_probe,
-	.remove_new = i2c_lpc2k_remove,
+	.remove = i2c_lpc2k_remove,
 	.driver	= {
 		.name		= "lpc2k-i2c",
 		.pm		= pm_sleep_ptr(&i2c_lpc2k_dev_pm_ops),
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c7b203cc4434..e1d69537353b 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -565,7 +565,7 @@ MODULE_DEVICE_TABLE(of, meson_i2c_match);
 
 static struct platform_driver meson_i2c_driver = {
 	.probe   = meson_i2c_probe,
-	.remove_new = meson_i2c_remove,
+	.remove = meson_i2c_remove,
 	.driver  = {
 		.name  = "meson-i2c",
 		.of_match_table = meson_i2c_match,
diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 0b0a1c4d17ca..d1543e7d8380 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -462,7 +462,7 @@ MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
 
 static struct platform_driver mchp_corei2c_driver = {
 	.probe = mchp_corei2c_probe,
-	.remove_new = mchp_corei2c_remove,
+	.remove = mchp_corei2c_remove,
 	.driver = {
 		.name = "microchip-corei2c",
 		.of_match_table = mchp_corei2c_of_match,
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index b3a73921ab69..21f67f3b65b6 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2456,7 +2456,7 @@ static void mlxbf_i2c_remove(struct platform_device *pdev)
 
 static struct platform_driver mlxbf_i2c_driver = {
 	.probe = mlxbf_i2c_probe,
-	.remove_new = mlxbf_i2c_remove,
+	.remove = mlxbf_i2c_remove,
 	.driver = {
 		.name = "i2c-mlxbf",
 		.acpi_match_table = ACPI_PTR(mlxbf_i2c_acpi_ids),
diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 8223f6d29eb3..07d3cadbf510 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -591,7 +591,7 @@ static void mlxcpld_i2c_remove(struct platform_device *pdev)
 
 static struct platform_driver mlxcpld_i2c_driver = {
 	.probe		= mlxcpld_i2c_probe,
-	.remove_new	= mlxcpld_i2c_remove,
+	.remove		= mlxcpld_i2c_remove,
 	.driver = {
 		.name = MLXCPLD_I2C_DEVICE_NAME,
 	},
diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 236d6b8ba867..28c5c5c1fb7a 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -938,7 +938,7 @@ MODULE_DEVICE_TABLE(of, mpc_i2c_of_match);
 /* Structure for a device driver */
 static struct platform_driver mpc_i2c_driver = {
 	.probe		= fsl_i2c_probe,
-	.remove_new	= fsl_i2c_remove,
+	.remove		= fsl_i2c_remove,
 	.driver = {
 		.name = "mpc-i2c",
 		.of_match_table = mpc_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e0ba653dec2d..5bd342047d59 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1550,7 +1550,7 @@ static const struct dev_pm_ops mtk_i2c_pm = {
 
 static struct platform_driver mtk_i2c_driver = {
 	.probe = mtk_i2c_probe,
-	.remove_new = mtk_i2c_remove,
+	.remove = mtk_i2c_remove,
 	.driver = {
 		.name = I2C_DRV_NAME,
 		.pm = pm_sleep_ptr(&mtk_i2c_pm),
diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 23d417ff5e71..2103f21f9ddd 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -331,7 +331,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 
 static struct platform_driver mtk_i2c_driver = {
 	.probe		= mtk_i2c_probe,
-	.remove_new	= mtk_i2c_remove,
+	.remove		= mtk_i2c_remove,
 	.driver		= {
 		.name	= "i2c-mt7621",
 		.of_match_table = i2c_mtk_dt_ids,
diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 29f94efedf60..874309580c33 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -1104,7 +1104,7 @@ static const struct dev_pm_ops mv64xxx_i2c_pm_ops = {
 
 static struct platform_driver mv64xxx_i2c_driver = {
 	.probe	= mv64xxx_i2c_probe,
-	.remove_new = mv64xxx_i2c_remove,
+	.remove = mv64xxx_i2c_remove,
 	.driver	= {
 		.name	= MV64XXX_I2C_CTLR_NAME,
 		.pm     = &mv64xxx_i2c_pm_ops,
diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 36def0a9c95c..ad62d56b2186 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -881,7 +881,7 @@ static struct platform_driver mxs_i2c_driver = {
 		   .of_match_table = mxs_i2c_dt_ids,
 		   },
 	.probe = mxs_i2c_probe,
-	.remove_new = mxs_i2c_remove,
+	.remove = mxs_i2c_remove,
 };
 
 static int __init mxs_i2c_init(void)
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbcb4d6668ce..44f078d372d3 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2363,7 +2363,7 @@ MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
 
 static struct platform_driver npcm_i2c_bus_driver = {
 	.probe = npcm_i2c_probe_bus,
-	.remove_new = npcm_i2c_remove_bus,
+	.remove = npcm_i2c_remove_bus,
 	.driver = {
 		.name = "nuvoton-i2c",
 		.of_match_table = npcm_i2c_bus_of_table,
diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 482b37c8a129..0f67e57cdeff 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -769,7 +769,7 @@ static DEFINE_NOIRQ_DEV_PM_OPS(ocores_i2c_pm,
 
 static struct platform_driver ocores_i2c_driver = {
 	.probe   = ocores_i2c_probe,
-	.remove_new = ocores_i2c_remove,
+	.remove = ocores_i2c_remove,
 	.driver  = {
 		.name = "ocores-i2c",
 		.of_match_table = ocores_i2c_match,
diff --git a/drivers/i2c/busses/i2c-octeon-platdrv.c b/drivers/i2c/busses/i2c-octeon-platdrv.c
index dc6dff95c68c..edfca7b20f29 100644
--- a/drivers/i2c/busses/i2c-octeon-platdrv.c
+++ b/drivers/i2c/busses/i2c-octeon-platdrv.c
@@ -269,7 +269,7 @@ MODULE_DEVICE_TABLE(of, octeon_i2c_match);
 
 static struct platform_driver octeon_i2c_driver = {
 	.probe		= octeon_i2c_probe,
-	.remove_new	= octeon_i2c_remove,
+	.remove		= octeon_i2c_remove,
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table = octeon_i2c_match,
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 1d9ad25c89ae..92faf03d64cf 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1605,7 +1605,7 @@ static const struct dev_pm_ops omap_i2c_pm_ops = {
 
 static struct platform_driver omap_i2c_driver = {
 	.probe		= omap_i2c_probe,
-	.remove_new	= omap_i2c_remove,
+	.remove		= omap_i2c_remove,
 	.driver		= {
 		.name	= "omap_i2c",
 		.pm	= pm_ptr(&omap_i2c_pm_ops),
diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index d9dd71cf37fd..c9b62892397a 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -249,7 +249,7 @@ MODULE_DEVICE_TABLE(of, i2c_opal_of_match);
 
 static struct platform_driver i2c_opal_driver = {
 	.probe	= i2c_opal_probe,
-	.remove_new = i2c_opal_remove,
+	.remove = i2c_opal_remove,
 	.driver	= {
 		.name		= "i2c-opal",
 		.of_match_table	= i2c_opal_of_match,
diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
index 5fbfb9b41744..a486a37d3863 100644
--- a/drivers/i2c/busses/i2c-pasemi-platform.c
+++ b/drivers/i2c/busses/i2c-pasemi-platform.c
@@ -104,7 +104,7 @@ static struct platform_driver pasemi_platform_i2c_driver = {
 		.of_match_table		= pasemi_platform_i2c_of_match,
 	},
 	.probe	= pasemi_platform_i2c_probe,
-	.remove_new = pasemi_platform_i2c_remove,
+	.remove = pasemi_platform_i2c_remove,
 };
 module_platform_driver(pasemi_platform_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index b8d5480c54f6..87da8241b927 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -238,7 +238,7 @@ MODULE_DEVICE_TABLE(of, i2c_pca_of_match_table);
 
 static struct platform_driver i2c_pca_pf_driver = {
 	.probe = i2c_pca_pf_probe,
-	.remove_new = i2c_pca_pf_remove,
+	.remove = i2c_pca_pf_remove,
 	.driver = {
 		.name = "i2c-pca-platform",
 		.of_match_table = of_match_ptr(i2c_pca_of_match_table),
diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 1dafadda73af..d4d139b97513 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -733,7 +733,7 @@ static struct platform_driver i2c_pnx_driver = {
 		.pm = pm_sleep_ptr(&i2c_pnx_pm),
 	},
 	.probe = i2c_pnx_probe,
-	.remove_new = i2c_pnx_remove,
+	.remove = i2c_pnx_remove,
 };
 
 static int __init i2c_adap_pnx_init(void)
diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index b6b03539f626..9a867c817db0 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -437,7 +437,7 @@ static int i2c_powermac_probe(struct platform_device *dev)
 
 static struct platform_driver i2c_powermac_driver = {
 	.probe = i2c_powermac_probe,
-	.remove_new = i2c_powermac_remove,
+	.remove = i2c_powermac_remove,
 	.driver = {
 		.name = "i2c-powermac",
 		.bus = &platform_bus_type,
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..cb6988482673 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1574,7 +1574,7 @@ static const struct dev_pm_ops i2c_pxa_dev_pm_ops = {
 
 static struct platform_driver i2c_pxa_driver = {
 	.probe		= i2c_pxa_probe,
-	.remove_new	= i2c_pxa_remove,
+	.remove		= i2c_pxa_remove,
 	.driver		= {
 		.name	= "pxa2xx-i2c",
 		.pm	= pm_sleep_ptr(&i2c_pxa_dev_pm_ops),
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f..4f510ac33527 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -826,7 +826,7 @@ MODULE_DEVICE_TABLE(of, cci_dt_match);
 
 static struct platform_driver qcom_cci_driver = {
 	.probe  = cci_probe,
-	.remove_new = cci_remove,
+	.remove = cci_remove,
 	.driver = {
 		.name = "i2c-qcom-cci",
 		.of_match_table = cci_dt_match,
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..9fdbe771cfc9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1049,7 +1049,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
-	.remove_new = geni_i2c_remove,
+	.remove = geni_i2c_remove,
 	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index d480162a4d39..86ec391616b0 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1974,7 +1974,7 @@ MODULE_DEVICE_TABLE(of, qup_i2c_dt_match);
 
 static struct platform_driver qup_i2c_driver = {
 	.probe  = qup_i2c_probe,
-	.remove_new = qup_i2c_remove,
+	.remove = qup_i2c_remove,
 	.driver = {
 		.name = "i2c_qup",
 		.pm = pm_ptr(&qup_i2c_qup_pm_ops),
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 9267df38c2d0..a7b77d14ee86 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1271,7 +1271,7 @@ static struct platform_driver rcar_i2c_driver = {
 		.pm	= pm_sleep_ptr(&rcar_i2c_pm_ops),
 	},
 	.probe		= rcar_i2c_probe,
-	.remove_new	= rcar_i2c_remove,
+	.remove		= rcar_i2c_remove,
 };
 
 module_platform_driver(rcar_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c7f3a4c02470..c218f73c3650 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -632,7 +632,7 @@ static const struct of_device_id riic_i2c_dt_ids[] = {
 
 static struct platform_driver riic_i2c_driver = {
 	.probe		= riic_i2c_probe,
-	.remove_new	= riic_i2c_remove,
+	.remove		= riic_i2c_remove,
 	.driver		= {
 		.name	= "i2c-riic",
 		.of_match_table = riic_i2c_dt_ids,
diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 4ef9bad77b85..d4e9196445c0 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1398,7 +1398,7 @@ static SIMPLE_DEV_PM_OPS(rk3x_i2c_pm_ops, NULL, rk3x_i2c_resume);
 
 static struct platform_driver rk3x_i2c_driver = {
 	.probe   = rk3x_i2c_probe,
-	.remove_new = rk3x_i2c_remove,
+	.remove = rk3x_i2c_remove,
 	.driver  = {
 		.name  = "rk3x-i2c",
 		.of_match_table = rk3x_i2c_match,
diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 8380a68538ab..02b76e24a476 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -536,7 +536,7 @@ static struct platform_driver rzv2m_i2c_driver = {
 		.pm = pm_sleep_ptr(&rzv2m_i2c_pm_ops),
 	},
 	.probe	= rzv2m_i2c_probe,
-	.remove_new = rzv2m_i2c_remove,
+	.remove = rzv2m_i2c_remove,
 };
 module_platform_driver(rzv2m_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 7698d9d59744..0f3cf500df68 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1176,7 +1176,7 @@ static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
 
 static struct platform_driver s3c24xx_i2c_driver = {
 	.probe		= s3c24xx_i2c_probe,
-	.remove_new	= s3c24xx_i2c_remove,
+	.remove		= s3c24xx_i2c_remove,
 	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
 		.name	= "s3c-i2c",
diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index d7af8e0d7599..10a5146b3aa5 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -411,7 +411,7 @@ static void smbus_cmi_remove(struct platform_device *device)
 
 static struct platform_driver smbus_cmi_driver = {
 	.probe = smbus_cmi_probe,
-	.remove_new = smbus_cmi_remove,
+	.remove = smbus_cmi_remove,
 	.driver = {
 		.name   = "smbus_cmi",
 		.acpi_match_table = acpi_smbus_cmi_ids,
diff --git a/drivers/i2c/busses/i2c-sh7760.c b/drivers/i2c/busses/i2c-sh7760.c
index 8a043f5fca1e..620f12596763 100644
--- a/drivers/i2c/busses/i2c-sh7760.c
+++ b/drivers/i2c/busses/i2c-sh7760.c
@@ -552,7 +552,7 @@ static struct platform_driver sh7760_i2c_drv = {
 		.name	= SH7760_I2C_DEVNAME,
 	},
 	.probe		= sh7760_i2c_probe,
-	.remove_new	= sh7760_i2c_remove,
+	.remove		= sh7760_i2c_remove,
 };
 
 module_platform_driver(sh7760_i2c_drv);
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index f86c29737df1..efe29621b8d7 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -983,7 +983,7 @@ static struct platform_driver sh_mobile_i2c_driver = {
 		.pm	= pm_sleep_ptr(&sh_mobile_i2c_pm_ops),
 	},
 	.probe		= sh_mobile_i2c_probe,
-	.remove_new	= sh_mobile_i2c_remove,
+	.remove		= sh_mobile_i2c_remove,
 };
 
 static int __init sh_mobile_i2c_adap_init(void)
diff --git a/drivers/i2c/busses/i2c-simtec.c b/drivers/i2c/busses/i2c-simtec.c
index 18516bc64e04..d90606048611 100644
--- a/drivers/i2c/busses/i2c-simtec.c
+++ b/drivers/i2c/busses/i2c-simtec.c
@@ -144,7 +144,7 @@ static struct platform_driver simtec_i2c_driver = {
 		.name		= "simtec-i2c",
 	},
 	.probe		= simtec_i2c_probe,
-	.remove_new	= simtec_i2c_remove,
+	.remove		= simtec_i2c_remove,
 };
 
 module_platform_driver(simtec_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 9c45e75b9187..56b2e5c5fb49 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -643,7 +643,7 @@ MODULE_DEVICE_TABLE(of, sprd_i2c_of_match);
 
 static struct platform_driver sprd_i2c_driver = {
 	.probe = sprd_i2c_probe,
-	.remove_new = sprd_i2c_remove,
+	.remove = sprd_i2c_remove,
 	.driver = {
 		   .name = "sprd-i2c",
 		   .of_match_table = sprd_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 05b19ede65a0..750fff3d2389 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -893,7 +893,7 @@ static struct platform_driver st_i2c_driver = {
 		.pm = pm_sleep_ptr(&st_i2c_pm),
 	},
 	.probe = st_i2c_probe,
-	.remove_new = st_i2c_remove,
+	.remove = st_i2c_remove,
 };
 
 module_platform_driver(st_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 230fff0c0bf9..b3d56d0aa9d0 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -869,7 +869,7 @@ static struct platform_driver stm32f4_i2c_driver = {
 		.of_match_table = stm32f4_i2c_match,
 	},
 	.probe = stm32f4_i2c_probe,
-	.remove_new = stm32f4_i2c_remove,
+	.remove = stm32f4_i2c_remove,
 };
 
 module_platform_driver(stm32f4_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index cfee2d9c09de..805075cdf9c2 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2532,7 +2532,7 @@ static struct platform_driver stm32f7_i2c_driver = {
 		.pm = &stm32f7_i2c_pm_ops,
 	},
 	.probe = stm32f7_i2c_probe,
-	.remove_new = stm32f7_i2c_remove,
+	.remove = stm32f7_i2c_remove,
 };
 
 module_platform_driver(stm32f7_i2c_driver);
diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 074eade6c4a4..fb5280b8cf7f 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -319,7 +319,7 @@ static void p2wi_remove(struct platform_device *dev)
 
 static struct platform_driver p2wi_driver = {
 	.probe	= p2wi_probe,
-	.remove_new = p2wi_remove,
+	.remove = p2wi_remove,
 	.driver	= {
 		.name = "i2c-sunxi-p2wi",
 		.of_match_table = p2wi_of_match_table,
diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index bbb9062669e4..31f8d08e32a4 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -629,7 +629,7 @@ MODULE_DEVICE_TABLE(acpi, synquacer_i2c_acpi_ids);
 
 static struct platform_driver synquacer_i2c_driver = {
 	.probe	= synquacer_i2c_probe,
-	.remove_new = synquacer_i2c_remove,
+	.remove = synquacer_i2c_remove,
 	.driver	= {
 		.name = "synquacer_i2c",
 		.of_match_table = of_match_ptr(synquacer_i2c_dt_ids),
diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index dabadbcc6d6a..bb0de6db6391 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -335,7 +335,7 @@ static struct platform_driver tegra_bpmp_i2c_driver = {
 		.of_match_table = tegra_bpmp_i2c_of_match,
 	},
 	.probe = tegra_bpmp_i2c_probe,
-	.remove_new = tegra_bpmp_i2c_remove,
+	.remove = tegra_bpmp_i2c_remove,
 };
 module_platform_driver(tegra_bpmp_i2c_driver);
 
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1df5b4204142..87976e99e6d0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1964,7 +1964,7 @@ MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
 
 static struct platform_driver tegra_i2c_driver = {
 	.probe = tegra_i2c_probe,
-	.remove_new = tegra_i2c_remove,
+	.remove = tegra_i2c_remove,
 	.driver = {
 		.name = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 10a99cd08972..d877f5a1f579 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -615,7 +615,7 @@ MODULE_DEVICE_TABLE(of, uniphier_fi2c_match);
 
 static struct platform_driver uniphier_fi2c_drv = {
 	.probe  = uniphier_fi2c_probe,
-	.remove_new = uniphier_fi2c_remove,
+	.remove = uniphier_fi2c_remove,
 	.driver = {
 		.name  = "uniphier-fi2c",
 		.of_match_table = uniphier_fi2c_match,
diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index ef5753307469..b95d50d4d7db 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -409,7 +409,7 @@ MODULE_DEVICE_TABLE(of, uniphier_i2c_match);
 
 static struct platform_driver uniphier_i2c_drv = {
 	.probe  = uniphier_i2c_probe,
-	.remove_new = uniphier_i2c_remove,
+	.remove = uniphier_i2c_remove,
 	.driver = {
 		.name  = "uniphier-i2c",
 		.of_match_table = uniphier_i2c_match,
diff --git a/drivers/i2c/busses/i2c-versatile.c b/drivers/i2c/busses/i2c-versatile.c
index 76abfa77e200..a1ab6ef6f071 100644
--- a/drivers/i2c/busses/i2c-versatile.c
+++ b/drivers/i2c/busses/i2c-versatile.c
@@ -109,7 +109,7 @@ MODULE_DEVICE_TABLE(of, i2c_versatile_match);
 
 static struct platform_driver i2c_versatile_driver = {
 	.probe		= i2c_versatile_probe,
-	.remove_new	= i2c_versatile_remove,
+	.remove		= i2c_versatile_remove,
 	.driver		= {
 		.name	= "versatile-i2c",
 		.of_match_table = i2c_versatile_match,
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 3415683dab91..4eb740faf268 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -169,7 +169,7 @@ static const struct of_device_id wmt_i2c_dt_ids[] = {
 
 static struct platform_driver wmt_i2c_driver = {
 	.probe		= wmt_i2c_probe,
-	.remove_new	= wmt_i2c_remove,
+	.remove		= wmt_i2c_remove,
 	.driver		= {
 		.name	= "wmt-i2c",
 		.of_match_table = wmt_i2c_dt_ids,
diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 2ed4130c0339..503e2f4d6f84 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -415,7 +415,7 @@ static void vprbrd_i2c_remove(struct platform_device *pdev)
 static struct platform_driver vprbrd_i2c_driver = {
 	.driver.name	= "viperboard-i2c",
 	.probe		= vprbrd_i2c_probe,
-	.remove_new	= vprbrd_i2c_remove,
+	.remove		= vprbrd_i2c_remove,
 };
 
 static int __init vprbrd_i2c_init(void)
diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 658396c9eeab..663fe5604dd6 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -581,7 +581,7 @@ MODULE_DEVICE_TABLE(acpi, xgene_slimpro_i2c_acpi_ids);
 
 static struct platform_driver xgene_slimpro_i2c_driver = {
 	.probe	= xgene_slimpro_i2c_probe,
-	.remove_new = xgene_slimpro_i2c_remove,
+	.remove = xgene_slimpro_i2c_remove,
 	.driver	= {
 		.name	= "xgene-slimpro-i2c",
 		.of_match_table = of_match_ptr(xgene_slimpro_i2c_dt_ids),
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 1d68177241a6..c4d3eb02da09 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1395,7 +1395,7 @@ static const struct dev_pm_ops xiic_dev_pm_ops = {
 
 static struct platform_driver xiic_i2c_driver = {
 	.probe   = xiic_i2c_probe,
-	.remove_new = xiic_i2c_remove,
+	.remove = xiic_i2c_remove,
 	.driver  = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(xiic_of_match),
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 08a59a920929..4d5e49b6321b 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -579,7 +579,7 @@ MODULE_DEVICE_TABLE(acpi, xlp9xx_i2c_acpi_ids);
 
 static struct platform_driver xlp9xx_i2c_driver = {
 	.probe = xlp9xx_i2c_probe,
-	.remove_new = xlp9xx_i2c_remove,
+	.remove = xlp9xx_i2c_remove,
 	.driver = {
 		.name = "xlp9xx-i2c",
 		.acpi_match_table = ACPI_PTR(xlp9xx_i2c_acpi_ids),
diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index 3648382b885a..4d6abd7e92ce 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -536,7 +536,7 @@ static struct platform_driver scx200_pci_driver = {
 		.name = "cs5535-smb",
 	},
 	.probe = scx200_probe,
-	.remove_new = scx200_remove,
+	.remove = scx200_remove,
 };
 
 static const struct pci_device_id scx200_isa[] = {
diff --git a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
index 7aa6e795d833..d6ef91b888c6 100644
--- a/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
+++ b/drivers/i2c/muxes/i2c-arb-gpio-challenge.c
@@ -190,7 +190,7 @@ MODULE_DEVICE_TABLE(of, i2c_arbitrator_of_match);
 
 static struct platform_driver i2c_arbitrator_driver = {
 	.probe	= i2c_arbitrator_probe,
-	.remove_new = i2c_arbitrator_remove,
+	.remove = i2c_arbitrator_remove,
 	.driver	= {
 		.name	= "i2c-arb-gpio-challenge",
 		.of_match_table = i2c_arbitrator_of_match,
diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 7e2686b606c0..dce18f763a09 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -314,7 +314,7 @@ static struct platform_driver i2c_demux_pinctrl_driver = {
 		.of_match_table = i2c_demux_pinctrl_of_match,
 	},
 	.probe	= i2c_demux_pinctrl_probe,
-	.remove_new = i2c_demux_pinctrl_remove,
+	.remove = i2c_demux_pinctrl_remove,
 };
 module_platform_driver(i2c_demux_pinctrl_driver);
 
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 944577bb09c1..9b46b84e84fb 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -247,7 +247,7 @@ MODULE_DEVICE_TABLE(of, i2c_mux_gpio_of_match);
 
 static struct platform_driver i2c_mux_gpio_driver = {
 	.probe	= i2c_mux_gpio_probe,
-	.remove_new = i2c_mux_gpio_remove,
+	.remove = i2c_mux_gpio_remove,
 	.driver	= {
 		.name	= "i2c-mux-gpio",
 		.of_match_table = i2c_mux_gpio_of_match,
diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index 10d63307b14d..ab8e11661052 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -152,7 +152,7 @@ static void i2c_mux_remove(struct platform_device *pdev)
 
 static struct platform_driver i2c_mux_driver = {
 	.probe	= i2c_mux_probe,
-	.remove_new = i2c_mux_remove,
+	.remove = i2c_mux_remove,
 	.driver	= {
 		.name	= "i2c-mux-gpmux",
 		.of_match_table = i2c_mux_of_match,
diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 3f06aa3331a7..1c2debcf379c 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -182,7 +182,7 @@ static struct platform_driver mlxcpld_mux_driver = {
 		.name = "i2c-mux-mlxcpld",
 	},
 	.probe = mlxcpld_mux_probe,
-	.remove_new = mlxcpld_mux_remove,
+	.remove = mlxcpld_mux_remove,
 };
 
 module_platform_driver(mlxcpld_mux_driver);
diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
index 02aaf0781e9c..fc686a350ae8 100644
--- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
@@ -186,7 +186,7 @@ static struct platform_driver i2c_mux_pinctrl_driver = {
 		.of_match_table = i2c_mux_pinctrl_of_match,
 	},
 	.probe	= i2c_mux_pinctrl_probe,
-	.remove_new = i2c_mux_pinctrl_remove,
+	.remove = i2c_mux_pinctrl_remove,
 };
 module_platform_driver(i2c_mux_pinctrl_driver);
 
diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index ef765fcd33f5..dfa472d514cc 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -247,7 +247,7 @@ MODULE_DEVICE_TABLE(of, i2c_mux_reg_of_match);
 
 static struct platform_driver i2c_mux_reg_driver = {
 	.probe	= i2c_mux_reg_probe,
-	.remove_new = i2c_mux_reg_remove,
+	.remove = i2c_mux_reg_remove,
 	.driver	= {
 		.name	= "i2c-mux-reg",
 		.of_match_table = of_match_ptr(i2c_mux_reg_of_match),

base-commit: 40e0c9d414f57d450e3ad03c12765e797fc3fede
-- 
2.45.2


