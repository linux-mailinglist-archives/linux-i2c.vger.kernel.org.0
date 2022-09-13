Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F58C5B7909
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 20:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbiIMR7t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 13:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbiIMR7T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 13:59:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2150AA4C8;
        Tue, 13 Sep 2022 10:01:39 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id z12so3521765wrp.9;
        Tue, 13 Sep 2022 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=w9orRMHb3W5Ot9zUe1tQk0A2XOUoQ89YRQsJAzE5Px4=;
        b=GORiJJCu47fleJzEi2bQpjm+m44qqdqj3QOGmYVurj+l4Dlu191OwMSPYvWnvfRL9r
         GI9GjGvTy238C+K3LA36Kismnz0yIGrMN/w7yiZBdfnhfPhG6dnj5y+pn+HXCwwO6KFO
         bkuyKG9oPoXuMM7YFbsbNjfroK1rDfMuMTa+OV8lCKi7Mr4DUblVh02Z9/82PHPDDGeU
         +XyaRM2FXeNmPZpYPTQ9QU6vLuNFqVriJ2C11LsePPQVKLCQJms+Z2D7H1PI7kLqzkGp
         E01qC//osOzBmlyj9ycCmBuGfi+uTUFuL3C0mmjbtqBcz9nZzLrCzR8JKCfaByLjZgmT
         aKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=w9orRMHb3W5Ot9zUe1tQk0A2XOUoQ89YRQsJAzE5Px4=;
        b=Pj4CswQK3PwKyQPfxhK3TG1mcjvLby1+nfDPaK8vkVkjM25Pan3RfKFdgE/ME//C4a
         NTRx/2fVRCZ4D7WYEV8Bzo25ftc86eEOzFpzOBTHNkZwsGHVXVvaSrgoEOZVwUChoGpo
         jKNnxqJe7COdSngUNlop4lCnlh+yHHTEQHSq95R2NFiSQzyEt7adqKezI9y+fKTN/5gQ
         wyQ0swni30+DhtZtoPp38x9ylrylY2tDNNbT63EHvrJtBTpzI16XQkGO3maFuzY02kRL
         prlbeBrdVskBuiGmm5vK23DnPEi9KZ2A4caPMG/GtLO/Dl40GhYJ2Z2TdbpaASvzez0A
         Mr1w==
X-Gm-Message-State: ACgBeo04slnYkuRgfWoGiS6sggzEK3E1R14fLZK3HkNjUdISJtAZhTlt
        76TATJQbYcMEmIyPYgxhd5s=
X-Google-Smtp-Source: AA6agR6YpkhM1xYDxBZ65W4zflFfwrDEEsSILoI8aGXYu8cQguo5Nx7DnFcPhhaQedouwW+a4cVkdg==
X-Received: by 2002:adf:ef52:0:b0:22a:6ec5:a0fd with SMTP id c18-20020adfef52000000b0022a6ec5a0fdmr8639990wrp.190.1663088497627;
        Tue, 13 Sep 2022 10:01:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fc6e:cfa1:9281:3490])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d6751000000b0021efc75914esm10878883wrw.79.2022.09.13.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 10:01:36 -0700 (PDT)
From:   Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] i2c: riic: Use devm_platform_ioremap_resource()
Date:   Tue, 13 Sep 2022 18:01:21 +0100
Message-Id: <20220913170121.24246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use the devm_platform_ioremap_resource() helper instead of calling
platform_get_resource() and devm_ioremap_resource() separately.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ecba1dfc1278..849848ccb080 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -400,7 +400,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct riic_dev *riic;
 	struct i2c_adapter *adap;
-	struct resource *res;
 	struct i2c_timings i2c_t;
 	struct reset_control *rstc;
 	int i, ret;
@@ -409,8 +408,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	if (!riic)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	riic->base = devm_ioremap_resource(&pdev->dev, res);
+	riic->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(riic->base))
 		return PTR_ERR(riic->base);
 
-- 
2.25.1

