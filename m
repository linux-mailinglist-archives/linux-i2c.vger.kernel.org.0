Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEE65B5B0B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 15:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiILNVL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 09:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiILNVH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 09:21:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DE822B39
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 06:21:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXjMv-0000gS-Fo; Mon, 12 Sep 2022 15:20:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXjMs-000JMe-QK; Mon, 12 Sep 2022 15:20:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXjMq-000Nt3-Mp; Mon, 12 Sep 2022 15:20:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] i2c: imx: If pm_runtime_get_sync() returned 1 device access is possible
Date:   Mon, 12 Sep 2022 15:20:40 +0200
Message-Id: <20220912132040.156713-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Y/i9di6EUGrIrJK5ZlpRf6vNXTuLye3r7vhLl00CDmg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjHzIko61J3bgPoYvStyMRJi/0Ir8KTq2/Dz5vXNTx OSs0vN2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYx8yJAAKCRDB/BR4rcrsCQQtB/ 9yTZHJpcxxEcUZPFCmP+KE9p7ID//CFQnWy1AksaEMBYjMMMxvYH9roreN34vQnu7bE0fosX8JC+o2 npuaPbIXR2mpw0xRY0sa1cM9d3mCjhRIB6MaIpfjwDpeeumu/LYUlX+QYKi6eW+RrEJ6QfzxeU0fR3 6qyRk5wUlxTIiyLC+OUfHbItUhU6b2lBUbSV3TQddbzeCAv5eCnCj8lekEtkvvwpI1fJ/5QaCCeIvq o3VPgYcZsbK3nCo7FOqMQ4VN78z5joXSthFosdqKITq2qOa1r2F9ickOI0zUzigyGuf9oemQWz1k4a Jc8aEInx0eeY5OylaasRbCoURziB7C
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

pm_runtime_get_sync() returning 1 also means the device is powered. So
resetting the chip registers in .remove() is possible and should be
done.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: d98bdd3a5b50 ("i2c: imx: Make sure to unregister adapter on remove()")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e47fa3465671..3082183bd66a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1583,7 +1583,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	if (i2c_imx->dma)
 		i2c_imx_dma_free(i2c_imx);
 
-	if (ret == 0) {
+	if (ret >= 0) {
 		/* setup chip registers to defaults */
 		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
 		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
-- 
2.37.2

