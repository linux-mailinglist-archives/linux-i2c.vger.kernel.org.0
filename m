Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D77A139B1B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 22:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgAMVG4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 16:06:56 -0500
Received: from sauhun.de ([88.99.104.3]:42072 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgAMVG4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 16:06:56 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id 37A4E2C0706;
        Mon, 13 Jan 2020 22:06:54 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2c: parport: move include file into main source
Date:   Mon, 13 Jan 2020 22:06:43 +0100
Message-Id: <20200113210643.5033-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After removal of the parport-light driver, this include is used by the
parport driver exclusively and can be included in the main source.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-parport.c | 100 ++++++++++++++++++++++++++++-
 drivers/i2c/busses/i2c-parport.h | 106 -------------------------------
 2 files changed, 99 insertions(+), 107 deletions(-)
 delete mode 100644 drivers/i2c/busses/i2c-parport.h

diff --git a/drivers/i2c/busses/i2c-parport.c b/drivers/i2c/busses/i2c-parport.c
index e8ed882de402..d03d22812eef 100644
--- a/drivers/i2c/busses/i2c-parport.c
+++ b/drivers/i2c/busses/i2c-parport.c
@@ -25,7 +25,90 @@
 #include <linux/slab.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
-#include "i2c-parport.h"
+
+#define PORT_DATA	0
+#define PORT_STAT	1
+#define PORT_CTRL	2
+
+struct lineop {
+	u8 val;
+	u8 port;
+	u8 inverted;
+};
+
+struct adapter_parm {
+	struct lineop setsda;
+	struct lineop setscl;
+	struct lineop getsda;
+	struct lineop getscl;
+	struct lineop init;
+	unsigned int smbus_alert:1;
+};
+
+static const struct adapter_parm adapter_parm[] = {
+	/* type 0: Philips adapter */
+	{
+		.setsda	= { 0x80, PORT_DATA, 1 },
+		.setscl	= { 0x08, PORT_CTRL, 0 },
+		.getsda	= { 0x80, PORT_STAT, 0 },
+		.getscl	= { 0x08, PORT_STAT, 0 },
+	},
+	/* type 1: home brew teletext adapter */
+	{
+		.setsda	= { 0x02, PORT_DATA, 0 },
+		.setscl	= { 0x01, PORT_DATA, 0 },
+		.getsda	= { 0x80, PORT_STAT, 1 },
+	},
+	/* type 2: Velleman K8000 adapter */
+	{
+		.setsda	= { 0x02, PORT_CTRL, 1 },
+		.setscl	= { 0x08, PORT_CTRL, 1 },
+		.getsda	= { 0x10, PORT_STAT, 0 },
+	},
+	/* type 3: ELV adapter */
+	{
+		.setsda	= { 0x02, PORT_DATA, 1 },
+		.setscl	= { 0x01, PORT_DATA, 1 },
+		.getsda	= { 0x40, PORT_STAT, 1 },
+		.getscl	= { 0x08, PORT_STAT, 1 },
+	},
+	/* type 4: ADM1032 evaluation board */
+	{
+		.setsda	= { 0x02, PORT_DATA, 1 },
+		.setscl	= { 0x01, PORT_DATA, 1 },
+		.getsda	= { 0x10, PORT_STAT, 1 },
+		.init	= { 0xf0, PORT_DATA, 0 },
+		.smbus_alert = 1,
+	},
+	/* type 5: ADM1025, ADM1030 and ADM1031 evaluation boards */
+	{
+		.setsda	= { 0x02, PORT_DATA, 1 },
+		.setscl	= { 0x01, PORT_DATA, 1 },
+		.getsda	= { 0x10, PORT_STAT, 1 },
+	},
+	/* type 6: Barco LPT->DVI (K5800236) adapter */
+	{
+		.setsda	= { 0x02, PORT_DATA, 1 },
+		.setscl	= { 0x01, PORT_DATA, 1 },
+		.getsda	= { 0x20, PORT_STAT, 0 },
+		.getscl	= { 0x40, PORT_STAT, 0 },
+		.init	= { 0xfc, PORT_DATA, 0 },
+	},
+	/* type 7: One For All JP1 parallel port adapter */
+	{
+		.setsda	= { 0x01, PORT_DATA, 0 },
+		.setscl	= { 0x02, PORT_DATA, 0 },
+		.getsda	= { 0x80, PORT_STAT, 1 },
+		.init	= { 0x04, PORT_DATA, 1 },
+	},
+	/* type 8: VCT-jig */
+	{
+		.setsda	= { 0x04, PORT_DATA, 1 },
+		.setscl	= { 0x01, PORT_DATA, 1 },
+		.getsda	= { 0x40, PORT_STAT, 0 },
+		.getscl	= { 0x80, PORT_STAT, 1 },
+	},
+};
 
 /* ----- Device list ------------------------------------------------------ */
 
@@ -42,6 +125,7 @@ static LIST_HEAD(adapter_list);
 static DEFINE_MUTEX(adapter_list_lock);
 #define MAX_DEVICE 4
 static int parport[MAX_DEVICE] = {0, -1, -1, -1};
+static int type = -1;
 
 
 /* ----- Low-level parallel port access ----------------------------------- */
@@ -318,5 +402,19 @@ MODULE_PARM_DESC(parport,
 		 " Default is one device connected to parport0.\n"
 );
 
+module_param(type, int, 0);
+MODULE_PARM_DESC(type,
+	"Type of adapter:\n"
+	" 0 = Philips adapter\n"
+	" 1 = home brew teletext adapter\n"
+	" 2 = Velleman K8000 adapter\n"
+	" 3 = ELV adapter\n"
+	" 4 = ADM1032 evaluation board\n"
+	" 5 = ADM1025, ADM1030 and ADM1031 evaluation boards\n"
+	" 6 = Barco LPT->DVI (K5800236) adapter\n"
+	" 7 = One For All JP1 parallel port adapter\n"
+	" 8 = VCT-jig\n"
+);
+
 module_init(i2c_parport_init);
 module_exit(i2c_parport_exit);
diff --git a/drivers/i2c/busses/i2c-parport.h b/drivers/i2c/busses/i2c-parport.h
deleted file mode 100644
index 3b32d92b1264..000000000000
--- a/drivers/i2c/busses/i2c-parport.h
+++ /dev/null
@@ -1,106 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/* ------------------------------------------------------------------------ *
- * i2c-parport.h I2C bus over parallel port                                 *
- * ------------------------------------------------------------------------ *
-   Copyright (C) 2003-2010 Jean Delvare <jdelvare@suse.de>
-
- * ------------------------------------------------------------------------ */
-
-#define PORT_DATA	0
-#define PORT_STAT	1
-#define PORT_CTRL	2
-
-struct lineop {
-	u8 val;
-	u8 port;
-	u8 inverted;
-};
-
-struct adapter_parm {
-	struct lineop setsda;
-	struct lineop setscl;
-	struct lineop getsda;
-	struct lineop getscl;
-	struct lineop init;
-	unsigned int smbus_alert:1;
-};
-
-static const struct adapter_parm adapter_parm[] = {
-	/* type 0: Philips adapter */
-	{
-		.setsda	= { 0x80, PORT_DATA, 1 },
-		.setscl	= { 0x08, PORT_CTRL, 0 },
-		.getsda	= { 0x80, PORT_STAT, 0 },
-		.getscl	= { 0x08, PORT_STAT, 0 },
-	},
-	/* type 1: home brew teletext adapter */
-	{
-		.setsda	= { 0x02, PORT_DATA, 0 },
-		.setscl	= { 0x01, PORT_DATA, 0 },
-		.getsda	= { 0x80, PORT_STAT, 1 },
-	},
-	/* type 2: Velleman K8000 adapter */
-	{
-		.setsda	= { 0x02, PORT_CTRL, 1 },
-		.setscl	= { 0x08, PORT_CTRL, 1 },
-		.getsda	= { 0x10, PORT_STAT, 0 },
-	},
-	/* type 3: ELV adapter */
-	{
-		.setsda	= { 0x02, PORT_DATA, 1 },
-		.setscl	= { 0x01, PORT_DATA, 1 },
-		.getsda	= { 0x40, PORT_STAT, 1 },
-		.getscl	= { 0x08, PORT_STAT, 1 },
-	},
-	/* type 4: ADM1032 evaluation board */
-	{
-		.setsda	= { 0x02, PORT_DATA, 1 },
-		.setscl	= { 0x01, PORT_DATA, 1 },
-		.getsda	= { 0x10, PORT_STAT, 1 },
-		.init	= { 0xf0, PORT_DATA, 0 },
-		.smbus_alert = 1,
-	},
-	/* type 5: ADM1025, ADM1030 and ADM1031 evaluation boards */
-	{
-		.setsda	= { 0x02, PORT_DATA, 1 },
-		.setscl	= { 0x01, PORT_DATA, 1 },
-		.getsda	= { 0x10, PORT_STAT, 1 },
-	},
-	/* type 6: Barco LPT->DVI (K5800236) adapter */
-	{
-		.setsda	= { 0x02, PORT_DATA, 1 },
-		.setscl	= { 0x01, PORT_DATA, 1 },
-		.getsda	= { 0x20, PORT_STAT, 0 },
-		.getscl	= { 0x40, PORT_STAT, 0 },
-		.init	= { 0xfc, PORT_DATA, 0 },
-	},
-	/* type 7: One For All JP1 parallel port adapter */
-	{
-		.setsda	= { 0x01, PORT_DATA, 0 },
-		.setscl	= { 0x02, PORT_DATA, 0 },
-		.getsda	= { 0x80, PORT_STAT, 1 },
-		.init	= { 0x04, PORT_DATA, 1 },
-	},
-	/* type 8: VCT-jig */
-	{
-		.setsda	= { 0x04, PORT_DATA, 1 },
-		.setscl	= { 0x01, PORT_DATA, 1 },
-		.getsda	= { 0x40, PORT_STAT, 0 },
-		.getscl	= { 0x80, PORT_STAT, 1 },
-	},
-};
-
-static int type = -1;
-module_param(type, int, 0);
-MODULE_PARM_DESC(type,
-	"Type of adapter:\n"
-	" 0 = Philips adapter\n"
-	" 1 = home brew teletext adapter\n"
-	" 2 = Velleman K8000 adapter\n"
-	" 3 = ELV adapter\n"
-	" 4 = ADM1032 evaluation board\n"
-	" 5 = ADM1025, ADM1030 and ADM1031 evaluation boards\n"
-	" 6 = Barco LPT->DVI (K5800236) adapter\n"
-	" 7 = One For All JP1 parallel port adapter\n"
-	" 8 = VCT-jig\n"
-);
-- 
2.20.1

