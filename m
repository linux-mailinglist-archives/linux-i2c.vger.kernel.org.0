Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675946C1499
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 15:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjCTOXh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 10:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjCTOXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 10:23:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547385FFD;
        Mon, 20 Mar 2023 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679322212; x=1710858212;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GyIwjb/f7Dy0RuF08G24M0jAm1JlunezL8wxuTfOAGE=;
  b=RrJLptEbQbkrpWkAb5YOzeYI/txe1S0Ij9k9Q1W08AGr42GRuTpwZBuj
   dFEJyMjnIqPM/B+zwsKAfb2+80Htd90iSCgM918Y/ie3bAzYzwBIAhq4r
   sFOtdBd9km38z8x2WPtVd1uw9cD4sJH0aiuIu6JNW0/FvpoOSzTdnhmMN
   l8eFsIXXSiP3zkA+jnZBzo1GPShZYwqxK2xzkGm809ezWUsbifxINlgl4
   ptO5HXmEIX1L9qX/g1WDta4pLZoSs+TtUwDTEbbemYDnSYmezwDjvyE3a
   vdl5CgBu3AV+YioKYHJAIzHj/sAHY5pYkC/HS/DEgj5FAv9ExJJYnG+sM
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="scan'208";a="142937026"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 07:23:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:23:13 -0700
Received: from CHE-LT-UNGSOFTWARE.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 07:23:11 -0700
From:   Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <wsa@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <UNGLinuxDriver@microchip.com>
Subject: [PATCH v1 i2c-master] i2c: microchip: pci1xxxx: Update Timing registers
Date:   Mon, 20 Mar 2023 19:52:37 +0530
Message-ID: <20230320142237.3091224-1-tharunkumar.pasumarthi@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update I2C timing registers based on latest hardware design.
This fix does not break functionality of chips with older design and
existing users will not be affected.

Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch")
Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
---
v0 -> v1:
- Update commit description as per review comments
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 60 +++++++++++++-------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index 09af75921147..b21ffd6df927 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -48,9 +48,9 @@
  * SR_HOLD_TIME_XK_TICKS field will indicate the number of ticks of the
  * baud clock required to program 'Hold Time' at X KHz.
  */
-#define SR_HOLD_TIME_100K_TICKS	133
-#define SR_HOLD_TIME_400K_TICKS	20
-#define SR_HOLD_TIME_1000K_TICKS	11
+#define SR_HOLD_TIME_100K_TICKS		150
+#define SR_HOLD_TIME_400K_TICKS		20
+#define SR_HOLD_TIME_1000K_TICKS	12
 
 #define SMB_CORE_COMPLETION_REG_OFF3	(SMBUS_MAST_CORE_ADDR_BASE + 0x23)
 
@@ -65,17 +65,17 @@
  * the baud clock required to program 'fair idle delay' at X KHz. Fair idle
  * delay establishes the MCTP T(IDLE_DELAY) period.
  */
-#define FAIR_BUS_IDLE_MIN_100K_TICKS		969
-#define FAIR_BUS_IDLE_MIN_400K_TICKS		157
-#define FAIR_BUS_IDLE_MIN_1000K_TICKS		157
+#define FAIR_BUS_IDLE_MIN_100K_TICKS		992
+#define FAIR_BUS_IDLE_MIN_400K_TICKS		500
+#define FAIR_BUS_IDLE_MIN_1000K_TICKS		500
 
 /*
  * FAIR_IDLE_DELAY_XK_TICKS field will indicate the number of ticks of the
  * baud clock required to satisfy the fairness protocol at X KHz.
  */
-#define FAIR_IDLE_DELAY_100K_TICKS	1000
-#define FAIR_IDLE_DELAY_400K_TICKS	500
-#define FAIR_IDLE_DELAY_1000K_TICKS	500
+#define FAIR_IDLE_DELAY_100K_TICKS	963
+#define FAIR_IDLE_DELAY_400K_TICKS	156
+#define FAIR_IDLE_DELAY_1000K_TICKS	156
 
 #define SMB_IDLE_SCALING_100K		\
 	((FAIR_IDLE_DELAY_100K_TICKS << 16) | FAIR_BUS_IDLE_MIN_100K_TICKS)
@@ -105,7 +105,7 @@
  */
 #define BUS_CLK_100K_LOW_PERIOD_TICKS		156
 #define BUS_CLK_400K_LOW_PERIOD_TICKS		41
-#define BUS_CLK_1000K_LOW_PERIOD_TICKS	15
+#define BUS_CLK_1000K_LOW_PERIOD_TICKS		15
 
 /*
  * BUS_CLK_XK_HIGH_PERIOD_TICKS field defines the number of I2C Baud Clock
@@ -131,7 +131,7 @@
  */
 #define CLK_SYNC_100K			4
 #define CLK_SYNC_400K			4
-#define CLK_SYNC_1000K		4
+#define CLK_SYNC_1000K			4
 
 #define SMB_CORE_DATA_TIMING_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x40)
 
@@ -142,25 +142,25 @@
  * determines the SCLK hold time following SDAT driven low during the first
  * START bit in a transfer.
  */
