Return-Path: <linux-i2c+bounces-12727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D05B4804E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CADDB189EEC7
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A700A280A5F;
	Sun,  7 Sep 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WahswfOV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CF1EFF9B;
	Sun,  7 Sep 2025 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280855; cv=none; b=QIHOo76dMB2SqbkC4u4sBbwu+lhVxnDRq075A5Td5GfFfrx/HvebNhY585t8D7MUqz+6d7w+8B06LNFdNFlAcYeloVwIaSaCBlRhyn0PcslddDiJGy/BlwHjcfmH7zcv6Ys8UVfcYGzuxXoV2S7zPBhfYjVPOEiXrx/qeGkBahs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280855; c=relaxed/simple;
	bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qx9vfO/xf/hKo8WK/aG83biP2bbtj/6rhZKZbfRF8gSRWDZZZr73me286u5YDoKTZILH5bViI4u2gMFhlpYZogCeWge03724O8yAnZzgnIomcKAdjTskrv516S93C1m556oEeY2COxZUFJUwcu2By35qzgzALYPHS4l512c/Ugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WahswfOV; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7221ce7e814so31027476d6.0;
        Sun, 07 Sep 2025 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280853; x=1757885653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=WahswfOVgEBqSwXkRBdRJtdlthHirtYZ3griwydFK8U1Cjv0C8TEuAZsbKmRRHrKjM
         O6M3QQGcw1xe39Xh9U7DTMxH6z2XG4Td+SVDdrD8K3ELRbHxlo946SPxO+QnfUgqNgTI
         wALvFTiximPbvTYWl0MR3fHHtSBDTANYwRhn0/s8+foUthjFROHlgV8T3u/skZFhuTzD
         8V29ZK/uJypdHfPjBu8eagQzmdaIUm/KjaUnu9f85unDBYMI0pxln47iOqfz3U9iYikl
         Ooxym7zN3KX63wESPO5Ve2Ayolley0/V4OWZw3R8UVclHiWFPPywtxwlcZX5h3iaN+il
         XUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280853; x=1757885653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=iGAO70fBQlc+pqUW1AQzqmrGnq62eBT2KZGXgoO7Xdf8RfSF7GpRJeqVzE8oDPYTP1
         e/M+btwWJShraS/YypcRbVkbnxD0yK4flwuxSGVJK5hfg8/sCr8F+KI4Kl2WLRpnJb2T
         SoTbMJnXfTWM3ejKQn3/QjefOgwum+zgTI+cAS/V2OFYcI4npsPIVsZ2RH4jiIxVPl1u
         GSNmgdYEqmgDa1xj4L6XTCmlY7nXPNMHIxHXGVq0NRGBkX/cE/F9RnZ6TwUHqCxpBjdL
         UQSgxRE1UH9FynFwTItAM4cX6uoEhY3wORsNz+fxIeGmVC6oy70iDXsDMASK6r9q465B
         C+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUxPnrTFfEkE+A7bzjgr2MSF1qorW2Ny2stjDa8T9j2wBzKiWq2l54LtV2nmI4hMjLY1Zfny+vOCiE=@vger.kernel.org, AJvYcCVJ58XPutJ93nankF1yycw1vDlPhwRV2Pm7o8iwj4TtOVKC55T+L7hw24yE9TvlNIFMwq1V5FcCJMR74uouKykpGAY=@vger.kernel.org, AJvYcCVXzuy0Z51i+EsRc4sY2U5Ej/pU4dq/x87p366Tde+GKJM/8w/n8U3qZTlvEyaYKJj5ykAAGJ/3GzTZH94W@vger.kernel.org, AJvYcCW5NTGbTfnEY5fp8NdDvhZ8fxeJ9JpAoyRHVf6TdFmrVTeZgmoKPV1MfnAtl0fw/A21MLm5cN4303DPi7Ov@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuxTxe3oaEOqWlXNt1pJaFreQE28zsAf7TgGR9t+En+MQrTAP
	N4MIixMKC3c2qhh6YJJXOQWQ+IOVewSUurkVSqXDtsC4D5rBLZdu4joY9SYsjhNC
X-Gm-Gg: ASbGncvIqyBsmsHxtkbyUV2QzgabyLg+9hOMEULEQi/6UPo8F+NFb41sPRLFdpjc6gz
	lMi1fyWNEUYiKUtgiIkMiZl40esTQ00SgFZngCx9fjysUhNOKOva/qO28FxfKcTQLu3KZxEJZLE
	B+Qwontfsyi3dxnDfRp3GpiSBlEYYVH88asxl8/jwbbFKZXnSL1Odb/6TkaQJh1VLyUzvDfS5KK
	goVTZg3YUtoq2Kl4iQhnqjIQdbmNr/wM+IoEQ/1d94UCm5gKoThrh138GedVxjhV3kXCeznbfh0
	U9cHVJAvtXGWZ+Mz19rqRNJfORX2ArRzpHvBl0PYfGc74kdpsWs0OijxjWAO5SZTVyurdcuwS/I
	8V8nhEO+yCrwBUmJhtSRc5ZMPFwnxSXs=
X-Google-Smtp-Source: AGHT+IHPM+G+GOjO0O2yBOjZ26lUoE+V4XS2kt7UKwhrRNsQwUzyBOaDQpcYiAqKWBmBOwp/wf22UQ==
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id 6a1803df08f44-73946e7c091mr61421626d6.60.1757280852658;
        Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 21:33:58 +0000
Subject: [PATCH 2/8] arm64: dts: exynos990: Add sysreg nodes for PERIC0 and
 PERIC1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v1-2-ae7600491a7f@gmail.com>
References: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1456;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
 b=x3i6FnOfW1YZIRe0vMTUnnw/gQJifiRBA7EPfOqI9+IlygYAnm2Pxoke4Z29b0nP5dMdbOPDj
 He1ZYf6XHaIC6D7KjMY5ZR/9mmy03Yk54+A3f9trNHJ82N/9scgr55n
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add syscon nodes for PERIC0 and PERIC1 blocks.
These are required for configuring the USI, SPI and I2C controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 7179109c49d0b0984c8d8eb2d24c0be1c6e015c3..f8e2a31b4b7519b83aa31deefbc40e5edbb8186a 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -260,6 +260,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
@@ -277,6 +283,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1


