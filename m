Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC3511DA12
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 00:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731300AbfLLXfN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 18:35:13 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39152 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730979AbfLLXfN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 18:35:13 -0500
Received: by mail-lj1-f196.google.com with SMTP id e10so569139ljj.6;
        Thu, 12 Dec 2019 15:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cVsLJFz89Vu7CJdRahLgph9ywbohEGqsx2SWyRDeTQ=;
        b=qvoQ62DKFza17wtpugsAb+eXLIKAXhiZjbSwnk4o3pFzMdgApDHILny97csQi2n2D6
         s+XKapMvMMDYIm+GmKYFp2fO8ID+v+qAqukQw0ruC9gM5YwZAJub4g1inJQpq8sEnHat
         ZZIorWo/dNBekYGecksgzlGYfe4T5LRRhOWq97i9CVHIfA1RqwqapReypOtF+ZZMEScL
         Qoakwl3sky70ppEFv+GJpEe8w8CSYq5N5QDmCpMhhbhnSw0mgmxL5HBxPAsR6zy829pq
         2YIhFrED5+dFTwHt4sxFkDEvcgzRlfD5PQUja4wqAbOWKXLq8DGXom0OrD3ijIMLKcVt
         K4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cVsLJFz89Vu7CJdRahLgph9ywbohEGqsx2SWyRDeTQ=;
        b=kVJX3bmrBHIKJuQgQ3MItcDt62hrM1rrHqNG4amcaz7Z5IFtL64Zjs8m6MgQ7/A4fj
         KSZc+bhN4TUa4LRUS+7tpSo0oFb/BQjP8hOEL6wZ77xqLaliO/7+kNQhi8dUHtmosgRT
         umenvC+nECgjYSYmdC41D/ku5bilsbJu/k03OyoidPGg7+00UWCqBpsyCvWmGJbLOx4x
         AZ8Gdoqq5aVi4FY2vVgUWaBs0SB5FK+JJQuaWYK6ItPWIK00g9iF06xkNaTTm1aJfKtk
         o6anZPV9mBbPtTEA7EnMAnyo7DPaH3kLYNSYeuywh1CFUIoZxp5/bHJ9+lYCSzP33g7S
         B6Cg==
X-Gm-Message-State: APjAAAXMbgWtwvrhE+DoT89C6mJIxnNveyxG9CjvlXJpv3njwXga5dVs
        ZQY7ivoVOZXAPGLjK1XtrK8=
X-Google-Smtp-Source: APXvYqyjZO5T9LxNXzegg/i9RFDt2Dlhrdk0GASmx5EGlwGUoNiJdI2G95w6Qn1Q9DskdAc/wE1LNA==
X-Received: by 2002:a2e:9b58:: with SMTP id o24mr7585247ljj.197.1576193710577;
        Thu, 12 Dec 2019 15:35:10 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id q27sm3764283ljm.25.2019.12.12.15.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 15:35:10 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
Date:   Fri, 13 Dec 2019 02:34:27 +0300
Message-Id: <20191212233428.14648-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212233428.14648-1-digetx@gmail.com>
References: <20191212233428.14648-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DMA is preferred for a larger transfers, while PIO is preferred for a
smaller transfers to avoid unnecessary DMA overhead. There is no strict
size limitations for the PIO-mode transfers, so let's rename the constant
for clarity.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 799c343571bc..b3ecdd87e91f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -130,11 +130,10 @@
 #define I2C_PACKET_HEADER_SIZE			12
 
 /*
- * Upto I2C_PIO_MODE_MAX_LEN bytes, controller will use PIO mode,
- * above this, controller will use DMA to fill FIFO.
- * MAX PIO len is 20 bytes excluding packet header.
+ * Up to 32 bytes, controller will use PIO mode, above this, controller will
+ * use DMA to fill FIFO. MAX PIO length is 20 bytes (excluding packet header).
  */
-#define I2C_PIO_MODE_MAX_LEN			32
+#define I2C_PIO_MODE_PREFERRED_LEN		32
 
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
@@ -1105,7 +1104,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
+	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-- 
2.24.0

