Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0448274CB7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgIVWxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgIVWwv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F73C0613D2;
        Tue, 22 Sep 2020 15:52:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z19so19880366lfr.4;
        Tue, 22 Sep 2020 15:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fpH0QE3p753fVY1hoE4zSamK9iHRhQYdD87Ck2Lu3sU=;
        b=JFmLWzX5p2qQPSF8yQOo1KsTk1qVkR7g98Ht9IpRmcv2PqX+p0VS07bIHOTgE9FHfZ
         S12YD6ZmygoriUpVBae2UErMTs6lJV3RHzL/HAMVkfHCALaN5MIUyuwlg5swLfkjovgW
         JJPwApA/cxaxnwvJwqVAkawyeU6KhOFXeeIvyHzNxHvdforTwc7P2G+ilRZdvHX5n5m4
         ZuGLKFHKMQFM3KV6MlpLHMB6Kh8kNU51FLxN+GLJ0SL+/X7NilW6fe8ByTsi3ioHgBfw
         AbhxFbzEQmHQMNg1y/SctJtPO7QLeaUoyqAQmvwpx8pckqEQTQkvcDGiaGMxYY9OLsVu
         jVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fpH0QE3p753fVY1hoE4zSamK9iHRhQYdD87Ck2Lu3sU=;
        b=WVkpdx4+ImVGKOCUVvB8qJW4cfVsHo0tmFg3eCL6K+vYnH8BQESGf+K3Xg7KobwH3z
         PUkiVBppdX/RTdkMVC3q6vU7/W25NJjHnh6mjYigQJXXuq2ul+U5h1geVI3RSthjTFHV
         MGzgbnGowe2MWDXq8K55oXULkL3FXA0eWFR1bYOLHT5lLqOfgBeHqD+bQ8B1nEOKTI5W
         ZknPZY0dMS2WrB+QK9+Pw49pW/YcPAq9xcV2T1I1f12GlgrBVTtaRU3u/9GFCo3g1I+6
         MhhEmUjMMjfMvo7pvRFRL+Q6cPyFmLxwlcgK+BdqK+kDkibROKBU0cLU/sgkd0Fb9jmv
         +UZQ==
X-Gm-Message-State: AOAM5333lJoJSTtTLyX/bwY5ME32Z8anRh6iRFOe/WGj/Cvh7Cunb1dR
        LLwfQ68XUsfDTHp00J/lbco=
X-Google-Smtp-Source: ABdhPJwcN8dbYOeeuvHtHVPHS7qnMLsEjAF/eIyZ66gd23Jmcx8m5LNokdkbJC1gtersXP2IX9oNkQ==
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr2677080lfh.86.1600815168652;
        Tue, 22 Sep 2020 15:52:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 19/32] i2c: tegra: Remove redundant check in tegra_i2c_issue_bus_clear()
Date:   Wed, 23 Sep 2020 01:51:42 +0300
Message-Id: <20200922225155.10798-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_wait_for_config_load() checks for 'has_config_load_reg' by
itself, hence there is no need to duplicate the check.

Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index dc25578adb6b..79fa98423cae 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1082,11 +1082,10 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-	if (i2c_dev->hw->has_config_load_reg) {
-		err = tegra_i2c_wait_for_config_load(i2c_dev);
-		if (err)
-			return err;
-	}
+
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		return err;
 
 	reg |= I2C_BC_ENABLE;
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
-- 
2.27.0

