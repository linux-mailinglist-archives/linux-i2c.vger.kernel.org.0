Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A92A27DBD7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729108AbgI2WU4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729062AbgI2WUu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:50 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6023DC0613D3;
        Tue, 29 Sep 2020 15:20:50 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y17so7403979lfa.8;
        Tue, 29 Sep 2020 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+dM+dFglcDZeZSg5A2SuqRgF8U+ggWDe/a+IZqDjJPs=;
        b=qEgaJ9ra+K3uNSAs2vPedjbDyIgzQL/x+Va/9vcwNcTc54cjdsbhaOBMF/7e3O47O6
         VsdrSevKMQOtPtiNP4GsVvY3DqniK13DFf2CqB/qip+x6ZpaUYTN+y7jg6D7BWoycSMU
         +RSSWUVahmyK3M/XX3mR9XFvxcZRytG0+wFaWTComyogdrYM8YA9/PDVm7AGxFjQkk7y
         QXEd8bf+/KXeJ1IrcE/QwfFeqhlUMr1PcLBVypuZanZd25H2jDb0+O0zXv6rBtwl3Iwe
         3gWw8Dq1U6QiJv0BKanUxyV1sdMsQDDPa9IHnETHPJAvl7znbSQetE1hW+ayWUWOl8wD
         X0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+dM+dFglcDZeZSg5A2SuqRgF8U+ggWDe/a+IZqDjJPs=;
        b=LL9UWJ6z2bdTuh1lgRElORbaLwi2a6/xwA169+DBj0ubcQqw2Z4hwv4HH6Lmp6KWKS
         rtc16nqzZWGy6hNsP+Zi4pYKYieWvFJ7EuuxRVhz7MemlTM4joIFKebhzTQgSgfWLpQ+
         YefjrfrOGOIKyV5v6uUJH1Kp+N6KtiFqUGSYP1GSA0V0TWGHO4C2eJRCMUVa07F14VuB
         SaZaFet/lhaHzrpEvv79cHUhetqXNgbKMf5AWUaxhyTF3npQhkKPSxP8lJOr1rJpQ4ci
         w0gFkIMz2SaOkxw34KsA0/VpYuKknsQJXIsiibaZxaj1Hv+vvS7H7OQOiMu1FRLV06Ct
         pw1g==
X-Gm-Message-State: AOAM531bqCdfkxSLRYnyUNwaQUPgqjSFNidw21MWMLXrGuvb7blIOpeo
        vc30iFee+ntmcI2fmuKrwAA=
X-Google-Smtp-Source: ABdhPJykdxlxLnkPoF63wtEJeBBRk9UCIAQzcjWh/NqpHclV11ZNEWJXQDuLRNo9s9hHvkqALSe0VA==
X-Received: by 2002:a05:6512:3297:: with SMTP id p23mr1767909lfe.362.1601418048846;
        Tue, 29 Sep 2020 15:20:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 13/32] i2c: tegra: Move out all device-tree parsing into tegra_i2c_parse_dt()
Date:   Wed, 30 Sep 2020 01:18:56 +0300
Message-Id: <20200929221915.10979-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move out code related to device-tree parsing from the probe function into
tegra_i2c_parse_dt() in order to make code more consistent.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

