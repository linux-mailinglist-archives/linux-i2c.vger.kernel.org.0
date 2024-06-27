Return-Path: <linux-i2c+bounces-4404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982F91AA3B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74160B2649E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8BB198846;
	Thu, 27 Jun 2024 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="L3I6I+6Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94C8198827
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500584; cv=none; b=AHhXODxlSuIuAE4RvW1cY5biRB3vlESbcyBWe7FEr4OFIcWSWirCSS8DyPwhMKVkQR9pX8RpSqaNJcQ9WtnSOVLcpmI/blS5xV+4aMZaPIBMpaLDoMj3aeB6mRjZkG1/C9fYuaydEau5HenK6iG/X3dreJWduEfo2ZKCeqVdPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500584; c=relaxed/simple;
	bh=A5cVVYIXLTtocL+I6NwQej/XBFq/5AxfenJcTvjbKQg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TAkjKTp3vOmnpixWHy5sGWLoJyPtvcolqjdNsYkIm+IkUYqsomkhHQnj8fDevDS26FQmcsilZElGzmJrdxE8rjyrGG9pSjOBLVwgUNLuJ1J1zLXjyAWDWar3jv51nqMAXlU44pT/7QkmYJ2i5DWrsye/WrP93hoj7UannZHmwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=L3I6I+6Q; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cd80e55efso11180849e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500580; x=1720105380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJvIbWYuYPh2MYk+7zUochFUm6khQh2owZTLDHTohpE=;
        b=L3I6I+6Q5B0QnLrtdL7LHBpwcJHra16vL0NA6ZlIChcntisELpd9rqh7uqXa4gRGUR
         s68dxE5+YBz0KrdPvDISHD4BTPGfrWa2Oz52bldNdtAPLxYIE84RZcXfEBB8kjRwkAEF
         eXXS3jR5nyGqFco75M3oiw0nduf0Dah6f02xE9uAVnCn0av+s1+v4cJOJhd/AJst4apD
         W8JlNte4G5ttIUUgQ/Ezn1tqfJfliYr0V/TM7gOkXWG6jPhFXJgprFs5jPX68aVRioFr
         Sox+/Kl4sQ3NlJJZ2GKqBcqN40VErubA07De2YuMNO3gBpr7jZgbCRVFQjoZdqJvB2rG
         u6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500580; x=1720105380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvIbWYuYPh2MYk+7zUochFUm6khQh2owZTLDHTohpE=;
        b=qWTdNGqfKVkqMXer2wV0h2FNva7aEKbyCPHl3E45kAGFpGums68GYKPR0fHpQoXXjR
         synX5A/S9SjrzO8Ot+uoeEFOe4Ta991obewfYx+GW2knbGeCCeFmM/NqtzQ5B9PGpfkR
         LhT1vh8CaXsxcbQhcNIHyfmiTQcRgLFVz91obvHfrcR436ecPnELUsrsrXYjxDrc7ed6
         clDsMH7YykOanxkHYmTOVj9jVJkx/MEy5a9eG6ooFfKu9sN0y8rJZlWwDuWV2Kh680Bk
         bZ+AxXE4iFx5w9UNMUqHN8Pz9Y8DOQwNXOOvoTqYx3EVOBT+xYaD1Ek54BbYWTeT+gsa
         9+4g==
X-Forwarded-Encrypted: i=1; AJvYcCV1M4KiS6FqlIWttQa8+QXn+m0FcQOrux1l0M99IPnlyMUVXLcIJhiuIzUu8feKWR5UZxdRAp34QGEO5WWTIpkcOITZEzZUlbUY
X-Gm-Message-State: AOJu0YwcdeXSeuM0ue6fl4tKUvgYMhvCGnV2gFtOt72NTkB7UBi6TtP8
	m2Y7aWOyP1xLlzPLXiCAWP1AVg/jpbfmW6tmgSwx01UOHg1sCciDgfhdQMc+hjGRHkteUHYJta3
	EQQY=
X-Google-Smtp-Source: AGHT+IGZ1++Ks98/Qf/5imxTRRLFDrmwBrTqFEXDtzEcoEhTACvV1BuNeYZAcogKlXox/ewKi1ymKA==
X-Received: by 2002:a19:6455:0:b0:52c:db0e:6c4a with SMTP id 2adb3069b0e04-52ce182bea2mr10424279e87.2.1719500580105;
        Thu, 27 Jun 2024 08:03:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:59 -0700 (PDT)
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
	Corentin Labbe <clabbe@baylibre.com>,
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
Subject: [Patch v5 05/12] ARM: dts: lpc32xx: Add missing dma properties
Date: Thu, 27 Jun 2024 17:00:23 +0200
Message-Id: <20240627150046.258795-6-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds properties declared in the new DT binding nxp,lpc3220-dmamux.yaml
and corresponding phandles.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 8bf88d141e5b..6135ce4dde61 100644
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
 
@@ -215,12 +232,16 @@ spi2: spi@20090000 {
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
+				dmas = <&dma 0 1>, <&dma 13 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -231,12 +252,16 @@ sd: sd@20098000 {
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
+				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -326,6 +351,13 @@ clk: clock-controller@0 {
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
@@ -361,6 +393,8 @@ uart1: serial@40014000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40014000 0x1000>;
 				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 6 1>, <&dma 5 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -368,6 +402,8 @@ uart2: serial@40018000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40018000 0x1000>;
 				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 8 1>, <&dma 7 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -375,6 +411,8 @@ uart7: serial@4001c000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x4001c000 0x1000>;
 				interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux 10 1 0>, <&dma 9 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.25.1


