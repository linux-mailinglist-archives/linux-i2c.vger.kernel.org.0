Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18699260877
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgIHCP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E391C061798;
        Mon,  7 Sep 2020 19:11:48 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so18002631ljo.5;
        Mon, 07 Sep 2020 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n78f/w7+YRlV7g2j4BSWVO0kVbFgpBSvXgYlEUTKsGI=;
        b=GoPm2t9ozB8lqVKv6t/xeiGfy8YhpTLYGgt0Kcc4cHVqZhhW+kSuG2PGad9yZ/hP90
         G9tEJCcRKmBaTyKe/ec4x0X2vH42LBE77Z8JL1D9WzvCaeicnxmBPOVRllQ0SnqV7y4l
         h2Kfm5iv3b5M12wogJFJn5TJHLvOBYOw+yXZjdUsAWH4KbXiH1LcHxLN4ehLb7h3+wW6
         R9aY4tjpMg5TsW/TSW0OUo5QHOTU85gU76UhET/DL/uoADU2p6LdxsSlJVL+9TqGj/QI
         4zkouuu0jwu5+5Pd9AQDs0mEoZ3Gf2PO+YBtWhybBKMNxBok9UVnLfCHFf+iIzGjD0ZG
         5m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n78f/w7+YRlV7g2j4BSWVO0kVbFgpBSvXgYlEUTKsGI=;
        b=jDkT9L2X+f8HWtS7X0eabQY0VBNYJVU0RkpxK5BOmHf/1kgVMsizO+24hvHBnAnY5r
         qjzMdxyPwevSPt+p3Allej0stqkUDlDzdQGrDYv9ABVjQEBRVGG/EBIwSiuuyWS+Kp52
         yi9E6T+Xp6uLM9Rz6wSbI0wHPWIB3kB7HEGsG4ATweQAEBnBNw29JSIhxzlbtAxIHdzG
         SB7ub4PDp8+Uau6Nmt28vOvXlFrgowXENHQWqac/HpUlulnppPviI1CkvrCJSLRu/0pz
         dABPJrpUyhAubCcwcF5GanD6FVn2+nACD51EZOD7QnX8uhDPMjrIu+pjW/n8100vX8ft
         JKvw==
X-Gm-Message-State: AOAM533GqE7xqAmhxCc/33G8Vno7i6N/08lckv6/fvCCRR4ygp4aRowY
        TFxumqwgjv68/YUCxpiiQcmMPJVX0p8=
X-Google-Smtp-Source: ABdhPJwAzGn2vY0SMWNE5xX/vh0LxiNC1OBOIgRrRXCf1ALdEL4SOn1JSdjboMWrH1XAwBv20cD/5w==
X-Received: by 2002:a2e:918f:: with SMTP id f15mr11835357ljg.435.1599531107062;
        Mon, 07 Sep 2020 19:11:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/35] i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
Date:   Tue,  8 Sep 2020 05:09:59 +0300
Message-Id: <20200908021021.9123-14-digetx@gmail.com>
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

Move out code related to device-tree parsing from the probe function into
tegra_i2c_parse_dt() in order to make code more consistent.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d2fe0f1704a5..e20937041504 100644
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

