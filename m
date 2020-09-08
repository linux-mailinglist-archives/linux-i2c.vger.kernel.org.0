Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DF02622F7
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730373AbgIHWmz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730115AbgIHWlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A22BC06179E;
        Tue,  8 Sep 2020 15:40:58 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a15so1003494ljk.2;
        Tue, 08 Sep 2020 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t5B6ysa7LjN/iHtlHoBH00Loul7JOotcYLDG2pE2B3U=;
        b=HHLAh3c4kVDtHud7bBCoc46guztvJ3zdyscQeEZy+Gf6FSRbdxhgpSjkQoDV7pt1Xu
         NaqYHUXS82yPuFmwVBXKY+02cDxE67TmDSsxYYk0pQtR2L1I6gzhtFOdtdYt45aw+y+B
         RZLg6hFJQaKLELyVxmxVMCics2Wz3HbBIdX+usPTujyCAmuwNQetPCkZN3WSxll0XdYk
         /g5RUvKifbWnKAl8U7xhBbfzmDasDCzLVAT490Cphyir3v09nnUOa1IXrEBUj47Jsl8q
         l571jX1WqerxXHCB1krrGL/bKbdnK9mYGjI+AedoSzTpc+tUA7ihKlArtVlpZgY/ugJe
         JsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t5B6ysa7LjN/iHtlHoBH00Loul7JOotcYLDG2pE2B3U=;
        b=UkJmExcsHq6lpiCtO2DXH4U72/G550s1ukYKfJEQ12ENfrdeP4nISvVpv61QeSU2q8
         dfTGIQV66xI6KTPeqq7rt76yvXOG/xdRViVggNlCAnJjzMMwQ0YLx82+Azz+qJLbxuls
         u7cl1YfaGZyZIcKae0FfLSCbSEMvmTg14grA9mAUGM5kOZE3z3/Jc03cO4QmthuCbhCF
         2zMsZuPkRAwG+cqAi99CXKTemqJl868VQi7LjEmGVv5ZdIoveOAlhFoZ7Rw7VxLWDLf/
         LVch2thX9ZjqOpYP7vtQdt/jb/NnMp5KOpzS2On1hTf3KKxP+zBfwohQI0P8qzRG6svD
         F2vw==
X-Gm-Message-State: AOAM532XM7krRpqZbTyFQzO1hVD6+vFU4vmTBBXvK49GjRTY5vmxZLIB
        bSGYl7AmCaBHkMpcFyH1h13M4PnN34M=
X-Google-Smtp-Source: ABdhPJw+agA+k4JlD3PPK/iBNjFyQOinKeXX6tv4eYz6XiCqt6dFSa77U58OrOl28+AiefObVIv9yw==
X-Received: by 2002:a2e:8681:: with SMTP id l1mr341010lji.108.1599604857092;
        Tue, 08 Sep 2020 15:40:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 27/34] i2c: tegra: Check errors for both positive and negative values
Date:   Wed,  9 Sep 2020 01:39:59 +0300
Message-Id: <20200908224006.25636-28-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
index 2f39366b6d55..fe672cfebe12 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -981,7 +981,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
 			return ret;
@@ -1224,7 +1224,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed, err %d\n",
 					err);
@@ -1249,7 +1249,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

