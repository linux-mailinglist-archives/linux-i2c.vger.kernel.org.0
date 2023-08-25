Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1ED788BC8
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 16:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343767AbjHYOdJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 10:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343783AbjHYOcs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 10:32:48 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114EF19AE;
        Fri, 25 Aug 2023 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692973961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=pg0LPNhgEAv4Ly7OVC5nrMKlmylfbzb/lgRhbAfYgQ8=;
        b=r8uCJFfxzrnu5eJfmggp7Zncg2yv/btUedOd9MKS+PuUamj2rIzuvOResjFacNLGJFdc76
        fLCXtwVl39vlT/SHnrU/1q1x03GMMYyr5r62q/4SsB7Sigyzv0K+WvBAxM3XW9V+cfhzda
        4KgkE54GBVqZ1lTkeu5dxJE5JzKWTKc=
Received: from fallen-ThinkPad-X260.home (91-171-21-26.subs.proxad.net [91.171.21.26])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 1d4ade5f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 25 Aug 2023 14:32:41 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Yann Sionneau <yann@sionneau.net>
Subject: [PATCH RESEND] i2c: at91: Use dev_err_probe() instead of dev_err()
Date:   Fri, 25 Aug 2023 16:32:34 +0200
Message-Id: <20230825143234.38336-1-yann@sionneau.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change
if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
into
return dev_err_probe()

Also, return the correct error instead of hardcoding -ENODEV
This change has also the advantage of handling the -EPROBE_DEFER situation.

Signed-off-by: Yann Sionneau <yann@sionneau.net>
---
 drivers/i2c/busses/i2c-at91-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 05ad3bc3578a..b7bc17b0e5f0 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -227,10 +227,9 @@ static int at91_twi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 
 	dev->clk = devm_clk_get(dev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(dev->dev, "no clock defined\n");
-		return -ENODEV;
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(dev->dev, PTR_ERR(dev->clk), "no clock defined\n");
+
 	clk_prepare_enable(dev->clk);
 
 	snprintf(dev->adapter.name, sizeof(dev->adapter.name), "AT91");
-- 
2.34.1

