Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555443807E6
	for <lists+linux-i2c@lfdr.de>; Fri, 14 May 2021 13:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhENLDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 May 2021 07:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbhENLDz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 May 2021 07:03:55 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48223C061574;
        Fri, 14 May 2021 04:02:43 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id k19so24396714pfu.5;
        Fri, 14 May 2021 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jE/TIuKBojv1iuFg/T5O/fed0z0GfnmGxLAakbUu4oY=;
        b=UOnA/xHoWAoylld5n8qdV8qF3EI0++R95yJ2uZjleNHcH2VmHdl+KESdFJ3lskmiar
         dofXBXdXMivKMrzN9QnwIl4Phz1zgNrIhN5LPADglcq4u9ANc97tJ9ZAuIkM8omC1fBG
         XjlFkTs+tgcTdvTerxjjGhISqVOTuLwKBY+d7zryde9Kg1ZwupbLNR2Fs52pPpIaRz/Y
         LzUS4kWSgK1wRv05oU0KYFCAeapo4StJa3w0Jl+8Oc7v8KMuKnrTcwwGLl+wRg4+VLZ8
         jgS4YS/chRyeGCBPeLEFmbpgdLrqHgRyWV9wfXWpadBH+SljTtP9tLPb0GCmgqw7Ec/S
         o9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jE/TIuKBojv1iuFg/T5O/fed0z0GfnmGxLAakbUu4oY=;
        b=hGHU5TlV4SZji1g8B+2Fh8wPhzOmblf4PGK6k48BMQTg7us2EeJ4uI7jT4KGJM20+r
         sPOyLgsGkXwm/wI/zFI0w94U1AqrObwWupflv0goYPiksjMF0DxNDbJ/7a36JflDOb7Z
         ulYuFvDhRES6HTiGQ2C21IdZ4i9StYlsCsbuQvdFA+BEJbNapazMzKmy+j9slIN1iOLu
         /gb7WrASEujzBETi0qzS3Hj7nFvLgLumW2LgrOkjlYyzU0UiBazvw7gw4A4mrSml/vg4
         hsluayYAf7iawKWO7e754CqbRDb/Cqe+7t4NaAcsJo/nCHQLh8/+2IWpk2MJuo1MCATH
         zGwQ==
X-Gm-Message-State: AOAM532UBsHc1mMpdBPp5ZuhW6uXHjt+tsUaxThDQupPXF5xj71jALq/
        ajEikZp2I0BgkoSVI8/83QM=
X-Google-Smtp-Source: ABdhPJzK+hkd/wpfDhRxZiEaIuttcbu2ggk+EolTJL37Sv5yA/IDXUCz8EzJworDthVCTht66uOClA==
X-Received: by 2002:a63:4c63:: with SMTP id m35mr45213490pgl.105.1620990162254;
        Fri, 14 May 2021 04:02:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 May 2021 04:02:41 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
        alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, mturquette@baylibre.com
Cc:     sboyd@kernel.org, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-clk@vger.kernel.org,
        Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH 1/4] drm/panel: Add ilitek ili9341 panel driver
Date:   Fri, 14 May 2021 19:02:29 +0800
Message-Id: <1620990152-19255-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This driver combine tiny/ili9341.c mipi_dbi_interface driver
with mipi_dpi_interface driver, can support ili9341 with serial
mode or parallel rgb interface mode by register configuration.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/lkml/1590378348-8115-7-git-send-email-dillon.minfei@gmail.com/
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                |   12 +
 drivers/gpu/drm/panel/Makefile               |    1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
 3 files changed, 1298 insertions(+)
 create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..e4babba17864 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -123,6 +123,18 @@ config DRM_PANEL_ILITEK_IL9322
 	  Say Y here if you want to enable support for Ilitek IL9322
 	  QVGA (320x240) RGB, YUV and ITU-T BT.656 panels.
 
+config DRM_PANEL_ILITEK_ILI9341
+	tristate "Ilitek ILI9341 240x320 QVGA panels"
+	depends on OF && SPI
+	depends on DRM_KMS_HELPER
+	depends on DRM_KMS_CMA_HELPER
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for Ilitek IL9341
+	  QVGA (240x320) RGB panels. support serial & parallel rgb
+	  interface.
+
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index cae4d976c069..0ecde184665d 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
 obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
