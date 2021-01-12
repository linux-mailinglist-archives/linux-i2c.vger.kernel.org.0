Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6602F26E5
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 05:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbhALEG7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 23:06:59 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12094 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729510AbhALEG7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 23:06:59 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffd203a0003>; Mon, 11 Jan 2021 20:06:18 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 04:06:18 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Jan 2021 04:06:17 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <wsa@the-dreams.de>, <skomatineni@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v2] i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX FIFO
Date:   Mon, 11 Jan 2021 20:06:19 -0800
Message-ID: <1610424379-23653-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610424379-23653-1-git-send-email-skomatineni@nvidia.com>
References: <1610424379-23653-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610424378; bh=Di1nGnKfNHnPo2PJcbfvnWaUpPkwPeDFp//2vWWPufA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=Ypirb7bYMBR+6DU6KIv9n0AKphmfPfLv0no+mMMye1peTBc9Bl/C8Q8e2s9GqW7e7
         LXS2biZ+f5orFlw6r71D0c6HRGQ2V7iJ6gampp364Ux/wxWpPBudbqruVadm2BEuwO
         +fe5oXIs1IP88jpvY07dffL+mP2ZXs/B4rDXVDNPTY/4Zf/sNKPZU/oTXVRjF4swy8
         a/sM1mw0W8sqx4zUpoERlwCVZ50w608b5zIDNsg/ai0l1EM6GfUpgz+5S+ch10diZm
         As7BeAQDTKO8P51k7GaR1eOFm0kcAFctljpqYh55e/nkQ26XK5oOyHYxf0TmYEul32
         czYp0pyjOVVAQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VI I2C don't have DMA support and uses PIO mode all the time.

Current driver uses writesl() to fill TX FIFO based on available
empty slots and with this seeing strange silent hang during any I2C
register access after filling TX FIFO with 8 words.

Using writel() followed by i2c_readl() in a loop to write all words
to TX FIFO instead of using writesl() helps for large transfers in
PIO mode.

So, this patch creates i2c_writesl_vi() API to use with VI I2C for
filling TX FIFO.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6f08c0c..e2b7503 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -339,6 +339,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
+static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, u32 *data,
+			   unsigned int reg, unsigned int len)
+{
+	/*
+	 * Using writesl() to fill VI I2C TX FIFO for transfers more than
+	 * 6 words is causing a silent hang on any VI I2C register access
+	 * after TX FIFO writes.
+	 * So using writel() followed by i2c_readl().
+	 */
+	while (len--) {
+		writel(*data++, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+		i2c_readl(i2c_dev, I2C_INT_STATUS);
+	}
+}
+
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 		       unsigned int reg, unsigned int len)
 {
@@ -811,7 +826,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
-		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+		if (i2c_dev->is_vi)
+			i2c_writesl_vi(i2c_dev, (u32 *)buf, I2C_TX_FIFO, words_to_transfer);
+		else
+			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
-- 
2.7.4

