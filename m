Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBC477EA59
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 22:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239509AbjHPUFA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 16:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346031AbjHPUEe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 16:04:34 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F732110;
        Wed, 16 Aug 2023 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692216270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=26DUZLe4PV/0nEWQNlxeRLfNg1jDJUvrXE6RFg1ThPg=;
        b=SRo7JCOYfnLKt/roeC4G6zaXhgZ8gfwdQ52MwzmbFJUQLcW4J7OpqrjU7aa6OSvPCxk8H2
        XlUK5hS6P81rJOdSZ9sQJu72UpGRB0zBphTcHmBmBRnxV7onSSw/WnwHfyNwJk4zi5QlIb
        tdsuR+X8pdGTCMaihQaiPRSlS6XlkB0=
Received: from fallen-ThinkPad-X260.hotspot.hub-one.net (<unknown> [37.169.176.143])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id dbbb5935 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 20:04:30 +0000 (UTC)
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
Subject: [PATCH 4/4] i2c: imx: devm_pinctrl_get() cannot return NULL
Date:   Wed, 16 Aug 2023 22:04:10 +0200
Message-Id: <20230816200410.62131-5-yann@sionneau.net>
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
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 65128a73e8a3..502276e8ded5 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1389,7 +1389,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
 
 	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
+	if (IS_ERR(i2c_imx->pinctrl)) {
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(i2c_imx->pinctrl);
 	}
-- 
2.34.1

