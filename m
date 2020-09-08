Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CF3260857
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgIHCOj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgIHCMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675C3C0613ED;
        Mon,  7 Sep 2020 19:12:01 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so11626101ljp.13;
        Mon, 07 Sep 2020 19:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cjZeMOpLGKlggQ4Zf1tDxvKw367fZ+lczUYfx0tdRmw=;
        b=ZS2wWUW3ORmz3Pv/f2ccJqJm93Xc67Hz0iyjcs1eleucmVVxZmL63LDdgzHIvah7js
         aAe4YHVT1+dxpwKWiuXXMiYmn2FGid9a7gAzTJjpcfJ6RxRQsjroJ7vf/2MV4SadIN48
         8bpIzhCHutRgl6Z/3QnWF0VwiXkEY8EqzDMUBRDrDQoKCKzbQ9fw0GwnPh2X0l8vn8Ai
         cee07Y4DJXQmoK2HSSkn/uQZreK9yTOhYxmql/7H2Qnu0+RAqfGU3BL5dqRxIybjv48b
         CJwsKajCjUS/g8MGDHokcXfdup85lDuJddMZn/QiJM/emi7sa1rjIK/n8NPF0dhTmbxM
         FaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cjZeMOpLGKlggQ4Zf1tDxvKw367fZ+lczUYfx0tdRmw=;
        b=sxdVFZiK7p5drNOYpsxihS6VpfyxZ+Q4ayLUgvFeQg6VIW5GY8kw6J2WF2aR1N8FTS
         xP7Rsoqo2nr5QarI4+pFfZahpi4d07pazltcnVX4fFtxV3LF90uuKAqc8S9XQAvqIwVK
         70PPcQnhPzMCT4u8S7Wvl158/mEFafVlrDaWw0NCDbopRfV5JokBZ2g1YnPZkWdGtrhG
         E6zYQwpuKnXdsKBXpBfv04U985VbAlpdY9qbt0WP9E9eM9Z0voOv1Z9O+AnKJrGba9TF
         JnAzInvcLJ5ouMNFvRWb0xIAUeEdFh0dsLGn2f/hdRM7AhV/7c5RVWMNr+DCZA7GvFdz
         U/sQ==
X-Gm-Message-State: AOAM530yhOdJ7qq89LTBeK/sJQTvD2/cqOI+W28v3L/4J6iVZtpyStU9
        9evpEqIRFnQQJ+FkvW7MrkU7Wx18PIs=
X-Google-Smtp-Source: ABdhPJzLpPz57i5QJ2Z0Xg0STz0uvvWopocYTfYuguMnwUOaxzolVsa8KzdbmBGBnL98cfsC9DuaWA==
X-Received: by 2002:a2e:9dc7:: with SMTP id x7mr11256502ljj.447.1599531119914;
        Mon, 07 Sep 2020 19:11:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 27/35] i2c: tegra: Factor out register polling into separate function
Date:   Tue,  8 Sep 2020 05:10:13 +0300
Message-Id: <20200908021021.9123-28-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out register polling into a separate function in order to remove
boilerplate code and make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 43 +++++++++++++++-------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7d54b8b3ed9a..2e7beadd381f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -518,10 +518,24 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -538,16 +552,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
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
@@ -557,25 +562,15 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long reg_offset;
-	void __iomem *addr;
-	u32 val;
 	int err;
 
 	if (!i2c_dev->hw->has_config_load_reg)
 		return 0;
 
-	reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-	addr = i2c_dev->base + reg_offset;
 	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 
-	if (i2c_dev->is_curr_atomic_xfer)
-		err = readl_relaxed_poll_timeout_atomic(addr, val, val == 0, 1000,
-							I2C_CONFIG_LOAD_TIMEOUT);
-	else
-		err = readl_relaxed_poll_timeout(addr, val, val == 0, 1000,
-						 I2C_CONFIG_LOAD_TIMEOUT);
-
+	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
 		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
 		return err;
-- 
2.27.0

