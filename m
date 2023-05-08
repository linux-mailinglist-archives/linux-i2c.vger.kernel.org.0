Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9100F6FB8D5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbjEHUyF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbjEHUxr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB3972A6
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-0003xp-VK; Mon, 08 May 2023 22:53:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-0024ub-6W; Mon, 08 May 2023 22:53:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-002YZJ-J7; Mon, 08 May 2023 22:53:29 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 71/89] i2c: sun6i-p2wi: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:48 +0200
Message-Id: <20230508205306.1474415-72-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Ua+Vc6h+cMJWDY+vGdfTJ8KhYbtKllDhMLrvznodC/g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEGq9cpekU8KQr9Jke3ZnX6XbUVfiqGpv+PK N9efKRsNS6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhBgAKCRCPgPtYfRL+ TuuoB/4xhKPb6zz62xlQ2ojOMPNOSW2EV2tBNkA/VSkYjyHo+Ufd9xo/WN1dUTP2M/nOuus9kHI f/x1GVcILomIrak0TQLzYzOBOnAQhDZ9I9rnEU2CiPkC7tuUFHFnYoXlmeQ4aPt1hJ2FxppocOS MFKFB95HlqXEFUbuimUJSvIboY3/606IOviVGgmemyqAEhEFsBg4y+3wLnycPSnz7QvjpVcbuc/ yfmIeab3z5Pd6aziIiLqqof5oCRvob/JL85wrZLbnn8NPKeW8BlKZL9nwH4+v0it5hRh9FoFqju QAF7hPEmWzkbCcdMjqu+fqlLYeb5JbDb+aItBPmmdodVlQ18
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 9e3483f507ff..3cff1afe0caa 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -313,20 +313,18 @@ static int p2wi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int p2wi_remove(struct platform_device *dev)
+static void p2wi_remove(struct platform_device *dev)
 {
 	struct p2wi *p2wi = platform_get_drvdata(dev);
 
 	reset_control_assert(p2wi->rstc);
 	clk_disable_unprepare(p2wi->clk);
 	i2c_del_adapter(&p2wi->adapter);
-
-	return 0;
 }
 
 static struct platform_driver p2wi_driver = {
 	.probe	= p2wi_probe,
-	.remove	= p2wi_remove,
+	.remove_new = p2wi_remove,
 	.driver	= {
 		.name = "i2c-sunxi-p2wi",
 		.of_match_table = p2wi_of_match_table,
-- 
2.39.2

