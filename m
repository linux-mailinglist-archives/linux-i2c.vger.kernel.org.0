Return-Path: <linux-i2c+bounces-1232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F11382867B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 13:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8C1281C94
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 12:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B87539AF3;
	Tue,  9 Jan 2024 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLfLjFPh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DCF39856
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3376f71fcbbso1359237f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 04:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805114; x=1705409914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYANYm/flTLm8ltfdyXSV/4KcEiWh8iO47/Oolwzemw=;
        b=gLfLjFPhX6ggGDo5EhGrBt3hCaHDWBGhH8hF+LhjGwFxHiqM1lSHB4r2oPVp2MZrln
         KfUUeGECf/l6QJz+doJ1rhJFBimbLc/59QLKyts5kVSieRKZsbyZcO0sR8aJ3nmerIyz
         R1fsO2QwF8IXXE57XWh66bj4iNmsiZYkUbJ2st35kgFfWXWjenlKz+AebI3wTRyGiulv
         J0skOOKKDL15dmfEoOxnPFPiZR2BoUVr9M9PViaMFQm+FvivKlilpbkZSiW4str9XL2y
         6rge7LHqujNI4LWdOx2rbcSB93ssx7SxqjDVjPjZD1Y5Hp4UWqBNfsALVBoArtZBXPoH
         YkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805114; x=1705409914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYANYm/flTLm8ltfdyXSV/4KcEiWh8iO47/Oolwzemw=;
        b=T29P9W6XOjqAd+p2voKCxEH77x+fsMi9K6mNmyzyX7EUWOhi6/sw8CzSIyX2ztfB09
         KmgvGvSRvj4/89D8/JVdGd5TvP87ctBWt1Q+I6XL5onQ0XJGTFuUVAe24O6x1jHDW+XW
         nBTzn5FmXE9JO67ZfuuyqKoge/XHi609YS1JYiP5dEwP/dyBIK2+t4mL//zrrr1fSooo
         juvVD0vFpDchxxXpsnOZ2hLFn6Hv3nKOl/gjnLv8ncqkQIakT7T5KMgW45ig1lsmNYZG
         Vu11nbjHEYSGd20oltuCk6D47y3HhCilzrJjOhyEqq/qirbZKx0tc/VjMvdU8AnoFl92
         CFjg==
X-Gm-Message-State: AOJu0Yxis0abjuLs5D5Qr5oZMdI6JRlH69AU9R5KbMwcIf/5Bn9Yrm49
	RjWP69GsWXQis27Ms2ulxpFUChSWHyli+A==
X-Google-Smtp-Source: AGHT+IGceZtkC0wZrtIHBAy7xlhr33Ldl9WFLcDfsJupgFjb103my2Ayh3FwlSnEldsW+8gESDuUsw==
X-Received: by 2002:a5d:55c5:0:b0:337:5d0:1f1a with SMTP id i5-20020a5d55c5000000b0033705d01f1amr478794wrw.66.1704805114750;
        Tue, 09 Jan 2024 04:58:34 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:33 -0800 (PST)
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
Subject: [PATCH v3 04/12] tty: serial: samsung: prepare for different IO types
Date: Tue,  9 Jan 2024 12:58:06 +0000
Message-ID: <20240109125814.3691033-5-tudor.ambarus@linaro.org>
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
register accesses. If using 8-bit register accesses, a SError
Interrupt is raised causing the system unusable.

Instead of specifying the reg-io-width = 4 everywhere, for each node,
the requirement should be deduced from the compatible.

Prepare the samsung tty driver to allow IO types different than
UPIO_MEM. ``struct uart_port::iotype`` is an unsigned char where all
its 8 bits are exposed to uapi. We can't make NULL checks on it to
verify if it's set, thus always set it from the driver's data.
Use u8 for the ``iotype`` member of ``struct s3c24xx_uart_info`` to
emphasize that the iotype is an 8 bit mask.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3:
- reposition the ``iotype`` member of ``struct s3c24xx_uart_info`` so
  that we reduce the struct's memory footprint.
- change ``iotype`` to u8 to emphasize that it's a 8 bit mask and update
  the commit message explaining why.
v2: new patch

 drivers/tty/serial/samsung_tty.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 66bd6c090ace..ff646cddd3f8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -84,6 +84,7 @@ struct s3c24xx_uart_info {
 	unsigned long		clksel_mask;
 	unsigned long		clksel_shift;
 	unsigned long		ucon_mask;
+	u8			iotype;
 
 	/* uart port features */
 
@@ -1742,7 +1743,6 @@ static void s3c24xx_serial_init_port_default(int index) {
 
 	spin_lock_init(&port->lock);
 
-	port->iotype = UPIO_MEM;
 	port->uartclk = 0;
 	port->fifosize = 16;
 	port->flags = UPF_BOOT_AUTOCONF;
@@ -1989,6 +1989,8 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 		break;
 	}
 
+	ourport->port.iotype = ourport->info->iotype;
+
 	if (np) {
 		of_property_read_u32(np,
 			"samsung,uart-fifosize", &ourport->port.fifosize);
@@ -2401,6 +2403,7 @@ static const struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
 		.name		= "Samsung S3C6400 UART",
 		.type		= TYPE_S3C6400,
 		.port_type	= PORT_S3C6400,
+		.iotype		= UPIO_MEM,
 		.fifosize	= 64,
 		.has_divslot	= 1,
 		.rx_fifomask	= S3C2440_UFSTAT_RXMASK,
@@ -2430,6 +2433,7 @@ static const struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 		.name		= "Samsung S5PV210 UART",
 		.type		= TYPE_S3C6400,
 		.port_type	= PORT_S3C6400,
+		.iotype		= UPIO_MEM,
 		.has_divslot	= 1,
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,
 		.rx_fifoshift	= S5PV210_UFSTAT_RXSHIFT,
@@ -2459,6 +2463,7 @@ static const struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
 		.port_type	= PORT_S3C6400,			\
+		.iotype		= UPIO_MEM,			\
 		.has_divslot	= 1,				\
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,	\
 		.rx_fifoshift	= S5PV210_UFSTAT_RXSHIFT,	\
@@ -2519,6 +2524,7 @@ static const struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
 		.name		= "Apple S5L UART",
 		.type		= TYPE_APPLE_S5L,
 		.port_type	= PORT_8250,
+		.iotype		= UPIO_MEM,
 		.fifosize	= 16,
 		.rx_fifomask	= S3C2410_UFSTAT_RXMASK,
 		.rx_fifoshift	= S3C2410_UFSTAT_RXSHIFT,
@@ -2548,6 +2554,7 @@ static const struct s3c24xx_serial_drv_data artpec8_serial_drv_data = {
 		.name		= "Axis ARTPEC-8 UART",
 		.type		= TYPE_S3C6400,
 		.port_type	= PORT_S3C6400,
+		.iotype		= UPIO_MEM,
 		.fifosize	= 64,
 		.has_divslot	= 1,
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,
-- 
2.43.0.472.g3155946c3a-goog


