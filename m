Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072817A99FD
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 20:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjIUSfd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 14:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjIUSfV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 14:35:21 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F61BA3ADC
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=w8oKEs2sMKyJB/
        9xLttOMoyayz94+7PAY5WtKf8fZZA=; b=P2jnk/j0vzH6uY8ib2yN+veCzZL5QQ
        bJZwMLVhK79/66lIPDr+MPDa/g31ktVrPH5GHpwPox3/Tbo6Osc1ozMRmJiBupbF
        I/HZXYMpmX7sINy/UzxniShAlEjcPbQl9Szn0JaFQe06LKw11nQbT3U2Y4GNvSlY
        9FfUWUMnjteGR8aQIs0xwhUQIUHfzVEcR7kQtxgWs8lCLiyHSUSNr0FV5zegHsXp
        6TFb2h0PM9vbuhIIFiWyvq+RvvhgseCuQbWPzA4qYYzeXmWYiLEoN364QGI2GN3O
        l1+nQRoZ4IWm2dY3rtsshWhKqzvqriUg/kc/U4Db1jghrlukv1z7FfOA==
Received: (qmail 886921 invoked from network); 21 Sep 2023 10:57:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2023 10:57:58 +0200
X-UD-Smtp-Session: l3s3148p1@Kug6sNoFKmkuciSu
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mux: gpio: adhere to coding style
Date:   Thu, 21 Sep 2023 10:57:51 +0200
Message-Id: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Advertise our coding style by following it :)

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 5ca03bd34c8d..0419c7453281 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -23,7 +23,7 @@ struct gpiomux {
 	struct gpio_desc **gpios;
 };
 
-static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
+static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned int val)
 {
 	DECLARE_BITMAP(values, BITS_PER_TYPE(val));
 
@@ -59,7 +59,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	struct device_node *adapter_np;
 	struct i2c_adapter *adapter = NULL;
 	struct fwnode_handle *child;
-	unsigned *values;
+	unsigned int *values;
 	int rc, i = 0;
 
 	if (is_of_node(fwnode)) {
@@ -102,7 +102,6 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
 	device_for_each_child_node(dev, child) {
 		if (is_of_node(child)) {
 			fwnode_property_read_u32(child, "reg", values + i);
-
 		} else if (is_acpi_node(child)) {
 			rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
 			if (rc) {
@@ -127,7 +126,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	struct gpiomux *mux;
 	struct i2c_adapter *parent;
 	struct i2c_adapter *root;
-	unsigned initial_state;
+	unsigned int initial_state;
 	int i, ngpios, ret;
 
 	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
-- 
2.35.1

