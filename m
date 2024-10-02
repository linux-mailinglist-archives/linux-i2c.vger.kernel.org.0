Return-Path: <linux-i2c+bounces-7179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F698D21F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 13:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC99D2863DE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8C01EC019;
	Wed,  2 Oct 2024 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hq5A/JZz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA91E7646;
	Wed,  2 Oct 2024 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868032; cv=none; b=IxZlW74+7GJGVcs1T33kdhPk6Z9F5s5bCiMco9xceNW1vcKFF74D90tYepfPGDi2tnFZx8RF0gs9iVLG4XoN9On7HddYxQsKXIhoWtc0DuB4IO50AvLKNkLbsgY/hxi0fFCvMEk0XBdGBcG0Ca/u5eyq8a9+i3UpbrEWxbQ8rmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868032; c=relaxed/simple;
	bh=xEztw/GwwhLD/gX/2JuP2k+o9OcVESh2PGvr7/izPNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WghZVzvrRSu8ttHRbZiApEfsXCF9Wk2NV0etDJI2MBWZddy5CsHy7wtz7h56IKzZ01RUWbUltyYQvdUXqeCts2lQzA6+2EaiZ5ah0i+ksxkZt49o7C/i4LCND4JF86BpGq0pcBc2+rfuaB8rV+cp0DS7826eWteifq3Bpcv/PdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hq5A/JZz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so60198765e9.3;
        Wed, 02 Oct 2024 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868029; x=1728472829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWe1LOAQAUHDMm2EMz2P+3VNJFGofn6qsW8nJYyiXVM=;
        b=hq5A/JZzAgZfijQFVsrHqAivcsF6kMJBwm03JkaUTqQT78Y3jTNu8uan2B9Ii/LzlX
         XrM0RJdS5VZ2RzmDCxRPZeHrb5xWmYGCsnR61wb2yS5ci0uGF31UyQyD2KyHSOhMJSuA
         TtR+T8fwWYp7Oe9m+YK9uuyVofDUi81IhsWnDehF9JN3Wf1wMUSkYdg4xcmiAneLRgsH
         Nob2oUeU2eXA7Dayym72LWP8DA+C/qc58c22mvYvugZ5Y1IxB9gl5gIzOeWldnURdxbl
         cX7GjO4VNO0RrIW5waJ0Q4BC6YzzTwwx6O6uslWZRHwEToQ+7wxUwFsXxe9+3nYvsBYL
         FrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868029; x=1728472829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWe1LOAQAUHDMm2EMz2P+3VNJFGofn6qsW8nJYyiXVM=;
        b=NGA6+k3XpkcBOJDhv2eX1bGVtKEgebWOVMq20zaPNQl/Olwp4BSqyGBjaSGhtRiokF
         sOhscuxEk8s9VZpPvbicqWBewRbDoQY/O/AbpYv2Uk9L96t3ueBYechm4+m+Q65d4N5D
         Y7AaxA9udHZr+T5tekO4MZiviT+NWPar2/eyyj61DINQl41/n+vgNARV/m3KLAitRO5m
         5cBVjy14wFaWeaahs3tRBXlMH2yRQRJRl+7rAvLUdfvOPkhw3IXDn3XP0ad4YOIkbczn
         EXuA94SNglxqldxDdO8NNcti4JlEVYw+iCyeAduAVnY2zc0Gxxn0hTAfzTr9pNtGxFzg
         OB7g==
X-Forwarded-Encrypted: i=1; AJvYcCWam9PIIY0cAWdV5A76Ntr7nCNiARw8+91zhPX3Rg/lK1K5cCw9AcwdMgNu1yUKbMjpP8/0hLhri+4T9SY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGoTbdOQYzjn1+7QbvMFv60ZnMuqC5WIBC2RLsYugmUbd7R2/
	r4wCmmkgSp7wj0n9v3mvr+rtuE/okseDBt9VmdJrCAawfBU8+5LO
X-Google-Smtp-Source: AGHT+IFGTSatLO1Ox4UQ8gJUxFQ+Sve6VZQyHmLuQ8fa68lXptO2HqFrHIWSzqjI6q344kc1YAHVhQ==
X-Received: by 2002:a5d:6189:0:b0:374:cbc4:53b1 with SMTP id ffacd0b85a97d-37cfba0a641mr1674756f8f.40.1727868028950;
        Wed, 02 Oct 2024 04:20:28 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771a1209sm23530685e9.0.2024.10.02.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:20:28 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v4 1/4] i2c: imx: only poll for bus busy in multi master mode
Date: Wed,  2 Oct 2024 13:19:39 +0200
Message-ID: <20241002112020.23913-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002112020.23913-1-eichest@gmail.com>
References: <20241002112020.23913-1-eichest@gmail.com>
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
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 98539313cbc97..fbacdfaf6b28e 100644
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


