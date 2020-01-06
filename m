Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4EF130B24
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgAFBEn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:04:43 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40997 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbgAFBEm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:42 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so49277774ljc.8;
        Sun, 05 Jan 2020 17:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cDTBvnvEGXiVvqB9EmDF3IYUf9U7iTuuWJKRtDCt8s=;
        b=cR/B/H5qWJgUsubdpZPIdaj65SQUpvhjH8jFkso02zpHtMu5MRWDCAz3c5INcPeSKG
         /rWolqkDyKQBkIPRZzfn3OoMsY/XfmmcqUUT9PoBuFRLYxBm6uLdHTchOqsnD2fHM5bE
         GCtr0KJrhlLekoqCqCYBA1KDweuHycZ/97uTKYFAzB5xocGogWcgrXHb5wswHlcCOi8E
         mTdW2FtWNEi7VNfh8h6gQiKtbNtY0LYiTK0wXXn1wQww8iK0D99xNQtl1/C5cGwvWepe
         jPq/zHmc6iWTTD9Cl2zLuvOJpXwbbRtWhQzj5UbeOeYyYwwQVIsX9ODB0FvC+Ip2vjT7
         mvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cDTBvnvEGXiVvqB9EmDF3IYUf9U7iTuuWJKRtDCt8s=;
        b=YUlJHJAAHw4yYfgSAsonFtx2St9x/RbS4u54cN+cIUjCqRJGt9UxpZUqQI0ApK/OQG
         oGs64/A57fIuVxnRbH05e9mD8relBU1fErcFrx79biCoB1Fuh3L86YaTO83blbT2mz+Q
         1phGYicd2JACkXa5Xm1g0HEl11uxP7gQyhwB2aZkyjr/ngaQS3JcUhm57gLcRo1xbfDr
         klQaUTyIAFUkDcvM6edVj62x7J7ioiiaFmyegmxPwG/ulog+nlV5uziIjsc1TTCvh7kB
         eC56SvkfGo4zK8mHDAxJf8K94DLn40M8KpVP1uuR0/eo6gH2tlUcJ1sLgQlAvqK9sGw2
         3nJw==
X-Gm-Message-State: APjAAAWC8EYRqkResZjkUlF/nctSKvFcHV+eyRjc0sh6uM2e+Kk4bdae
        zHCWn8PE0AXj/rF9HHA9OtHsdewW
X-Google-Smtp-Source: APXvYqwZxtnGUKWsJGyMJ2sYjA6vA3eyKvbCJsz+3QAKtCIgLrUywnYckusX09tNltqQWO8dTK9Suw==
X-Received: by 2002:a2e:9015:: with SMTP id h21mr40903117ljg.69.1578272680349;
        Sun, 05 Jan 2020 17:04:40 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:39 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
Date:   Mon,  6 Jan 2020 04:04:19 +0300
Message-Id: <20200106010423.5890-6-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
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

