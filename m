Return-Path: <linux-i2c+bounces-6652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DF9770AF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BFD11F2812F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1371C3F0F;
	Thu, 12 Sep 2024 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4O9Ae/l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0461C32E8;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=C+Ogqrfsvg6deHrnEWUpTyCAQgDWlk9WfoTz79bYP/zfcj+kQu8UVSEs6tPa3uP4l5OHmTp70AmVWv+vHdiA41C+Ca/XhHuDeo6RUDJ5OHqjrH/3CB+vnPKIkUAd2GtAct76NtPKBsQmA2cDv/J4s1jlOppW1UcVUkOvf1Luy9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=OpMw8H1Uy7VJPtjkQlzz7ECyPIAIof/IYlkKaagHA0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4vDAM+wuAHIY7y6LFbp1W97n2PcFMNHoDZTCK2TfEzhV1huJZT/BtCq+22VSmi175O5CwYT4Q8oLTPhQp9nbva9Kfj9vr6/jRmh0Q7TyshUnPv4jnYK2W8gHUjvyqy5ibN305WIrqUHxU+olCol/JMeYiwNq3WRH/ldm+mw4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4O9Ae/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A9EFC4FE14;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=OpMw8H1Uy7VJPtjkQlzz7ECyPIAIof/IYlkKaagHA0A=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=G4O9Ae/lhd1rutXXY24q0dKWpQIomRNl4m214Bfu2bgdMVx9xfHnb+6c3TUJBevKd
	 mzZS/aoukhzlJ9KJko4M4o9GMvySthPWYCYNudpA5CKbr1K+kD2bR9fmojrUCka/CE
	 TB/JhSMymx2DDrOu4xq9lmrY4UU+CXM/R4CesDogkazfKSGGiTyIWWDGcuf4dus1EL
	 QCj194O54v1+mKNXilv+3ZFCHWpn3A9wHw5l8owgjyzYwSnxkuzVdAAFY8XT5U/R1b
	 HgilmUrTGjYdX3WB3V6WsKvK8UeNwmM97+PxBku2AjqmrXkCB0XslEVr8Vsue5+CQE
	 NiY0Ny6lhEUng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CB5EEE25C;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:05 +0100
Subject: [PATCH 20/21] arm64: defconfig: sc598 add minimal changes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-20-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=2190;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=MHsHd+C/PIZW+6c/4XvADztERNqdGgexUrpmw/8Uj1o=;
 b=ckE38LhnghBiz6ehY1LUpgPtxnhxp0i91l16hEWoTdfUkJhwgYv0et/QDYoVF7isUu1LLusPS
 15YeKF/PimUDG9n6SDxoWDjeMljd29/pxhd07rkP9NiynxSaD1LZVEI
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC598 defconfig

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 362df939026383a26ee23485d1ec25b252b90d5d..7801dd7d7d65bc504dc6e2945f92f261f2911115 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -67,6 +67,7 @@ CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
+CONFIG_ARCH_SC59X_64=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_TESLA_FSD=y
 CONFIG_ARCH_SPRD=y
@@ -473,6 +474,7 @@ CONFIG_SERIAL_8250_OMAP=y
 CONFIG_SERIAL_8250_MT6577=y
 CONFIG_SERIAL_8250_UNIPHIER=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_ADI_UART=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MESON=y
@@ -513,6 +515,7 @@ CONFIG_TCG_TIS_I2C_CR50=m
 CONFIG_TCG_TIS_I2C_INFINEON=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
+CONFIG_I2C_ADI_TWI=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_CADENCE=m
@@ -539,6 +542,7 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
+CONFIG_SPI_ADI=y
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
 CONFIG_SPI_BCM2835AUX=m
@@ -637,6 +641,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_GPIO_ADI_ADSP_PORT=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1512,6 +1517,7 @@ CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
+CONFIG_RESET_SC5XX=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_SUN4I_USB=y

-- 
2.25.1



