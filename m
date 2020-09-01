Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C9F25A0A4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgIAVMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729039AbgIAVLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:37 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DB7C061246;
        Tue,  1 Sep 2020 14:11:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v12so3273115ljc.10;
        Tue, 01 Sep 2020 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFRnoOZ6XZak8+RaE/bfJzD46w7iNGKhaqsvbF27kaM=;
        b=fiPCEwrXN2oOGrzQ8OnuQRA9X2LvP0HXIqq5o9JIat/OLR3aef0MKjFXbAQ04NBJXs
         5qeGJio6otdCBPOBsZlHqWatsuQsIBW5REhZi6Mi/OH9/JLjtIi8l4w0FpW3ajtaK1rf
         OnXj85CS1X8rT3jo2lAP3APiUsGBABOi57ocjcM9yOjaePhCMU9c+7jEg5gvZMxVPt/O
         67TINVm6TI+WpYi0Uu+tGp/FcBSqerLhyLZXOEuggEdlD7zxwpLFXDWnv0zH4i4uHGt/
         pv7/KvnP8VRoDutrmqNtoARuu/j8ekdwW27Zo2/CUUKYy/95fe3aQfGwwVWCSQWySy6o
         skrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFRnoOZ6XZak8+RaE/bfJzD46w7iNGKhaqsvbF27kaM=;
        b=bwp7KI/ppIJBvn3Ib/J7JsM5tf1swCUV7RciD65YR6BeGihsr2GIOf236lGj5S/icQ
         NX8ZfZzH9Wqz+2l7KbIQ56gYpEwRAo+VHLEgduIKNumMjUq5K46naj/rFHoxX/Yrh3lA
         6Xr59zxRy0uioS+11tzfocEw8IrW9BE3YFPKqKYTLC/Asfd7OjBhb/gH6LilNIYUPl+S
         /kZbJbXMqPGy0pqN4KPAHjP3mzs+jWYS9ostlXB5SX88J+kxaLOa1ykluA3J5zzxck6B
         YBzmyU5xSlEOBxZ/hTB2s098Z7BKFHkGzDXM91Om1qurjWhmZVAH80pFBmK5KbM6Gwho
         +0Nw==
X-Gm-Message-State: AOAM530YNQGjMNg026VFlcLnhaPJzIMr7vIP1rtYebjKCcg/ljG8elU+
        3gNyRNTGNwSAFcZmS0VdHZtTV+7AGDo=
X-Google-Smtp-Source: ABdhPJzMi/7F3hBq1UzOEv5cKZjVTuSKXnrqJ5sabV1DHfgXNJKWQcMgvsej5ZabP2CD2eOJl3a+fQ==
X-Received: by 2002:a2e:8346:: with SMTP id l6mr1522669ljh.202.1598994695818;
        Tue, 01 Sep 2020 14:11:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/17] i2c: tegra: Check errors for both positive and negative values
Date:   Wed,  2 Sep 2020 00:10:58 +0300
Message-Id: <20200901211102.11072-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bc891d4b41ad..9a807caef4a6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -674,19 +674,19 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 		return ret;
 
 	ret = clk_enable(i2c_dev->fast_clk);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "failed to enable fast clock: %d\n", ret);
 		return ret;
 	}
 
 	ret = clk_enable(i2c_dev->slow_clk);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "failed to enable slow clock: %d\n", ret);
 		goto disable_fast_clk;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "failed to enable div clock: %d\n", ret);
 		goto disable_slow_clk;
 	}
@@ -1047,7 +1047,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "dma config failed: %d\n", ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
@@ -1235,7 +1235,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting rx dma failed: %d\n", err);
 				return err;
@@ -1294,7 +1294,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_TO_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting tx dma failed: %d\n", err);
 				return err;
-- 
2.27.0

