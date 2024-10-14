Return-Path: <linux-i2c+bounces-7363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83199CB6C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 15:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C895BB26F7F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF91AAE0D;
	Mon, 14 Oct 2024 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUW/2+QG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC81A7275;
	Mon, 14 Oct 2024 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911805; cv=none; b=FiRLYAy9qMaRDR2fnyM9aYaGxGk+gwbtSmGxnU/aQ5q6oLH/VcJ3M29CT4DyAXKkhaa6pwrcaXf2Jw0Dw2QXABw4Nm/pFy8O+v1TQ3yAIcWLPZQ5YPtEiIL2TQ6cOV9R284ARItK+oUplL8l60H6o/BEm15i96TbMkie0MvinjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911805; c=relaxed/simple;
	bh=FGh1USeWntWI8ZQEGAaLSFGyBkAiHg39jlIcF0HR9O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5ByoKfnyowHELRkM1oLgL/QtYPd9IChH53seC5o/heOaQkCLhW5jNZ/E2Oc9uCMK3cUqOzkxY95StsKuQYqc8vivUHGyIeT9S3W+GOz40UEM6MsTvyG2aus8sZ4R2ib0h+bdohLZGHR6VYRNDv7o7JiEFW1eA6okKyNNJXlE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUW/2+QG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43056d99a5aso34089535e9.0;
        Mon, 14 Oct 2024 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728911802; x=1729516602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUH25x79k8EHQsto7o4HWXcz+cLM47kx/MicJivdg7g=;
        b=eUW/2+QGGek+2cYt5QN56jVZVopSH3ydnAMlVRlVZUDnnRf89b2baQMr5yS45CyCy6
         eqolpk8cQ86/d0dKtEc/UegRj8Oarig07cDF0P5h4AtF+Tj3fl3vRkwLELc9UueyvqbJ
         r1xYZtzwiUpnpbjTOU3l+pIId7EqGUn0q8URrrqXhXX3roTcw2ENQvfNVTIMGO7khU5p
         eSciwFjWbQS0f4ZK6SKGeJYIQTAltSJLzZvs1Zi1CgTvgS9iO4ltTwCPYA+hT+4qsnuw
         svQtvnPYz8xK/YEixs73vP4f0qshn3+SWxSn98gTQyJkh86cYAEpxvHY0SYumfZgjgCZ
         BHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728911802; x=1729516602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUH25x79k8EHQsto7o4HWXcz+cLM47kx/MicJivdg7g=;
        b=JPeyggPA4iJbNy45+0Ez+r9lInZzTWq/AB2cboCdnhaRKCIQpFcytw6msBAnSjDybg
         oJ6KgFznKwRSpBdSqiafBrT1NgpcHlslT93tVM1DweFQh0n17QlM0e0iF38NGalOT0zR
         OVK75yoWxl92F2ZekoivGIqsoLAsxpbQ1d/gaQSuy8Cta6D1id1sH6nBqBUVFPoi0Tq+
         ot7zPWYPxQI2ciirbpXSZ3o1E29espeUpqEIXCX3Dl6gYuu/tKPCflI0py+c4lrgb6TW
         /bQHRrhzcafhAiJTEwH/9uWgAWR0EZKe/8lHg5Y8ISTYjYzL6ZkkTIL/m/SNckY5BBZI
         EQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1SkRuiY4NK1MU2neZa9zOlFmKHkM7vYKCvz9ExdacSzN8+SgdXoD4/s7/cfAbQEOn9XvQb0XWEUQ+M8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0rMP+bFPTrD22Vgo50rFk/2vuOqDYId+NEaveRjMHDCsJfho
	YSEcjwMab7+EnzNENGV80ZqBkwjduGse0yb5gY1L0ZBFjFKuMLLL
X-Google-Smtp-Source: AGHT+IHFCOhkWsbSszMYyapdJCiM6wV55PCzOwhLCTtrrsuvQ5Od0oVlQ1v7sPpCFmpXOlc0aIrgWA==
X-Received: by 2002:a05:600c:3106:b0:431:136b:8bef with SMTP id 5b1f17b1804b1-43115aa52a6mr133830585e9.7.1728911802065;
        Mon, 14 Oct 2024 06:16:42 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:d130:f8ef:c6c1:55ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d42fsm153420425e9.43.2024.10.14.06.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:16:41 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	l.stach@pengutronix.de,
	arnd@arndb.de,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v5 1/3] i2c: imx: do not poll for bus busy in single master mode
Date: Mon, 14 Oct 2024 15:15:12 +0200
Message-ID: <20241014131635.205489-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014131635.205489-1-eichest@gmail.com>
References: <20241014131635.205489-1-eichest@gmail.com>
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
while the i2c bus is busy and avoids SMBus devices to timeout. For
backward compatibility, the single-master property needs to be
explicitly set to disable the bus busy polling.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
@Frank and Oleksij: I kept your tags even though I made multi-master the
new default. Let me know if you have any objections.

 drivers/i2c/busses/i2c-imx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 98539313cbc97..d697abd2459d4 100644
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
 
@@ -1468,6 +1473,12 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
+	/*
+	 * We use the single-master property for backward compatibility.
+	 * By default multi master mode is enabled.
+	 */
+	i2c_imx->multi_master = !of_property_read_bool(pdev->dev.of_node, "single-master");
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.43.0


