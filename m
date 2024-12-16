Return-Path: <linux-i2c+bounces-8521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC29F3443
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10209167773
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 15:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DED1465A1;
	Mon, 16 Dec 2024 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYuQ+ULc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974A146599;
	Mon, 16 Dec 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362329; cv=none; b=ah5e0JZAG4KcBw2V6CEE9JmnpldeQ1fnHzFZkzLGGNTWfVxtUUwoNCZNPU1qLs2swYw3N8ZaPDBbpaeNaSPBU8274vAhP7Q9MqUPem1KZzCPZu3LXXe1TO+AyIoPRyore+vDYXCU81WjZqncJimlEk7QegPo2fVyiyJcmXTBJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362329; c=relaxed/simple;
	bh=UzGoSy4ZSRHs3s5CX4llzjwYLDEDVAKyM9abgyG2RGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8nyIzEbXhUBywZzVKqu36W7RkgGSfVwFlW8oStxnr8knBD+bhbVTy9W/IrrpxHtuXOXDhY56DHTE37WrG4vkE6r5eGSr2v/6pgaHSDzDyCYuleNVJhE1huLpFO11P6wqXSGF6BOXXpiAXY5OyDTZ0/VZBUlK02awh9HGTghdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYuQ+ULc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3863494591bso2277606f8f.1;
        Mon, 16 Dec 2024 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734362325; x=1734967125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=;
        b=TYuQ+ULcFasz3pNBRTkzCoaCpsDYSX024Zwey2g9kHTkqflKUbzYyBH1DDxQIqouAM
         E971+aC+vzmz2u74WNP9UmLEy08TGS6hPODgJYvHvmmQCfpE3sIw1XnCLLrCFPzlb9Nz
         24apfuupmerk8qz/jHUIWjoNlKaSvlyicGh/aCZwVn9+rJU3PQ96z9kYAKuRJ8/5dXdj
         BZdDg58N0uHZWj6OVzmIuMfN6eIkK++q6p6bCam/6mYOAnCPWZc4tUkvsLL1+haeDBd/
         YAvQ8pgk7JA89rW/MwJdiKKSYTJWZiUKZRerm3EjCgMeZr9ZC+A4uzPGyxKHSUxY4Fqt
         La5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362325; x=1734967125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=;
        b=kBzIjEYfrGH1AVQUtYAEkba5mxBU5jmBDhUg2f0H8pBDMar5uZkJisam6+t9vGOnsK
         U1WvKO7rP5RZtkQhFtbzzEIBUBXCJ/DeexbRPdCj0t6u9D+syXQEUrJqomnfkF4O7cJE
         3/VPS3FnMSIS8aoz0qZ/Y6mKLvtffS6lQTmYPa2ThwY4+7jh7jnelK2E61r16uBJoKZn
         2yA9q2TGbGOvG9ETyTmngF91bRbn70TnwbdQdvQ6T42hB8T3ctW0k3J43hmFF2zBNNC/
         nHES5rllHF252R3iLkLfR3I15tR9Jka0/zxMK/LpRd1HJaueMTQdbCopIFXBlwOcRZrF
         Zzhw==
X-Forwarded-Encrypted: i=1; AJvYcCWDSEXSlQ3qYJy/KZ5zwwvCMDCsVUFltVdka4m1AqvpMifled/qtA1mMLbRQMSc6jVDM5wG+1hooR0jNF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLycxPXeQlKf17H6nUyVzP1AwO3B9NO86/rI3HVwB/K0VAvHZ3
	g8hqk7Cfwfr0CB9+oWytEEmDMNuqoS+GE1oSaV+I/7z+e7JpXcW4
X-Gm-Gg: ASbGncu6nW4oeHgyBmqj2uzZM0rt2UWYbyaStdcv91x1jHtmM+Rp9eeHdx2mi5M5KxX
	LcCj3tuvDUs5aXF8PiL1z6YUIT94oYeOI6kS3wU9nsIotWUUpYVbDy/o8n7IXi9XKH3rO+VKfaQ
	wwcrHlpu17aGrcl2jxZ6gGBvvbE3oQdx70tCPGpoVNNdqmEAV8YV81TFUnLeP1VlV8hdzg3vkDw
	OFQ7uBTKEtyTY1DGlk68FXTXNg67btIM+zOJ2Uv2dL2eL2sRUGdh1+iLuURVVvFSpOWsGSL
X-Google-Smtp-Source: AGHT+IEr92SrsyLf8UEGh/qJ4AcuJCbiE9QwqwVLL1sL4V60D+nHXLQW58JemQqBLG51UkqEem66Mw==
X-Received: by 2002:a5d:6487:0:b0:382:5088:9372 with SMTP id ffacd0b85a97d-3888e0b88afmr11406631f8f.43.1734362324993;
        Mon, 16 Dec 2024 07:18:44 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:9096:1cad:6f4d:511a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8015f77sm8351129f8f.26.2024.12.16.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:18:44 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: imx: fix missing stop condition in single-master mode
Date: Mon, 16 Dec 2024 16:16:40 +0100
Message-ID: <20241216151829.74056-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

A regression was introduced with the implementation of single-master
mode, preventing proper stop conditions from being generated. Devices
that require a valid stop condition, such as EEPROMs, fail to function
correctly as a result.

The issue only affects devices with the single-master property enabled.

This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
polling for single-master mode when generating a stop condition. The fix
further ensures that the i2c_imx->stopped flag is cleared at the start
of each transfer, allowing the stop condition to be correctly generated
in i2c_imx_stop().

According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
5270), polling the IBB bit to determine if the bus is free is only
necessary in multi-master mode. Consequently, the IBB bit is not polled
for the start condition in single-master mode.

Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f751d231ded8..cbf66a69e20b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 {
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
-
-	if (!i2c_imx->multi_master)
-		return 0;
+	bool multi_master = i2c_imx->multi_master;
 
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
 		/* check for arbitration lost */
-		if (temp & I2SR_IAL) {
+		if (multi_master && (temp & I2SR_IAL)) {
 			i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 			return -EAGAIN;
 		}
 
-		if (for_busy && (temp & I2SR_IBB)) {
+		if (for_busy && (!multi_master || (temp & I2SR_IBB))) {
 			i2c_imx->stopped = 0;
 			break;
 		}
-- 
2.45.2