-#define FIRST_START_HOLD_100K_TICKS	22
-#define FIRST_START_HOLD_400K_TICKS	16
-#define FIRST_START_HOLD_1000K_TICKS	6
+#define FIRST_START_HOLD_100K_TICKS	23
+#define FIRST_START_HOLD_400K_TICKS	8
+#define FIRST_START_HOLD_1000K_TICKS	12
 
 /*
  * STOP_SETUP_XK_TICKS will indicate the number of ticks of the baud clock
  * required to program 'STOP_SETUP' timer at X KHz. This timer determines the
  * SDAT setup time from the rising edge of SCLK for a STOP condition.
  */
-#define STOP_SETUP_100K_TICKS		157
+#define STOP_SETUP_100K_TICKS		150
 #define STOP_SETUP_400K_TICKS		20
-#define STOP_SETUP_1000K_TICKS	12
+#define STOP_SETUP_1000K_TICKS		12
 
 /*
  * RESTART_SETUP_XK_TICKS will indicate the number of ticks of the baud clock
  * required to program 'RESTART_SETUP' timer at X KHz. This timer determines the
  * SDAT setup time from the rising edge of SCLK for a repeated START condition.
  */
-#define RESTART_SETUP_100K_TICKS	157
+#define RESTART_SETUP_100K_TICKS	156
 #define RESTART_SETUP_400K_TICKS	20
 #define RESTART_SETUP_1000K_TICKS	12
 
@@ -169,7 +169,7 @@
  * required to program 'DATA_HOLD' timer at X KHz. This timer determines the
  * SDAT hold time following SCLK driven low.
  */
-#define DATA_HOLD_100K_TICKS		2
+#define DATA_HOLD_100K_TICKS		12
 #define DATA_HOLD_400K_TICKS		2
 #define DATA_HOLD_1000K_TICKS		2
 
@@ -190,35 +190,35 @@
  * Bus Idle Minimum time = BUS_IDLE_MIN[7:0] x Baud_Clock_Period x
  * (BUS_IDLE_MIN_XK_TICKS[7] ? 4,1)
  */
-#define BUS_IDLE_MIN_100K_TICKS		167UL
-#define BUS_IDLE_MIN_400K_TICKS		139UL
-#define BUS_IDLE_MIN_1000K_TICKS		133UL
+#define BUS_IDLE_MIN_100K_TICKS		36UL
+#define BUS_IDLE_MIN_400K_TICKS		10UL
+#define BUS_IDLE_MIN_1000K_TICKS	4UL
 
 /*
  * CTRL_CUM_TIME_OUT_XK_TICKS defines SMBus Controller Cumulative Time-Out.
  * SMBus Controller Cumulative Time-Out duration =
  * CTRL_CUM_TIME_OUT_XK_TICKS[7:0] x Baud_Clock_Period x 2048
  */
-#define CTRL_CUM_TIME_OUT_100K_TICKS		159
-#define CTRL_CUM_TIME_OUT_400K_TICKS		159
-#define CTRL_CUM_TIME_OUT_1000K_TICKS		159
+#define CTRL_CUM_TIME_OUT_100K_TICKS		76
+#define CTRL_CUM_TIME_OUT_400K_TICKS		76
+#define CTRL_CUM_TIME_OUT_1000K_TICKS		76
 
 /*
  * TARGET_CUM_TIME_OUT_XK_TICKS defines SMBus Target Cumulative Time-Out duration.
  * SMBus Target Cumulative Time-Out duration = TARGET_CUM_TIME_OUT_XK_TICKS[7:0] x
  * Baud_Clock_Period x 4096
  */
-#define TARGET_CUM_TIME_OUT_100K_TICKS	199
-#define TARGET_CUM_TIME_OUT_400K_TICKS	199
-#define TARGET_CUM_TIME_OUT_1000K_TICKS	199
+#define TARGET_CUM_TIME_OUT_100K_TICKS	95
+#define TARGET_CUM_TIME_OUT_400K_TICKS	95
+#define TARGET_CUM_TIME_OUT_1000K_TICKS	95
 
 /*
  * CLOCK_HIGH_TIME_OUT_XK defines Clock High time out period.
  * Clock High time out period = CLOCK_HIGH_TIME_OUT_XK[7:0] x Baud_Clock_Period x 8
  */
-#define CLOCK_HIGH_TIME_OUT_100K_TICKS	204
-#define CLOCK_HIGH_TIME_OUT_400K_TICKS	204
-#define CLOCK_HIGH_TIME_OUT_1000K_TICKS	204
+#define CLOCK_HIGH_TIME_OUT_100K_TICKS	97
+#define CLOCK_HIGH_TIME_OUT_400K_TICKS	97
+#define CLOCK_HIGH_TIME_OUT_1000K_TICKS	97
 
 #define TO_SCALING_100K		\
 	((BUS_IDLE_MIN_100K_TICKS << 24) | (CTRL_CUM_TIME_OUT_100K_TICKS << 16) | \
-- 
2.25.1

