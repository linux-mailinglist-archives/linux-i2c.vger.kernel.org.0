Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9117388AF
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 17:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjFUPUK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 11:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbjFUPTx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 11:19:53 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D832ED2;
        Wed, 21 Jun 2023 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687360610; x=1718896610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZCM5lLaApqKK/yTbVaJKND0T8mjA20qNjOsA8/s5nU=;
  b=bfMDzeCKjGK6H4FHShn/5ZdLutzkHVU11a33O9iqmeqxrfBZJt9ZBljw
   rSF/InNEnMxd7QULv5c7U0DXmoQdykfDSwJB7tzQO3Z4ARh8o7kJfN+Hi
   zISSaxlRaMmD9ucQsXB6pauKiGSHaZgDaffPtYEWAPh5umNzHJ5EYMTsX
   1jGCQOjCYLIhb1/sj+T5+HqK00ggbpqYokCVIO7DXS/Qw74zVtMBVoNhx
   8lJZxg58k9eHqYsrmEclLp4c8i5OuMDQIp+kyFXrtTz9Y/ALITd6Hp8Aa
   DpM967FR8z6EpgbMbPN3uq9qzoxMtYjKMHelf6FAxI6DUVdgwlsSWzuRM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="446584496"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="446584496"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 08:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="664702536"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="664702536"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2023 08:16:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8D4D0241; Wed, 21 Jun 2023 18:16:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>
Subject: [PATCH v2 2/2] ACPI: platform: Move SMB0001 HID to the header and reuse
Date:   Wed, 21 Jun 2023 18:16:52 +0300
Message-Id: <20230621151652.79579-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20230620163534.1042-2-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added tag (Andi)
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

