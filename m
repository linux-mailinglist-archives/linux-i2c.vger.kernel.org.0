Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06380792F2E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 21:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240954AbjIETnR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 15:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241263AbjIETnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 15:43:14 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308DBE46
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 12:43:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwy-0006MD-JS; Tue, 05 Sep 2023 21:43:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwx-004GYh-U3; Tue, 05 Sep 2023 21:42:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwx-00FcPs-7t; Tue, 05 Sep 2023 21:42:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>
Subject: [PATCH 1/2] w1: ds2482: Switch back to use struct i2c_driver's .probe()
Date:   Tue,  5 Sep 2023 21:42:52 +0200
Message-Id: <20230905194253.256054-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bm14rIOiA/vizwtSGolixWDcVJSNpvLzw/FTvPjglA0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBk94S3J7K7kXqE4W3EA7koem9JU0iJGL3zG7WTY GwdDakEejKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZPeEtwAKCRCPgPtYfRL+ TuUbB/9epxEqGffOrFGvnYs2vNOT9Fl6tu/+QPYZBfY2aWGWQeNBkEzqDcGUuYfhl5jfTNOpz5E luPDv6kgaOCjaGhgfS9qwQ2+3xwu/laRcjImlfuBigij5ThCVf0cZrJuaqYyNdf/ln1l1oiWMcX gUKK8C3kptwPA33uD6DkJk6BUrv1uofiHYnWWROmDk/Tt/jz90P9nZRxJ0b1MaO48t9JP/nmXo6 qZUOuWkfOuJwyXT30fepA20rhFp91lCRKIj8m78Vt9kplGsJY8bWrw4+5Q2OcV5cFlkI3zQ3F3A wQ922GMbtWMfjz66xSRIH9N68stu+bT80xCnrebNl9e1DkBc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/lkml/20230612072807.839689-1-u.kleine-koenig@pengutronix.de/
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/w1/masters/ds2482.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index c1de8a92e144..b2d76c1784bd 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -551,7 +551,7 @@ static struct i2c_driver ds2482_driver = {
 	.driver = {
 		.name	= "ds2482",
 	},
-	.probe_new	= ds2482_probe,
+	.probe		= ds2482_probe,
 	.remove		= ds2482_remove,
 	.id_table	= ds2482_id,
 };
-- 
2.40.1

