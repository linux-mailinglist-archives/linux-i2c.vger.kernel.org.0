Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099AF56B63E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 12:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237446AbiGHKCP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 06:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237298AbiGHKCO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 06:02:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B3B83F18;
        Fri,  8 Jul 2022 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657274533; x=1688810533;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jXwem7MyMyTEeSilwpw/3LwkDeEvgtyjSeZFs1hTWFc=;
  b=Nf1LLnlPqmLB5mHa45DAYS9bo3jJ0p0xBm1Iw0nJ1Z1mc8bc+BUXyZgB
   Jz3KVHbmCN+Ef16SDvjlyLpZkdYxtK2uC/PsCX5Fn9YKVvZnnHDLg1lqV
   MAwsoJ22B2YvczhZc68D5deFuysSnz+wrQlMFB8VSk/iFd70bPs3dUhs6
   MxTPOcxLoqS2Cl6q2WvLa13Rmz4CNNL0KJL3Uu5asa6Rg/f4l3F78hvUy
   TuzMmKJ8P5gZZfvuHt2vpC8J+3YYRr+YVyb7QM1I9vXmpnDczDsISQXyv
   k0bxnSyKUGkg8ZL+zevVCrae78VbRgL8oxF5C8YBLcUtM0payXWi9rstN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281796165"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="281796165"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 03:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="920944487"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2022 03:02:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 12FCACE; Fri,  8 Jul 2022 13:02:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 1/1] i2c: scmi: Replace open coded device_get_match_data()
Date:   Fri,  8 Jul 2022 13:02:16 +0300
Message-Id: <20220708100216.84300-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace open coded device_get_match_data() in acpi_smbus_cmi_add().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: used device_get_match_data() instead
 drivers/i2c/busses/i2c-scmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 6746aa46d96c..ab318ff78a82 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -369,6 +369,7 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 		return -ENOMEM;
 
 	smbus_cmi->handle = device->handle;
+	smbus_cmi->methods = device_get_match_data(&device->dev);
 	strcpy(acpi_device_name(device), ACPI_SMBUS_HC_DEVICE_NAME);
 	strcpy(acpi_device_class(device), ACPI_SMBUS_HC_CLASS);
 	device->driver_data = smbus_cmi;
@@ -376,11 +377,6 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 	smbus_cmi->cap_read = 0;
 	smbus_cmi->cap_write = 0;
 
-	for (id = acpi_smbus_cmi_ids; id->id[0]; id++)
-		if (!strcmp(id->id, acpi_device_hid(device)))
-			smbus_cmi->methods =
-				(struct smbus_methods_t *) id->driver_data;
-
 	acpi_walk_namespace(ACPI_TYPE_METHOD, smbus_cmi->handle, 1,
 			    acpi_smbus_cmi_query_methods, NULL, smbus_cmi, NULL);
 
-- 
2.35.1

