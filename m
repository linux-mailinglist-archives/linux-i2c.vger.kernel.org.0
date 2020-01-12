Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 631CE13873F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 18:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733168AbgALRRr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jan 2020 12:17:47 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42027 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733154AbgALRRr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jan 2020 12:17:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id y4so7417766ljj.9;
        Sun, 12 Jan 2020 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DKcajWqETcYxz0G58Z+vZAfLySB6HXY6m/67CXA4AZc=;
        b=tivx4iE8IykK+6ikNZHoI/BIg8DBp4x46ck+nK3H3zTq9KoLSDtoJNqqNlGxfCNCe0
         AETCKBXZdhbN4mRYhWJZqIJ4X0n8+d3HtNSYEKXLYUAhjHTXHfsxwBUY5fP6XPmVNBqU
         cyN2XZF05myd52rVhKh52L7jnZXUx6Www0py6dAJULk9gWtLIW11TKqDmpLdY+LzfsIR
         YogFkc7ppH+tBemPzLXT7K3F8YTV3jrTuHMR9F+ZaNddqTL3Ukx+UMFHpqWNpoqwrWL1
         4Z9rTi9pHV5uLyqngL45JnTXIzNFys0vlcrYe+gYp/MzyhStftZyNQdoCrOJAEdKC5ez
         Y+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DKcajWqETcYxz0G58Z+vZAfLySB6HXY6m/67CXA4AZc=;
        b=sd+d37JLvdhbvZCl3uuqAvW/xoNWfvE0RhitQumawg9iQjOMUxPG9qnOEFEOkfntM8
         8uxsQS6SxjiZHBpboT/s2f7w8cBksXq3iKd4fmuP1pgWuvDkSoNJNob0f98vku5DiFyD
         sO+P2QX3QQLEnVlvbJVyZx/4QYxqvbhuIvTnJ3Ql1SbnAgN2C0Z7ksyHeb+4LMRsiwUN
         +ettaVy6ipI3h3xxEinvhurbD+sJyFDxbFbFPow07+ZNtOGltb+eBcPPqGNYRlaNbmDE
         R+hnN138h9Ymd468x1kEKU3r/PDEkbCv4j3FnrhP5el7mggomj9HMKcwQANTW/tTBgsN
         yBYw==
X-Gm-Message-State: APjAAAVIvFq/mBLKhxnq7/r+e3kNPBK1UEOjVClxTmkYHjakbngjG11D
        bAGqmuUeBJmVrSIADRd1xvc=
X-Google-Smtp-Source: APXvYqy1I/KeU+rqaOkngiDRulwYrJI+UOzYh8xuZIvE3OAu3vpbwD9/08Y/Pfixp8CcFMzetRdD2A==
X-Received: by 2002:a2e:6c13:: with SMTP id h19mr8193248ljc.221.1578849464799;
        Sun, 12 Jan 2020 09:17:44 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id i13sm4506628ljg.89.2020.01.12.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 09:17:44 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/8] i2c: tegra: Use relaxed versions of readl/writel
Date:   Sun, 12 Jan 2020 20:14:28 +0300
Message-Id: <20200112171430.27219-7-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200112171430.27219-1-digetx@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
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

