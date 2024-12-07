Return-Path: <linux-i2c+bounces-8365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A79E7FE7
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 13:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A121883D04
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 12:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E862A1474D3;
	Sat,  7 Dec 2024 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgAY9i92"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8087146019;
	Sat,  7 Dec 2024 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733575486; cv=none; b=XjIOGDdn2t9lqSsO7j90Z6zWvK/IRQLA/e6M6LHV66crMmYwKO+JvU/teMQ9Bk4cLvh3gkFWbGa6g1h3oZD32YDgHuaPI+8yaSpeHvghpbimyFd2h2D6IziUQ02QUxmrp5JKC3jIaWJmHiiI+6W7DftE72tpEYr6D+bMxGV3q+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733575486; c=relaxed/simple;
	bh=DZFiH7OcpXTx2gbyhNNaP3OgjZjVhkt9WI+lPhvUTNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/3b9/ufAa5kjqYt4Y6rpHjDOmCdVgencM1Z+Lu6VovtIOyzW0L3F7hHQWIsa/zbgMdbr6SyOhFtWF7tri9KAy1LwYMNSwmnWMgrsH/VGCPUFxOLW2aCgUMCFM2VzXdDm6JuIQykVD3M2z95Kpug0BG/3yHGbUC96vwVrbUu76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgAY9i92; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7251331e756so3207217b3a.3;
        Sat, 07 Dec 2024 04:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733575484; x=1734180284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q54VpEYJdMjsNCN94HkXizbNIoHxRVwmAQ13CoTaIfM=;
        b=JgAY9i92YpLR4hQhk7Kmfo20YmWq7m2DZDdfJUIBLgvEVQtIMfOzO6cdTe6mpnpJ9z
         G9GmAIN/CajeVs8lKqVP6aSRxtyGL1ah/Cb4X2WYMn2KJ2uHv89cU+Upx5q77+YRoon3
         JKcJHPDzz2ydt+lbjDsG9H1kPQ/XTyKD8Ne8W0t9co3BIFgb5ffxxe7HrwaDdWpwhbSH
         tOWRGgGo9JJPXy3rF0ytqliO/Q6P0wfq4orTBk5Xmb15g098UejnKp08zpcEJFPq40uM
         bIyQOEW2gdfOo5j51dDTbAbN0v0JO7V9wdBDmr/0vYJcyjGd4U+++QGIaW2sk2Zk4uqD
         QG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733575484; x=1734180284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q54VpEYJdMjsNCN94HkXizbNIoHxRVwmAQ13CoTaIfM=;
        b=NtyKRZem8DMG5y4KNnJSff/IU73HM7nwpi+fsshzaj6nu2pjnOlz4e81j6pfVpUtM4
         OM4UWYKVlbKCCanPYTBRcZ99zfyxLJrtOyLJMH0w0kfOzsBFYAGKdiz4P0lrJcOHGQtz
         SfwTJ9aajt9SdUEK9OWMw6zT1wE8lHaCt6d4FZdePGnaQii4naF16hLxCJiPoGJ6CXfW
         2RfkbLLahmbgskS9i2wakcXwCZeWXEqL58kVNB5iMBW5HWI+lPw99XaXxpvxUGeVyPRv
         U/Ver35Qqp/DB4JGvGDJGszlQ5+n6FJ7/rfAbjker68IRou3hoKeJxSEzFa8ZD6ofypI
         jYEw==
X-Forwarded-Encrypted: i=1; AJvYcCUo9rdU1DT4c0rtobjaN1N59u8tDtyoR6AFwyq7pFrvgBDZFBEoiwE1lwNV/VTOR2WB/iRYQwlpQpteIA==@vger.kernel.org, AJvYcCXgzkgzFSH9yBco2hWQiP944AeBvO/Bhy67dfSh6IMLwTcK1X1cLWb6wcatTjrTMIy3Da1IotD9lQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7/sY4c7x+VXtgdryFDO6DeGTtssCykHJx/2CxAvze+tGtADa
	L/DlhK3QrGAvGYyz+UMMw+djdLK29A7JPt4jWEL455GDOyfMX455
