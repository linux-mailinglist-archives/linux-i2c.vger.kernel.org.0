Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C665130B37
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgAFBFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:05:11 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44661 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgAFBEn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:43 -0500
Received: by mail-lj1-f195.google.com with SMTP id u71so49244877lje.11;
        Sun, 05 Jan 2020 17:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+y0KhirYz7Qpd7TQAaHTz11cWV+TrICbXO1Zs7mmjzE=;
        b=cBDSl6BX+bG78fS9ceAiGmLYmA/BUZXPHrB8v9zYYmDm0c3HwbQbcp1FIG0ZTODn1t
         T5efgSl9OdnDNusCM38UpYfmYqAcvUS9T92NE+wJfOB46RpQ+nMoQSXKdzU8DBjDz8Ps
         BPiQbBWW4syyNwL5/7Pcnhbpf9rX2wokFtzvw2RDuf2EgpZibInexNL0jI/woGfZYZro
         KW9+CR4jlbgAgvDrvxUHcjvTU8eZSDO9ejM2luzbl6p3ySUadBzzWgICyhmWwlojLiyx
         WLEkD6t24noPSU5b4odeOWpao2h4e6B4po7SH9U+Db9M86FVJ5t5GDuGdkxT2sGcQJaI
         cJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+y0KhirYz7Qpd7TQAaHTz11cWV+TrICbXO1Zs7mmjzE=;
        b=rMGMxGUVRt+Fhebxf16TNztMmBdZ40gb83wm04vXlqb8ERRlVVgfB2Tjql6Trw3Z8P
         IO1d8tBUMMpxjsLMLxd82JKorENqkGQqohX2uS0BmJtnu6hR+nCSvyyZGFGl4vwpVJmB
         VO44B0FBoU7FwgwNxWfwbWWDyvfkUzJ5QYJAwZ4GtoqNa8bn5ZztNSAuhzH7JsACkF8R
         cvysKAVZRSndvXheWZ+AMX6lQ7RBk7LmDSkOLBBoH2HYJaf2WgkokRQ816dbOLby7pJe
         bwM2r1RYGmG7JrM9QXRt9No5M4kYCogrj6oaDgle5XENbqkBNcWUAuLEpz2jvZYSWZUs
         DvbA==
X-Gm-Message-State: APjAAAWQtPknhWAKVftAyEM9XDOKxj9OU28e2oROxnnFwyvR5DzwozJ3
        m/SAjxABYobi16s0Kh0KePk=
X-Google-Smtp-Source: APXvYqxiC8fsFkLbJrAn9UCtvMXmxfBU65X85JVQaGESdaY26CXTwpcEH/T4VjhqozbrIdp7A6s9ww==
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr58126603ljj.243.1578272681222;
        Sun, 05 Jan 2020 17:04:41 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:40 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] i2c: tegra: Use relaxed versions of readl/writel
Date:   Mon,  6 Jan 2020 04:04:20 +0300
Message-Id: <20200106010423.5890-7-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is nothing to synchronize in regards to memory accesses for PIO
transfers and for DMA transfers the DMA API takes care of the syncing.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e0eb8f5dcd6b..1a390e1bff72 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -284,12 +284,12 @@ struct tegra_i2c_dev {
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
-	writel(val, i2c_dev->base + reg);
+	writel_relaxed(val, i2c_dev->base + reg);
 }
 
 static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
 {
-	return readl(i2c_dev->base + reg);
+	return readl_relaxed(i2c_dev->base + reg);
 }
 
 /*
@@ -307,16 +307,16 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
-	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
 	/* Read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
-		readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
 {
-	return readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
@@ -689,12 +689,13 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
 		if (i2c_dev->is_curr_atomic_xfer)
-			err = readl_poll_timeout_atomic(addr, val, val == 0,
-							1000,
-							I2C_CONFIG_LOAD_TIMEOUT);
+			err = readl_relaxed_poll_timeout_atomic(
+						addr, val, val == 0, 1000,
+						I2C_CONFIG_LOAD_TIMEOUT);
 		else
-			err = readl_poll_timeout(addr, val, val == 0, 1000,
-						 I2C_CONFIG_LOAD_TIMEOUT);
+			err = readl_relaxed_poll_timeout(
+						addr, val, val == 0, 1000,
+						I2C_CONFIG_LOAD_TIMEOUT);
 
 		if (err) {
 			dev_warn(i2c_dev->dev,
-- 
2.24.0

