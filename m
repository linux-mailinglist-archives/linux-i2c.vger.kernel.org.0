Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68FA607149
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiJUHjx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiJUHjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:39:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7A32CCBF
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:39:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd6-0006Mg-8i; Fri, 21 Oct 2022 09:39:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd3-000TRK-26; Fri, 21 Oct 2022 09:39:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd4-009WBD-Ns; Fri, 21 Oct 2022 09:39:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v1 2/5] i2c: slave eeprom: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 09:39:32 +0200
Message-Id: <20221021073935.165158-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
References: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=cGxD5LI6RpVRvkuUReTvWQ8ZC84cttB4FAhdlcluDOQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUkyk4/PnCDv5S/Zi1/vyo6/bqBbPn8uc/VMDpWD9 hK1XMVCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JMpAAKCRDB/BR4rcrsCQ++CA CC1yjHYODnmQo8ujhFqd6EZ/hTu4FMEQhRFg9pjREKCUTfhqJq5w50vMk4639OyytaWwLv87Xa3HFP 8qshYzckJBthxZgBGGnfEN7R64kTf2M1HceXposHx9EJmRyudyylgGtlcK3WaDXvTNKm7veDiGeNRG NTsLVMy5SlgMuhC7gkqW4VkCeTOaeec7QW4uTOL2qsoS3hhY/BopkB992CKfaq3RhyMZnh3VT3ruiP YmpFjoRXJvAD90HGmgKlEn+fIDyih5mXkM50j5pSFcAOkZ29k0ebrFpxdhoYxUYbOAD9p3ZreuGHsB wEoN6AnHRZWuKM08zfhZh23r7oNBcT
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
that explicitly in .probe(). The device_id array has to move up for that
to work.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-slave-eeprom.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 4abc2d919881..44c14bfd1fda 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -140,10 +140,24 @@ static int i2c_slave_init_eeprom_data(struct eeprom_data *eeprom, struct i2c_cli
 	return 0;
 }
 
-static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static const struct i2c_device_id i2c_slave_eeprom_id[] = {
+	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
+	{ "slave-24c02ro", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c512", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c512ro", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
+
+static int i2c_slave_eeprom_probe(struct i2c_client *client)
 {
 	struct eeprom_data *eeprom;
 	int ret;
+	const struct i2c_device_id *id = i2c_match_id(i2c_slave_eeprom_id, client);
 	unsigned int size = FIELD_GET(I2C_SLAVE_BYTELEN, id->driver_data) + 1;
 	unsigned int flag_addr16 = FIELD_GET(I2C_SLAVE_FLAG_ADDR16, id->driver_data);
 
@@ -189,24 +203,11 @@ static void i2c_slave_eeprom_remove(struct i2c_client *client)
 	sysfs_remove_bin_file(&client->dev.kobj, &eeprom->bin);
 }
 
-static const struct i2c_device_id i2c_slave_eeprom_id[] = {
-	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
-	{ "slave-24c02ro", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },
-	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
-	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
-	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
-	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
-	{ "slave-24c512", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16) },
-	{ "slave-24c512ro", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
-
 static struct i2c_driver i2c_slave_eeprom_driver = {
 	.driver = {
 		.name = "i2c-slave-eeprom",
 	},
-	.probe = i2c_slave_eeprom_probe,
+	.probe_new = i2c_slave_eeprom_probe,
 	.remove = i2c_slave_eeprom_remove,
 	.id_table = i2c_slave_eeprom_id,
 };
-- 
2.37.2

