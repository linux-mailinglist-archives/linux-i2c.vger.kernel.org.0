Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4BE46020D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Nov 2021 23:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356583AbhK0WmM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 17:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356499AbhK0WkL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Nov 2021 17:40:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86DFC0613FA
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:02 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id c4so27247187wrd.9
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gy/+9Ap7B7a6ofg9Xo33DIKIIPnt1f9QgfnSCCN5Jwc=;
        b=qkhowHREvrRZHY0+mq5T1R32ESs6o0PuHWsxIqhsCZTLUpCiUPyrHQSG/2alUwrDSe
         imo2LsLgwZspsZY2XMnOJA+phhTp8EZDPtHuv0ddE03YuQ8QHl3GUCQnggEsa1cJSh6a
         foAKgsMdebwAvE43u0kSeic6WjuEiZSEGaEAwHkh+SZtD0hhynbGW3g/rMdFT/7zPVLd
         OCjUaRyZzMTXc0J8A5dpwvl1UQNHdCeJ5pkpFJbds0X39lXc/15Q0zWbyyzs8zfxQakg
         u7G51A7NpmB86rFxtsNnb4xGQSnlbq76tVDHMw7E7ErFV2acwAyrISkLJsCNxNou+U1G
         4GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gy/+9Ap7B7a6ofg9Xo33DIKIIPnt1f9QgfnSCCN5Jwc=;
        b=ju5Xt3/79xQqg2aYnNm90NlUugPmOj8o+zRsE7MnMdvTFK8rNJ8orVhV6UGi+w/anB
         DRHjKS3e+sqmriYOPlYqewqgU/bz+kDJDafRViQLC+OMCQMK613HaDPGFtwKVT5Ksxsf
         6oj1nr6xwai1V+JzS8jtbOVG5qOX/gPfvwXmaFxMoiufTo5z0qWfkOg4Fh1MpNKDKQXm
         n7S2gAXI+zGRLltUL43NbocPwZ3YfRu3gUBIHvf76EzovFt9WYRuLUULWr95g+ia4U6C
         ag3JHjTacEGCkK8yIthOHAh3CG5+CZUDiaCxJfrYHLG263Tgq7BKomJckGkA9snksKzc
         F1MA==
X-Gm-Message-State: AOAM530HFnU6U7f2/wM+C9ROUjBfKQTmlWsPKsApxAgSLFNXzymXvtKO
        OTP2JvpfGllaI/w+BTcTCoh9I3QkJvxwZPLM
X-Google-Smtp-Source: ABdhPJygkLORZGJoecoCFIe4i9zkk8SG3qflYMozTYJVZLFFCWQrQUA9jnW6PWrwpX+FLxdGhSagfg==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr23701900wri.438.1638052381363;
        Sat, 27 Nov 2021 14:33:01 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l4sm9314966wrv.94.2021.11.27.14.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:33:01 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 4/8] tty: serial: samsung: Remove USI initialization
Date:   Sun, 28 Nov 2021 00:32:49 +0200
Message-Id: <20211127223253.19098-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

USI control is now extracted to dedicated USIv2 driver. Remove USI
related code from serial driver to avoid conflicts and code duplication.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
 include/linux/serial_s3c.h       |  9 --------
 2 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index ca084c10d0bb..f986a9253dc8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -65,7 +65,6 @@ enum s3c24xx_port_type {
 struct s3c24xx_uart_info {
 	char			*name;
 	enum s3c24xx_port_type	type;
-	bool			has_usi;
 	unsigned int		port_type;
 	unsigned int		fifosize;
 	unsigned long		rx_fifomask;
@@ -1357,28 +1356,6 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-static void exynos_usi_init(struct uart_port *port)
-{
-	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	struct s3c24xx_uart_info *info = ourport->info;
-	unsigned int val;
-
-	if (!info->has_usi)
-		return;
-
-	/* Clear the software reset of USI block (it's set at startup) */
-	val = rd_regl(port, USI_CON);
-	val &= ~USI_CON_RESET_MASK;
-	wr_regl(port, USI_CON, val);
-	udelay(1);
-
-	/* Continuously provide the clock to USI IP w/o gating (for Rx mode) */
-	val = rd_regl(port, USI_OPTION);
-	val &= ~USI_OPTION_HWACG_MASK;
-	val |= USI_OPTION_HWACG_CLKREQ_ON;
-	wr_regl(port, USI_OPTION, val);
-}
-
 /* power power management control */
 
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
@@ -1405,8 +1382,6 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 
 		if (!IS_ERR(ourport->baudclk))
 			clk_prepare_enable(ourport->baudclk);
-
-		exynos_usi_init(port);
 		break;
 	default:
 		dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
@@ -2130,8 +2105,6 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	if (ret)
 		pr_warn("uart: failed to enable baudclk\n");
 
-	exynos_usi_init(port);
-
 	/* Keep all interrupts masked and cleared */
 	switch (ourport->info->type) {
 	case TYPE_S3C6400:
@@ -2780,11 +2753,10 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #endif
 
 #if defined(CONFIG_ARCH_EXYNOS)
-#define EXYNOS_COMMON_SERIAL_DRV_DATA(_has_usi)			\
+#define EXYNOS_COMMON_SERIAL_DRV_DATA()				\
 	.info = &(struct s3c24xx_uart_info) {			\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
-		.has_usi	= _has_usi,			\
 		.port_type	= PORT_S3C6400,			\
 		.has_divslot	= 1,				\
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,	\
@@ -2805,17 +2777,17 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 	}							\
 
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(false),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 256, 64, 16, 16 },
 };
 
 static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(false),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 64, 256, 16, 256 },
 };
 
 static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(true),
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
 	.fifosize = { 256, 64, 64, 64 },
 };
 
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index cf0de4a86640..f6c3323fc4c5 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -27,15 +27,6 @@
 #define S3C2410_UERSTAT	  (0x14)
 #define S3C2410_UFSTAT	  (0x18)
 #define S3C2410_UMSTAT	  (0x1C)
-#define USI_CON		  (0xC4)
-#define USI_OPTION	  (0xC8)
-
-#define USI_CON_RESET			(1<<0)
-#define USI_CON_RESET_MASK		(1<<0)
-
-#define USI_OPTION_HWACG_CLKREQ_ON	(1<<1)
-#define USI_OPTION_HWACG_CLKSTOP_ON	(1<<2)
-#define USI_OPTION_HWACG_MASK		(3<<1)
 
 #define S3C2410_LCON_CFGMASK	  ((0xF<<3)|(0x3))
 
-- 
2.30.2