X-Gm-Gg: ASbGnct0aNd/CStkCuO/VUwG7+65KjWcPoOxWrZXmB/i2xINxmKFp1aXB1uSUPMsvay
	5fjGUdWliAPDjQtFFdGO/wol2UPnn1yqVIH5VKmT90Ms8WI+QZ7Fd1C7svW4XLoZp2dhfbeCnKG
	shuhOl2YWsfmKN7gVVBqUJ0rHWW4vgPkkvDi724oB4x70njuXRBiDcw3ONSWlKosqFHsFExQ2ri
	NHD7nVLLJRbYGtvr1gdFUdHawD0ox93w5hlRMSBZOLP+pT4xnrtVYk=
X-Google-Smtp-Source: AGHT+IHmSM5HvInvy2LtxKyOBx8lZtVgbdQBiMaNu8Rr2gh3tI8PaeuV1X+ya9FnaeJd73Zgl4lJ0w==
X-Received: by 2002:a05:6a20:4303:b0:1db:f00e:2dfe with SMTP id adf61e73a8af0-1e1871371a3mr11704514637.39.1733575483971;
        Sat, 07 Dec 2024 04:44:43 -0800 (PST)
Received: from melbuntu.. ([122.171.22.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c82b4852sm1700850b3a.135.2024.12.07.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:44:43 -0800 (PST)
From: Dhruv Menon <dhruvmenon1104@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	vigneshr@ti.com,
	andi.shyti@kernel.org
Cc: jmkrzyszt@gmail.com,
	tony@atomide.com,
	khilman@baylibre.com,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Dhruv Menon <dhruvmenon1104@gmail.com>
Subject: [PATCH v3 1/2] i2c: omap: Clean up coding style
Date: Sat,  7 Dec 2024 18:12:02 +0530
Message-ID: <cf8f6f85fd0279b8a77e3e89b0cb879494a40cd8.1733217877.git.dhruvmenon1104@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733217877.git.dhruvmenon1104@gmail.com>
References: <cover.1733217877.git.dhruvmenon1104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit addresses the coding style issues present in i2c-omap.c,
identified by checkpatch.pl.

1. BIT Macros utilization
2. Spelling correction
3. Alignment correction
4. Unnecessary blank lines removal

No functional changes have been introduced in this commit.

Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 189 +++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 97 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 1d9ad25c89ae..df945ddfe089 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -78,39 +78,39 @@ enum {
 };
 
 /* I2C Interrupt Enable Register (OMAP_I2C_IE): */
-#define OMAP_I2C_IE_XDR		(1 << 14)	/* TX Buffer drain int enable */
-#define OMAP_I2C_IE_RDR		(1 << 13)	/* RX Buffer drain int enable */
-#define OMAP_I2C_IE_XRDY	(1 << 4)	/* TX data ready int enable */
-#define OMAP_I2C_IE_RRDY	(1 << 3)	/* RX data ready int enable */
-#define OMAP_I2C_IE_ARDY	(1 << 2)	/* Access ready int enable */
-#define OMAP_I2C_IE_NACK	(1 << 1)	/* No ack interrupt enable */
-#define OMAP_I2C_IE_AL		(1 << 0)	/* Arbitration lost int ena */
+#define OMAP_I2C_IE_XDR		BIT(14)	/* TX Buffer drain int enable */
+#define OMAP_I2C_IE_RDR		BIT(13)	/* RX Buffer drain int enable */
+#define OMAP_I2C_IE_XRDY	BIT(4)	/* TX data ready int enable */
+#define OMAP_I2C_IE_RRDY	BIT(3)	/* RX data ready int enable */
+#define OMAP_I2C_IE_ARDY	BIT(2)	/* Access ready int enable */
+#define OMAP_I2C_IE_NACK	BIT(1)	/* No ack interrupt enable */
+#define OMAP_I2C_IE_AL		BIT(0)	/* Arbitration lost int ena */
 
 /* I2C Status Register (OMAP_I2C_STAT): */
-#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
-#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
-#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
-#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
-#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
-#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
-#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
-#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
-#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
-#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
-#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
-#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
+#define OMAP_I2C_STAT_XDR	BIT(14)	/* TX Buffer draining */
+#define OMAP_I2C_STAT_RDR	BIT(13)	/* RX Buffer draining */
+#define OMAP_I2C_STAT_BB	BIT(12)	/* Bus busy */
+#define OMAP_I2C_STAT_ROVR	BIT(11)	/* Receive overrun */
+#define OMAP_I2C_STAT_XUDF	BIT(10)	/* Transmit underflow */
+#define OMAP_I2C_STAT_AAS	BIT(9)	/* Address as slave */
+#define OMAP_I2C_STAT_BF	BIT(8)	/* Bus Free */
+#define OMAP_I2C_STAT_XRDY	BIT(4)	/* Transmit data ready */
+#define OMAP_I2C_STAT_RRDY	BIT(3)	/* Receive data ready */
+#define OMAP_I2C_STAT_ARDY	BIT(2)	/* Register access ready */
+#define OMAP_I2C_STAT_NACK	BIT(1)	/* No ack interrupt enable */
+#define OMAP_I2C_STAT_AL	BIT(0)	/* Arbitration lost int ena */
 
 /* I2C WE wakeup enable register */
-#define OMAP_I2C_WE_XDR_WE	(1 << 14)	/* TX drain wakup */
-#define OMAP_I2C_WE_RDR_WE	(1 << 13)	/* RX drain wakeup */
-#define OMAP_I2C_WE_AAS_WE	(1 << 9)	/* Address as slave wakeup*/
-#define OMAP_I2C_WE_BF_WE	(1 << 8)	/* Bus free wakeup */
-#define OMAP_I2C_WE_STC_WE	(1 << 6)	/* Start condition wakeup */
-#define OMAP_I2C_WE_GC_WE	(1 << 5)	/* General call wakeup */
-#define OMAP_I2C_WE_DRDY_WE	(1 << 3)	/* TX/RX data ready wakeup */
-#define OMAP_I2C_WE_ARDY_WE	(1 << 2)	/* Reg access ready wakeup */
-#define OMAP_I2C_WE_NACK_WE	(1 << 1)	/* No acknowledgment wakeup */
-#define OMAP_I2C_WE_AL_WE	(1 << 0)	/* Arbitration lost wakeup */
+#define OMAP_I2C_WE_XDR_WE	BIT(14)	/* TX drain wakup */
+#define OMAP_I2C_WE_RDR_WE	BIT(13)	/* RX drain wakeup */
+#define OMAP_I2C_WE_AAS_WE	BIT(9)	/* Address as slave wakeup*/
+#define OMAP_I2C_WE_BF_WE	BIT(8)	/* Bus free wakeup */
+#define OMAP_I2C_WE_STC_WE	BIT(6)	/* Start condition wakeup */
+#define OMAP_I2C_WE_GC_WE	BIT(5)	/* General call wakeup */
+#define OMAP_I2C_WE_DRDY_WE	BIT(3)	/* TX/RX data ready wakeup */
+#define OMAP_I2C_WE_ARDY_WE	BIT(2)	/* Reg access ready wakeup */
+#define OMAP_I2C_WE_NACK_WE	BIT(1)	/* No acknowledgment wakeup */
+#define OMAP_I2C_WE_AL_WE	BIT(0)	/* Arbitration lost wakeup */
 
 #define OMAP_I2C_WE_ALL		(OMAP_I2C_WE_XDR_WE | OMAP_I2C_WE_RDR_WE | \
 				OMAP_I2C_WE_AAS_WE | OMAP_I2C_WE_BF_WE | \
@@ -119,59 +119,59 @@ enum {
 				OMAP_I2C_WE_NACK_WE | OMAP_I2C_WE_AL_WE)
 
 /* I2C Buffer Configuration Register (OMAP_I2C_BUF): */
-#define OMAP_I2C_BUF_RDMA_EN	(1 << 15)	/* RX DMA channel enable */
-#define OMAP_I2C_BUF_RXFIF_CLR	(1 << 14)	/* RX FIFO Clear */
-#define OMAP_I2C_BUF_XDMA_EN	(1 << 7)	/* TX DMA channel enable */
-#define OMAP_I2C_BUF_TXFIF_CLR	(1 << 6)	/* TX FIFO Clear */
+#define OMAP_I2C_BUF_RDMA_EN	BIT(15)	/* RX DMA channel enable */
+#define OMAP_I2C_BUF_RXFIF_CLR	BIT(14)	/* RX FIFO Clear */
+#define OMAP_I2C_BUF_XDMA_EN	BIT(7)	/* TX DMA channel enable */
+#define OMAP_I2C_BUF_TXFIF_CLR	BIT(6)	/* TX FIFO Clear */
 
 /* I2C Configuration Register (OMAP_I2C_CON): */
-#define OMAP_I2C_CON_EN		(1 << 15)	/* I2C module enable */
-#define OMAP_I2C_CON_BE		(1 << 14)	/* Big endian mode */
-#define OMAP_I2C_CON_OPMODE_HS	(1 << 12)	/* High Speed support */
-#define OMAP_I2C_CON_STB	(1 << 11)	/* Start byte mode (master) */
-#define OMAP_I2C_CON_MST	(1 << 10)	/* Master/slave mode */
-#define OMAP_I2C_CON_TRX	(1 << 9)	/* TX/RX mode (master only) */
-#define OMAP_I2C_CON_XA		(1 << 8)	/* Expand address */
-#define OMAP_I2C_CON_RM		(1 << 2)	/* Repeat mode (master only) */
-#define OMAP_I2C_CON_STP	(1 << 1)	/* Stop cond (master only) */
-#define OMAP_I2C_CON_STT	(1 << 0)	/* Start condition (master) */
+#define OMAP_I2C_CON_EN		BIT(15)	/* I2C module enable */
+#define OMAP_I2C_CON_BE		BIT(14)	/* Big endian mode */
+#define OMAP_I2C_CON_OPMODE_HS	BIT(12)	/* High Speed support */
+#define OMAP_I2C_CON_STB	BIT(11)	/* Start byte mode (master) */
+#define OMAP_I2C_CON_MST	BIT(10)	/* Master/slave mode */
+#define OMAP_I2C_CON_TRX	BIT(9)	/* TX/RX mode (master only) */
+#define OMAP_I2C_CON_XA		BIT(8)	/* Expand address */
+#define OMAP_I2C_CON_RM		BIT(2)	/* Repeat mode (master only) */
+#define OMAP_I2C_CON_STP	BIT(1)	/* Stop cond (master only) */
+#define OMAP_I2C_CON_STT	BIT(0)	/* Start condition (master) */
 
 /* I2C SCL time value when Master */
 #define OMAP_I2C_SCLL_HSSCLL	8
 #define OMAP_I2C_SCLH_HSSCLH	8
 
 /* I2C System Test Register (OMAP_I2C_SYSTEST): */
-#define OMAP_I2C_SYSTEST_ST_EN		(1 << 15)	/* System test enable */
-#define OMAP_I2C_SYSTEST_FREE		(1 << 14)	/* Free running mode */
-#define OMAP_I2C_SYSTEST_TMODE_MASK	(3 << 12)	/* Test mode select */
-#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)		/* Test mode select */
+#define OMAP_I2C_SYSTEST_ST_EN		BIT(15)	/* System test enable */
+#define OMAP_I2C_SYSTEST_FREE		BIT(14)	/* Free running mode */
+#define OMAP_I2C_SYSTEST_TMODE_MASK	GENMASK(13, 12)	/* Test mode select */
+#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)	/* Test mode select */
 /* Functional mode */
-#define OMAP_I2C_SYSTEST_SCL_I_FUNC	(1 << 8)	/* SCL line input value */
-#define OMAP_I2C_SYSTEST_SCL_O_FUNC	(1 << 7)	/* SCL line output value */
-#define OMAP_I2C_SYSTEST_SDA_I_FUNC	(1 << 6)	/* SDA line input value */
-#define OMAP_I2C_SYSTEST_SDA_O_FUNC	(1 << 5)	/* SDA line output value */
+#define OMAP_I2C_SYSTEST_SCL_I_FUNC	BIT(8)	/* SCL line input value */
+#define OMAP_I2C_SYSTEST_SCL_O_FUNC	BIT(7)	/* SCL line output value */
+#define OMAP_I2C_SYSTEST_SDA_I_FUNC	BIT(6)	/* SDA line input value */
+#define OMAP_I2C_SYSTEST_SDA_O_FUNC	BIT(5)	/* SDA line output value */
 /* SDA/SCL IO mode */
-#define OMAP_I2C_SYSTEST_SCL_I		(1 << 3)	/* SCL line sense in */
-#define OMAP_I2C_SYSTEST_SCL_O		(1 << 2)	/* SCL line drive out */
-#define OMAP_I2C_SYSTEST_SDA_I		(1 << 1)	/* SDA line sense in */
-#define OMAP_I2C_SYSTEST_SDA_O		(1 << 0)	/* SDA line drive out */
+#define OMAP_I2C_SYSTEST_SCL_I		BIT(3)	/* SCL line sense in */
+#define OMAP_I2C_SYSTEST_SCL_O		BIT(2)	/* SCL line drive out */
+#define OMAP_I2C_SYSTEST_SDA_I		BIT(1)	/* SDA line sense in */
+#define OMAP_I2C_SYSTEST_SDA_O		BIT(0)	/* SDA line drive out */
 
 /* OCP_SYSSTATUS bit definitions */
-#define SYSS_RESETDONE_MASK		(1 << 0)
+#define SYSS_RESETDONE_MASK		BIT(0)
 
 /* OCP_SYSCONFIG bit definitions */
-#define SYSC_CLOCKACTIVITY_MASK		(0x3 << 8)
-#define SYSC_SIDLEMODE_MASK		(0x3 << 3)
-#define SYSC_ENAWAKEUP_MASK		(1 << 2)
-#define SYSC_SOFTRESET_MASK		(1 << 1)
-#define SYSC_AUTOIDLE_MASK		(1 << 0)
+#define SYSC_CLOCKACTIVITY_MASK		GENMASK(9, 8)
+#define SYSC_SIDLEMODE_MASK		GENMASK(4, 3)
+#define SYSC_ENAWAKEUP_MASK		BIT(2)
+#define SYSC_SOFTRESET_MASK		BIT(1)
+#define SYSC_AUTOIDLE_MASK		BIT(0)
 
 #define SYSC_IDLEMODE_SMART		0x2
 #define SYSC_CLOCKACTIVITY_FCLK		0x2
 
 /* Errata definitions */
-#define I2C_OMAP_ERRATA_I207		(1 << 0)
-#define I2C_OMAP_ERRATA_I462		(1 << 1)
+#define I2C_OMAP_ERRATA_I207		BIT(0)
+#define I2C_OMAP_ERRATA_I462		BIT(1)
 
 #define OMAP_I2C_IP_V2_INTERRUPTS_MASK	0x6FFF
 
@@ -277,7 +277,6 @@ static inline u16 omap_i2c_read_reg(struct omap_i2c_dev *omap, int reg)
 
 static void __omap_i2c_init(struct omap_i2c_dev *omap)
 {
-
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 
 	/* Setup clock prescaler to obtain approx 12MHz I2C module clock: */
@@ -316,19 +315,19 @@ static int omap_i2c_reset(struct omap_i2c_dev *omap)
 
 		/* Disable I2C controller before soft reset */
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG,
-			omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
-				~(OMAP_I2C_CON_EN));
+				   omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
+		~(OMAP_I2C_CON_EN));
 
 		omap_i2c_write_reg(omap, OMAP_I2C_SYSC_REG, SYSC_SOFTRESET_MASK);
 		/* For some reason we need to set the EN bit before the
-		 * reset done bit gets set. */
+		 * reset done bit gets set.
+		 */
 		timeout = jiffies + OMAP_I2C_TIMEOUT;
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_EN);
 		while (!(omap_i2c_read_reg(omap, OMAP_I2C_SYSS_REG) &
 			 SYSS_RESETDONE_MASK)) {
 			if (time_after(jiffies, timeout)) {
-				dev_warn(omap->dev, "timeout waiting "
-						"for controller reset\n");
+				dev_warn(omap->dev, "timeout waiting for controller reset\n");
 				return -ETIMEDOUT;
 			}
 			msleep(1);
@@ -396,15 +395,13 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 	}
 
 	if (!(omap->flags & OMAP_I2C_FLAG_SIMPLE_CLOCK)) {
-
 		/*
 		 * HSI2C controller internal clk rate should be 19.2 Mhz for
 		 * HS and for all modes on 2430. On 34xx we can use lower rate
 		 * to get longer filter period for better noise suppression.
 		 * The filter is iclk (fclk for HS) period.
 		 */
-		if (omap->speed > 400 ||
-			       omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
+		if (omap->speed > 400 || omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
 			internal_clk = 19200;
 		else if (omap->speed > 100)
 			internal_clk = 9600;
@@ -616,7 +613,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
 	 * then we might use draining feature to transfer the remaining bytes.
 	 */
 
-	omap->threshold = clamp(size, (u8) 1, omap->fifo_size);
+	omap->threshold = clamp(size, (u8)1, omap->fifo_size);
 
 	buf = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
 
@@ -636,7 +633,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
 		omap->b_hw = 1; /* Enable hardware fixes */
 
 	/* calculate wakeup latency constraint for MPU */
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->latency = (1000000 * omap->threshold) /
 			(1000 * omap->speed / 8);
 }
@@ -718,13 +715,13 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	if (omap->b_hw && stop) {
 		unsigned long delay = jiffies + OMAP_I2C_TIMEOUT;
 		u16 con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
+
 		while (con & OMAP_I2C_CON_STT) {
 			con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
 
 			/* Let the user know if i2c is in a bad state */
 			if (time_after(jiffies, delay)) {
-				dev_err(omap->dev, "controller timed out "
-				"waiting for start condition to finish\n");
+				dev_err(omap->dev, "controller timed out waiting for start condition to finish\n");
 				return -ETIMEDOUT;
 			}
 			cpu_relax();
@@ -782,7 +779,6 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	return -EIO;
 }
 
-
 /*
  * Prepare controller for a transaction and call omap_i2c_xfer_msg
  * to do the work during IRQ processing.
@@ -807,7 +803,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 	if (r < 0)
 		goto out;
 
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->set_mpu_wkup_lat(omap->dev, omap->latency);
 
 	for (i = 0; i < num; i++) {
@@ -822,7 +818,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 
 	omap_i2c_wait_for_bb(omap);
 
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->set_mpu_wkup_lat(omap->dev, -1);
 
 out:
@@ -875,18 +871,15 @@ static inline void i2c_omap_errata_i207(struct omap_i2c_dev *omap, u16 stat)
 	if (stat & OMAP_I2C_STAT_RDR) {
 		/* Step 1: If RDR is set, clear it */
 		omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
-
 		/* Step 2: */
 		if (!(omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
 						& OMAP_I2C_STAT_BB)) {
-
 			/* Step 3: */
 			if (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
 						& OMAP_I2C_STAT_RDR) {
 				omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 				dev_dbg(omap->dev, "RDR when bus is busy.\n");
 			}
-
 		}
 	}
 }
@@ -911,7 +904,7 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 		dev_err(omap->dev, "Arbitration lost\n");
 		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_AL);
 		break;
