Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11ACF7371D7
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 18:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbjFTQgS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 12:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjFTQgH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 12:36:07 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BE32106;
        Tue, 20 Jun 2023 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687278944; x=1718814944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MU6h0bQC0vAge5es6R0v/1fr1IoAPMvkrNIAnaSKRwM=;
  b=OWDeK3t688m5Vu25OHOVjthdpTd0X3o0WHWZ791OfI1mwaedOXOWuBJI
   ac7LW/rNlK3nkUzyt5/IF6mX2cN0z9okQ2nZPuBAEfr7Zcf2mld0az3jS
   AyoRvh8vgEsr7CwBhT9QWUFh6cGyi7HnhpqyU9Jk5Wapehz3OUq0/9GXs
   G2C0fScAA5DnlXtrZWIdOOz8KOjrXwMNs6nFaYe6XURh0yJo7UCi1mPfK
   0L5xafC1bFpX5ZLU9lqTmRP0qNGntKVdR0pjxyB1yRwhLTTL/h1gJwLok
   +ZEWKu5Pt5LpLL5P6iBQI5UnIDRZNP07QZ43cnEYbZn/pC5liOVtQ/91S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="423575845"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="423575845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 09:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838268291"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="838268291"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 20 Jun 2023 09:35:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4ED3E690; Tue, 20 Jun 2023 19:35:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>
Subject: [PATCH v1 2/2] ACPI: platform: Move SMB0001 HID to the header and reuse
Date:   Tue, 20 Jun 2023 19:35:34 +0300
Message-Id: <20230620163534.1042-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are at least two places in the kernel that are using
the SMB0001 HID. Make it to be available via acpi_drivers.h
header file. While at it, replace hard coded one with a
definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_platform.c  | 2 +-
 drivers/i2c/busses/i2c-scmi.c | 3 ---
 include/acpi/acpi_drivers.h   | 2 ++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index 089a98bd18bf..e86f76ee3473 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -20,7 +20,7 @@
 #include "internal.h"
 
 static const struct acpi_device_id forbidden_id_with_resourses[] = {
-	{"SMB0001",  0},	/* ACPI SMBUS virtual device */
+	{ACPI_SMBUS_MS_HID,  0},	/* ACPI SMBUS virtual device */
 	{ }
 };
 
diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 104570292241..421735acfa14 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -13,9 +13,6 @@
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 
-/* SMBUS HID definition as supported by Microsoft Windows */
-#define ACPI_SMBUS_MS_HID		"SMB0001"
-
 struct smbus_methods_t {
 	char *mt_info;
 	char *mt_sbr;
diff --git a/include/acpi/acpi_drivers.h b/include/acpi/acpi_drivers.h
index 8372b0e7fd15..b14d165632e7 100644
--- a/include/acpi/acpi_drivers.h
+++ b/include/acpi/acpi_drivers.h
@@ -27,6 +27,8 @@
 #define ACPI_BAY_HID			"LNXIOBAY"
 #define ACPI_DOCK_HID			"LNXDOCK"
 #define ACPI_ECDT_HID			"LNXEC"
+/* SMBUS HID definition as supported by Microsoft Windows */
+#define ACPI_SMBUS_MS_HID		"SMB0001"
 /* Quirk for broken IBM BIOSes */
 #define ACPI_SMBUS_IBM_HID		"SMBUSIBM"
 
-- 
2.40.0.1.gaa8946217a0b

