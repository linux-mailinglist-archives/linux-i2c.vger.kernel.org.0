Return-Path: <linux-i2c+bounces-4143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAA911083
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 20:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A70EB2A2E7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 18:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3381D18FC;
	Thu, 20 Jun 2024 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="X82Lh127"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0F61D18E0
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 17:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906344; cv=none; b=phpSxD5LdqaxnuhrweGKElTWvjz2PiMO9cVF/3jgIAoMkBMKsQtEwY61nPLC7oIzhjLX/AxoTH5cuQH6w3iNNpCtsElATceLONnmGg0E13B76WFq0L7ESUol+fl5+a1mNLtu3wt6AW9YHfhllCVpZU8URP+QVfWKZ9+dsHYSPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906344; c=relaxed/simple;
	bh=EMyHs6b9ptSnKztiiVKCqZSXFWuzO60Th0vGvDdv00s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FGUmwU5fQS+z50vmmAewZOk04P1z6d+p/t1LfXhv1k8F23IaLFIeSitWolbrsnoxRUI9p7jijoNZksrSPcZP7NoZScntclBQJDNHNgzRMuvzMh+ZP/BNBRp4nvoi3/UOQDPO0SR6jGXiMa8c7L3NPedUGyGRp/DhatJPHbbqWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=X82Lh127; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f177b78dcso127730766b.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906340; x=1719511140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJI26duvfMm0hH2VM1fi6stFJmPonSLGaDj169i8hcM=;
        b=X82Lh1275jU1Lb9NHfNSZXx/jm7ow57L03G6u3oO6uf1D9y4w7p2DS7CMMhGXEzt+5
         ofFLnboUvO4UnHUs5qTdYUXgEknrXZWrL9t74NLd0pwaZKcBMO3fqKj3Rewgo+ZtzwEj
         Doy6e/T8dNfGOzQTnYB+K78wVyHFO2lbheWgm0tQhDXlXdiwVoupWJNTcCToPkbYaTTQ
         wnbq2MwERWULCUBoStLL1GxPN7s3t/saZDGW9TOEFiFw9Wq1bkJcEqNIS/mNLSVrMv/n
         D1b8dy9u8rvAnLwfT9YLgIPv1d87+GAgZP9DX7P0BucyRM5CpyTqjmHezqi9AqcwdrIf
         3a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906341; x=1719511141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJI26duvfMm0hH2VM1fi6stFJmPonSLGaDj169i8hcM=;
        b=mIvkEGbXVYF7ycWyPDasc4i0UE7WP0hnlwaB9hdAnlzgkR5Pul+Gca18BS0gB0/LH2
         pa/LkGwvMosVFsA4T3BR2dpuX+yZew7AQ+z7Ho9Ui/450nQDIcqQ2XLA8/tNTW7bNgyL
         xqKpqOwlb2Y6EOO84SAwWjjA5dp019ed2RlEA+uIkXVDOdYBLHD3oyyFs5cVhauCf4x2
         LCz88uZfHzBYOqaNTlSeNcegW+GKHSmn9cq4mIrchJMrTTzu9umZjzrpEXJMHptSVFIs
         +ZWBfq4oiP9E37YawATg/4+imqoWTUbkLPl+llStxC1tCiVA82tgbWRB0/pu+f20E6yI
         cKpA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDI62IduB4EZo2DXnHlYtR8BRJQ8OKPRKHNbxXN6JJBc92y52fRLuknmMYGJHzQHa/pQoCmx+Y4qNbCpnYOtwr9nez3nnkF++
X-Gm-Message-State: AOJu0Yyn5fIkXgNMNJNJJj5ORETYQ3PcFhCtBwT84ZWdGSVO9DvNzt1+
	gtZm4/Q9tW6wM9j/c0K9o92193bBLMwl52rVEyLyumUoZwDkLqd4Xfe57MFWFw8=
X-Google-Smtp-Source: AGHT+IFE99yiH6KlSLSijoysmvGidn2b7gOkfW49nNmYq3cUnll4tztljhinaCegKpYiciiy0oFs8g==
X-Received: by 2002:a17:907:1606:b0:a6f:b19d:90ac with SMTP id a640c23a62f3a-a6fb19d9667mr375299966b.69.1718906340595;
        Thu, 20 Jun 2024 10:59:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:59:00 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 04/10] ARM: dts: lpc32xx: Add missing dma and i2s properties
