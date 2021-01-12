Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A452C2F3977
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 20:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406513AbhALTDX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 14:03:23 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17664 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbhALTDW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 14:03:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffdf2520000>; Tue, 12 Jan 2021 11:02:42 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 19:02:41 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Jan 2021 19:02:41 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <wsa@the-dreams.de>, <skomatineni@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v3] i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX FIFO
Date:   Tue, 12 Jan 2021 11:02:41 -0800
Message-ID: <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
References: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610478162; bh=N8Z8QPncj3XHrc0hRnQALJ2m6I90W1MDete86aCTUr0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=hAtYHGBXtH14OIq53vnG3JCOx9yY5MFmzXTShx1e2uvb49iCtpjgygylzfxGE2rlu
         yxxHuW14wqy6hs3yqGV2+K7oWxJO4GZqvopdYyAQOwvx+WgzAPC8VP+W3XiuzoX52c
         JKm2E5nQVQrdmwlrGiuDqjZ5OhGA+IqrfKqiFhnu30KkyheoNecWunA7YyOYAtaCBP
         oDMfoTW4DjDlj9qp16p9ikrg6GlCf5zqstTPi+tdhT6c+QAFLaVOT6dnN5lgdPFsrE
         hVKp+GwsiaM2sZX57srbUtcibGU9cZVOIMihQUUAjdHHxB/TH7wLVUip0E7UyMmdhx
         kDa4aE8Ggk2cw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VI I2C controller has known hardware bug where immediate multiple
writes to TX_FIFO register gets stuck.

Recommended software work around is to read I2C register after
each write to TX_FIFO register to flush out the data.

This patch implements this work around for VI I2C controller.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f08c0c..4a27782 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -326,6 +326,8 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
 	/* read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	else if (i2c_dev->is_vi)
+		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
@@ -339,6 +341,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
+			   unsigned int reg, unsigned int len)
+{
+	u32 *data32 = data;
+
+	/*
+	 * VI I2C controller has known hardware bug where writes get stuck
+	 * when immediate multiple writes happen to TX_FIFO register.
+	 * Recommended software work around is to read I2C register after
+	 * each write to TX_FIFO register to flush out the data.
+	 */
+	while (len--)
+		i2c_writel(i2c_dev, *data32++, reg);
+}
+
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 		       unsigned int reg, unsigned int len)
 {
@@ -811,7 +828,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
-		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+		if (i2c_dev->is_vi)
+			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+		else
+			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
-- 
2.7.4

