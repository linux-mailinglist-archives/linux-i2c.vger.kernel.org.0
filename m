Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F03C139F08
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgANBhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:37:01 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36064 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729147AbgANBhA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:37:00 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so12403090ljg.3;
        Mon, 13 Jan 2020 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6cDTBvnvEGXiVvqB9EmDF3IYUf9U7iTuuWJKRtDCt8s=;
        b=b85QbUSCNv5ohXNNP4jVLX6NWSufaDjbrGJqmT1C3WFC1jy5j9+DPG6iZwk8i2WX8+
         vmFulgBibdDxbIJMFCgpHgMM7NOSvwDi6o/sWpuNUJxkvA+B7TKa1BwYn1zkLSqjSUjE
         43lwWskDEJhmHKG7+3uBEoEq8+xBNM+wZrPDWqZbD7zscKDz5aaselvtkoW2hkdxLSbr
         ciZsjVo3/pQA1PllEgHwqQLO39nnceEXSyiMisIJltgZV+GJwtl3UAYz69PiHxbBsbcU
         a87YSZ70h5iDcSu6lSu0vOnxw9Cot++60uO+/y1fI9SN+HcYo48ERZ25+6L6rOl7bc5E
         3MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6cDTBvnvEGXiVvqB9EmDF3IYUf9U7iTuuWJKRtDCt8s=;
        b=DfjS0SEjLWG2w2b9bHgFGQLuGCq7HHx9hKB55EadbQ1sEkEKXh21HEmo4tTzIaAwxm
         OlJk/e6zF4exaZWWsOHBdbP7ng1DDqr2MT9JwnUeaDYTEw58o7u8Podjg2jSH6H+juH0
         f0qVDDbWGTDPJlF006l37PVOo6Khf40cYxv+hfIYfAj2aJE5AO+/R+ABp//chbqsalOr
         Pi7vTJXnn3vYN/jKnpEH8HydSEEuvwvDnyt5JltXnOcaTUCazfmn6CQRQKJoe7Auc68S
         ajWEut/I5yYh5B9mdUBRFJVbjbowSl3mvbsSQf5hHsLDutK7QCAB8VLGsnwWrigWDPao
         lVaw==
X-Gm-Message-State: APjAAAWzYEs5UrHrU/+uv1EN0ICTCtGS6oF4Yn8H+80LFvM4AliFDmj2
        iJFW6BhFw6uJmv7QpJ3K/RU=
X-Google-Smtp-Source: APXvYqzWi5jSIeFgajpsbcYlaTQoMEEzkFc2UJFkfaiGWgXb93+H5xh94StiyhcJ2sNjz3KsdpefUQ==
X-Received: by 2002:a2e:3609:: with SMTP id d9mr11928117lja.188.1578965818251;
        Mon, 13 Jan 2020 17:36:58 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to I2C_PIO_MODE_PREFERRED_LEN
Date:   Tue, 14 Jan 2020 04:34:39 +0300
Message-Id: <20200114013442.28448-6-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
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

