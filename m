Return-Path: <linux-i2c+bounces-1233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D91828684
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 14:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4641F256A4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 13:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21B739FEA;
	Tue,  9 Jan 2024 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YA5XUN7K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238139AD8
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33694bf8835so2637405f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 04:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805116; x=1705409916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs4co9mt9XXnYsWzWbhSmPzFgtlixpVNmZRAHGA/jCw=;
        b=YA5XUN7KEE/0hW3CIuJJ5suhkbjgb7vwF1m7QMlEGfYfNJJjqmAfKfM2jl8W+MGSSq
         If4BR0VuYJ0uiaoOnwM4VZW2M1gKnP66YlPbE6ymk3QYD1t0TCOyfs/OBe6gXe8q/9NH
         Apk3olEvwFbSUkIAxK5lyoFcadSaRPEPRQM6d+3MAxMsYWuVqEmO3oKT1NW2MGMaZrv8
         pm63GwQZcYFtb+0Ofy0P6CedaCvnJReDofQVCGfaDnjhKPkic83MrrgHlF4+TMGXOUCo
         k0nF38YZ9lvwF8vlSTFUcX8Qy9DGu2nLlq5Cd9Oa0J0xO6B5lonq3OYM1Ps7jKQ6/aQe
         Hq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805116; x=1705409916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs4co9mt9XXnYsWzWbhSmPzFgtlixpVNmZRAHGA/jCw=;
        b=mNfzxI2Ke1gJ2wUqZTPtYXtXieMZshwH0oKsFxspk4CAF9QUZY5WwBfXhLb8NwV317
         MSGQeI9w67Sth7/z/xbhtczltAFocOdkGZtjdn5ge23JKwXhtnfk4bpSp0ibw/1kx+dw
         ZbzabmA8LuJXFxJW7Fwbjm5G1qPMB6mnlJprXPrFs6E4y33CPy/rwR4uHpLLFrQ1Jvi8
         OAzgJSg4FrJp7ezXSlWL1++M9AzEH5A5BHN6uOKPq3nkJUL/D9NiXGxic3+S8oWdAT09
         +c34wwr0Zwp4YikbPhsvRDDxkqmzhfPEEEaIkHZdeUIK0bw4ua2G5EGBEN143LrIwF5s
         vdMQ==
X-Gm-Message-State: AOJu0YzWxB8KJihKuXf9dwOfPO7g2gfCwnyo9M0qetg9l+K2wjlfpVsi
	03EQO93o7fxgAhY8cwI46lGABeSH8c3FOw==
X-Google-Smtp-Source: AGHT+IFHF9ov79LocrFWdFMN09ObGvuvUIjCSqttKPJPivd5wdvSVQbLdnjR/6JFSIMjZpBJdC/a5Q==
X-Received: by 2002:a5d:548f:0:b0:336:82a8:1093 with SMTP id h15-20020a5d548f000000b0033682a81093mr422477wrv.48.1704805116186;
        Tue, 09 Jan 2024 04:58:36 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:35 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 05/12] tty: serial: samsung: set UPIO_MEM32 iotype for gs101
Date: Tue,  9 Jan 2024 12:58:07 +0000
Message-ID: <20240109125814.3691033-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
include the I3C and USI (I2C, SPI, UART) only allow 32-bit
register accesses.

Instead of specifying the reg-io-width = 4 everywhere, for each node,
the requirement should be deduced from the compatible.

Infer UPIO_MEM32 iotype from the "google,gs101-uart" compatible.
Update the uart info name to be GS101 specific in order to
differentiate from the other exynos platforms. All the other settings
are not changed.

exynos_fifoszdt_serial_drv_data was replaced by gs101_serial_drv_data
because the iotype restriction is gs101 specific and there was no other
user of exynos_fifoszdt_serial_drv_data.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: collect Peter's R-b tag
v2: new patch

 drivers/tty/serial/samsung_tty.c | 38 +++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index ff646cddd3f8..a81b61953a28 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2497,25 +2497,43 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
-/*
- * Common drv_data struct for platforms that specify samsung,uart-fifosize in
- * device tree.
- */
-static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_data = {
-	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
+	.info = {
+		.name		= "Google GS101 UART",
+		.type		= TYPE_S3C6400,
+		.port_type	= PORT_S3C6400,
+		.iotype		= UPIO_MEM32,
+		.has_divslot	= 1,
+		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,
+		.rx_fifoshift	= S5PV210_UFSTAT_RXSHIFT,
+		.rx_fifofull	= S5PV210_UFSTAT_RXFULL,
+		.tx_fifofull	= S5PV210_UFSTAT_TXFULL,
+		.tx_fifomask	= S5PV210_UFSTAT_TXMASK,
+		.tx_fifoshift	= S5PV210_UFSTAT_TXSHIFT,
+		.def_clk_sel	= S3C2410_UCON_CLKSEL0,
+		.num_clks	= 1,
+		.clksel_mask	= 0,
+		.clksel_shift	= 0,
+	},
+	.def_cfg = {
+		.ucon		= S5PV210_UCON_DEFAULT,
+		.ufcon		= S5PV210_UFCON_DEFAULT,
+		.has_fracval	= 1,
+	},
+	/* samsung,uart-fifosize must be specified in the device tree. */
 	.fifosize = { 0 },
 };
 
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
-#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
+#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
 
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
-#define EXYNOS_FIFOSZDT_DRV_DATA NULL
+#define GS101_SERIAL_DRV_DATA NULL
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
@@ -2603,7 +2621,7 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
 	}, {
 		.name		= "gs101-uart",
-		.driver_data	= (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_DATA,
+		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
 	},
 	{ },
 };
@@ -2626,7 +2644,7 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 	{ .compatible = "axis,artpec8-uart",
 		.data = ARTPEC8_SERIAL_DRV_DATA },
 	{ .compatible = "google,gs101-uart",
-		.data = EXYNOS_FIFOSZDT_DRV_DATA },
+		.data = GS101_SERIAL_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.43.0.472.g3155946c3a-goog


