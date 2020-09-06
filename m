Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667A025EFA3
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgIFSxH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729225AbgIFSwL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:11 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB652C061757;
        Sun,  6 Sep 2020 11:52:09 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x77so6414156lfa.0;
        Sun, 06 Sep 2020 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2o2vAoBFqoq71Ahr+LyFMm+DHUsrYLkew8isQkemhDw=;
        b=gZ5ob4zDsUSPG8DCvI6p0r3OZhsBQ8rX7wHaAWUBzaPdJg4iJDoWjkwZweyCBXZmyu
         u3VwEpGDReR0a7mXABcsem1Vv9vD51v7TSHWeVgZrDByFLq5sdLaS6ERhphd27RWE+Rb
         KohkZJrv03o9Tu4GLLMdkeVIcG/Rm801nIK8zme3asDjlF+sCjSsF4ivat4uUXU7hfsk
         8RG/s0mMPdLsmSP0Bfz4BWRn7Bw4ittMAHa7qZtSWXe5qqASbOIcVUMCy2dqCadZW7gi
         drhT3T+/Fdh6/cf7VnFiclrwY+LotzhConAXggnpkLzbg4jHCHacK9IwFSd/W/tw/z+i
         rImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2o2vAoBFqoq71Ahr+LyFMm+DHUsrYLkew8isQkemhDw=;
        b=EGiRnY0Wvpt785wIwDw2FoIyXcdQ6h+xdPbP6FAwF9UVX+wui//FVr3qB/G/dTpmJv
         wWr8VtgXJD5zk0Mn7ehiUYTrL7GmtFiOuufZ2W1coK+dqieSznRtydEPVHIosRshoYir
         wlKs+A3BhlO/KXlcJCAO63/VS5600dSh1noWe4kCmQhXeGkNxw1ubIeRvFPjW8UsxHw0
         zBatzAJ2uyrrmfK/vvYfy8s1dPsv5UYPJ5H9QNqTa2mEBsOWbiyWLCYJO4P+gXfMLzct
         E92OdcRwQryZDzdtL1HRE3DIozswEEZV1l/r6Jb5fIJCKv39I8ZzrKRh6qvdMd5FZDcu
         HpfA==
X-Gm-Message-State: AOAM530A+Aue54fstCzHQw19wpXub7pNIOCkWSzui3iOm+U9w4B+puiq
        NNVStEuNckP92YbS9sqhVgc=
X-Google-Smtp-Source: ABdhPJzxtVPJjhjLqgnmjLddo8b20kUdSFmB29lE/cgJcc7rA363cXnbAG0BIbDu9YxXlo9eNMxHgQ==
X-Received: by 2002:a19:8386:: with SMTP id f128mr8750897lfd.78.1599418328351;
        Sun, 06 Sep 2020 11:52:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 33/36] i2c: tegra: Clean up variable types
Date:   Sun,  6 Sep 2020 21:50:36 +0300
Message-Id: <20200906185039.22700-34-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't use signed types for unsigned values.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ddd39af4ebd4..1f3110a589af 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -326,13 +326,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, u32 reg)
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
-			u32 reg, int len)
+			u32 reg, unsigned int len)
 {
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
-		       u32 reg, int len)
+		       u32 reg, unsigned int len)
 {
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
@@ -695,9 +695,8 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	unsigned int words_to_transfer, rx_fifo_avail;
 	u8 *buf = i2c_dev->msg_buf;
-	int words_to_transfer;
-	int rx_fifo_avail;
 	u32 val;
 
 	/*
@@ -756,9 +755,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	unsigned int words_to_transfer, tx_fifo_avail;
 	u8 *buf = i2c_dev->msg_buf;
-	int words_to_transfer;
-	int tx_fifo_avail;
 	u32 val;
 
 	if (i2c_dev->hw->has_mst_fifo) {
-- 
2.27.0

