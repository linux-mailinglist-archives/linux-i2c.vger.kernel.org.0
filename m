Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F001234CE2C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbhC2KvO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:51:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:49552 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231493AbhC2Kux (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 06:50:53 -0400
IronPort-SDR: qbuD+4hGdLs5iZNt34LhHPSFw+1NYqOFnJaKvEYAv9NEN+KHCLVq98SKHnSZqo05kgvWXWezBw
 MQapzND6bHgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="178653637"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="178653637"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 03:50:38 -0700
IronPort-SDR: vX1a2AQ5RnfXE6Zt00uYEGsu2SUx1wC+iirbEZ3+0pwRzK6yt8Bc99g4YPUYYM4Z/9oXEaEv6K
 oOcbElDOj9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515955830"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 03:50:36 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/12] ARM: davinci: Constify the software nodes
Date:   Mon, 29 Mar 2021 13:50:37 +0300
Message-Id: <20210329105047.51033-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional device properties are always just a part of a
software fwnode. If the device properties are constant, the
software node can also be constant.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da830-evm.c    | 6 +++++-
 arch/arm/mach-davinci/board-dm365-evm.c    | 6 +++++-
 arch/arm/mach-davinci/board-dm644x-evm.c   | 6 +++++-
 arch/arm/mach-davinci/board-dm646x-evm.c   | 6 +++++-
 arch/arm/mach-davinci/board-mityomapl138.c | 6 +++++-
 arch/arm/mach-davinci/board-sffsdr.c       | 6 +++++-
 6 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index a20ba12d876c6..823c9cc98f18b 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -454,6 +454,10 @@ static const struct property_entry da830_evm_i2c_eeprom_properties[] = {
 	{ }
 };
 
+static const struct software_node da830_evm_i2c_eeprom_node = {
+	.properties = da830_evm_i2c_eeprom_properties,
+};
+
 static int __init da830_evm_ui_expander_setup(struct i2c_client *client,
 		int gpio, unsigned ngpio, void *context)
 {
@@ -485,7 +489,7 @@ static struct pcf857x_platform_data __initdata da830_evm_ui_expander_info = {
 static struct i2c_board_info __initdata da830_evm_i2c_devices[] = {
 	{
 		I2C_BOARD_INFO("24c256", 0x50),
-		.properties = da830_evm_i2c_eeprom_properties,
+		.swnode = &da830_evm_i2c_eeprom_node,
 	},
 	{
 		I2C_BOARD_INFO("tlv320aic3x", 0x18),
diff --git a/arch/arm/mach-davinci/board-dm365-evm.c b/arch/arm/mach-davinci/board-dm365-evm.c
index bdf31eb776204..b3bef74c982a3 100644
--- a/arch/arm/mach-davinci/board-dm365-evm.c
+++ b/arch/arm/mach-davinci/board-dm365-evm.c
@@ -232,10 +232,14 @@ static const struct property_entry eeprom_properties[] = {
 	{ }
 };
 
+static const struct software_node eeprom_node = {
+	.properties = eeprom_properties,
+};
+
 static struct i2c_board_info i2c_info[] = {
 	{
 		I2C_BOARD_INFO("24c256", 0x50),
-		.properties = eeprom_properties,
+		.swnode = &eeprom_node,
 	},
 	{
 		I2C_BOARD_INFO("tlv320aic3x", 0x18),
diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index 7755cccec550c..cce3a621eb20b 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -541,6 +541,10 @@ static const struct property_entry eeprom_properties[] = {
 	{ }
 };
 
+static const struct software_node eeprom_node = {
+	.properties = eeprom_properties,
+};
+
 /*
  * MSP430 supports RTC, card detection, input from IR remote, and
  * a bit more.  It triggers interrupts on GPIO(7) from pressing
@@ -647,7 +651,7 @@ static struct i2c_board_info __initdata i2c_info[] =  {
 	},
 	{
 		I2C_BOARD_INFO("24c256", 0x50),
-		.properties = eeprom_properties,
+		.swnode = &eeprom_node,
 	},
 	{
 		I2C_BOARD_INFO("tlv320aic33", 0x1b),
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 952ddabc743e0..ee91d81ebbfdf 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -362,6 +362,10 @@ static const struct property_entry eeprom_properties[] = {
 	PROPERTY_ENTRY_U32("pagesize", 64),
 	{ }
 };
+
+static const struct software_node eeprom_node = {
+	.properties = eeprom_properties,
+};
 #endif
 
 static u8 dm646x_iis_serializer_direction[] = {
@@ -430,7 +434,7 @@ static void evm_init_cpld(void)
 static struct i2c_board_info __initdata i2c_info[] =  {
 	{
 		I2C_BOARD_INFO("24c256", 0x50),
-		.properties  = eeprom_properties,
+		.swnode = &eeprom_node,
 	},
 	{
 		I2C_BOARD_INFO("pcf8574a", 0x38),
diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index 5205008c8061b..2127969beb965 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -197,6 +197,10 @@ static const struct property_entry mityomapl138_fd_chip_properties[] = {
 	{ }
 };
 
+static const struct software_node mityomapl138_fd_chip_node = {
+	.properties = mityomapl138_fd_chip_properties,
+};
+
 static struct davinci_i2c_platform_data mityomap_i2c_0_pdata = {
 	.bus_freq	= 100,	/* kHz */
 	.bus_delay	= 0,	/* usec */
@@ -323,7 +327,7 @@ static struct i2c_board_info __initdata mityomap_tps65023_info[] = {
 	},
 	{
 		I2C_BOARD_INFO("24c02", 0x50),
-		.properties = mityomapl138_fd_chip_properties,
+		.swnode = &mityomapl138_fd_chip_node,
 	},
 };
 
diff --git a/arch/arm/mach-davinci/board-sffsdr.c b/arch/arm/mach-davinci/board-sffsdr.c
index 79b47958e9926..6930b2f485d19 100644
--- a/arch/arm/mach-davinci/board-sffsdr.c
+++ b/arch/arm/mach-davinci/board-sffsdr.c
@@ -84,10 +84,14 @@ static const struct property_entry eeprom_properties[] = {
 	{ }
 };
 
+static const struct software_node eeprom_node = {
+	.properties = eeprom_properties,
+};
+
 static struct i2c_board_info __initdata i2c_info[] =  {
 	{
 		I2C_BOARD_INFO("24c64", 0x50),
-		.properties = eeprom_properties,
+		.swnode = &eeprom_node,
 	},
 	/* Other I2C devices:
 	 * MSP430,  addr 0x23 (not used)
-- 
2.30.2

