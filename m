Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73C4138746
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 18:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgALRSI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jan 2020 12:18:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39738 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733145AbgALRRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jan 2020 12:17:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id l2so7415591lja.6;
        Sun, 12 Jan 2020 09:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cDTBvnvEGXiVvqB9EmDF3IYUf9U7iTuuWJKRtDCt8s=;
        b=eqO8iHptAQgwthI2TXVPuMR5cXD/OB0DNZDZ/zBQGjNSYSaBlrh5uApHCVrFccF+Rw
         Ro5tCvFfnY2SqWcjEyfBCnhsDEW9FMAaVL1g6dkZJAes4Zva7AScPYs7rKjLTey/Dfjs
         nqsIgdbtlmoH6W3UZVhQOHKCdp3jnXxatg95RUryczhgT9X9QGd3n5dnOpYPDybqdIi/
         De7VDYhDMjursQ2WPxcf4ad/EKvJfLsqcoLcXFtXicj9wTiMl9hlrK9CqomIasN2sCGv
         QPC0PUnE6tGJ/r4MGRVwZsqFhH09X0X5NI4Y0G/ndSZWYaRjHHeFCJQCNnigUDVzfp8B
         Rljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cDTBvnvEGXiVvqB9EmDF3IYUf9U7iTuuWJKRtDCt8s=;
        b=bv5rIriHMtUcNxSvGapu3j3aTEftwfVlPRytisgEQj2F7E9idf8M//S2d43H4ANoLU
         4mBlZBNpFI2NSmbLZYei18yoGMiWQcBVSz/nAKtZTNUcl0v+8ccHYVBgsFn6A1C6a7lr
         p7G/j/TN06kZItRgGBjtKTO6W9lAv7xYGm7p/hU4GzGTNkoCAmQUu5Vn0PvTuFtUvDEO
         pgqlcGOLeuoiDg29uxOvjiYpvtdK2NmPe24368fylf12iQgeMUbF7Jyrgxt9ojOEWtvb
         Ar0ihiX0kKufQCTdJyu5JWtymbhdu5Pm3jM2nsuuxb0+A2P1QT7BBBFoMg6AoIJEVLxP
         Zxuw==
X-Gm-Message-State: APjAAAUtcKTsohigv1RhLkZHXIXDdTHvuPJfkB7Xx3YhEfpi6DewI8Wt
        g3wqPlQTZw1XPMrLbvtFG4o=
X-Google-Smtp-Source: APXvYqxVhwJRWBwNnqR4dmok1NeAyunZtJcd+woFvOgEvAbPYIG80FOS6oKEJcf72Qi71u3Tget+ew==
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr8565230lji.147.1578849463936;
        Sun, 12 Jan 2020 09:17:43 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id i13sm4506628ljg.89.2020.01.12.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 09:17:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
Date:   Sun, 12 Jan 2020 20:14:27 +0300
Message-Id: <20200112171430.27219-6-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200112171430.27219-1-digetx@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
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

Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0245fc2b5684..e0eb8f5dcd6b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -131,11 +131,12 @@
 #define I2C_PACKET_HEADER_SIZE			12
 
 /*
- * Upto I2C_PIO_MODE_MAX_LEN bytes, controller will use PIO mode,
- * above this, controller will use DMA to fill FIFO.
- * MAX PIO len is 20 bytes excluding packet header.
+ * I2C Controller will use PIO mode for transfers up to 32 bytes in order to
+ * avoid DMA overhead, otherwise external APB DMA controller will be used.
+ * Note that the actual MAX PIO length is 20 bytes because 32 bytes include
+ * I2C_PACKET_HEADER_SIZE.
  */
-#define I2C_PIO_MODE_MAX_LEN			32
+#define I2C_PIO_MODE_PREFERRED_LEN		32
 
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
@@ -1110,7 +1111,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
+	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
-- 
2.24.0

