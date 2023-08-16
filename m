Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EAB77EA55
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 22:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345895AbjHPUE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 16:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345874AbjHPUE1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 16:04:27 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D861BE8;
        Wed, 16 Aug 2023 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692216265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TR5waAKqgJDCuh+rCJahhuidB0eME1Oapggx75cClbQ=;
        b=bmf5vcGVXogUm50nsSTAHcIBD2I5AmKXA/kHZTFQJuyCiNvaiqrwt3o7cPD78DrqxN1NkR
        Gh6buxGqfMDtuyP0h/tT5166PzLHRd1Dnw7OYAd0Bs1I5bBMopB1FOA6ivRAO6vo/lO4KG
        n/tTHz+mtjj1MDoJ9ii7i9koJG2eYP4=
Received: from fallen-ThinkPad-X260.hotspot.hub-one.net (<unknown> [37.169.176.143])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id b10c9cd5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 20:04:24 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Michal Simek <michal.simek@amd.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Yann Sionneau <yann@sionneau.net>
Subject: [PATCH 2/4] i2c: at91-master: devm_pinctrl_get() cannot return NULL
Date:   Wed, 16 Aug 2023 22:04:08 +0200
Message-Id: <20230816200410.62131-3-yann@sionneau.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816200410.62131-1-yann@sionneau.net>
References: <20230816200410.62131-1-yann@sionneau.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove unnecessary check against NULL for devm_pinctrl_get() return value.

Signed-off-by: Yann Sionneau <yann@sionneau.net>
---
 drivers/i2c/busses/i2c-at91-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index c0c35785a0dc..b598d2439eb1 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -832,7 +832,7 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 
 	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
+	if (IS_ERR(rinfo->pinctrl)) {
 		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(rinfo->pinctrl);
 	}
-- 
2.34.1

