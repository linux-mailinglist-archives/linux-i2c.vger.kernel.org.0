Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B6D274CB3
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgIVWxg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgIVWw7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24295C0613D7;
        Tue, 22 Sep 2020 15:52:54 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so19848073lfb.6;
        Tue, 22 Sep 2020 15:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2MKF7BzqpSNvoK2H0SjcBKDlKS1066C1jO6CceJcfs=;
        b=O7S0cfkdWPND7hGGAzDoMT5qzdYF+QLoY5f+jTKFWC07t3gKXYpRf1g0Acizq54LXo
         jh4/0Rx0J/uqy7H7IezVlg/oh/NnuKKHbmkDQopYnBH6aW5jnpZjOt1L2I58abFh+hqu
         T0/N6By8s0RQV2tuQasJI6Y2BWzuq27tfFhdWGOTbN2D65N3Y7m6t4eEKgwUzaE5wV4l
         gnYzrOkJJ4pAB780dTvig5mpUYPfK2K09PeJb3fNStkE1RFKI3TcH2MqOpCR/dyuxq+7
         VNOsCfiKzG0+B+TTkphfpdBQTsyeRMgBaNh4L06FoCg3xc3Jr/Z4vbePLsRdlSON+GrZ
         cEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2MKF7BzqpSNvoK2H0SjcBKDlKS1066C1jO6CceJcfs=;
        b=MJ5ru2dtj96BTB/fPxub6W7p9IYQY3blnYeXznT9zedPPCEQYMQCdfoydZ1d42iSLB
         ezLc7LuB72jeaAu5dd8699lQNywKeFUQPbodRxSMxvUXgVJVrEjTfyFtL+ptXBes4ily
         ltoH2jdvGRoGN1Oz3hcsDVRBmdhL1HsunTi4P3YWRrnrrrSu4sYFbrkl64qLfop4mV1b
         Ube6MMZJgA+tP0h15nTxStpmjFy3suoBKj9YDlZ/ckjoECge3iTn6S6BoqsJYsNyCmM7
         /z7ypBCDl4vxHP78OQRMX8DVTF+mbRlpcqQMqPlDO0tVeEjswMhwAJZNQZTS0VNkQMn5
         FFig==
X-Gm-Message-State: AOAM533etaX4jP+u7k94w6aV3W0NRZ7nCa2YhBxzTRLcRwtIgxHOrvWV
        irR1w8fOWGnSBCpAHdbBLZs=
X-Google-Smtp-Source: ABdhPJzkLNLR9L4Q8Pt/eezEECU9ch79pD2Dow7YbyIDiO/B5A2MjYqKlTuv6dWC5jKQGVrq/twFLQ==
X-Received: by 2002:ac2:4acf:: with SMTP id m15mr2203995lfp.261.1600815173306;
        Tue, 22 Sep 2020 15:52:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 24/32] i2c: tegra: Factor out register polling into separate function
Date:   Wed, 23 Sep 2020 01:51:47 +0300
Message-Id: <20200922225155.10798-25-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out register polling into a separate function in order to remove
boilerplate code and make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 57 +++++++++++++++-------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a0de01d5cb1c..72ad0e8e89d2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -514,10 +514,24 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
 }
 
+static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
+				   u32 reg, u32 mask, u32 delay_us,
+				   u32 timeout_us)
+{
+	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
+	u32 val;
+
+	if (!i2c_dev->is_curr_atomic_xfer)
+		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						  delay_us, timeout_us);
+
+	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+						 delay_us, timeout_us);
+}
+
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 mask, val, offset, reg_offset;
-	void __iomem *addr;
+	u32 mask, val, offset;
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo) {
@@ -534,16 +548,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
-	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
-	addr = i2c_dev->base + reg_offset;
-
-	if (i2c_dev->is_curr_atomic_xfer)
-		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
-							1000, 1000000);
-	else
-		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
-						 1000, 1000000);
-
+	err = tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
 		return err;
@@ -553,30 +558,18 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long reg_offset;
-	void __iomem *addr;
-	u32 val;
 	int err;
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-		addr = i2c_dev->base + reg_offset;
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+	if (!i2c_dev->hw->has_config_load_reg)
+		return 0;
 
-		if (i2c_dev->is_curr_atomic_xfer)
-			err = readl_relaxed_poll_timeout_atomic(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
-		else
-			err = readl_relaxed_poll_timeout(
-						addr, val, val == 0, 1000,
-						I2C_CONFIG_LOAD_TIMEOUT);
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
-		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
-			return err;
-		}
+	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+				      1000, I2C_CONFIG_LOAD_TIMEOUT);
+	if (err) {
+		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		return err;
 	}
 
 	return 0;
-- 
2.27.0

