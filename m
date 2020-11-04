Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C3E2A7018
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 23:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732052AbgKDWCl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 17:02:41 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:5083 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731198AbgKDWCf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Nov 2020 17:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604527354; x=1636063354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GNGAiShu/8brycAcsYXEC6wJgzf/foiuvxYEUaQxlh8=;
  b=DTJJb0ojDaPxeQPltrO4mgZlfyoprJQb/DLX/bJE9xn2nBawpH/nrE3y
   Zm63/wQGkxgemst6yXdaut+/CaIhBSoyqz8DW0zVXIQKngGfwJd2wPC4y
   6xLqvYm8odmj5yrKl7iyWNirniuZ/1J06JaEb3BPUsnvYmfaTeyCzhPdJ
   khShK2Gf9rtF2CE0gZIig2KFgPRSrDCnshy8c897qJvISqs2RVH32uwkI
   psrxTIVDLrgiblc8umgnBQSmpt6DoYGlkIww4oDfL8mXPsYYG9IUy4y9d
   jNI+GAjiFTf2KX9CFtycLE5wCuq6LDPPk3NhmLJwxisugosASmpxY3YGr
   A==;
IronPort-SDR: S9qNVmM+hchmvZ+/mJO8y9EB+5GGlk2QLrVa7s3yygptQ1IskvsXHWJFN4k47pGysJYU2+UQqt
 0dQsftMJbVKNW07z31zZsUGSxdAg9Y2yHFsqxbFGoef8/5/IHMgc/PNR4nPGaHH9OfRZ8Htjn3
 1PQ6P7EDG7xErdrAICryC++FvgYNkkgBAVO5VfBqtZmaC4iphL06Cg9217kMMltVUBDozx9G18
 4bgbjeleOnRC2IBDQYNDE+lgRYVnf/c2lwHT7DVmzo0UnsRCoE04BbcXp+MnCMXyQfN6NHVgYX
 wX4=
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="32465680"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2020 15:02:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 4 Nov 2020 15:02:33 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 4 Nov 2020 15:02:31 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
        UNGLinuxDriver <UNGLinuxDriver@microchip.com>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        <linux-i2c@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] HID: mcp2221: Fix GPIO output handling
Date:   Wed, 4 Nov 2020 23:02:23 +0100
Message-ID: <20201104220223.293253-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The mcp2221 driver GPIO output handling has has several issues.

* A wrong value is used for the GPIO direction.

* Wrong offsets are calculated for some GPIO set value/set direction
  operations, when offset is larger than 0.

This has been fixed by introducing proper manifest constants for the
direction encoding, and using 'offsetof' when calculating GPIO
register offsets.

The updated driver has been tested with the Sparx5 pcb134/pcb135
board, which has the mcp2221 device with several (output) GPIO's.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/hid/hid-mcp2221.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 0d27ccb55dd9..4211b9839209 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -49,6 +49,36 @@ enum {
 	MCP2221_ALT_F_NOT_GPIOD = 0xEF,
 };
 
+/* MCP GPIO direction encoding */
+enum {
+	MCP2221_DIR_OUT = 0x00,
+	MCP2221_DIR_IN = 0x01,
+};
+
+#define MCP_NGPIO	4
+
+/* MCP GPIO set command layout */
+struct mcp_set_gpio {
+	u8 cmd;
+	u8 dummy;
+	struct {
+		u8 change_value;
+		u8 value;
+		u8 change_direction;
+		u8 direction;
+	} gpio[MCP_NGPIO];
+} __packed;
+
+/* MCP GPIO get command layout */
+struct mcp_get_gpio {
+	u8 cmd;
+	u8 dummy;
+	struct {
+		u8 direction;
+		u8 value;
+	} gpio[MCP_NGPIO];
+} __packed;
+
 /*
  * There is no way to distinguish responses. Therefore next command
  * is sent only after response to previous has been received. Mutex
@@ -542,7 +572,7 @@ static int mcp_gpio_get(struct gpio_chip *gc,
 
 	mcp->txbuf[0] = MCP2221_GPIO_GET;
 
-	mcp->gp_idx = (offset + 1) * 2;
+	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].value);
 
 	mutex_lock(&mcp->lock);
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
@@ -559,7 +589,7 @@ static void mcp_gpio_set(struct gpio_chip *gc,
 	memset(mcp->txbuf, 0, 18);
 	mcp->txbuf[0] = MCP2221_GPIO_SET;
 
-	mcp->gp_idx = ((offset + 1) * 4) - 1;
+	mcp->gp_idx = offsetof(struct mcp_set_gpio, gpio[offset].value);
 
 	mcp->txbuf[mcp->gp_idx - 1] = 1;
 	mcp->txbuf[mcp->gp_idx] = !!value;
@@ -575,7 +605,7 @@ static int mcp_gpio_dir_set(struct mcp2221 *mcp,
 	memset(mcp->txbuf, 0, 18);
 	mcp->txbuf[0] = MCP2221_GPIO_SET;
 
-	mcp->gp_idx = (offset + 1) * 5;
+	mcp->gp_idx = offsetof(struct mcp_set_gpio, gpio[offset].direction);
 
 	mcp->txbuf[mcp->gp_idx - 1] = 1;
 	mcp->txbuf[mcp->gp_idx] = val;
@@ -590,7 +620,7 @@ static int mcp_gpio_direction_input(struct gpio_chip *gc,
 	struct mcp2221 *mcp = gpiochip_get_data(gc);
 
 	mutex_lock(&mcp->lock);
-	ret = mcp_gpio_dir_set(mcp, offset, 0);
+	ret = mcp_gpio_dir_set(mcp, offset, MCP2221_DIR_IN);
 	mutex_unlock(&mcp->lock);
 
 	return ret;
@@ -603,7 +633,7 @@ static int mcp_gpio_direction_output(struct gpio_chip *gc,
 	struct mcp2221 *mcp = gpiochip_get_data(gc);
 
 	mutex_lock(&mcp->lock);
-	ret = mcp_gpio_dir_set(mcp, offset, 1);
+	ret = mcp_gpio_dir_set(mcp, offset, MCP2221_DIR_OUT);
 	mutex_unlock(&mcp->lock);
 
 	/* Can't configure as output, bailout early */
@@ -623,7 +653,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
 
 	mcp->txbuf[0] = MCP2221_GPIO_GET;
 
-	mcp->gp_idx = (offset + 1) * 2;
+	mcp->gp_idx = offsetof(struct mcp_get_gpio, gpio[offset].direction);
 
 	mutex_lock(&mcp->lock);
 	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
@@ -632,7 +662,7 @@ static int mcp_gpio_get_direction(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	if (mcp->gpio_dir)
+	if (mcp->gpio_dir == MCP2221_DIR_IN)
 		return GPIO_LINE_DIRECTION_IN;
 
 	return GPIO_LINE_DIRECTION_OUT;
@@ -758,7 +788,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 				mcp->status = -ENOENT;
 			} else {
 				mcp->status = !!data[mcp->gp_idx];
-				mcp->gpio_dir = !!data[mcp->gp_idx + 1];
+				mcp->gpio_dir = data[mcp->gp_idx + 1];
 			}
 			break;
 		default:
@@ -860,7 +890,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->get_direction = mcp_gpio_get_direction;
 	mcp->gc->set = mcp_gpio_set;
 	mcp->gc->get = mcp_gpio_get;
-	mcp->gc->ngpio = 4;
+	mcp->gc->ngpio = MCP_NGPIO;
 	mcp->gc->base = -1;
 	mcp->gc->can_sleep = 1;
 	mcp->gc->parent = &hdev->dev;
-- 
2.25.1

