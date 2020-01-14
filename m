Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34D2139F14
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgANBhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:37:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36066 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729174AbgANBhB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:37:01 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so12403121ljg.3;
        Mon, 13 Jan 2020 17:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DKcajWqETcYxz0G58Z+vZAfLySB6HXY6m/67CXA4AZc=;
        b=DBPXGTouY1AnqUlxz4t88YHhQOdOCr9aLI0Uuc8fLX1QdFr8iYm0p+nUncoCl6nQYg
         iQca1BD+Izhgcv353eBcpgA7Ppl9vFPdkhzHoIFoRSAtPPPSXW/bBGItE4heEzLuUiEx
         vz9DfLJdWDP+roY3lN9++jnHVlQ3fJbMzcqko/z7GM1WNqcXhYId7nFJWCgfBiVLJO0U
         PMFaBXU5SV1ZMKFjff8UTETBBpzxXjFzQnnd4lAo8caWQS8n44NvuFBoKAQUkKFA2XsU
         5jWXw5js7Ii4I1itfsxMP4UPLTwSuuoCZkz6aWkQHzzTUT1fsiKFTMR9ZfdmNCMyem81
         PJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DKcajWqETcYxz0G58Z+vZAfLySB6HXY6m/67CXA4AZc=;
        b=Bh7S/L3+/8zAKbr/79KnDzAtV8aMqUSfjZFIweUlyUsgR/31/xPfNOz+/lUcwpmw4+
         twA1/p4aWbulBYDWgUjbZcBCb73h3HF7pq7ifkmVvS+L2yrT/6ojZkquZFJalNnBvU/T
         MzGFQAmYddEEKXwSf1GS5FzeN8eWrKpswIe/tHzWQ1PRc9/Jbf+V8mpdnPrRkpwrvMZa
         e4NIg6Jd7Wm1WW4FuJnNuHyY7z409yMCt308+8XVf04+viMPuLpnL7cmaO+AQ2rtWU2d
         85fCNYu/uyzbAHCGw0rdcVEgyjPD+6Iz3FwwhYgQ8nIqs0kCQFPj8POEQbtEShcPrcIL
         E/oA==
X-Gm-Message-State: APjAAAVCwTtPdC9a9o/x0E+KVHoJ9tVQp0+0R9HB2bYwGQsttME/HZnK
        bzfQL0/4ypsGiQ5s933tMyY=
X-Google-Smtp-Source: APXvYqy4g8304I5J28cD6d4ur9vak2vo0suYZmudSiaI457mo3hwgPza5dQSAooBzxt2Fm6yMiEu3g==
X-Received: by 2002:a2e:9e19:: with SMTP id e25mr12608645ljk.179.1578965819140;
        Mon, 13 Jan 2020 17:36:59 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:58 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] i2c: tegra: Use relaxed versions of readl/writel
Date:   Tue, 14 Jan 2020 04:34:40 +0300
Message-Id: <20200114013442.28448-7-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is nothing to synchronize in regards to memory accesses for PIO
transfers and for DMA transfers the DMA API takes care of the syncing.

Tested-by: Thierry Reding <treding@nvidia.com>
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

