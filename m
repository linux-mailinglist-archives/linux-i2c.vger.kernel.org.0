Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB5C3607146
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJUHjv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiJUHjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:39:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C68F2CC9E
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:39:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd6-0006Mj-AN; Fri, 21 Oct 2022 09:39:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd3-000TRU-Ae; Fri, 21 Oct 2022 09:39:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd4-009WBA-Ho; Fri, 21 Oct 2022 09:39:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v1 1/5] i2c: Convert the dummy_driver to .probe_new()
Date:   Fri, 21 Oct 2022 09:39:31 +0200
Message-Id: <20221021073935.165158-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
References: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=udjqYNrFRO88QYK+CXBlmrarRiTbAOE8271jzyrA3GQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUkyhZMCnj5mz91InCVKNxfW0h7K8iV0li+KqPQnl +7eRK5OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JMoQAKCRDB/BR4rcrsCarJB/ 4oNEH1/tqaC53pKGxaJZv56+vXHY7Pip9jpPmX1mGjCHb6ctMi8tHZctENdUTF8GUDwXijq8bMQBrx k0GuOJL5dv8gzZheQF1JXVjR4GP7e7S98xJ1TjD/BYL3itgGFOyrgNqYtuI/uvb1sHXkkYl3fVw99j qtLYc6+Pkn822D61/OEsJWOiwPmmBu1WqgGqReB8maD3bUbvvSTOTYK+i90RmEPOoZRKPGJsYNM5/x U0D5OqPxsFWCnfWbhJdy5dRMLSVWCsT+zuinIz9szcrx6QOZoZSl6KTm26/0P+xTK2XTATo2FRsn7n 4XMnLu1HZpy3WRgWU9h/jeir1EhqwR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The probe function doesn't make use of the id parameter, so the driver
can be converted trivially to .probe_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b4edf10e8fd0..f786917a7f44 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1017,15 +1017,14 @@ static const struct i2c_device_id dummy_id[] = {
 	{ },
 };
 
-static int dummy_probe(struct i2c_client *client,
-		       const struct i2c_device_id *id)
+static int dummy_probe(struct i2c_client *client)
 {
 	return 0;
 }
 
 static struct i2c_driver dummy_driver = {
 	.driver.name	= "dummy",
-	.probe		= dummy_probe,
+	.probe_new	= dummy_probe,
 	.id_table	= dummy_id,
 };
 
-- 
2.37.2