Date: Thu, 20 Jun 2024 19:56:35 +0200
Message-Id: <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds properties declared in the new DT bindings:
 - nxp,lpc3220-i2s.yaml
 - nxp,lpc3220-dmamux.yaml
for dma router/mux and I2S interface.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is renamed from
  "ARM: dts: lpc32xx: Add missing properties for the i2s interfaces"
  to describe dma changes as well
- Added dmas and dma-names properties in to all node which have dma request signals
- Add bus properties to pl08x dma node since they are removed from platform data in phy3250.c
- Put clock-controller@0 and dma-router@7c under the same syscon, simple-mfd device

Changes for v3:
- Split previous commit for separate subsystems
- Add properties to match dt binding

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 53 +++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..c58dc127e59f 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -67,6 +67,8 @@ slc: flash@20020000 {
 			reg = <0x20020000 0x1000>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
 			status = "disabled";
+			dmas = <&dma 1 1>;
+			dma-names = "rx-tx";
 		};
 
 		mlc: flash@200a8000 {
@@ -75,6 +77,8 @@ mlc: flash@200a8000 {
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_MLC>;
 			status = "disabled";
+			dmas = <&dma 12 1>;
+			dma-names = "rx-tx";
 		};
 
 		dma: dma@31000000 {
@@ -83,6 +87,13 @@ dma: dma@31000000 {
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_DMA>;
 			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+			dma-channels = <8>;
+			dma-requests = <16>;
+			lli-bus-interface-ahb1;
+			mem-bus-interface-ahb1;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
 		};
 
 		usb {
@@ -182,6 +193,8 @@ ssp0: spi@20084000 {
 				clock-names = "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 14 1 1>, <&dmamux 15 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -191,6 +204,8 @@ spi1: spi@20088000 {
 				clocks = <&clk LPC32XX_CLK_SPI1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 11 1 0>;
+				dma-names = "rx-tx";
 				status = "disabled";
 			};
 
@@ -206,6 +221,8 @@ ssp1: spi@2008c000 {
 				clock-names = "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 3 1 1>, <&dmamux 11 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -215,12 +232,19 @@ spi2: spi@20090000 {
 				clocks = <&clk LPC32XX_CLK_SPI2>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 3 1 0>;
+				dma-names = "rx-tx";
 				status = "disabled";
 			};
 
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				dmas = <&dma 0 1>, <&dma 13 1>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -231,12 +255,19 @@ sd: sd@20098000 {
 					     <13 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SD>;
 				clock-names = "apb_pclk";
+				dmas = <&dma 4 1>;
+				dma-names = "rx";
 				status = "disabled";
 			};
 
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -312,21 +343,27 @@ fab {
 			compatible = "simple-bus";
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
-			/* System Control Block */
-			scb {
-				compatible = "simple-bus";
-				ranges = <0x0 0x40004000 0x00001000>;
+			syscon@40004000 {
+				compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+				reg = <0x40004000 0x114>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				ranges = <0 0x40004000 0x114>;
 
 				clk: clock-controller@0 {
 					compatible = "nxp,lpc3220-clk";
 					reg = <0x00 0x114>;
 					#clock-cells = <1>;
-
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
+
+				dmamux: dma-router@7c {
+					compatible = "nxp,lpc3220-dmamux";
+					reg = <0x7c 0x8>;
+					#dma-cells = <3>;
+					dma-masters = <&dma>;
+				};
 			};
 
 			mic: interrupt-controller@40008000 {
@@ -362,6 +399,8 @@ uart1: serial@40014000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40014000 0x1000>;
 				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 6 1>, <&dma 5 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -369,6 +408,8 @@ uart2: serial@40018000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40018000 0x1000>;
 				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 8 1>, <&dma 7 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -376,6 +417,8 @@ uart7: serial@4001c000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x4001c000 0x1000>;
 				interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux 10 1 0>, <&dma 9 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.25.1


