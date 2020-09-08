Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66F2260855
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgIHCO3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728384AbgIHCMP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:15 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A756C0617A5;
        Mon,  7 Sep 2020 19:12:03 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so18007832ljk.8;
        Mon, 07 Sep 2020 19:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bhYXVU5OxtMkVW3XxSZWr/Wz0AEa7WBnTGkvmLBOr6I=;
        b=rtm0v+gAdEnm932au1tB3Fambj6CK2mvDSkO41G+MXRYrgKpvgZQbe+qo2qQsXM9pa
         kWpRKCslYyWfiIdlxpDEwCLwtCaXCN3NPtcbh3Nk/SzzuhxMuBq/FvNvkAlTUQULVEu0
         PIoSJIZUEEIAkavsKZoYTi6NVYSTluxri29OUE87N7ZFXDZUp8LkNNDMJXLWFblzK1Pa
         Tf7lgqHPdsXOGJPY8qiwKJtX80U3lk6h/dj/iCbg2XpjUYXa4dKXGOxthGNGQrptVID3
         BZJO+kccC3lJd9ORL77C18iESLpBktXup3j0OOU7ffbAe2U3TeAycgnoiJwNS90CVv+W
         JyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bhYXVU5OxtMkVW3XxSZWr/Wz0AEa7WBnTGkvmLBOr6I=;
        b=CRM/DfpCow23LAwPyACMriQ+I337AZyBWOX+1rMQEQRxpk86O2urR9ZBwFREsKCMG7
         /7DFR7bOiTzEFg19CBJ4xczGlafpNPtCClyAq1dsCzrsZpxxnXegZfMJwpTWY6QZ2mTh
         o/SqlqUl4G2bqWmS8QXxtXnD1BPgU2qCKj8qCxElTlh2NfUu2pkODt0i0n+gXTJsxq1d
         eJjHRnex+hpXGr6+CaJhZZ+3QydCVW0x+O/sq0t34RBlenc5G6W8re62JDCROOwMeaVT
         IsKRgysVS2cOhLK+ltD04fWicV8AR3XjUAVrJoalAMJrsrTbwD7dCkgEJ0j8gXvMPKKv
         K3kw==
X-Gm-Message-State: AOAM531iMemLb14S3v3I9mM7y64mj+oadPGcI8lDuBLbD4MapKSzGwLc
        MrP2JKENUpjWURkTAqyoyoA=
X-Google-Smtp-Source: ABdhPJyjrjcqJE86UbUuHCAIy7a2diCuAzo72eXvsYDkgkGJtdepruaA11KcB55rm36Jy1wMiGKR4A==
X-Received: by 2002:a2e:9988:: with SMTP id w8mr12365362lji.286.1599531121631;
        Mon, 07 Sep 2020 19:12:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 29/35] i2c: tegra: Check errors for both positive and negative values
Date:   Tue,  8 Sep 2020 05:10:15 +0300
Message-Id: <20200908021021.9123-30-digetx@gmail.com>
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

The driver's code is inconsistent in regards to the error values checking.
The correct way should be to check both positive and negative values.
This patch cleans up the error-checks in the code. Note that the
pm_runtime_get_sync() could return positive value on success, hence only
relevant parts of the code are changed by this patch.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 44a8c7ae8509..2529d557e0b1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -977,7 +977,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
 			return ret;
@@ -1219,7 +1219,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed, err %d\n",
 					err);
@@ -1244,7 +1244,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_TO_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting TX DMA failed, err %d\n",
 					err);
-- 
2.27.0

