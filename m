Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1D4260864
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgIHCOl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728328AbgIHCMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AE9C0617A1;
        Mon,  7 Sep 2020 19:11:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n25so7106387ljj.4;
        Mon, 07 Sep 2020 19:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lxvjtf4dYiAKvgZL7eYwyWdc5H5QauMaAbRRwLy755M=;
        b=SXIC3Q8SrWUGUeRnAFdu5qYHteMzhNsaoneeeTW6BzfdTaLgKwfRYFtd54IFuDdeki
         hsgRr4CiEgPwBTb7V1DQgH4etiA2repiRFPY5kz9yH8PSdeFpDzqguwBF3Dr0KS67vKo
         RbM3Pb4/WUGRCf9cmSqJjnSPpFBu/MV90h3US9j+yX8ZtTdy9TI7VSGFLSE/XvgLIGdA
         h78sO84zdAJX36lUyA72g31DiMEx/J4KZ8lUM9mWXQWYAX0O1fpWNmRfnzmA7IjW5XQf
         hkZz7ITkURMfbTdXG5sn7YtsEc6aCf2a/YFzs0/rs/C9hSDkfAAVOCjD4OK8FI7V3foM
         YpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lxvjtf4dYiAKvgZL7eYwyWdc5H5QauMaAbRRwLy755M=;
        b=I54f5dhRg5ESHWm8Av65sxe9TGX99Pasc6ia8aYcEAjDXF+LH5m3nRJ/ay82GG2xSh
         Lg53kZP7btSrxVXCrlQ017tSAVd5OWwjNAdnspgBX9Wz8duqwdvDtOe2720knTFzASf5
         kov53p83XPcGgCJ0x8ujJL88wbNnPmTIqTEpnS4CP1ORQc6hzEUxMkHUPBl6Vn5Sq0JE
         Ncb4YZ8MuMLQ57gYnsj8skWioZp+ruKnrSgkccRU0ePl0TuFXN4BQBRfvrquvolaaFaI
         35xVtly+moSCYc5XPMEJSTMNze0bn8WuXUoX7xDQsKreEIca2gHKGS5hUgNMt1J4K2SR
         CBmA==
X-Gm-Message-State: AOAM531EwLyIBv+2PgV3MRVDxRZaWtLniXtCi9LmjDbJXrjw0IbS2GEu
        e8wpafRchPSKnBuDy7yjXPk=
X-Google-Smtp-Source: ABdhPJysiWP28b7t6ydytix6g/oK2T8yL2PpXxcryP+HVlaolLiMbkUYyCwNZykLDQZqU8E1ZOBtIQ==
X-Received: by 2002:a2e:a304:: with SMTP id l4mr11810448lje.35.1599531114697;
        Mon, 07 Sep 2020 19:11:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 21/35] i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
Date:   Tue,  8 Sep 2020 05:10:07 +0300
Message-Id: <20200908021021.9123-22-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The DMA code path has been tested well enough and the DMA configuration
performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in practice.
Hence let's remove the obscure transfer-mode switching in order to have a
cleaner and simpler code. Now I2C transfer will be failed if DMA
configuration fails.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e94da14d36e2..ba71b64e5e64 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -940,8 +940,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
-				       size_t len)
+static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 {
 	u32 val, reg;
 	u8 dma_burst;
@@ -992,12 +991,10 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		if (ret < 0) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
-			dev_err(i2c_dev->dev, "falling back to PIO\n");
-			tegra_i2c_release_dma(i2c_dev);
-			i2c_dev->is_curr_dma_xfer = false;
-		} else {
-			goto out;
+			return ret;
 		}
+
+		goto out;
 	}
 
 	if (i2c_dev->hw->has_mst_fifo)
@@ -1008,6 +1005,8 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		      I2C_FIFO_CONTROL_RX_TRIG(1);
 out:
 	i2c_writel(i2c_dev, val, reg);
+
+	return 0;
 }
 
 static unsigned long
@@ -1141,7 +1140,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
-	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
+
+	err = tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
+	if (err)
+		return err;
 
 	/*
 	 * Transfer time in mSec = Total bits / transfer rate
-- 
2.27.0

