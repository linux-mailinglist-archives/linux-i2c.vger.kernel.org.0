Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0F012DA3D
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 17:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLaQOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 11:14:37 -0500
Received: from sauhun.de ([88.99.104.3]:51518 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbfLaQOg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Dec 2019 11:14:36 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id BBA282C0783;
        Tue, 31 Dec 2019 17:14:33 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
Date:   Tue, 31 Dec 2019 17:13:56 +0100
Message-Id: <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is a pattern to check for existence of a client which is copied in
i2c_detect_address() and i2c_new_scanned_device():

1) check if address is valid
2) check if address is already registered
3) send a message and check the reponse

Because this pattern will be needed a third time soon, refactor it into
its own function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 57 ++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index a1eb28a3cc54..20a726dc78db 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2108,29 +2108,39 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
 	return err >= 0;
 }
 
-static int i2c_detect_address(struct i2c_client *temp_client,
-			      struct i2c_driver *driver)
+static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
+			    int (*probe)(struct i2c_adapter *adap, unsigned short addr))
 {
-	struct i2c_board_info info;
-	struct i2c_adapter *adapter = temp_client->adapter;
-	int addr = temp_client->addr;
 	int err;
 
 	/* Make sure the address is valid */
 	err = i2c_check_7bit_addr_validity_strict(addr);
-	if (err) {
-		dev_warn(&adapter->dev, "Invalid probe address 0x%02x\n",
-			 addr);
+	if (WARN(err, "Invalid probe address 0x%02x\n", addr))
 		return err;
-	}
 
 	/* Skip if already in use (7 bit, no need to encode flags) */
-	if (i2c_check_addr_busy(adapter, addr))
-		return 0;
+	if (i2c_check_addr_busy(adap, addr))
+		return -EBUSY;
 
 	/* Make sure there is something at this address */
-	if (!i2c_default_probe(adapter, addr))
-		return 0;
+	if (!probe(adap, addr))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int i2c_detect_address(struct i2c_client *temp_client,
+			      struct i2c_driver *driver)
+{
+	struct i2c_board_info info;
+	struct i2c_adapter *adapter = temp_client->adapter;
+	int addr = temp_client->addr;
+	int err;
+
+	/* Only report broken addresses, busy addresses are no error */
+	err = i2c_scan_for_client(adapter, addr, i2c_default_probe);
+	if (err < 0)
+		return err == -EINVAL ? -EINVAL : 0;
 
 	/* Finally call the custom detection function */
 	memset(&info, 0, sizeof(struct i2c_board_info));
@@ -2232,26 +2242,9 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
 	if (!probe)
 		probe = i2c_default_probe;
 
-	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
-		/* Check address validity */
-		if (i2c_check_7bit_addr_validity_strict(addr_list[i]) < 0) {
-			dev_warn(&adap->dev, "Invalid 7-bit address 0x%02x\n",
-				 addr_list[i]);
-			continue;
-		}
-
-		/* Check address availability (7 bit, no need to encode flags) */
-		if (i2c_check_addr_busy(adap, addr_list[i])) {
-			dev_dbg(&adap->dev,
-				"Address 0x%02x already in use, not probing\n",
-				addr_list[i]);
-			continue;
-		}
-
-		/* Test address responsiveness */
-		if (probe(adap, addr_list[i]))
+	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++)
+		if (i2c_scan_for_client(adap, addr_list[i], probe) == 0)
 			break;
-	}
 
 	if (addr_list[i] == I2C_CLIENT_END) {
 		dev_dbg(&adap->dev, "Probing failed, no device found\n");
-- 
2.20.1

