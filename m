Return-Path: <linux-i2c+bounces-5475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE595647B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 09:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0C851F245D9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 07:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66346158A08;
	Mon, 19 Aug 2024 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWi893Rm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5415853C;
	Mon, 19 Aug 2024 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052061; cv=none; b=elUvJSEK16no7/96d6u6e8n8VHEZw8KQIMAMRh8lQkGIXvt3rMR0kwgc6LE7piDtTG59B2NrPId/VOhoQ62qbg3tCVHiPQLKqTLX5xEdHAYfWTLTJCVb1rfVkykEanQI6UtBKNfkN4HppaJ8qIhG43j/wSa9l1Nj0ghcdtjK718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052061; c=relaxed/simple;
	bh=7EukbPFp9jYwNRKD9UsgVvXRecgMzl9o3py4Xy1umos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7tuRzU6M5s8t9AkxAfNGArBgVoSdf7KIVe3NuN0Nm+MCuhfDAISXUUN9DHQOcAnCSpjKl6zY5d7fJ8BXPSdNDtQFMGcrjkNQbbRpwyiyEs2XePz8oyk5cZyABN0Z3xiAhv62qUv6cTPH0QqftDh4u1pdVwHCiOiECSvuC+j+kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWi893Rm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3719f0758c6so1292217f8f.1;
        Mon, 19 Aug 2024 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052058; x=1724656858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsPA5mclXdisvKKaTQ02gNCQ1XXrITHCNqT/Xgg4pnY=;
        b=bWi893Rmy8D5GFM6Iwmj5rzHVQVdHsKnFuFslLVQjDbi6o4nxXGJtg/2nTJc6NJoCD
         N+yzb3p8OtsBwvESXw3hAO2C1spLoUHUw2VF0mDvdypFa8ZYv8txvaEFCyL8SsauKsW4
         fPivojZztqeFEzM8AMR2jX8mXCl9nAqfNnHfH7omtyOJm/0kaOsZIeEdfL7NIeJuHL+T
         SnVtousvzOWgXKvQu0ZbCYcEI/Yz+OyloFDfQe0JrgDKXDl/552YU088trUBwSGVpdVb
         jLgp5ju7QXAIMBk1F4h/Z0KnWNN/PSxlskSLe4I5LlOJul6u5bTyqu0rAwUA+VPW2HIP
         XJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052058; x=1724656858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsPA5mclXdisvKKaTQ02gNCQ1XXrITHCNqT/Xgg4pnY=;
        b=bHxKugU+DG/Sbi6Psu4sZvM6y2DRIlLtELmb94c49Ft6vssMP5L1zDx8tBByur9hpi
         r4w5KGU+QE9wrvVM9fj9gS/FaTG2tXlA9vV++RfDSwkfPsCSuED1URd8Gqqu5O1ggSQi
         RG77vSd7bq4o9qbcK9E+4/tUs3LxZ3DlStefnMYJDR2H7HnSIIJzDegcOW3GFF6N4hnk
         Ur10QksLS1+HR+HUXFWv1lGWoZlkgBuMKqj49PWDLnGOeusegfJz0mnyIlD6v0pMwMKa
         jdjvuR1sddubLG6v9rgXpcXFySIAAcHFFMBb6KPoF5lm4SYyaaFNbhtmVZjx4s8dzYEy
         5g4w==
X-Forwarded-Encrypted: i=1; AJvYcCUfZuP6nfL7pLogLjRzz0P7KHyn3XwKA4oDBupWmuk9sFxxYQqtlD1w7VWSyK0uwcwNU1QJLfbV33TTo2W4Xw4c5ECVejk6D6hookHF
X-Gm-Message-State: AOJu0Yx+oOXJXxaDoaXADoo3wHSv6l19s4Idb0g0FGpSYocD7NCwJfvY
	SNKPuvpWci99jCTHJd6/jeHysunVnty8dVnNDjW6bewsdUjOmE+3
X-Google-Smtp-Source: AGHT+IEUwcTEkZfbBy8umdlK7hlL1JY0T3hwRz7NQ1Yzdd8B4npZGPeuvqx+Sh7ON7/mAc5VseEm9A==
X-Received: by 2002:adf:f5c4:0:b0:371:937a:3276 with SMTP id ffacd0b85a97d-371a747839bmr3485924f8f.57.1724052057345;
        Mon, 19 Aug 2024 00:20:57 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:57 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
Date: Mon, 19 Aug 2024 09:19:07 +0200
Message-ID: <20240819072052.8722-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819072052.8722-1-eichest@gmail.com>
References: <20240819072052.8722-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

According to the i.MX8M Mini reference manual chapter "16.1.4.2
Generation of Start" it is only necessary to poll for bus busy and
arbitration lost in multi master mode. This helps to avoid rescheduling
while the i2c bus is busy and avoids SMBus devices to timeout.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b7..1add946e3bc20 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -216,6 +216,8 @@ struct imx_i2c_struct {
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
 
+	bool			multi_master;
+
 	/* For checking slave events. */
 	spinlock_t     slave_lock;
 	struct hrtimer slave_timer;
@@ -481,6 +483,9 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
+	if (!i2c_imx->multi_master)
+		return 0;
+
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
@@ -540,8 +545,8 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 		return -ETIMEDOUT;
 	}
 
-	/* check for arbitration lost */
-	if (i2c_imx->i2csr & I2SR_IAL) {
+	/* In multi-master mode check for arbitration lost */
+	if (i2c_imx->multi_master && (i2c_imx->i2csr & I2SR_IAL)) {
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
 		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 
@@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
+	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.43.0


