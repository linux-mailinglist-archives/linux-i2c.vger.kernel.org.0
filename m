Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3322125EA71
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgIEUmd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgIEUma (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:30 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B8AC061245;
        Sat,  5 Sep 2020 13:42:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so11804710lja.7;
        Sat, 05 Sep 2020 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+k/j54UUFXpl3cJ5D3v+AZkJutbwOs6dE47dPPkwck=;
        b=nr30d4CVnAIMuyV90BnlCD+DOS5KDp0LJPQAdF4e9nDkcXSmU521yzPgD0hXRF5ppI
         QMKdgcXWvG8cKhnRg8hNzUbdRac5phUlXXVmB0QIPokAznRmU+oCxNN8yIeUNxmgOkoN
         4SrgbxOpalyYAE4tbsSvFPLf1PHZAYyYMcoA8MyDXJkawMDHB9Pg3weqKUj+EsQNgowC
         R38C3cO8quUEQudNy16OAgHSs4NdH1To9QJsfX3Ki726ReFpRL+pXuyhFHEt2X1AiVqZ
         ihszFgKGfQAKyXV/aaRzPztaiP+ShEQ334DH426z42D1UFWmVQcXWgv96gGYDi+FBhu9
         Pz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+k/j54UUFXpl3cJ5D3v+AZkJutbwOs6dE47dPPkwck=;
        b=JAkoHFnXd6Dj/maUJnJ5fuvbAgzX736jUB3rNdzvRe/fTEFK7gdQPr1Zf+P3Pwce0I
         masJPFR4dBq9+6U54XQ51+GwzqlOTSaGJXgrm9/z+BXZPL49KlfGdbQAeBUUIj0OCInI
         2pR4BILHcxMXaY5QCl123lRVh8JdlmL3ECQfdeT7BAooU3Dn8ZV542eS1o0irbZFMKMH
         g3vEkglJBhif5W4xyIjip8wTlWUP72L9vFb2if2YuBZ/MUKFiSly/2oOZPgrVwErbeUO
         rSkoiJ0gi82U/eAuXS42XLzWjbdhEQM2aAN4g9XwTrF9YD0y+nnkg2Ncopk1jvSSMffB
         x2Yg==
X-Gm-Message-State: AOAM533utLevHLBoBs3xMyuNzqffR1hnt9nPJNby2x0LdKB2M/qP5J9V
        8B+qVZEIeYjc9WUl26JUFEs=
X-Google-Smtp-Source: ABdhPJz3tpVNaCtO9sbEYbj9fx6Tzm1Y34zYbSK1cEhRpaUF46xySO+uk2UqqPf4Q7CA/LmUz4dDdw==
X-Received: by 2002:a2e:9019:: with SMTP id h25mr6770880ljg.186.1599338546024;
        Sat, 05 Sep 2020 13:42:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/31] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Sat,  5 Sep 2020 23:41:21 +0300
Message-Id: <20200905204151.25343-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
are not updating if interrupts are disabled. Let's switch to use iopoll
API helpers for register-polling. The iopoll API provides helpers for both
atomic and non-atomic cases.

Note that this patch doesn't fix any known problem because normally FIFO
is flushed at the time of starting a new transfer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..ab88cdd70376 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,9 +470,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
-	unsigned int offset;
-	u32 mask, val;
+	u32 mask, val, offset, reg_offset;
+	void __iomem *addr;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
@@ -488,12 +488,19 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
-	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(1000, 2000);
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
+	addr = i2c_dev->base + reg_offset;
+
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+							1000, 1000000);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						 1000, 1000000);
+
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
+		return err;
 	}
 	return 0;
 }
-- 
2.27.0