-	case 0x02:	/* No acknowledgement */
+	case 0x02:	/* No acknowledgment */
 		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_NACK);
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_STP);
 		break;
@@ -927,8 +920,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 				*omap->buf++ = w >> 8;
 				omap->buf_len--;
 			}
-		} else
+		} else {
 			dev_err(omap->dev, "RRDY IRQ while no data requested\n");
+		}
 		break;
 	case 0x05:	/* Transmit data ready */
 		if (omap->buf_len) {
@@ -939,8 +933,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 				omap->buf_len--;
 			}
 			omap_i2c_write_reg(omap, OMAP_I2C_DATA_REG, w);
-		} else
+		} else {
 			dev_err(omap->dev, "XRDY IRQ while no data to send\n");
+		}
 		break;
 	default:
 		return IRQ_NONE;
@@ -1266,13 +1261,13 @@ static const struct of_device_id omap_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
 #endif
 
-#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
+#define OMAP_I2C_SCHEME(rev)           (((rev) & 0xc000) >> 14)
 
-#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
-#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
+#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (((rev) >> 4))
+#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (((rev) & 0xf))
 
-#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
-#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
+#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) (((rev) & 0x0700) >> 7)
+#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (((rev) & 0x1f))
 #define OMAP_I2C_SCHEME_0		0
 #define OMAP_I2C_SCHEME_1		1
 
