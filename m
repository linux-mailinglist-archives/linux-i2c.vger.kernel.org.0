Return-Path: <linux-i2c+bounces-5985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119B9680D5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 09:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91051F22C78
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 07:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7477183063;
	Mon,  2 Sep 2024 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8tqoi8v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2217C9B3;
	Mon,  2 Sep 2024 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263018; cv=none; b=cQ/0F48XEusVbe703NguEewcOjQmkpvbSOJ1OJhnK+/YGAmX819Ipa1HA3hTPp9BpU5kmEi3Pov8v9YhAgKy9WlpxhgUeDKHrgeejGgAl5SS4ewDlwkuirrXUkZLIboAinE1gYPjSpe5d/PA2CBUiIEAtk4a4BQPm0O32oQvZow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263018; c=relaxed/simple;
	bh=1+Y0JalHCoCU/LU0jqow3NhVDYD+bqfOX2pYtJtYgIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wp+LnQAwRtcN6qqyjrMI9+eL0k0BlO7WWs8bvmsqRQffhfsTB4WjPWOzlO9UFsK9zBo3IfZfbzipW5JnkmES1X8U/xYZb/cZmz+RYs2fqphYV6PNhpdYlc5UlIve13TCUdklvOQfoc8xZbufuMOOAPHFyIFNhjRfhRuTNVfLf2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8tqoi8v; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c25f01879fso535412a12.1;
        Mon, 02 Sep 2024 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263015; x=1725867815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpFUa0HNPaA1/z3K1YQrq6JjQoT/x4qwWIkq9q1c5wM=;
        b=T8tqoi8v80xuBTEgChLxCtm/WlhiXaoNaO4rLxmDVeJ936sQ3Ku4hD8u4AYmSArtnl
         kIjT1ld/WlD1JS+XEZ5dqkPWUY8ASR8e8MlO92RJAfDwD0h00psnXvEsEjzR1kR/FGry
         t9fL1XUYlfGvg6S0rPzWKf66aYR92up9l61yZRrqW2cJlXUvTnYqTnUE0fCiFm+gqDyo
         WNaY56ywUPoKhIaUfF2VSM8Fc13ska3OOcrnJQ7eYgQ6G397c6j2H4HI4rBjS4JyNXTb
         EjKcP7+QA/DVg+Sr3MQ81LaBWAowI5ySj6c/objAmZgsOon+fN/qYS2EuAKl9Ah2znUM
         BQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263015; x=1725867815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpFUa0HNPaA1/z3K1YQrq6JjQoT/x4qwWIkq9q1c5wM=;
        b=XhWQ+QhI/kPnn9uxTU9tKtZ/mHXGBvRvauQTKNmdv/5qs5OkJrP2HYyQMc3YCkvLEl
         m/iCyjC6XeXsvQ0VX49IOSJYR6tu6vOgz301FhT2BV1E+dVO49FKshM63Np9fZkaUc19
         lqMmv6Vh6cvc0Y7+KTot3FlcZVwyhkBXrsZE3OEnYXzDon1sIP5tqzP4TY5jyweWIbJi
         4LGPPxL5pidJXGu732KfkKLibBRQbeC/pmK8p7eD/pknbR14Hfftb/fxbWRj+9x0Jgju
         WsBvwhdxYSVl/BKmCrOg5WqXK4z8vc6xGhzZJ0Hybbycur3y7Qe+r8r9efTkhNl9n8SF
         Ec1g==
X-Forwarded-Encrypted: i=1; AJvYcCVHnCkjE6c0M9xjpeFl6aVXHrOYmdE9Sdpk19KvmJk9JQ56y/aD1C4bR586NOIQpt/5fPP58aucMTAYY10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeSxYfnoq3PA8oj/L4+8IeTn0Ve+u+d+uC38C91AnRSPTfpK+
	Tmur7Iz0iRaGTEGEzho2lId+vgUaHvarskJfSNuKWV9JAfKwanvR
X-Google-Smtp-Source: AGHT+IGXhpPe+w6G0FeAT/iHfSIhFVsjo1uLMmtN+ZLdNG28sLEI6fGLHqIbur3Zw3B584wVE2jslw==
X-Received: by 2002:a05:6402:5215:b0:5c2:5620:f7c with SMTP id 4fb4d7f45d1cf-5c256201165mr2046949a12.18.1725263015146;
        Mon, 02 Sep 2024 00:43:35 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:34 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 1/4] i2c: imx: only poll for bus busy in multi master mode
Date: Mon,  2 Sep 2024 09:42:01 +0200
Message-ID: <20240902074330.6349-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902074330.6349-1-eichest@gmail.com>
References: <20240902074330.6349-1-eichest@gmail.com>
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


