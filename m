Return-Path: <linux-i2c+bounces-6637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C650977073
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471C01F26025
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138971C1AA6;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qv9AJUHw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901321BFE12;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=AdlTa08ZqbX1JpVA8lapvKx73Il61hV2Dsx+DfA42+9N44HCsK1rxj7wsFGv7nLXHGK4MDixlkXw/ZAuXjJwwfdyyI3k7qVPrhvkDRNljhXALzgloWDXnFqGVImwl/Skw9x5yNWKJEshOrDTWMQt8V3cfgSTC0YtYzq1oz3CquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=TAvj/gNZj1rstVTZNHKfYn84bNB1hLFim2lMkTFzOnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbGpiZ+yqIu2CSO6XypUXH0vOQ+8TkL7+RMeRYOxDSXz+06NV6+X0QUlCRcbIS5CYOfbq/js9cb2Qi6cUazkUS7iSmWRrCDwROyz2gCl92nTJyXwwG8ksYZWQTrEboEI9zT3tCg7zjpBK/8IB8Gh7e/nwJg+ZdZbI/FOT2ecoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qv9AJUHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 328ABC4CEE1;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=TAvj/gNZj1rstVTZNHKfYn84bNB1hLFim2lMkTFzOnk=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=qv9AJUHwkYur1gjCRGsv4tTxfn5YYyY4BVHZSsoXaPBbm0jV9HIqbHErixfD6VJ4l
	 NqtoRb+pRbm81twqsYF90bX5GqvH5up4wFFdJXO0hUAGqG8d7KnPV0zv7gSmWdWN1G
	 FHxcafjYelE5ikDwCIcR1qi8nu7Zbnj99ahnNJY5DYCJB2ZKKQRJ4v3SKXu+nhrBqt
	 5nvMeluC/zizqOLeEsw1OfX3nAFkC4NahNMNljKPEUfcMm+pZBrJ5ilIwc/L4ZNF29
	 OF54cEGmW0rXc0x6200EvB+ksyX+Q/I7XFYi/Sm+stkXRv1xbwFoSYnvI1quTUTXio
	 CPhTPVyY6gdvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281A5EED63F;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:51 +0100
