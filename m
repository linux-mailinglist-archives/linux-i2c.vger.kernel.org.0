Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE253274CC3
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgIVWwp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgIVWwo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:44 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1249AC0613D0;
        Tue, 22 Sep 2020 15:52:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r24so15546422ljm.3;
        Tue, 22 Sep 2020 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJZ1iczltyTFw6wCDjfkRjmvcSNVI7wJPdSx8RR/M8w=;
        b=StSvx2wL/6ujgpdj6yXTyntwMWLwLQJSXj7tFuVdP882j4hmuDsQ3IoA3HZYQlUsXE
         kLY5VtgZ5jn2dsLoHEjl6FHIBzil1VuBRro4tsE/K7P/b66AW3uQRn7lGFFjv7fctvvu
         whIXcp6tXHlhhkSp6gweBsJFUEjDlFJJpXuWMuxz1mrEEwNQW2iCfHWanBhB2jUAoUnX
         V+PRarsOEvozD4vTuE7w3euJ1Fy3P8ALdRF/pRS8sCDfx1AXWTfUITXHPtJa+XsLjKdq
         OSkfccKNs1Ee7/xaNjTuSwBKWbPxm5SFPB4z0YcJF3TxfPoV9ZYCtylespVPYF2pN7L5
         QOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJZ1iczltyTFw6wCDjfkRjmvcSNVI7wJPdSx8RR/M8w=;
        b=mZOq7M3dHvfL1M6p0t75e4Regl6z9CJ5TGYvqTHX9Rg54ADEOFMbAx0ANRoQCltN6q
         +YiADl9Oc+R0JPgDdKk2vd62uAo1HRM75LxGqiLsPU73DIBvVNsL3BtzUOLVpMLYlo+d
         LB3S4ntWxcMXH/nUpM3CxI0iO4CihtziukbT3OjTD8Jk+ACiV9gBhqkJohpMP7nsoa82
         qKtrwG2jIYWJyVZzZMG1cuuzClKhldT7nZp8u/ihJOUEHi9N5UlVyl8gtkdziUCp1Olw
         LMve8jGvsW7p1DFYW1KfjEk7B1E1KVmjvC64PHF8wxgs/hEV6oizG87ctjTBIyak/Wvv
         lQZA==
X-Gm-Message-State: AOAM530bqZR2yhTxehdMBX3njhOHjCxH9QYhnT9H1cksrBi0W93f/LcL
        E3KOiGsFHpI5SHbXiKhKXdm/SKBPTyw=
X-Google-Smtp-Source: ABdhPJzQb80vgwjZY9K68Y8rFvgnQzNwI/cqiBewDc27tn5+4DsDcSxsl2hXBsJWcmllzlbVZF4wcg==
X-Received: by 2002:a05:651c:10cc:: with SMTP id l12mr2026556ljn.351.1600815162328;
        Tue, 22 Sep 2020 15:52:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 13/32] i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
Date:   Wed, 23 Sep 2020 01:51:36 +0300
Message-Id: <20200922225155.10798-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move out code related to device-tree parsing from the probe function into
tegra_i2c_parse_dt() in order to make code more consistent.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b389cd0ce23a..9486fcba655c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1428,6 +1428,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->is_multimaster_mode = multi_mode;
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1730,10 +1736,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
-						  "nvidia,tegra20-i2c-dvc");
-	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
-						 "nvidia,tegra210-i2c-vi");
 	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
-- 
2.27.0

