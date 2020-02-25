Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62DB116C100
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 13:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbgBYMiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 07:38:17 -0500
Received: from mga11.intel.com ([192.55.52.93]:34255 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgBYMiG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 07:38:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 04:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="260681181"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2020 04:38:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3B28B3C0; Tue, 25 Feb 2020 14:38:02 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] watchdog: iTCO_wdt: Export vendorsupport
Date:   Tue, 25 Feb 2020 15:38:00 +0300
Message-Id: <20200225123802.88984-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for making ->smi_res optional the iTCO_wdt driver needs
to know whether vendorsupport is being set to non-zero. For this reason
export the variable.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/watchdog/iTCO_vendor.h         |  2 ++
 drivers/watchdog/iTCO_vendor_support.c | 16 +++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/iTCO_vendor.h b/drivers/watchdog/iTCO_vendor.h
index 0f7373ba10d5..69e92e692ae0 100644
--- a/drivers/watchdog/iTCO_vendor.h
+++ b/drivers/watchdog/iTCO_vendor.h
@@ -1,10 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* iTCO Vendor Specific Support hooks */
 #ifdef CONFIG_ITCO_VENDOR_SUPPORT
+extern int iTCO_vendorsupport;
 extern void iTCO_vendor_pre_start(struct resource *, unsigned int);
 extern void iTCO_vendor_pre_stop(struct resource *);
 extern int iTCO_vendor_check_noreboot_on(void);
 #else
+#define iTCO_vendorsupport				0
 #define iTCO_vendor_pre_start(acpibase, heartbeat)	{}
 #define iTCO_vendor_pre_stop(acpibase)			{}
 #define iTCO_vendor_check_noreboot_on()			1
diff --git a/drivers/watchdog/iTCO_vendor_support.c b/drivers/watchdog/iTCO_vendor_support.c
index 4f1b96f59349..cf0eaa04b064 100644
--- a/drivers/watchdog/iTCO_vendor_support.c
+++ b/drivers/watchdog/iTCO_vendor_support.c
@@ -39,8 +39,10 @@
 /* Broken BIOS */
 #define BROKEN_BIOS		911
 
-static int vendorsupport;
-module_param(vendorsupport, int, 0);
+int iTCO_vendorsupport;
+EXPORT_SYMBOL(iTCO_vendorsupport);
+
+module_param_named(vendorsupport, iTCO_vendorsupport, int, 0);
 MODULE_PARM_DESC(vendorsupport, "iTCO vendor specific support mode, default="
 			"0 (none), 1=SuperMicro Pent3, 911=Broken SMI BIOS");
 
@@ -152,7 +154,7 @@ static void broken_bios_stop(struct resource *smires)
 void iTCO_vendor_pre_start(struct resource *smires,
 			   unsigned int heartbeat)
 {
-	switch (vendorsupport) {
+	switch (iTCO_vendorsupport) {
 	case SUPERMICRO_OLD_BOARD:
 		supermicro_old_pre_start(smires);
 		break;
@@ -165,7 +167,7 @@ EXPORT_SYMBOL(iTCO_vendor_pre_start);
 
 void iTCO_vendor_pre_stop(struct resource *smires)
 {
-	switch (vendorsupport) {
+	switch (iTCO_vendorsupport) {
 	case SUPERMICRO_OLD_BOARD:
 		supermicro_old_pre_stop(smires);
 		break;
@@ -178,7 +180,7 @@ EXPORT_SYMBOL(iTCO_vendor_pre_stop);
 
 int iTCO_vendor_check_noreboot_on(void)
 {
-	switch (vendorsupport) {
+	switch (iTCO_vendorsupport) {
 	case SUPERMICRO_OLD_BOARD:
 		return 0;
 	default:
@@ -189,13 +191,13 @@ EXPORT_SYMBOL(iTCO_vendor_check_noreboot_on);
 
 static int __init iTCO_vendor_init_module(void)
 {
-	if (vendorsupport == SUPERMICRO_NEW_BOARD) {
+	if (iTCO_vendorsupport == SUPERMICRO_NEW_BOARD) {
 		pr_warn("Option vendorsupport=%d is no longer supported, "
 			"please use the w83627hf_wdt driver instead\n",
 			SUPERMICRO_NEW_BOARD);
 		return -EINVAL;
 	}
-	pr_info("vendor-support=%d\n", vendorsupport);
+	pr_info("vendor-support=%d\n", iTCO_vendorsupport);
 	return 0;
 }
 
-- 
2.25.0

