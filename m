Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D236877EA57
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 22:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345971AbjHPUE7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 16:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346019AbjHPUEb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 16:04:31 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179BB1FE3;
        Wed, 16 Aug 2023 13:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692216268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9z8MSlMelNlflt6ODHLzPuDfrH7+1zhOszToYuWOP8k=;
        b=zHMl55jDuyuMVmijysBOPCvsx49I3VW7DZd+TmjKXnJzJykmrnhuPpd7ruaAZ71kceJCTk
        dx8sFRGPibQvR8Q4K7HAxxsq/U8dcjXU2D2MxhWt4IcDXYWUSOBj0JYx0gOrZdYZMYuMjU
        W1+rJ8SvfhkSClQmDUvNWd41VJSIBb4=
Received: from fallen-ThinkPad-X260.hotspot.hub-one.net (<unknown> [37.169.176.143])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 5d17dcb0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 20:04:27 +0000 (UTC)
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
Subject: [PATCH 3/4] i2c: i2c-cadence: Reset pinctrl to NULL in case devm_pinctrl_get() fails
Date:   Wed, 16 Aug 2023 22:04:09 +0200
Message-Id: <20230816200410.62131-4-yann@sionneau.net>
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

The core i2c code generally checks if pinctrl has been properly initialized
by just doing 'if (p) some_pinctrl_function(p)'.
In case devm_pinctrl_get() fails, pinctrl variable contains an error
instead of a valid pointer.
To prevent core i2c code to crash, reset back pinctrl pointer to NULL when
this happens.

Signed-off-by: Yann Sionneau <yann@sionneau.net>
---
 drivers/i2c/busses/i2c-cadence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 9849f4502570..aa9ae0755674 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1299,6 +1299,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(id->rinfo.pinctrl)) {
 		int err = PTR_ERR(id->rinfo.pinctrl);
 
+		id->rinfo.pinctrl = NULL;
 		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
 		if (err != -ENODEV)
 			return err;
-- 
2.34.1

