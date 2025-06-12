Return-Path: <linux-i2c+bounces-11395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A453AD7D16
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 23:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10423B2386
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD4F2E2EFF;
	Thu, 12 Jun 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEL0uaSZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8DD2DFA27;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762722; cv=none; b=kQHizA8DC41CM4BwISXbXHrM2ZKQzTmrezeB4KOC4cFIScJZkjEtYmX48etT75srSzPJIehCLO+UIo2qsV1hoC4Lf3L6sbR9D5XWfAxLZ1gvDN+S4bGux2EAhhldTNh8ek/g71CtdgW/MJjl4d8uuV9FwKnUNWm3pjIr3ek7ycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762722; c=relaxed/simple;
	bh=Li+xnd3OfWbFujc9g4zCLODzu8bXDFZr8M+WXuiOQm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bz8FGi3KlU/YcFMXoTZswsDJvDCZ/a917uCByZkilPnP/EKMGQya8JXOfSEEXHwLRLBVHwuMl+UqbnGd6hY7OwGqHStDZcZN8wQX0UTAyumgTRI59CxfWhLsmEcTHq7cNAm3HFZTLISyLiUs52rACEO98arepVy4qSRKfC8+mn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEL0uaSZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7100DC4CEF4;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=Li+xnd3OfWbFujc9g4zCLODzu8bXDFZr8M+WXuiOQm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AEL0uaSZ4sTrsOzx1TIpvmjEUjJiePMJ46UYjEv5LqW8RLAHc5CZZddepfSAaboZL
	 7O0E5KTewfNSXAzXju4psSmPDw1mZByc4A+MePw6+kV+j/u3QoN7jt7CXbevXmQHKl
	 s5NPMKtaGUn7fsMZx41Tw3wNABC2NzXceeRMtPqkAUhSNrc5UUUYY/X5GoPg5XMzGj
	 vCvvnu+YzYEFhKPlkK6xn82flLeqqIKov4gwxRf36ARVozidLyINRzM//j2xO4ne0Z
	 sStK3ZToLuieMcc7GFrwgnf/kb4tkln95EnR3GJRGN1jFk6A/AL/eiyqiIrit30xrn
	 7GI8SBPMQswqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6408AC71150;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:35 +0000
Subject: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4568; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Li+xnd3OfWbFujc9g4zCLODzu8bXDFZr8M+WXuiOQm8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a307zLLFdFnr3dPbepTfuP5dHZ1nrR2+SPHVY53Cm6W
 XRX3eGjHaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJrOti+O/+5turv6cj0pJ4
 /hfOazRxXDaxXeoAe8nEiIylzdJePtIMf7h7X2/QEN277twWqQ+rj+z3n7L136uMzLv1P/P6TCy
 a1jEAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Enable drivers for hardware present on Apple Silicon machines.
The power domain and interrupt driver should be built-it since these are
critical for the system to boot, the rest can be build as modules.

Previously, many of these drivers were accidentally configured as y
such that this actually decreases the size of the kernel image:

vmlinux 163628520 -> 163330632 (-297888)
Image    48388608 ->  48384512 (-  4096)

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/configs/defconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..8ebebfc2fa1293bd16332858d6e6694e1a6f3088 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -97,6 +97,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
 CONFIG_CPUFREQ_DT=y
 CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
+CONFIG_ARM_APPLE_SOC_CPUFREQ=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_IMX_CPUFREQ_DT=m
@@ -218,6 +219,7 @@ CONFIG_HOTPLUG_PCI_ACPI=y
 CONFIG_PCI_AARDVARK=y
 CONFIG_PCIE_ALTERA=y
 CONFIG_PCIE_ALTERA_MSI=y
+CONFIG_PCIE_APPLE=m
 CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
@@ -294,6 +296,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
+CONFIG_NVME_APPLE=m
 CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
 CONFIG_SRAM=y
@@ -454,6 +457,7 @@ CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_APPLE_Z2=m
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI=m
@@ -538,6 +542,7 @@ CONFIG_I2C_MT65XX=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OMAP=y
 CONFIG_I2C_OWL=y
+CONFIG_I2C_APPLE=m
 CONFIG_I2C_PXA=y
 CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
@@ -552,6 +557,7 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
+CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
 CONFIG_SPI_BCM2835AUX=m
@@ -586,7 +592,9 @@ CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
+CONFIG_SPMI_APPLE=m
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
@@ -757,6 +765,7 @@ CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_RENESAS_RZV2HWDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_PM8916_WATCHDOG=m
+CONFIG_APPLE_WATCHDOG=m
 CONFIG_BCM2835_WDT=y
 CONFIG_BCM7038_WDT=m
 CONFIG_MFD_ADP5585=m
@@ -983,6 +992,7 @@ CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_SOC=y
+CONFIG_SND_SOC_APPLE_MCA=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1266,6 +1276,7 @@ CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_DMADEVICES=y
+CONFIG_APPLE_ADMAC=m
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
 CONFIG_FSL_EDMA=y
@@ -1310,6 +1321,7 @@ CONFIG_CROS_EC_RPMSG=m
 CONFIG_CROS_EC_SPI=y
 CONFIG_CROS_KBD_LED_BACKLIGHT=m
 CONFIG_CROS_EC_CHARDEV=m
+CONFIG_COMMON_CLK_APPLE_NCO=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y
@@ -1451,6 +1463,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_APPLE_DART=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
@@ -1470,6 +1483,9 @@ CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_SOUNDWIRE=m
 CONFIG_SOUNDWIRE_QCOM=m
+CONFIG_APPLE_MAILBOX=m
+CONFIG_APPLE_RTKIT=m
+CONFIG_APPLE_SART=m
 CONFIG_FSL_DPAA=y
 CONFIG_FSL_MC_DPIO=y
 CONFIG_FSL_RCPM=y
@@ -1504,6 +1520,7 @@ CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
+CONFIG_APPLE_PMGR_PWRSTATE=y
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_IMX_SCU_PD=y
 CONFIG_QCOM_CPR=y
@@ -1567,6 +1584,7 @@ CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
 CONFIG_TI_SCI_INTR_IRQCHIP=y
 CONFIG_TI_SCI_INTA_IRQCHIP=y
+CONFIG_APPLE_AIC=y
 CONFIG_RESET_GPIO=m
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
@@ -1640,6 +1658,7 @@ CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
+CONFIG_NVMEM_APPLE_EFUSES=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
 CONFIG_NVMEM_IMX_OCOTP_SCU=y

-- 
2.34.1



