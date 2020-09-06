Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B25D25EFCD
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgIFSyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729194AbgIFSv5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:57 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69614C0613ED;
        Sun,  6 Sep 2020 11:51:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so12680196ljd.10;
        Sun, 06 Sep 2020 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yFOJedfPdL6ZXIsZin/sbekfS4yBpB4E0u3zT35lcg0=;
        b=ksShP6KOaE+hNHbVqbbH6OXZ90GgPfjlLLxucj7GP27nsvqj/AMXAhJzCn4se87HZc
         +0R3TWZ0wHPnUObUaJzVLbx0RlSgLR6rTWujPNajYI89AEFRqaow+gXLdn6kVdHZOhwj
         Dz1zOpV9Rho6GVt11KKI4J61VXuxa93PcbTTFkeeliiKGg2mIXGhYFyEfmP+YrpAAbqP
         jN34kbbMvWyZmYbEdHomd5bFao2kxp3vPO6WVpTuIL6PGJRefkWZcXRKoHt4R+2g5z2W
         7nOfYUCE9h1F/fF+q0eHcNKGDEvr3BtoMrTnevgRThhSu6h4YH94RLPopreym1OZjJ5W
         NQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yFOJedfPdL6ZXIsZin/sbekfS4yBpB4E0u3zT35lcg0=;
        b=U0hc4sSHPDXcj53Ki7lTddpPFiJ1lzkHl4ZP2Xv/yoVbTUn3WtFYopqBodWRqUty/k
         4JCw0nP/c9Uvo9liaOpa59wRkJNA3VFB2jkn2kTyBkEJPA7NsxED0qgeOpTr4ldic2P2
         7Ed4Eb9TTOalZMQ28lVY0cxUIB6NIlE6PZzj3Bsl4jgHFIhwePo0qVqXuQiUvJOrzJs2
         SHRZho79V+rCi+3rvod8ETQM6h3ibzIX/QmaNE/WLhBgBKZm9LzXSWUhVzHdbgwWPqdE
         7Ls5Kyb3XcrosT0/eeaEPt2kDaYsvt2LE2H7w38LTqtlZxDDdcQFWYpK3IhOURVWw8id
         Ypwg==
X-Gm-Message-State: AOAM533I15cb5615pTD1aQ43ew2WTJF9hGNX4A7vcuWmejgWQG/kLmVi
        s+n5X6uh4Ul4Ek4Ks248VfjRRtR0l+c=
X-Google-Smtp-Source: ABdhPJxFTzkOOXtzSRN+75UzyFbZSuPRkmLJtSQnON5vEjjwrAf6cz8udV5RHBCrVhze7zm5GsGh9g==
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr8387075ljh.422.1599418314907;
        Sun, 06 Sep 2020 11:51:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 18/36] i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
Date:   Sun,  6 Sep 2020 21:50:21 +0300
Message-Id: <20200906185039.22700-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
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
index 20168e49dbb2..f38e0f3fe367 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -975,8 +975,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
-				       size_t len)
+static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 {
 	u32 val, reg;
 	u8 dma_burst;
@@ -1027,12 +1026,10 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
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
@@ -1043,6 +1040,8 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		      I2C_FIFO_CONTROL_RX_TRIG(1);
 out:
 	i2c_writel(i2c_dev, val, reg);
+
+	return 0;
 }
 
 static unsigned long
@@ -1176,7 +1175,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

