Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA5374B1BE
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 15:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjGGN0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 09:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGGN0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 09:26:22 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D168F1FEC;
        Fri,  7 Jul 2023 06:26:21 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so19351155e9.1;
        Fri, 07 Jul 2023 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688736380; x=1691328380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqJPRv6MIZ8ua4fCvSYsUcevIALkgdCAoznGZ8KNcv0=;
        b=nuj6Edmf8JAi01cjjJ0hayp7K62W4CD+BEjUI5IZTmibHmKGm1Y/NI+w+MTcQpcJk4
         Qf8GPFXq5oC90+NZE4jxXrSQetgUL432QGbJ32kiT5uMsYE/a5BN4zdECG658tWIrMVZ
         OU+84bUA8OrGk4gBz+B8imZf5595scxjNQLmRZWaLskpumNuF0Qz/P6Q7CVAGuE8czXu
         rwETWy7jRrCQGau7G6QndJvx+b0kW5klSUTi2r6Awsdsn0LLBW20iRzB0whK+c7z+8EU
         RXPeiFgkm8mK/UJfBCTHef/Yc4j8ATdk6CWRnSl3KjQYktZM/IQSzB2U2wakWt9F67DO
         t7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688736380; x=1691328380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqJPRv6MIZ8ua4fCvSYsUcevIALkgdCAoznGZ8KNcv0=;
        b=ZbPAe2pc6p1GPrXGdPl5h4ZLQ36KIE1j12PAmUZyPYDk9AJpX8R2YuRZXrVkRy/EYx
         8bvcq7J1VdQuMDn3l5TCp/nvYK8HMHkR96zD3i6mz/tZYCb6IWi2Djk5otCzuKWZeSmf
         0ty5//l1XLkUmcwpitfJKmR3k3DTxJxsDcTBrIXSJ+gTKfvo8AL7LojE4lx5GZS2q203
         UyXn6lXYlwl979qUZz2XSEk5Evm/LYnaIYSTOsgzMIiWokLdAqjyi3+lb3c8VoQKK17o
         w7agcvhQPfqhRRLcXvQR6jAZUVMkW9ANrNOAFwq0U5Upsf0Op4LmAV5vep5BMhhzOA5G
         oERA==
X-Gm-Message-State: ABy/qLbTfOFXVm8HlTHwYaUQDIzLU3SRlQjsEsmb491XZkyb6VcQc3ML
        YepakiUzUF6E8ttG+scjZnQ=
X-Google-Smtp-Source: APBJJlGtDZuJw+usDqxCPN8oDZx+1jOmhFMx3YYRltev6rV/20kZvZSGHgcTV7lcW5UKITVWnsBF5Q==
X-Received: by 2002:a05:600c:3786:b0:3fb:b890:128b with SMTP id o6-20020a05600c378600b003fbb890128bmr3944782wmr.27.1688736380160;
        Fri, 07 Jul 2023 06:26:20 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f23-20020a7bcd17000000b003fbb5506e54sm2469658wmj.29.2023.07.07.06.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:26:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Date:   Fri,  7 Jul 2023 15:26:19 +0200
Message-ID: <20230707132619.2998382-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If the driver fails to obtain a DMA channel, it will initiate cleanup
and try to release the DMA channel that couldn't be retrieved. This will
cause a crash because the cleanup will try to dereference an ERR_PTR()-
encoded error code.

However, there's nothing to clean up at this point yet, so we can avoid
this by simply resetting the DMA channel to NULL instead of storing the
error code.

Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- simplify patch by setting dma_chan = NULL on channel request failure

 drivers/i2c/busses/i2c-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f155e9028f94..2a13f11edfd1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -460,6 +460,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	i2c_dev->dma_chan = dma_request_chan(i2c_dev->dev, "tx");
 	if (IS_ERR(i2c_dev->dma_chan)) {
 		err = PTR_ERR(i2c_dev->dma_chan);
+		i2c_dev->dma_chan = NULL;
 		goto err_out;
 	}
 
-- 
2.41.0

