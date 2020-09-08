Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685E02622F6
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgIHWlC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729961AbgIHWkq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C783EC061573;
        Tue,  8 Sep 2020 15:40:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a15so1003002ljk.2;
        Tue, 08 Sep 2020 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0XBZLDfH4kqBUBs9C1cyVQsph7rHRjiYes9QzEnkvlE=;
        b=XgaMSUI3ZEBWtGlpiuYwsI1hsO6BdSusSk5BGyPlsiqrkGKhEL9yuzDrOCbz+5BtXX
         f7+otHA9UKZHAcoYBljlj44fjVYVX+gez/nzfsVbTTU17qnUzXGYcZ/eWgXhMTjSwyR8
         wDhcIZTyukQpYC+gxVxBaokBLJLi2GzpuSOC/6Jmkiu+LxiJv2RLBBxDbC3eAGqxDOo+
         vweyyZ4VF/UCln1gVg8mmG634/CC1ROFKbnEke9p6W4Pu6xW9JdzL3bMp9vKhZtX2Rke
         ka4JqXolyDEKv9nMI0IDLvsBhpX6RahdTD62Vv21SgyzlF+XuwM+QhSEVsZ1BE/TWNLu
         ztyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0XBZLDfH4kqBUBs9C1cyVQsph7rHRjiYes9QzEnkvlE=;
        b=c5n/FNROjZD0mQLzb4oqjDKlGyajyODWvjpr1Pfj/mJ16DbBVH1+JXc+Z75vxNREsu
         17IgdjCYlvTeruOBQruLiK9y6csbNgM1oCCW5Zpgwwy6B3hehp9eI7esFmT4XT4Efyv/
         pd+sfhvVbPQGwF5uK/vqhH/cdFuYmvOnI8/pyCYRMTSYZSoFvh23PiliC4Iv7FgPQ53J
         bpZ1AuKXK7lk+hYvL0fvs3kjiqBCHLUHScwsmnjTo3srfKQctk02Y7DM58fuLytlG+Pw
         ynnjjV8xE4yBUs/229iO6GONC2QIapsrwpp2qCBpYQoCzpgbHQQmOanxBZeNpxqcok9N
         2bYQ==
X-Gm-Message-State: AOAM533XmuTH+blldLctcXD4x0GLFawEQZz0unlnAqxE1ZWrtm7DY6k5
        urEL35hPbRbEF/V3DURHOsU=
X-Google-Smtp-Source: ABdhPJye63ZcCwiuphm1b1+1K7l3XePgTiUGdtQiA4NJbSx9TjC3AXOxwfW08CeoA7OSo2jSOEuTGw==
X-Received: by 2002:a2e:7213:: with SMTP id n19mr354579ljc.326.1599604844296;
        Tue, 08 Sep 2020 15:40:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/34] i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
Date:   Wed,  9 Sep 2020 01:39:45 +0300
Message-Id: <20200908224006.25636-14-digetx@gmail.com>
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

Move out code related to device-tree parsing from the probe function into
tegra_i2c_parse_dt() in order to make code more consistent.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c6a29a8069d9..79d1cefdc901 100644
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
@@ -1729,10 +1735,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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

