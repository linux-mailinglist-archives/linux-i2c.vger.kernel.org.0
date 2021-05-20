Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BE838AE1D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 14:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbhETMZX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 08:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbhETMZR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 08:25:17 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BA3C0AF781
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:21:13 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso4865627wmc.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYtTHed5+bcflT7W1MwJxVtTplHwdof5DPlJCzKg/GU=;
        b=wHzSjTiwKXBcRbEJoWYfBbHsBACdQyin173EJ35ibk/Le84pDQz22+ydLN+s2rjISy
         I+JQrHpSULjWpslolZhZ5oNzuFn6Jm4Xfez874QzyEF3o1vjZLDKl5RfL6iEpjDpTU6E
         GsWAE200CVFWmzZB0jBnSHQiysNZqmuHA4QBYeUZNk7kY6BB8Z9W7JH+a6/3a+lWNf1q
         aiDoJJPNe7khmZ6EHXZO1bhn6GXd4F7Hp/o3NyaiFDPEhbKCcue5aqXjPfe0cBmp8TKB
         DNHKneadShb9fVu0FQOnKh4P481VVKGXrk6C+/s6sN3zz62tMKeeqha/+VCFc2gHYup/
         yVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYtTHed5+bcflT7W1MwJxVtTplHwdof5DPlJCzKg/GU=;
        b=oyxDM/bWqAzxho5h/7ON4eo5QhnW5BQ4SJFohB8Y+cfYWN68P8T+GdYqn+fyNNjivu
         Wgfss6OmcMYAWUGs6tugtQ8y5o2/W01Q5/PAYNhE90BcNxOCizZAPiWFPQ3x2F4dNi6f
         J+/Tr9xo350uNLZuX/Go5aVFY6ekKNKNVOfgwnQQk6BfZwnrXl/Zav/8A6wbe8YeQp2F
         Qg7Ew4MwjBiK5yPPlmUiNAQf+Nufilmtyk8eHNKp4lV3Pms/kohd3pQOaX1vw0PX2TwY
         uaI3zsAXnWLPYn9ryqwcZhDc8XuKROFJijLtYzi1MScK+O3y1+ue9zX1WE2KMBBRtsry
         5wLA==
X-Gm-Message-State: AOAM53234BlO7Lycr+31cG3yg6csatgDaHtMpYCi2SjF5CodN2e0j+29
        fLH9AR0MJdIfdab++1N+MHKS5g==
X-Google-Smtp-Source: ABdhPJwvuM5ZR01Iie6YuQBaMHLb3duG28paxLrXOheP+cO3HgcEo+2Qn9ejUUvRZNq2JhTAWP7/DQ==
X-Received: by 2002:a05:600c:5c1:: with SMTP id p1mr1599688wmd.10.1621509671651;
        Thu, 20 May 2021 04:21:11 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 04:21:11 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] i2c: i2c-mt65xx: add MT8365 SoC support
Date:   Thu, 20 May 2021 13:21:04 +0200
Message-Id: <20210520112106.77190-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for I2C on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2: No change

 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e56ee2..0e6ad84e0e47 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -404,6 +404,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8365_compat = {
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.apdma_sync = 0,
+	.max_dma_support = 33,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
@@ -412,6 +425,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
+	{ .compatible = "mediatek,mt8365-i2c", .data = &mt8365_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);
-- 
2.31.1

