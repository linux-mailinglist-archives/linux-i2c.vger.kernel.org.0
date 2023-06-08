Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C48972794B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 09:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbjFHH4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 03:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233801AbjFHH4O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 03:56:14 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276DF10F8;
        Thu,  8 Jun 2023 00:56:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-977cf86aae5so53264266b.0;
        Thu, 08 Jun 2023 00:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686210970; x=1688802970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pxxVNO1ebNs7IeCt2Qr1fNijVL9D+WeUV59wK9pdas=;
        b=hZgL/HLD2zhbj6owMSmd8rlf8UKLUxz0MrZl5tRQMQgqNewucNTRaElZaqPDlgNUMN
         QpjbTYXuXzjHiBV8M/mRMXvMKIS0p7/Gu6wpusVn+bhHb0680YR/oA4GY44k9z8NWa0b
         vEySSHz3TXsUpnz7a4mzUKt9XcJTbwUsZwhcS9X1SYep7x6ik0qyPV7PEfKSt8/QCG17
         Wou1cpRvxFjy77IWoAQn3wPegUc0SF45ZRlgCkdA3DfYO2QPel6hbUKDN4+EfZLjHwgm
         KdDY2i2ltjOEDiQRPscatT3phkLCso9e+EgD6eKOteC7Vdy54i66vABGjjr/uwCD/DZE
         L6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210970; x=1688802970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pxxVNO1ebNs7IeCt2Qr1fNijVL9D+WeUV59wK9pdas=;
        b=eohCNbByOzcDpUQkveLkHsoJi6TkhkJNyAB26zMOgl0IUktzm+dqgMnLieoPVWxHje
         WsmMX3KjbNRqLh5IvdApGHENc6LgMV2155fyykDIA3jcAeRMq2uhGLu79iBQYyopB8VC
         bLvTe94bxoy/VB09VGF3NQ5gO8VbBGmKLV+p0ZDT9o+hFg6W3aJJ4zL6UjsMmwRMjnmP
         HhqLBpQuSsBjTWMMMF1ueh+QYibwP8BBsH4DqHocd7V1sifcFBel6yUjLN8GwWuknXh9
         TNSbOyvNhY+jh40Ua0G+QQULTs38udsj5BgwyY4c66zr7xNB4y8ErlUtB5H1UPB+vXT3
         Q9jQ==
X-Gm-Message-State: AC+VfDyJDuyor/UE+H9u+hAWwQ8+OA7666JyT4FV0LvkgRh92HwzkTgj
        TOVbEoaJPVjC7U3cgRjJTvm/ijG+A0g=
X-Google-Smtp-Source: ACHHUZ5EghSL+T2smSFXGaDDfGtSEs20h0mHG9wiXgx18PI4vRiqEqB1vTRkGMtyHfYeT+MGxnnm4Q==
X-Received: by 2002:a17:907:a424:b0:960:ce5:20c0 with SMTP id sg36-20020a170907a42400b009600ce520c0mr8595282ejc.20.1686210970362;
        Thu, 08 Jun 2023 00:56:10 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906c18b00b009746023de34sm345781ejz.150.2023.06.08.00.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:56:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] i2c: tegra: Fix failure during probe deferral cleanup
Date:   Thu,  8 Jun 2023 09:56:06 +0200
Message-Id: <20230608075606.3590744-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
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
this by simply propagating the error code.

Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f155e9028f94..0eab199900ae 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -458,10 +458,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	 * with existing devicetrees.
 	 */
 	i2c_dev->dma_chan = dma_request_chan(i2c_dev->dev, "tx");
-	if (IS_ERR(i2c_dev->dma_chan)) {
-		err = PTR_ERR(i2c_dev->dma_chan);
-		goto err_out;
-	}
+	if (IS_ERR(i2c_dev->dma_chan))
+		return PTR_ERR(i2c_dev->dma_chan);
 
 	i2c_dev->dma_dev = i2c_dev->dma_chan->device->dev;
 	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
-- 
2.40.1