@@ -1383,7 +1378,7 @@ omap_i2c_probe(struct platform_device *pdev)
 		of_property_read_u32(node, "clock-frequency", &freq);
 		/* convert DT freq value in Hz into kHz for speed */
 		omap->speed = freq / 1000;
-	} else if (pdata != NULL) {
+	} else if (pdata) {
 		omap->speed = pdata->clkrate;
 		omap->flags = pdata->flags;
 		omap->set_mpu_wkup_lat = pdata->set_mpu_wkup_lat;
@@ -1434,7 +1429,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	omap->errata = 0;
 
 	if (omap->rev >= OMAP_I2C_REV_ON_2430 &&
-			omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
+	    omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
 		omap->errata |= I2C_OMAP_ERRATA_I207;
 
 	if (omap->rev <= OMAP_I2C_REV_ON_3430_3530)
@@ -1459,7 +1454,7 @@ omap_i2c_probe(struct platform_device *pdev)
 			omap->b_hw = 1; /* Enable hardware fixes */
 
 		/* calculate wakeup latency constraint for MPU */
-		if (omap->set_mpu_wkup_lat != NULL)
+		if (omap->set_mpu_wkup_lat)
 			omap->latency = (1000000 * omap->fifo_size) /
 				       (1000 * omap->speed / 8);
 	}
@@ -1469,12 +1464,12 @@ omap_i2c_probe(struct platform_device *pdev)
 
 	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
 		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
-				IRQF_NO_SUSPEND, pdev->name, omap);
+				     IRQF_NO_SUSPEND, pdev->name, omap);
 	else
 		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
-				omap_i2c_isr, omap_i2c_isr_thread,
-				IRQF_NO_SUSPEND | IRQF_ONESHOT,
-				pdev->name, omap);
+					      omap_i2c_isr, omap_i2c_isr_thread,
+							IRQF_NO_SUSPEND | IRQF_ONESHOT,
+							pdev->name, omap);
 
 	if (r) {
 		dev_err(omap->dev, "failure requesting irq %i\n", omap->irq);
-- 
2.43.0


