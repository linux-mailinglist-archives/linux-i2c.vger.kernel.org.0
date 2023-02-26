Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1986A349F
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjBZW1W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjBZW1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3FA18B04
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTx-0000v7-0N; Sun, 26 Feb 2023 23:27:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-000UbY-AW; Sun, 26 Feb 2023 23:27:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000YPl-7I; Sun, 26 Feb 2023 23:26:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] serial: sc16is7xx: Convert to i2c's .probe_new()
Date:   Sun, 26 Feb 2023 23:26:48 +0100
Message-Id: <20230226222654.1741900-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=D79Vaqn/zOmfQLHCMMajfRylVVdeG/UEyphy/fGba08=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMST/vjNFc4/+HfaadnbxdGX/E3FxhXydzV39Uf+1P/Idz emZeHlGJ6MxCwMjF4OsmCJLXZGW2ASJNf/tSpZwwwxiZQKZwsDFKQATSb3H/lfWh4NpGXNOfW4u R78Ui3ceL6fK2Q39y3rafK69l9jr6dp1eOa5h+78jy29tkVVaut9et3P/G3yQYeZ9xKKxS2i3G7 Ke6ybG5t0ajp3id27iZGfirfW+l67xyk9pXBapOqU/OTso953Qmp05y3KS9YRvx+fEefOun/dgx /JvqpXrKcvS+/8+TsocoHJP0mFGW7ia7bMt//cskc1M8Wjrunvooyr6TKvag12rKzgMNZ5v/pv2 v0ZLi9N1mQxNzx2Cs1Z81Wvd1ntvz2BL87X1hY+9y9XjXGfEvlfsXArA/v8DNHdKiY8n96EVv4J uNhwfk9Ud54Rz91i7ZdrFFbZdsXe35JTJnitf1vPw1UXAQ==
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

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in the probe function.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/lkml/20221118224540.619276-572-uwe@kleine-koenig.org
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/serial/sc16is7xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index 29c94be09159..abad091baeea 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1666,9 +1666,9 @@ MODULE_ALIAS("spi:sc16is7xx");
 #endif
 
 #ifdef CONFIG_SERIAL_SC16IS7XX_I2C
-static int sc16is7xx_i2c_probe(struct i2c_client *i2c,
-			       const struct i2c_device_id *id)
+static int sc16is7xx_i2c_probe(struct i2c_client *i2c)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
 	const struct sc16is7xx_devtype *devtype;
 	struct regmap *regmap;
 
@@ -1709,7 +1709,7 @@ static struct i2c_driver sc16is7xx_i2c_uart_driver = {
 		.name		= SC16IS7XX_NAME,
 		.of_match_table	= sc16is7xx_dt_ids,
 	},
-	.probe		= sc16is7xx_i2c_probe,
+	.probe_new	= sc16is7xx_i2c_probe,
 	.remove		= sc16is7xx_i2c_remove,
 	.id_table	= sc16is7xx_i2c_id_table,
 };
-- 
2.39.1

