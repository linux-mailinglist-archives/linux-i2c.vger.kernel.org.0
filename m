Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F4812BF6A
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 23:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfL1WR0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 17:17:26 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38206 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfL1WR0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Dec 2019 17:17:26 -0500
Received: by mail-lj1-f194.google.com with SMTP id w1so8001236ljh.5;
        Sat, 28 Dec 2019 14:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PiNNr9K9qIQQnPJ6yZ/V1JmcG7noCNBTXNqtHbq6dTk=;
        b=F+JDMOlP2X3eFRRcURDvQX83S7gq7aV3tR5j/dAe2MVbdwz3hcXg05rEdZl1uWBCUZ
         SHqXf/4kRfxBZqKIsaUywdeF2U1kjCJjFzeXh9iy9Y/DEg8uw9Vn0MbGve28AcAzlhsZ
         yn5Nj/K+r3KvTG1STPRrfIDvJEbFPSwcDV7cEXPiETlR/5kWi39qPjzcvkRFN1ZKne6D
         VID6jrDXWW2GvVWwMuoLbsIhD37FPRAowx2xyw1xqjbNuXi9x1gmeABHXrTsZDZmNKL+
         3MchmnXstIQ3RW8+XjMRpvPIo4XZaLPVJR1J6iSASLvW7dZVhfq913iQ68VcaGjJlBA6
         XK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PiNNr9K9qIQQnPJ6yZ/V1JmcG7noCNBTXNqtHbq6dTk=;
        b=ekOvDA3s0iETD5jyfwdUZi+akVp1pRv2hwxPciKf9kF9Y1qOXsrpA7Z7dS8k8+EuoP
         zPL58uyyYatmA2QWy8LaHTtH2Ps37FaXFdT7DYRtXhhLHaUtjS9U85XLzRdXe4KynVqG
         qWtHYRfCs7tliVGy9f9QVWRiCI31x5GH8DVOI59c+5qEY2ulHuTaGNkVX36fWcZxW7pT
         QJSpkcRCMbJopJHKBqSpzLqvUCDWTACM1qiUboPLNLQhuRQSSj7AuCe26TrGUkqKqK4r
         W+D2OFK5O9WRhyrZDebgQiBA6zsX7UGjNWWmTAZZbgH7lBNhGjNEr398aCtpkb97FJi/
         oqWQ==
X-Gm-Message-State: APjAAAXyTRGN/AmFwVjFG8K6yam2Eqqeqj75zsyfs1rEfertsdaBjP5X
        HBoov93+AXzUN5Vj6gAFs2g=
X-Google-Smtp-Source: APXvYqwe6eRGb0lzPDGmWiVte7AMHiY7SA5qKagpCMQ/3OvM0RD+ONdohmoLYCzKP90k2d88sFkDuA==
X-Received: by 2002:a2e:9ad8:: with SMTP id p24mr32131220ljj.148.1577571444214;
        Sat, 28 Dec 2019 14:17:24 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y10sm15209584ljm.93.2019.12.28.14.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 14:17:23 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] i2c: tegra: Use relaxed versions of readl/writel
Date:   Sun, 29 Dec 2019 01:16:54 +0300
Message-Id: <20191228221654.28842-7-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191228221654.28842-1-digetx@gmail.com>
References: <20191228221654.28842-1-digetx@gmail.com>
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
index 0e88c7aa7cd5..a39de5012128 100644
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

