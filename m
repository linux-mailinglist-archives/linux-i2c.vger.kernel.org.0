Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D7656B975
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 14:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbiGHMKN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 08:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238201AbiGHMKC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 08:10:02 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347B79FE21;
        Fri,  8 Jul 2022 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657282198; x=1688818198;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YvldKyFbhk7lRJkx7aYJWJ92+gC0um2AaK4no4SFWt8=;
  b=bzrEhu8pF1smgh3ERxuJDLAnHMbEaFPLgNWcfufTDrpruVS4pVEL4J5j
   KK7Z42lnK2FgwN9Tpw3tor8h6riy8pFbIoI8rMGIB1aWcZMlw9JxZr9z7
   SFxeKXtbjB6JKWUnp5QgK1ImZw1RNHvSFjOz+FatUshgR0+3uBy5ij/LS
   YlkPdHntudVJts3LUPlVw/He7p7j/S4LIGFnV7ba7I+EFZe0sEclbsiPu
   xIoFBcCbpx5SttKYROLAxBNGD7ubRTvMKEBTvsP2XmHkMwtqnhUwl+vXn
   AGTQ4sdfmszBFqdFfYLXt6PesOLHNULJMGhji7bleav3A+RuwVE48gJxQ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348250665"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="348250665"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 05:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="591550541"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Jul 2022 05:09:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 49DE3CE; Fri,  8 Jul 2022 15:10:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v3 1/1] i2c: scmi: Replace open coded device_get_match_data()
Date:   Fri,  8 Jul 2022 15:09:58 +0300
Message-Id: <20220708120958.74034-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
v2: used device_get_match_data()
v3: fixed couple of warnings (LKP)
 drivers/i2c/busses/i2c-scmi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 6746aa46d96c..79798fc7462a 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -30,7 +30,7 @@ struct acpi_smbus_cmi {
 	u8 cap_info:1;
 	u8 cap_read:1;
 	u8 cap_write:1;
-	struct smbus_methods_t *methods;
+	const struct smbus_methods_t *methods;
 };
 
 static const struct smbus_methods_t smbus_methods = {
@@ -361,7 +361,6 @@ static acpi_status acpi_smbus_cmi_query_methods(acpi_handle handle, u32 level,
 static int acpi_smbus_cmi_add(struct acpi_device *device)
 {
 	struct acpi_smbus_cmi *smbus_cmi;
-	const struct acpi_device_id *id;
 	int ret;
 
 	smbus_cmi = kzalloc(sizeof(struct acpi_smbus_cmi), GFP_KERNEL);
@@ -369,6 +368,7 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 		return -ENOMEM;
 
 	smbus_cmi->handle = device->handle;
+	smbus_cmi->methods = device_get_match_data(&device->dev);
 	strcpy(acpi_device_name(device), ACPI_SMBUS_HC_DEVICE_NAME);
 	strcpy(acpi_device_class(device), ACPI_SMBUS_HC_CLASS);
 	device->driver_data = smbus_cmi;
@@ -376,11 +376,6 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
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

