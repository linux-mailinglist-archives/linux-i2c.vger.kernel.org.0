Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF2C745BF0
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjGCMOR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjGCMOP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:14:15 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC5F109;
        Mon,  3 Jul 2023 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688386455; x=1719922455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SqHkBAkMK8Hr6vUp+4hcp7KlH8mbLu8d9B93Kaa2CI0=;
  b=cmN2v3BsUccyQpB/JP3I9AtikT+eCMQn8WwHu9egn0wTtsuAYkJePai1
   6HEjlNDFWllbAKPK60bGVrSH/GYvzl0UQXdKSAB5LWU4n8/saIkNoTzaA
   fMh+YAlfqXEMOlMMQ0CwefQZTVz3RDjwuAvshaHuA+RDCz/YbJSQE75HA
   hpXgpCwhxOTNx5bi2F58iuFl58g6RGaSGvPTjLE51k0XKVDf5NT/kznuZ
   ftDipyD8x8ixCcklcmp+ULXMzkKvDR30DeZQXpxGilEpPjfL0su892qqI
   ju1zCNIHGPfUCnGWKs4v5ZBYAxl1DpI+SRp2Ahdzf0szGGFoUPiRihiOa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449241146"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="449241146"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="718574510"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="718574510"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2023 05:14:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 12A1A177; Mon,  3 Jul 2023 15:14:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 3/5] ACPI: platform: Move SMB0001 HID to the header and reuse
Date:   Mon,  3 Jul 2023 15:14:09 +0300
Message-Id: <20230703121411.69606-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
Link: https://lore.kernel.org/r/20230621151652.79579-2-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_platform.c  | 2 +-
 drivers/i2c/busses/i2c-scmi.c | 3 ---
 include/acpi/acpi_drivers.h   | 2 ++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index c2ce558bd032..3867d5389c51 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -29,7 +29,7 @@ static const struct acpi_device_id forbidden_id_list[] = {
 	{"PNP0000",  0},	/* PIC */
 	{"PNP0100",  0},	/* Timer */
 	{"PNP0200",  0},	/* AT DMA Controller */
-	{"SMB0001",  ACPI_ALLOW_WO_RESOURCES},	/* ACPI SMBUS virtual device */
+	{ACPI_SMBUS_MS_HID,  ACPI_ALLOW_WO_RESOURCES},	/* ACPI SMBUS virtual device */
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