new file mode 100644
index 000000000000..f84983cbb250
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -0,0 +1,1285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ilitek ILI9341 TFT LCD drm_panel driver.
+ *
+ * This panel can be configured to support:
+ * - 16-bit parallel RGB interface
+ * - 18-bit parallel RGB interface
+ * - 4-line serial spi interface
+ *
+ * Copyright (C) 2020 Dillon Min <dillon.minfei@gmail.com>
+ * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/delay.h>
+#include <video/mipi_display.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_atomic_helper.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+
+#define ILI9341_RGB_INTERFACE  0xb0   /* RGB Interface Signal Control */
+#define ILI9341_FRC            0xb1   /* Frame Rate Control register */
+#define ILI9341_DFC            0xb6   /* Display Function Control register */
+#define ILI9341_POWER1         0xc0   /* Power Control 1 register */
+#define ILI9341_POWER2         0xc1   /* Power Control 2 register */
+#define ILI9341_VCOM1          0xc5   /* VCOM Control 1 register */
+#define ILI9341_VCOM2          0xc7   /* VCOM Control 2 register */
+#define ILI9341_POWERA         0xcb   /* Power control A register */
+#define ILI9341_POWERB         0xcf   /* Power control B register */
+#define ILI9341_PGAMMA         0xe0   /* Positive Gamma Correction register */
+#define ILI9341_NGAMMA         0xe1   /* Negative Gamma Correction register */
+#define ILI9341_DTCA           0xe8   /* Driver timing control A */
+#define ILI9341_DTCB           0xea   /* Driver timing control B */
+#define ILI9341_POWER_SEQ      0xed   /* Power on sequence register */
+#define ILI9341_3GAMMA_EN      0xf2   /* 3 Gamma enable register */
+#define ILI9341_INTERFACE      0xf6   /* Interface control register */
+#define ILI9341_PRC            0xf7   /* Pump ratio control register */
+#define ILI9341_ETMOD	       0xb7   /* Entry mode set */
+
+#define ILI9341_MADCTL_BGR	BIT(3)
+#define ILI9341_MADCTL_MV	BIT(5)
+#define ILI9341_MADCTL_MX	BIT(6)
+#define ILI9341_MADCTL_MY	BIT(7)
+
+
+#define ILI9341_POWER_B_LEN	3
+#define ILI9341_POWER_SEQ_LEN	4
+#define ILI9341_DTCA_LEN	3
+#define ILI9341_DTCB_LEN	2
+#define ILI9341_POWER_A_LEN	5
+#define ILI9341_DFC_1_LEN	2
+#define ILI9341_FRC_LEN		2
+#define ILI9341_VCOM_1_LEN	2
+#define ILI9341_DFC_2_LEN	4
+#define ILI9341_COLUMN_ADDR_LEN	4
+#define ILI9341_PAGE_ADDR_LEN	4
+#define ILI9341_INTERFACE_LEN	3
+#define ILI9341_PGAMMA_LEN	15
+#define ILI9341_NGAMMA_LEN	15
+#define ILI9341_CA_LEN		3
+
+#define ILI9341_PIXEL_DPI_16_BITS	(BIT(6)|BIT(4))
+#define ILI9341_PIXEL_DPI_18_BITS	(BIT(6)|BIT(5))
+#define ILI9341_GAMMA_CURVE_1		BIT(0)
+#define ILI9341_IF_WE_MODE		BIT(0)
+#define ILI9341_IF_BIG_ENDIAN		0x00
+#define ILI9341_IF_DM_RGB		BIT(2)
+#define ILI9341_IF_DM_INTERNAL		0x00
+#define ILI9341_IF_DM_VSYNC		BIT(3)
+#define ILI9341_IF_RM_RGB		BIT(1)
+#define ILI9341_IF_RIM_RGB		0x00
+
+#define ILI9341_COLUMN_ADDR		0x00ef
+#define ILI9341_PAGE_ADDR		0x013f
+
+#define ILI9341_RGB_EPL			BIT(0)
+#define ILI9341_RGB_DPL			BIT(1)
+#define ILI9341_RGB_HSPL		BIT(2)
+#define ILI9341_RGB_VSPL		BIT(3)
+#define ILI9341_RGB_DE_MODE		BIT(6)
+#define ILI9341_RGB_DISP_PATH_MEM	BIT(7)
+
+#define ILI9341_DBI_VCOMH_4P6V		0x23
+#define ILI9341_DBI_PWR_2_DEFAULT	0x10
+#define ILI9341_DBI_PRC_NORMAL		0x20
+#define ILI9341_DBI_VCOM_1_VMH_4P25V	0x3e
+#define ILI9341_DBI_VCOM_1_VML_1P5V	0x28
+#define ILI9341_DBI_VCOM_2_DEC_58	0x86
+#define ILI9341_DBI_FRC_DIVA		0x00
+#define ILI9341_DBI_FRC_RTNA		0x1b
+#define ILI9341_DBI_EMS_GAS		BIT(0)
+#define ILI9341_DBI_EMS_DTS		BIT(1)
+#define ILI9341_DBI_EMS_GON		BIT(2)
+/**
+ * ili9341_command - ili9341 command with optional parameter(s)
+ * @ili: struct ili9341
+ * @cmd: Command
+ * @seq...: Optional parameter(s)
+ *
+ * Send command to the controller.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+#define ili9341_command(ili, cmd, seq...) \
+({ \
+	u8 d[] = { seq }; \
+	_ili9341_command(ili, cmd, d, ARRAY_SIZE(d)); \
+})
+
+/**
+ * struct ili9341_config - the system specific ILI9341 configuration
+ * @max_spi_speed: 10000000
+ */
+struct ili9341_config {
+	u32 max_spi_speed;
+	/** @mode: the drm display mode */
+	const struct drm_display_mode mode;
+	/** @ca: TODO: need comments for this register */
+	u8 ca[ILI9341_CA_LEN];
+	/** @power_b: TODO: need comments for this register */
+	u8 power_b[ILI9341_POWER_B_LEN];
+	/** @power_seq: TODO: need comments for this register */
+	u8 power_seq[ILI9341_POWER_SEQ_LEN];
+	/** @dtca: TODO: need comments for this register */
+	u8 dtca[ILI9341_DTCA_LEN];
+	/** @dtcb: TODO: need comments for this register */
+	u8 dtcb[ILI9341_DTCB_LEN];
+	/** @power_a: TODO: need comments for this register */
+	u8 power_a[ILI9341_POWER_A_LEN];
+	/** @frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
+	/*
+	 * Formula to calculate frame frequency:
+	 * Frame Rate=fosc/(Clocks per line x Division ratio x
+	 * (Lines+VBP+VFP))
+	 *
+	 * Sets the division ratio for internal clocks of Normal mode at MCU
+	 * interface.
+	 *
+	 * fosc : internal oscillator frequency
+	 * Clocks per line : RTNA setting
+	 * Division ratio : DIVA setting
+	 * Lines : total driving line number
+	 * VBP : back porch line number
+	 * VFP : front porch line number
+	 *
+	 * RTNA [4:0] Frame Rate (Hz)   RTNA [4:0] Frame Rate (Hz)
+	 * 1 0 0 0 0  119		1 1 0 0 0  79
+	 * 1 0 0 0 1  112		1 1 0 0 1  76
+	 * 1 0 0 1 0  106		1 1 0 1 0  73
+	 * 1 0 0 1 1  100		1 1 0 1 1  70(default)
+	 * 1 0 1 0 0  95		1 1 1 0 0  68
+	 * 1 0 1 0 1  90		1 1 1 0 1  65
+	 * 1 0 1 1 0  86		1 1 1 0 1  63
+	 * 1 0 1 1 1  83		1 1 1 1 1  61
+	 *
+	 * DIVA [1:0] : division ratio for internal clocks when Normal mode.
+	 *
+	 * DIVA [1:0] Division Ratio
+	 * 0 0 fosc
+	 * 0 1 fosc / 2
+	 * 1 0 fosc / 4
+	 * 1 1 fosc / 8
+	 *
+	 */
+	u8 frc[ILI9341_FRC_LEN];
+	/** @prc: TODO: need comments for this register */
+	u8 prc;
+	/** @dfc_1: B6h DISCTRL (Display Function Control) */
+	/*               D/CX RDX WRX D17-8 D7  D6 D5 D4 D3   D2  D1  D0  HEX
+	 * Command       0    1   M   XX    1   0  1  1  0    1   1   0   B6h
+	 * 1st Parameter 1    1   M   XX    0   0  0  0  PTG[1:0] PT[1:0] 0A
+	 * 2nd Parameter 1    1   M   XX    REV GS SS SM ISC[3:0]         82
+	 * 3rd Parameter 1    1   M   XX    0   0  NL[5:0]                27
+	 * 4th Parameter 1    1   M   XX    0   0  PCDIV[5:0]             XX
+	 *
+	 * PTG [1:0]: Set the scan mode in non-display area.
+	 * PTG1 | PTG0 | Gate outputs in   | Source outputs in  | VCOM output
+	 *               non-display area  | non-display area   |
+	 * 1      0      Interval scan       Set with the PT[2:0] bits
+	 *
+	 * PT [1:0]: Determine source/VCOM output in a non-display area in the
+	 * partial display mode.
+	 * 1    0    AGND       AGND       AGND         AGND
+	 *
+	 * REV: Select whether the liquid crystal type is normally white type
+	 * or normally black type.
+	 * REV   Liquid crystal type
+	 * 0     Normally black
+	 * 1     Normally white
+	 *
+	 * SS: Select the shift direction of outputs from the source driver.
+	 * SS    Source Output Scan Direction
+	 * 0     S1 -> S720
+	 * 1     S720 -> S1
+	 *
+	 * GS: Sets the direction of scan by the gate driver in the range
+	 * determined by SCN [4:0] and NL [4:0]. The scan direction
+	 * determined by GS = 0 can be reversed by setting GS = 1.
+	 *
+	 * GS     Gate Output Scan Direction
+	 * 0      G1 -> G320
+	 * 1      G320 -> G1
+	 */
+	u8 dfc_1[ILI9341_DFC_1_LEN];
+	 /** @power_1: Power Control 1 (C0h) */
+	 /* VRH [5:0]: Set the GVDD level, which is a reference level for the
+	 * VCOM level and the grayscale voltage level.
+	 *
+	 * VRH[5:0]    GVDD			VRH[5:0]	GVDD
+	 * 0 0 0 0 0 0 Setting prohibited	1 0 0 0 0 0	4.45 V
+	 * 0 0 0 0 0 1 Setting prohibited	1 0 0 0 0 1	4.50 V
+	 * 0 0 0 0 1 0 Setting prohibited	1 0 0 0 1 0	4.55 V
+	 * 0 0 0 0 1 1 3.00 V			1 0 0 0 1 1	4.60 V
+	 * 0 0 0 1 0 0 3.05 V			1 0 0 1 0 0	4.65 V
+	 * 0 0 0 1 0 1 3.10 V			1 0 0 1 0 1	4.70 V
+	 * 0 0 0 1 1 0 3.15 V			1 0 0 1 1 0	4.75 V
+	 * 0 0 0 1 1 1 3.20 V			1 0 0 1 1 1	4.80 V
+	 * 0 0 1 0 0 0 3.25 V			1 0 1 0 0 0	4.85 V
+	 * 0 0 1 0 0 1 3.30 V			1 0 1 0 0 1	4.90 V
+	 * 0 0 1 0 1 0 3.35 V			1 0 1 0 1 0	4.95 V
+	 * 0 0 1 0 1 1 3.40 V			1 0 1 0 1 1	5.00 V
+	 * 0 0 1 1 0 0 3.45 V			1 0 1 1 0 0	5.05 V
+	 * 0 0 1 1 0 1 3.50 V			1 0 1 1 0 1	5.10 V
+	 * 0 0 1 1 1 0 3.55 V			1 0 1 1 1 0	5.15 V
+	 * 0 0 1 1 1 1 3.60 V			1 0 1 1 1 1	5.20 V
+	 * 0 1 0 0 0 0 3.65 V			1 1 0 0 0 0	5.25 V
+	 * 0 1 0 0 0 1 3.70 V			1 1 0 0 0 1	5.30 V
+	 * 0 1 0 0 1 0 3.75 V			1 1 0 0 1 0	5.35 V
+	 * 0 1 0 0 1 1 3.80 V			1 1 0 0 1 1	5.40 V
+	 * 0 1 0 1 0 0 3.85 V			1 1 0 1 0 0	5.45 V
+	 * 0 1 0 1 0 1 3.90 V			1 1 0 1 0 1	5.50 V
+	 * 0 1 0 1 1 0 3.95 V			1 1 0 1 1 0	5.55 V
+	 * 0 1 0 1 1 1 4.00 V			1 1 0 1 1 1	5.60 V
+	 * 0 1 1 0 0 0 4.05 V			1 1 1 0 0 0	5.65 V
+	 * 0 1 1 0 0 1 4.10 V			1 1 1 0 0 1	5.70 V
+	 * 0 1 1 0 1 0 4.15 V			1 1 1 0 1 0	5.75 V
+	 * 0 1 1 0 1 1 4.20 V			1 1 1 0 1 1	5.80 V
+	 * 0 1 1 1 0 0 4.25 V			1 1 1 1 0 0	5.85 V
+	 * 0 1 1 1 0 1 4.30 V			1 1 1 1 0 1	5.90 V
+	 * 0 1 1 1 1 0 4.35 V			1 1 1 1 1 0	5.95 V
+	 * 0 1 1 1 1 1 4.40 V			1 1 1 1 1 1	6.00 V
+	 */
+	u8 power_1;
+	/** @power_2: Power Control 2 (C1h) */
+	/*
+	 * BT [2:0]: Sets the factor used in the step-up circuits.
+	 * Select the optimal step-up factor for the operating voltage. To
+	 * reduce power consumption, set a smaller factor.
+	 *
+	 * BT[2:0]   AVDD     VGH      VGL
+	 * 0 0 0     VCI x 2  VCI x 7  VCI x 4
+	 * 0 0 1                       VCI x 3
+	 * 0 1 0              VCI x 6  VCI x 4
+	 * 0 1 1		       VCI x 3
+	 *
+	 */
+	u8 power_2;
+	/** @vcom_1: VCOM Control 1(C5h) */
+	/*
+	 * VMH [6:0] : Set the VCOMH voltage
+	 *
+	 * VMH[6:0] VCOMH(V) VMH[6:0] VCOMH(V) VMH[6:0] VCOMH(V) VMH[6:0] VCOMH
+	 * 0000000  2.700    0100000  3.500    1000000  4.300    1100000  5.100
+	 * 0000001  2.725    0100001  3.525    1000001  4.325    1100001  5.125
+	 * 0000010  2.750    0100010  3.550    1000010  4.350    1100010  5.150
+	 * 0000011  2.775    0100011  3.575    1000011  4.375    1100011  5.175
+	 * 0000100  2.800    0100100  3.600    1000100  4.400    1100100  5.200
+	 * 0000101  2.825    0100101  3.625    1000101  4.425    1100101  5.225
+	 * 0000110  2.850    0100110  3.650    1000110  4.450    1100110  5.250
+	 * 0000111  2.875    0100111  3.675    1000111  4.475 	 1100111  5.275
+	 * 0001000  2.900    0101000  3.700    1001000  4.500 	 1101000  5.300
+	 * 0001001  2.925    0101001  3.725    1001001  4.525 	 1101001  5.325
+	 * 0001010  2.950    0101010  3.750    1001010  4.550 	 1101010  5.350
+	 * 0001011  2.975    0101011  3.775    1001011  4.575 	 1101011  5.375
+	 * 0001100  3.000    0101100  3.800    1001100  4.600 	 1101100  5.400
+	 * 0001101  3.025    0101101  3.825    1001101  4.625 	 1101101  5.425
+	 * 0001110  3.050    0101110  3.850    1001110  4.650 	 1101110  5.450
+	 * 0001111  3.075    0101111  3.875    1001111  4.675 	 1101111  5.475
+	 * 0010000  3.100    0110000  3.900    1010000  4.700 	 1110000  5.500
+	 * 0010001  3.125    0110001  3.925    1010001  4.725 	 1110001  5.525
+	 * 0010010  3.150    0110010  3.950    1010010  4.750 	 1110010  5.550
+	 * 0010011  3.175    0110011  3.975    1010011  4.775 	 1110011  5.575
+	 * 0010100  3.200    0110100  4.000    1010100  4.800 	 1110100  5.600
+	 * 0010101  3.225    0110101  4.025    1010101  4.825 	 1110101  5.625
+	 * 0010110  3.250    0110110  4.050    1010110  4.850 	 1110110  5.650
+	 * 0010111  3.275    0110111  4.075    1010111  4.875 	 1110111  5.675
+	 * 0011000  3.300    0111000  4.100    1011000  4.900 	 1111000  5.700
+	 * 0011001  3.325    0111001  4.125    1011001  4.925 	 1111001  5.725
+	 * 0011010  3.350    0111010  4.150    1011010  4.950 	 1111010  5.750
+	 * 0011011  3.375    0111011  4.175    1011011  4.975 	 1111011  5.775
+	 * 0011100  3.400    0111100  4.200    1011100  5.000 	 1111100  5.800
+	 * 0011101  3.425    0111101  4.225    1011101  5.025 	 1111101  5.825
+	 * 0011110  3.450    0111110  4.250    1011110  5.050 	 1111110  5.850
+	 * 0011111  3.475    0111111  4.275    1011111  5.075    1111111  5.875
+	 *
+	 * VML[6:0] : Set the VCOML voltage
+	 *
+	 * VML[6:0] VCOML(V) VML[6:0] VCOML(V) VML[6:0] VCOML(V) VML[6:0] VCOML
+	 * 0000000 -2.500 0100000 -1.700 1000000 -0.900 1100000 -0.100
+	 * 0000001 -2.475 0100001 -1.675 1000001 -0.875 1100001 -0.075
+	 * 0000010 -2.450 0100010 -1.650 1000010 -0.850 1100010 -0.050
+	 * 0000011 -2.425 0100011 -1.625 1000011 -0.825 1100011 -0.025
+	 * 0000100 -2.400 0100100 -1.600 1000100 -0.800 1100100 0
+	 * 0000101 -2.375 0100101 -1.575 1000101 -0.775 1100101 Reserved
+	 * 0000110 -2.350 0100110 -1.550 1000110 -0.750 1100110 Reserved
+	 * 0000111 -2.325 0100111 -1.525 1000111 -0.725 1100111 Reserved
+	 * 0001000 -2.300 0101000 -1.500 1001000 -0.700 1101000 Reserved
+	 * 0001001 -2.275 0101001 -1.475 1001001 -0.675 1101001 Reserved
+	 * 0001010 -2.250 0101010 -1.450 1001010 -0.650 1101010 Reserved
+	 * 0001011 -2.225 0101011 -1.425 1001011 -0.625 1101011 Reserved
+	 * 0001100 -2.200 0101100 -1.400 1001100 -0.600 1101100 Reserved
+	 * 0001101 -2.175 0101101 -1.375 1001101 -0.575 1101101 Reserved
+	 * 0001110 -2.150 0101110 -1.350 1001110 -0.550 1101110 Reserved
+	 * 0001111 -2.125 0101111 -1.325 1001111 -0.525 1101111 Reserved
+	 * 0010000 -2.100 0110000 -1.300 1010000 -0.500 1110000 Reserved
+	 * 0010001 -2.075 0110001 -1.275 1010001 -0.475 1110001 Reserved
+	 * 0010010 -2.050 0110010 -1.250 1010010 -0.450 1110010 Reserved
+	 * 0010011 -2.025 0110011 -1.225 1010011 -0.425 1110011 Reserved
+	 * 0010100 -2.000 0110100 -1.200 1010100 -0.400 1110100 Reserved
+	 * 0010101 -1.975 0110101 -1.175 1010101 -0.375 1110101 Reserved
+	 * 0010110 -1.950 0110110 -1.150 1010110 -0.350 1110110 Reserved
+	 * 0010111 -1.925 0110111 -1.125 1010111 -0.325 1110111 Reserved
+	 * 0011000 -1.900 0111000 -1.100 1011000 -0.300 1111000 Reserved
+	 * 0011001 -1.875 0111001 -1.075 1011001 -0.275 1111001 Reserved
+	 * 0011010 -1.850 0111010 -1.050 1011010 -0.250 1111010 Reserved
+	 * 0011011 -1.825 0111011 -1.025 1011011 -0.225 1111011 Reserved
+	 * 0011100 -1.800 0111100 -1.000 1011100 -0.200 1111100 Reserved
+	 * 0011101 -1.775 0111101 -0.975 1011101 -0.175 1111101 Reserved
+	 * 0011110 -1.750 0111110 -0.950 1011110 -0.150 1111110 Reserved
+	 * 0011111 -1.725 0111111 -0.925 1011111 -0.125 1111111 Reserved
+	 */
+	u8 vcom_1[ILI9341_VCOM_1_LEN];
+	/** @vcom_2: VCOM Control 2(C7h) */
+	/*
+	 * C7h		VMCTRL1 (VCOM Control 1)
+	 *		D/CX RDX WRX D17-8 D7  D6  D5 D4 D3 D2 D1 D0 HEX
+	 * Command 	0    1   M   XX    1   1   0  0  0  1  1  1  C7h
+	 * Parameter 	1    1   M   XX    nVM VMF[6:0]              C0
+	 *
+	 * nVM: nVM equals to “0” after power on reset and VCOM offset
+	 * equals to program MTP value. When nVM set to “1”, setting
+	 * of VMF [6:0] becomes valid and VCOMH/VCOML can be adjusted.
+	 *
+	 * VMF [6:0]: Set the VCOM offset voltage.
+	 */
+	u8 vcom_2;
+	/** @address_mode: Memory Access Control (36h) */
+	/*
+	 * 36h 		MADCTL (Memory Access Control)
+	 * 		D/CX RDX WRX D17-8 D7 D6 D5 D4 D3  D2 D1 D0 HEX
+	 * Command 	0    1   M   XX    0  0  1  1  0   1  1  0  36h
+	 * Parameter 	1    1   M   XX    MY MX MV ML BGR MH 0  0  00
+	 *
+	 * This command defines read/write scanning direction of frame memory.
+	 * This command makes no change on the other driver status.
+	 *
+	 * Bit  Name 			 Description
+	 * MY   Row Address Order
+	 * MX   Column Address Order
+	 * MV 	Row / Column Exchange 	 These 3 bits control MCU to memory
+	 * 				 write/read direction.
+	 * ML 	Vertical Refresh Order 	 LCD vertical refresh direction control.
+	 * BGR 	RGB-BGR Order		 Color selector switch control
+	 *                               (0=RGB color filter panel, 1=BGR
+	 *                               color filter panel)
+	 * MH 	Horizontal Refresh ORDER LCD horizontal refreshing
+	 * direction control.
+	 *
+	 * Note: When BGR bit is changed, the new setting is active
+	 * immediately without update the content in Frame Memory again.
+	 *
+	 */
+	u8 address_mode;
+	/** @g3amma_en: TODO: need comments for this register */
+	u8 g3amma_en;
+	/** @rgb_interface: RGB Interface Signal Control (B0h) */
+	/*
+	 * B0h 		IFMODE (Interface Mode Control)
+	 * 		D/CX RDX WRX D17-8 D7 	       D6     D5     D4 D3   D2   D1  D0  HEX
+	 * Command 	0    1   M   XX    1 	       0      1      1  0    0    0   0   B0h
+	 * Parameter 	1    1   M   XX    ByPass_MODE RCM[1] RCM[0] 0  VSPL HSPL DPL EPL 40
+	 *
+	 * Sets the operation status of the display interface. The setting
+	 * becomes effective as soon as the command is received.
+	 * EPL: DE polarity (“0”= High enable for RGB interface, “1”= Low
+	 * enable for RGB interface)
+	 *
+	 * DPL: DOTCLK polarity set (“0”= data fetched at the rising time,
+	 * “1”= data fetched at the falling time)
+	 *
+	 * HSPL: HSYNC polarity (“0”= Low level sync clock, “1”= High
+	 * level sync clock)
+	 *
+	 * VSPL: VSYNC polarity (“0”= Low level sync clock, “1”= High
+	 * level sync clock)
+	 *
+	 * RCM [1:0]: RGB interface selection (refer to the RGB interface
+	 * section).
+	 *
+	 * ByPass_MODE: Select display data path whether Memory or Direct to
+	 * Shift register when RGB Interface is used.
+	 *
+	 * ByPass_MODE 	Display Data Path
+	 * 0 		Direct to Shift Register (default)
+	 * 1 		Memory
+	 */
+	u8 rgb_interface;
+	/** @dfc_2: refer to dfc_1 */
+	u8 dfc_2[ILI9341_DFC_2_LEN];
+	/** @column_addr: Column Address Set (2Ah) */
+	/* This command is used to define area of frame memory where MCU can
+	 * access. This command makes no change on the
+	 * other driver status. The values of SC [15:0] and EC [15:0] are
+	 * referred when RAMWR command comes. Each value
+	 * represents one column line in the Frame Memory.
+	 */
+	u8 column_addr[ILI9341_COLUMN_ADDR_LEN];
+	/** @page_addr: Page Address Set (2Bh) */
+	/* This command is used to define area of frame memory where MCU can
+	 * access. This command makes no change on the
+	 * other driver status. The values of SP [15:0] and EP [15:0] are
+	 * referred when RAMWR command comes. Each value
+	 * represents one Page line in the Frame Memory.
+	 */
+	u8 page_addr[ILI9341_PAGE_ADDR_LEN];
+	/** @interface: Interface Control (F6h) */
+	/*
+	 * F6h 		IFCTL (16bits Data Format Selection)
+	 * 	        D/CX RDX WRX D17-8 D7   D6   D5     D4     D3      D2     D1     D0      HEX
+	 * Command      0    1   M   XX    1    1    1      1      0       1      1      0       F6h
+	 * 1stParameter 1    1   M   XX    MY   MX   MV
+	 * 				   _EOR _EOR _EOR   0      BGR_EOR 0      0      WE MODE 01
+	 * 2ndParameter 1    1   M   XX    0    0    EPF[1] EPF[0] 0       0      MDT[1] MDT[0]  00
+	 * 3rdParameter 1    1   M   XX    0    0    ENDIAN 0      DM[1]   DM[0]  RM     RIM     00
+	 *
+	 */
+	u8 interface[ILI9341_INTERFACE_LEN];
+	/** @pixel_format: This command sets the pixel format for the RGB image data used by */
+	/* the interface. DPI [2:0] is the pixel format select of RGB
+	 * interface and DBI [2:0] is the pixel format of MCU interface. If a
+	 * particular interface, either RGB interface or MCU interface, is
+	 * not used then the corresponding bits in the parameter are ignored.
+	 * The pixel format is shown in the table below.
+	 *
+	 * DPI[2:0] 	RGB Interface Format 	DBI[2:0] MCU Interface Format
+	 * 0 0 0 	Reserved 		0 0 0 	 Reserved
+	 * 0 0 1 	Reserved 		0 0 1 	 Reserved
+	 * 0 1 0 	Reserved 		0 1 0 	 Reserved
+	 * 0 1 1 	Reserved 		0 1 1 	 Reserved
+	 * 1 0 0 	Reserved 		1 0 0  	 Reserved
+	 * 1 0 1 	16 bits / pixel 	1 0 1    16 bits / pixel
+	 * 1 1 0 	18 bits / pixel 	1 1 0 	 18 bits / pixel
+	 * 1 1 1 	Reserved 		1 1 1 	 Reserved
+	 *
+	 */
+	u8 pixel_format;
+	/** @gamma_curve: This command is used to select the desired Gamma curve for the */
+	/* current display. A maximum of 4 fixed gamma curves can
+	 * be selected. The curve is selected by setting the appropriate bit
+	 * in the parameter as described in the Table:
+	 *
+	 * GC [7:0] 	Curve Selected
+	 * 01h 		Gamma curve 1 (G2.2)
+	 * 02h 		---
+	 * 04h 		---
+	 * 08h 		---
+	 */
+	u8 gamma_curve;
+	/** @pgamma: Positive Gamma Correction (E0h) */
+	/*
+	 * Set the gray scale voltage to adjust the gamma characteristics of
+	 * the TFT panel.
+	 */
+	u8 pgamma[ILI9341_PGAMMA_LEN];
+	/** @ngamma: Negative Gamma Correction (E1h) */
+	/*
+	 * Set the gray scale voltage to adjust the gamma characteristics of
+	 * the TFT panel.
+	 */
+	u8 ngamma[ILI9341_NGAMMA_LEN];
+};
+
+struct ili9341 {
+	struct device *dev;
+	const struct ili9341_config *conf;
+	struct drm_panel panel;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *dc_gpio;
+	u32 max_spi_speed;
+	struct regulator *vcc;
+};
+
+/*
+ * The Stm32f429-disco board has a panel ili9341 connected to ltdc controller
+ */
+static const struct ili9341_config ili9341_stm32f429_disco_data = {
+	.max_spi_speed = 10000000,
+	.mode = {
+		.clock = 6100,
+		.hdisplay = 240,
+		.hsync_start = 240 + 10,/* hfp 10 */
+		.hsync_end = 240 + 10 + 10,/* hsync 10 */
+		.htotal = 240 + 10 + 10 + 20,/* hbp 20 */
+		.vdisplay = 320,
+		.vsync_start = 320 + 4,/* vfp 4 */
+		.vsync_end = 320 + 4 + 2,/* vsync 2 */
+		.vtotal = 320 + 4 + 2 + 2,/* vbp 2 */
+		.flags = 0,
+		.width_mm = 65,
+		.height_mm = 50,
+		.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	/* TODO: need comments for this register */
+	.ca = {0xc3, 0x08, 0x50},
+	/* TODO: need comments for this register */
+	.power_b = {0x00, 0xc1, 0x30},
+	/* TODO: need comments for this register */
+	.power_seq = {0x64, 0x03, 0x12, 0x81},
+	/* TODO: need comments for this register */
+	.dtca = {0x85, 0x00, 0x78},
+	/* TODO: need comments for this register */
+	.power_a = {0x39, 0x2c, 0x00, 0x34, 0x02},
+	/* TODO: need comments for this register */
+	.prc = 0x20,
+	/* TODO: need comments for this register */
+	.dtcb = {0x00, 0x00},
+	/* 0x00 fosc, 0x1b 70hz */
+	.frc = {0x00, 0x1b},
+	/* 0x0a Interval scan, AGND AGND AGND AGND
+	 * 0xa2 Normally white, G1 -> G320, S720 -> S1,
+	 *	Scan Cycle 5 frames,85ms
+	 */
+	.dfc_1 = {0x0a, 0xa2},
+	/* 0x10 3.65v */
+	.power_1 = 0x10,
+	/* 0x10 AVDD=vci*2, VGH=vci*7, VGL=-vci*4 */
+	.power_2 = 0x10,
+	/* 0x45 VCOMH 4.425v, 0x15 VCOML -1.975*/
+	.vcom_1 = {0x45, 0x15},
+	/* 0x90 offset voltage, VMH-48, VML-48 */
+	.vcom_2 = 0x90,
+	/* 0xc8 Row Address Order, Column Address Order
+	 * 	BGR 1
+	 */
+	.address_mode = 0xc8,
+	.g3amma_en = 0x00,
+	/* 0xc2
+	 * Display Data Path: Memory
+	 * RGB: DE mode
+	 * DOTCLK polarity set (data fetched at the falling time)
+	 */
+	.rgb_interface = ILI9341_RGB_DISP_PATH_MEM |
+			ILI9341_RGB_DE_MODE |
+			ILI9341_RGB_DPL,
+	/*
+	 * 0x0a
+	 * Gate outputs in non-display area: Interval scan
+	 * Determine source/VCOM output in a non-display area in the partial
+	 * display mode: AGND AGND AGND AGND
+	 *
+	 * 0xa7
+	 * Scan Cycle: 15 frames
+	 * fFLM = 60Hz: 255ms
+	 * Liquid crystal type: Normally white
+	 * Gate Output Scan Direction: G1 -> G320
+	 * Source Output Scan Direction: S720 -> S1
+	 *
+	 * 0x27
+	 * LCD Driver Line: 320 lines
+	 *
+	 * 0x04
+	 * PCDIV: 4
+	 */
+	.dfc_2 = {0x0a, 0xa7, 0x27, 0x04},
+	/* column address: 240 */
+	.column_addr = {0x00, 0x00, (ILI9341_COLUMN_ADDR >> 4) & 0xff,
+				ILI9341_COLUMN_ADDR & 0xff},
+	/* page address: 320 */
+	.page_addr = {0x00, 0x00, (ILI9341_PAGE_ADDR >> 4) & 0xff,
+				ILI9341_PAGE_ADDR & 0xff},
+	/* Memory write control: When the transfer number of data exceeds
+	 * (EC-SC+1)*(EP-SP+1), the column and page number will be
+	 * reset, and the exceeding data will be written into the following
+	 * column and page.
+	 * Display Operation Mode: RGB Interface Mode
+	 * Interface for RAM Access: RGB interface
+	 * 16- bit RGB interface (1 transfer/pixel)
+	 */
+	.interface = {ILI9341_IF_WE_MODE, 0x00,
+			ILI9341_IF_DM_RGB | ILI9341_IF_RM_RGB},
+	/* DPI: 16 bits / pixel */
+	.pixel_format = ILI9341_PIXEL_DPI_16_BITS,
+	/* Curve Selected: Gamma curve 1 (G2.2) */
+	.gamma_curve = ILI9341_GAMMA_CURVE_1,
+	.pgamma = {0x0f, 0x29, 0x24, 0x0c, 0x0e,
+			0x09, 0x4e, 0x78, 0x3c, 0x09,
+			0x13, 0x05, 0x17, 0x11, 0x00},
+	.ngamma = {0x00, 0x16, 0x1b, 0x04, 0x11,
+			0x07, 0x31, 0x33, 0x42, 0x05,
+			0x0c, 0x0a, 0x28, 0x2f, 0x0f},
+};
+
+static inline struct ili9341 *panel_to_ili9341(struct drm_panel *panel)
+{
+	return container_of(panel, struct ili9341, panel);
+}
+
+static int ili9341_spi_transfer(struct spi_device *spi, u32 speed_hz,
+			  u8 bpw, const void *buf, size_t len)
+{
+	size_t max_chunk = spi_max_transfer_size(spi);
+	struct spi_transfer tr = {
+		.bits_per_word = bpw,
+		.speed_hz = speed_hz,
+		.len = len,
+	};
+	struct spi_message m;
+	size_t chunk;
+	int ret;
+
+	spi_message_init_with_transfers(&m, &tr, 1);
+
+	while (len) {
+		chunk = min(len, max_chunk);
+
+		tr.tx_buf = buf;
+		tr.len = chunk;
+		buf += chunk;
+		len -= chunk;
+
+		ret = spi_sync(spi, &m);
+		if (ret) {
+			dev_err(&spi->dev, "spi_sync error: %d\n", ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int _ili9341_command(struct ili9341 *ili, u8 cmd, const void *data,
+				    size_t count)
+{
+	struct spi_device *spi = to_spi_device(ili->dev);
+	int ret = 0;
+
+	gpiod_set_value_cansleep(ili->dc_gpio, 0);
+
+	ret = ili9341_spi_transfer(spi, ili->max_spi_speed, 8,
+					(const void *)&cmd, 1);
+	if (ret || data == NULL || count == 0) {
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ili->dc_gpio, 1);
+
+	return ili9341_spi_transfer(spi, ili->max_spi_speed, 8,
+		data, count);
+}
+
+static int ili9341_dpi_init(struct ili9341 *ili)
+{
+	int ret;
+	ret = _ili9341_command(ili, 0xca,
+			ili->conf->ca,
+			ILI9341_CA_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_POWERB,
+			ili->conf->power_b,
+			ILI9341_POWER_B_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_POWER_SEQ,
+			ili->conf->power_seq,
+			ILI9341_POWER_SEQ_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_DTCA,
+			ili->conf->dtca,
+			ILI9341_DTCA_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_POWERA,
+			ili->conf->power_a,
+			ILI9341_POWER_A_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_PRC,
+			&ili->conf->prc,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_DTCB,
+			ili->conf->dtcb,
+			ILI9341_DTCB_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_FRC,
+			ili->conf->frc,
+			ILI9341_FRC_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_DFC,
+			ili->conf->dfc_1,
+			ILI9341_DFC_1_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_POWER1,
+			&ili->conf->power_1,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_POWER2,
+			&ili->conf->power_2,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_VCOM1,
+			ili->conf->vcom_1,
+			ILI9341_VCOM_1_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_VCOM2,
+			&ili->conf->vcom_2,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, MIPI_DCS_SET_ADDRESS_MODE,
+			&ili->conf->address_mode,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_3GAMMA_EN,
+			&ili->conf->g3amma_en,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_RGB_INTERFACE,
+			&ili->conf->rgb_interface,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_DFC,
+			ili->conf->dfc_2,
+			ILI9341_DFC_2_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, MIPI_DCS_SET_COLUMN_ADDRESS,
+			ili->conf->column_addr,
+			ILI9341_COLUMN_ADDR_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, MIPI_DCS_SET_PAGE_ADDRESS,
+			ili->conf->page_addr,
+			ILI9341_PAGE_ADDR_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_INTERFACE,
+			ili->conf->interface,
+			ILI9341_INTERFACE_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, MIPI_DCS_SET_PIXEL_FORMAT,
+			&ili->conf->pixel_format,
+			1);
+	if (ret)
+		return ret;
+
+	ret = ili9341_command(ili, MIPI_DCS_WRITE_MEMORY_START);
+	if (ret)
+		return ret;
+
+	msleep(200);
+	ret = _ili9341_command(ili, MIPI_DCS_SET_GAMMA_CURVE,
+			&ili->conf->gamma_curve,
+			1);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_PGAMMA,
+			ili->conf->pgamma,
+			ILI9341_PGAMMA_LEN);
+	if (ret)
+		return ret;
+
+	ret = _ili9341_command(ili, ILI9341_NGAMMA,
+			ili->conf->ngamma,
+			ILI9341_NGAMMA_LEN);
+	if (ret)
+		return ret;
+
+	ret = ili9341_command(ili, MIPI_DCS_EXIT_SLEEP_MODE);
+	if (ret)
+		return ret;
+
+	msleep(200);
+	ret = ili9341_command(ili, MIPI_DCS_SET_DISPLAY_ON);
+	if (ret)
+		return ret;
+
+	ret = ili9341_command(ili, MIPI_DCS_WRITE_MEMORY_START);
+	if (ret)
+		return ret;
+
+	dev_info(ili->dev, "initialized display rgb interface\n");
+
+	return 0;
+}
+
+static int ili9341_dpi_power_on(struct ili9341 *ili)
+{
+	int ret = 0;
+
+	/* Assert RESET */
+	gpiod_set_value(ili->reset_gpio, 1);
+
+	/* Enable power */
+	if (!IS_ERR(ili->vcc)) {
+		ret = regulator_enable(ili->vcc);
+		if (ret < 0) {
+			dev_err(ili->dev, "unable to enable vcc\n");
+			return ret;
+		}
+	}
+	msleep(20);
+
+	/* De-assert RESET */
+	gpiod_set_value(ili->reset_gpio, 0);
+	msleep(10);
+
+	return 0;
+}
+
+static int ili9341_dpi_power_off(struct ili9341 *ili)
+{
+	/* Assert RESET */
+	gpiod_set_value(ili->reset_gpio, 1);
+
+	/* Disable power */
+	if (!IS_ERR(ili->vcc))
+		return regulator_disable(ili->vcc);
+
+	return 0;
+}
+
+static int ili9341_dpi_disable(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+
+	ili9341_command(ili, MIPI_DCS_SET_DISPLAY_OFF);
+
+	return 0;
+}
+
+static int ili9341_dpi_unprepare(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+
+	return ili9341_dpi_power_off(ili);
+}
+
+static int ili9341_dpi_prepare(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+	int ret;
+
+	ret = ili9341_dpi_power_on(ili);
+	if (ret < 0)
+		return ret;
+
+	ret = ili9341_dpi_init(ili);
+	if (ret < 0)
+		ili9341_dpi_unprepare(panel);
+
+	return ret;
+}
+
+static int ili9341_dpi_enable(struct drm_panel *panel)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+
+	ili9341_command(ili, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int ili9341_dpi_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct ili9341 *ili = panel_to_ili9341(panel);
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode;
+	struct drm_display_info *info;
+
+	info = &connector->display_info;
+	info->width_mm = ili->conf->mode.width_mm;
+	info->height_mm = ili->conf->mode.height_mm;
+
+	if (ili->conf->rgb_interface & ILI9341_RGB_DPL)
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
+	else
+		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
+
+	if (ili->conf->rgb_interface & ILI9341_RGB_EPL)
+		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;
+	else
+		info->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
+
+	mode = drm_mode_duplicate(drm, &ili->conf->mode);
+	if (!mode) {
+		DRM_ERROR("bad mode or failed to add mode\n");
+		return -EINVAL;
+	}
+	drm_mode_set_name(mode);
+
+	/* Set up the polarity */
+	if (ili->conf->rgb_interface & ILI9341_RGB_HSPL)
+		mode->flags |= DRM_MODE_FLAG_PHSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_NHSYNC;
+
+	if (ili->conf->rgb_interface & ILI9341_RGB_VSPL)
+		mode->flags |= DRM_MODE_FLAG_PVSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_NVSYNC;
+
+	drm_mode_probed_add(connector, mode);
+
+	return 1; /* Number of modes */
+}
+
+static const struct drm_panel_funcs ili9341_dpi_funcs = {
+	.disable = ili9341_dpi_disable,
+	.unprepare = ili9341_dpi_unprepare,
+	.prepare = ili9341_dpi_prepare,
+	.enable = ili9341_dpi_enable,
+	.get_modes = ili9341_dpi_get_modes,
+};
+
+static int ili9341_dpi_probe(struct spi_device *spi)
+{
+	int ret;
+	struct device *dev = &spi->dev;
+	struct ili9341 *ili;
+
+	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
+	if (!ili)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, ili);
+
+	ili->dev = dev;
+	/*
+	 * Every new incarnation of this display must have a unique
+	 * data entry for the system in this driver.
+	 */
+	ili->conf = of_device_get_match_data(dev);
+	if (!ili->conf) {
+		dev_err(dev, "missing device configuration\n");
+		return -ENODEV;
+	}
+
+	ili->vcc = devm_regulator_get_optional(dev, "vcc");
+	if (IS_ERR(ili->vcc))
+		dev_err(dev, "get optional vcc failed\n");
+
+	ili->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(ili->reset_gpio)) {
+		dev_err(dev, "failed to get RESET GPIO\n");
+		return PTR_ERR(ili->reset_gpio);
+	}
+
+	ili->dc_gpio = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(ili->dc_gpio)) {
+		dev_err(dev, "failed to get DC GPIO\n");
+		return PTR_ERR(ili->dc_gpio);
+	}
+
+	spi->bits_per_word = 8;
+	ret = spi_setup(spi);
+	if (ret < 0) {
+		dev_err(dev, "spi setup failed.\n");
+		return ret;
+	}
+
+	ili->max_spi_speed = ili->conf->max_spi_speed;
+
+	drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	drm_panel_add(&ili->panel);
+
+	return 0;
+}
+
+
+
+static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	u8 addr_mode;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+
+	mipi_dbi_command(dbi, ILI9341_POWERB, 0x00, 0xc1, 0x30);
+	mipi_dbi_command(dbi, ILI9341_POWER_SEQ, 0x64, 0x03, 0x12, 0x81);
+	mipi_dbi_command(dbi, ILI9341_DTCA, 0x85, 0x00, 0x78);
+	mipi_dbi_command(dbi, ILI9341_POWERA, 0x39, 0x2c, 0x00, 0x34, 0x02);
+	mipi_dbi_command(dbi, ILI9341_PRC, ILI9341_DBI_PRC_NORMAL);
+	mipi_dbi_command(dbi, ILI9341_DTCB, 0x00, 0x00);
+
+	/* Power Control */
+	mipi_dbi_command(dbi, ILI9341_POWER1, ILI9341_DBI_VCOMH_4P6V);
+	mipi_dbi_command(dbi, ILI9341_POWER2, ILI9341_DBI_PWR_2_DEFAULT);
+	/* VCOM */
+	mipi_dbi_command(dbi, ILI9341_VCOM1, ILI9341_DBI_VCOM_1_VMH_4P25V,
+						ILI9341_DBI_VCOM_1_VML_1P5V);
+	mipi_dbi_command(dbi, ILI9341_VCOM2, ILI9341_DBI_VCOM_2_DEC_58);
+
+	/* Memory Access Control */
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
+				MIPI_DCS_PIXEL_FMT_16BIT);
+
+	/* Frame Rate */
+	mipi_dbi_command(dbi, ILI9341_FRC, ILI9341_DBI_FRC_DIVA & 0x03,
+						ILI9341_DBI_FRC_RTNA & 0x1f);
+
+	/* Gamma */
+	mipi_dbi_command(dbi, ILI9341_3GAMMA_EN, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_GAMMA_CURVE, ILI9341_GAMMA_CURVE_1);
+	mipi_dbi_command(dbi, ILI9341_PGAMMA,
+			 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1,
+			 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00);
+	mipi_dbi_command(dbi, ILI9341_NGAMMA,
+			 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1,
+			 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f);
+
+	/* DDRAM */
+	mipi_dbi_command(dbi, ILI9341_ETMOD, ILI9341_DBI_EMS_GAS |
+						ILI9341_DBI_EMS_DTS |
+						ILI9341_DBI_EMS_GON);
+
+	/* Display */
+	mipi_dbi_command(dbi, ILI9341_DFC, 0x08, 0x82, 0x27, 0x00);
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(100);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	msleep(100);
+
+out_enable:
+	switch (dbidev->rotation) {
+	default:
+		addr_mode = ILI9341_MADCTL_MX;
+		break;
+	case 90:
+		addr_mode = ILI9341_MADCTL_MV;
+		break;
+	case 180:
+		addr_mode = ILI9341_MADCTL_MY;
+		break;
+	case 270:
+		addr_mode = ILI9341_MADCTL_MV | ILI9341_MADCTL_MY |
+			    ILI9341_MADCTL_MX;
+		break;
+	}
+	addr_mode |= ILI9341_MADCTL_BGR;
+	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+	DRM_DEBUG_KMS("initialized display serial interface\n");
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs ili9341_dbi_funcs = {
+	.enable = ili9341_dbi_enable,
+	.disable = mipi_dbi_pipe_disable,
+	.update = mipi_dbi_pipe_update,
+	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
+};
+
+static const struct drm_display_mode ili9341_dbi_mode = {
+	DRM_SIMPLE_MODE(240, 320, 37, 49),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(ili9341_dbi_fops);
+
+static struct drm_driver ili9341_dbi_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops			= &ili9341_dbi_fops,
+	DRM_GEM_CMA_DRIVER_OPS_VMAP,
+	.debugfs_init		= mipi_dbi_debugfs_init,
+	.name			= "ili9341",
+	.desc			= "Ilitek ILI9341",
+	.date			= "20180514",
+	.major			= 1,
+	.minor			= 0,
+};
+static int ili9341_dbi_probe(struct spi_device *spi)
+{
+	struct mipi_dbi_dev *dbidev;
+	struct drm_device *drm;
+	struct mipi_dbi *dbi;
+	struct gpio_desc *dc;
+	struct device *dev = &spi->dev;
+	u32 rotation = 0;
+	int ret;
+
+	dbidev = devm_drm_dev_alloc(dev, &ili9341_dbi_driver,
+				    struct mipi_dbi_dev, drm);
+	if (IS_ERR(dbidev))
+		return PTR_ERR(dbidev);
+
+	dbi = &dbidev->dbi;
+	drm = &dbidev->drm;
+
+	drm_mode_config_init(drm);
+
+	dbi->reset = devm_gpiod_get_optional(dev, "reset",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(dbi->reset)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
+		return PTR_ERR(dbi->reset);
+	}
+
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc)) {
+		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
+		return PTR_ERR(dc);
+	}
+
+	dbidev->regulator = devm_regulator_get_optional(dev, "vcc");
+	if (IS_ERR(dbidev->regulator))
+		dev_err(dev, "get optional vcc failed\n");
+
+	dbidev->backlight = devm_of_find_backlight(dev);
+	if (IS_ERR(dbidev->backlight))
+		return PTR_ERR(dbidev->backlight);
+
+	device_property_read_u32(dev, "rotation", &rotation);
+
+	ret = mipi_dbi_spi_init(spi, dbi, dc);
+	if (ret)
+		return ret;
+
+	ret = mipi_dbi_dev_init(dbidev, &ili9341_dbi_funcs,
+					&ili9341_dbi_mode, rotation);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, drm);
+
+	drm_fbdev_generic_setup(drm, 0);
+
+	return 0;
+}
+static int ili9341_probe(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+
+	if (!strcmp(id->name, "sf-tc240t-9370-t"))
+		return ili9341_dpi_probe(spi);
+	else if (!strcmp(id->name, "yx240qv29"))
+		return ili9341_dbi_probe(spi);
+
+	return -1;
+}
+
+static int ili9341_remove(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+	struct ili9341 *ili = spi_get_drvdata(spi);
+	struct drm_device *drm = spi_get_drvdata(spi);
+
+	if (!strcmp(id->name, "sf-tc240t-9370-t")) {
+		ili9341_dpi_power_off(ili);
+		drm_panel_remove(&ili->panel);
+	} else if (!strcmp(id->name, "yx240qv29")) {
+		drm_dev_unplug(drm);
+		drm_atomic_helper_shutdown(drm);
+	}
+	return 0;
+}
+
+static void ili9341_shutdown(struct spi_device *spi)
+{
+	const struct spi_device_id *id = spi_get_device_id(spi);
+
+	if (!strcmp(id->name, "yx240qv29"))
+		drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+static const struct of_device_id ili9341_of_match[] = {
+	{
+		.compatible = "st,sf-tc240t-9370-t",
+		.data = &ili9341_stm32f429_disco_data,
+	},
+	{
+		/* porting from tiny/ili9341.c
+		 * for original mipi dbi compitable
+		 */
+		.compatible = "adafruit,yx240qv29",
+		.data = NULL,
+	},
+};
+MODULE_DEVICE_TABLE(of, ili9341_of_match);
+
+static const struct spi_device_id ili9341_id[] = {
+	{ "yx240qv29", 0 },
+	{ "sf-tc240t-9370-t", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9341_id);
+
+static struct spi_driver ili9341_driver = {
+	.probe = ili9341_probe,
+	.remove = ili9341_remove,
+	.shutdown = ili9341_shutdown,
+	.id_table = ili9341_id,
+	.driver = {
+		.name = "panel-ilitek-ili9341",
+		.of_match_table = ili9341_of_match,
+	},
+};
+module_spi_driver(ili9341_driver);
+
+MODULE_AUTHOR("Dillon Min <dillon.minfei@gmail.com>");
+MODULE_DESCRIPTION("ILI9341 LCD panel driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

