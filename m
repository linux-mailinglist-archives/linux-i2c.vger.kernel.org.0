Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEC232ABA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 10:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfFCIZs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 04:25:48 -0400
Received: from sauhun.de ([88.99.104.3]:35888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfFCIZs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 04:25:48 -0400
Received: from localhost (unknown [88.128.80.57])
        by pokefinder.org (Postfix) with ESMTPSA id B9AC52CF690;
        Mon,  3 Jun 2019 10:25:45 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 4/5] i2c: headers: update docs about I2C_CLIENT_*
Date:   Mon,  3 Jun 2019 10:25:34 +0200
Message-Id: <20190603082535.1566-5-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190603082535.1566-1-wsa@the-dreams.de>
References: <20190603082535.1566-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update kerneldoc for i2c client flags because they increased over time.
Also, move them to a position where they can be more easily found.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 include/linux/i2c.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 14e04fb4f46f..9853fae9b505 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -298,8 +298,7 @@ struct i2c_driver {
 
 /**
  * struct i2c_client - represent an I2C slave device
- * @flags: I2C_CLIENT_TEN indicates the device uses a ten bit chip address;
- *	I2C_CLIENT_PEC indicates it uses SMBus Packet Error Checking
+ * @flags: see I2C_CLIENT_* for possible flags
  * @addr: Address used on the I2C bus connected to the parent adapter.
  * @name: Indicates the type of the device, usually a chip name that's
  *	generic enough to hide second-sourcing and compatible revisions.
@@ -317,6 +316,15 @@ struct i2c_driver {
  */
 struct i2c_client {
 	unsigned short flags;		/* div., see below		*/
+#define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
+#define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */
+					/* Must equal I2C_M_TEN below */
+#define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
+#define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
+#define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
+#define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
+					/* Must match I2C_M_STOP|IGNORE_NAK */
+
 	unsigned short addr;		/* chip address - NOTE: 7bit	*/
 					/* addresses are stored in the	*/
 					/* _LOWER_ 7 bits		*/
@@ -803,16 +811,6 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
 }
 
-/*flags for the client struct: */
-#define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
-#define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */
-					/* Must equal I2C_M_TEN below */
-#define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
-#define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
-#define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
-#define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
-					/* Must match I2C_M_STOP|IGNORE_NAK */
-
 /* i2c adapter classes (bitmask) */
 #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
 #define I2C_CLASS_DDC		(1<<3)	/* DDC bus on graphics adapters */
-- 
2.19.1