Subject: [PATCH 06/21] include: dt-binding: clock: add adi clock header
 file
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-6-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=4153;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=tPiF/DaY6UORa5f5iyBwG+k45QdAa3ZySrbsiRLF6Cc=;
 b=r71K9MzY6ONZnGXOuRJSwoTdhK0WXTFZ4S0T+uvezlfMOqM9MA/kGKSJMD86VcBBnyFCLjBBD
 JduICltZI6lA9QAIMLZjzW9gVzn4gOIYm0i3WCY9uEggXoVCd8M7dTZ
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add adi clock driver header file

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 include/dt-bindings/clock/adi-sc5xx-clock.h | 93 +++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/include/dt-bindings/clock/adi-sc5xx-clock.h b/include/dt-bindings/clock/adi-sc5xx-clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..723c11dc44f9741cff49dc2cb6c5232022abf00c
--- /dev/null
+++ b/include/dt-bindings/clock/adi-sc5xx-clock.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ADSP SC5xx clock device tree bindings
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef DT_BINDINGS_CLOCK_ADI_SC5XX_CLOCK_H
+#define DT_BINDINGS_CLOCK_ADI_SC5XX_CLOCK_H
+
+#define ADSP_SC598_CLK_DUMMY 0
+#define ADSP_SC598_CLK_SYS_CLKIN0 1
+#define ADSP_SC598_CLK_SYS_CLKIN1 2
+#define ADSP_SC598_CLK_CGU0_PLL_IN 3
+#define ADSP_SC598_CLK_CGU0_VCO_OUT 4
+#define ADSP_SC598_CLK_CGU0_PLLCLK 5
+#define ADSP_SC598_CLK_CGU1_IN 6
+#define ADSP_SC598_CLK_CGU1_PLL_IN 7
+#define ADSP_SC598_CLK_CGU1_VCO_OUT 8
+#define ADSP_SC598_CLK_CGU1_PLLCLK 9
+#define ADSP_SC598_CLK_CGU0_CDIV 10
+#define ADSP_SC598_CLK_CGU0_SYSCLK 11
+#define ADSP_SC598_CLK_CGU0_DDIV 12
+#define ADSP_SC598_CLK_CGU0_ODIV 13
+#define ADSP_SC598_CLK_CGU0_S0SELDIV 14
+#define ADSP_SC598_CLK_CGU0_S1SELDIV 15
+#define ADSP_SC598_CLK_CGU0_S1SELEXDIV 16
+#define ADSP_SC598_CLK_CGU0_S1SEL 17
+#define ADSP_SC598_CLK_CGU1_CDIV 18
+#define ADSP_SC598_CLK_CGU1_SYSCLK 19
+#define ADSP_SC598_CLK_CGU1_DDIV 20
+#define ADSP_SC598_CLK_CGU1_ODIV 21
+#define ADSP_SC598_CLK_CGU1_S0SELDIV 22
+#define ADSP_SC598_CLK_CGU1_S1SELDIV 23
+#define ADSP_SC598_CLK_CGU1_S0SELEXDIV 24
+#define ADSP_SC598_CLK_CGU1_S1SELEXDIV 25
+#define ADSP_SC598_CLK_CGU1_S0SEL 26
+#define ADSP_SC598_CLK_CGU1_S1SEL 27
+#define ADSP_SC598_CLK_CGU0_CCLK2 28
+#define ADSP_SC598_CLK_CGU0_CCLK0 29
+#define ADSP_SC598_CLK_CGU0_OCLK 30
+#define ADSP_SC598_CLK_CGU0_DCLK 31
+#define ADSP_SC598_CLK_CGU0_SCLK1 32
+#define ADSP_SC598_CLK_CGU0_SCLK0 33
+#define ADSP_SC598_CLK_CGU1_CCLK0 34
+#define ADSP_SC598_CLK_CGU1_OCLK 35
+#define ADSP_SC598_CLK_CGU1_DCLK 36
+#define ADSP_SC598_CLK_CGU1_SCLK1 37
+#define ADSP_SC598_CLK_CGU1_SCLK0 38
+#define ADSP_SC598_CLK_CGU1_CCLK2 39
+#define ADSP_SC598_CLK_DCLK0_HALF 40
+#define ADSP_SC598_CLK_DCLK1_HALF 41
+#define ADSP_SC598_CLK_CGU1_SCLK1_HALF 42
+#define ADSP_SC598_CLK_SHARC0_SEL 43
+#define ADSP_SC598_CLK_SHARC1_SEL 44
+#define ADSP_SC598_CLK_ARM_SEL 45
+#define ADSP_SC598_CLK_CDU_DDR_SEL 46
+#define ADSP_SC598_CLK_CAN_SEL 47
+#define ADSP_SC598_CLK_SPDIF_SEL 48
+#define ADSP_SC598_CLK_SPI_SEL 49
+#define ADSP_SC598_CLK_GIGE_SEL 50
+#define ADSP_SC598_CLK_LP_SEL 51
+#define ADSP_SC598_CLK_LP_DDR_SEL 52
+#define ADSP_SC598_CLK_OSPI_REFCLK_SEL 53
+#define ADSP_SC598_CLK_TRACE_SEL 54
+#define ADSP_SC598_CLK_EMMC_SEL 55
+#define ADSP_SC598_CLK_EMMC_TIMER_QMC_SEL 56
+#define ADSP_SC598_CLK_SHARC0 57
+#define ADSP_SC598_CLK_SHARC1 58
+#define ADSP_SC598_CLK_ARM 59
+#define ADSP_SC598_CLK_CDU_DDR 60
+#define ADSP_SC598_CLK_CAN 61
+#define ADSP_SC598_CLK_SPDIF 62
+#define ADSP_SC598_CLK_SPI 63
+#define ADSP_SC598_CLK_GIGE 64
+#define ADSP_SC598_CLK_LP 65
+#define ADSP_SC598_CLK_LP_DDR 66
+#define ADSP_SC598_CLK_OSPI_REFCLK 67
+#define ADSP_SC598_CLK_TRACE 68
+#define ADSP_SC598_CLK_EMMC 69
+#define ADSP_SC598_CLK_EMMC_TIMER_QMC 70
+#define ADSP_SC598_CLK_3PLL_PLL_IN 71
+#define ADSP_SC598_CLK_3PLL_VCO_OUT 72
+#define ADSP_SC598_CLK_3PLL_PLLCLK 73
+#define ADSP_SC598_CLK_3PLL_DDIV 74
+#define ADSP_SC598_CLK_DDR_SEL 75
+#define ADSP_SC598_CLK_DDR 76
+#define ADSP_SC598_CLK_CGU0_VCO_2_OUT 77
+#define ADSP_SC598_CLK_CGU1_VCO_2_OUT 78
+#define ADSP_SC598_CLK_3PLL_VCO_2_OUT 79
+#define ADSP_SC598_CLK_END 80
+
+#endif

-- 
2.25.1



