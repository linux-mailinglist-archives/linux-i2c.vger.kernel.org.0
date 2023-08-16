Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9CD77EA56
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 22:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237492AbjHPUE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 16:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239509AbjHPUEZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 16:04:25 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEFA1BE8;
        Wed, 16 Aug 2023 13:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692216262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZyPwLzsO5Iq18JykTf6YehEkeDl4Bvn+ZZAZBGf+JIM=;
        b=PWgD44hKBNwvnR/2y9IyD/C+e96cOmyQJRqYvith4gpGhFq0j8i3KPzo/pjCslMT7BcgrE
        QeM2SAkHTlYEM59jP6XP7eVUDHzJagCyS74SKDmflbCZ7wEpU654N2eTkp4lv8IxlAP7Nm
        k7e/ukCccQLpcohO0P8FE0iKLyG5GK8=
Received: from fallen-ThinkPad-X260.hotspot.hub-one.net (<unknown> [37.169.176.143])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 8204e85d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 16 Aug 2023 20:04:21 +0000 (UTC)
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
Subject: [PATCH 1/4] i2c: mv64xxx: devm_pinctrl_get() cannot return NULL
Date:   Wed, 16 Aug 2023 22:04:07 +0200
Message-Id: <20230816200410.62131-2-yann@sionneau.net>
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
 drivers/i2c/busses/i2c-mv64xxx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index fd8403b07fa6..0c4a0110978f 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -947,8 +947,6 @@ static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_data,
 			return -EPROBE_DEFER;
 		dev_info(dev, "can't get pinctrl, bus recovery not supported\n");
 		return PTR_ERR(rinfo->pinctrl);
-	} else if (!rinfo->pinctrl) {
-		return -ENODEV;
 	}
 
 	drv_data->adapter.bus_recovery_info = rinfo;
-- 
2.34.1

