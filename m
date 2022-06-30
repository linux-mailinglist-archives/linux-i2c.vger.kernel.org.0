Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75DC56239D
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 21:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiF3T4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 15:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbiF3T4M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 15:56:12 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566D544760;
        Thu, 30 Jun 2022 12:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656618971; x=1688154971;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9bDKDU8l215gnZyJhkGFvAKmvgqtGJH9XwdqGBQl7BU=;
  b=G53+EcSzk1a9R0pPplebcW+rQRG60QcMNK6oec2wJ2xBconVTnL4aIPd
   IeWCWF9LmIBMgxwYzOpilh4NPIGiJP+fJ8nZUjMjo0lSkfNsnLnF5PY7P
   JUBSryAosUZeavfzqaSvQIfi6wqJX0ziD1VighA+NTj20lODoAh7RTFXs
   SndoM30UUrlbW0+z+Gxo5HxRM7qZyChQtYJLZP3G4DYkFezn0HoGoUfMT
   tyPrV0cKK1saL5SOP1iQlMPNoR0MlttMxK+4IxIai76vKB9VOPBrLtT1x
   67FrxI/GEDWKIhWEJHAqbjFDqeeyp5s/ejsTWutDVHvVFDzYMviggroOY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="344137990"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="344137990"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 12:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="591376536"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 30 Jun 2022 12:55:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 39B2911E; Thu, 30 Jun 2022 22:55:43 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v1 1/1] i2c: scmi: Replace open coded acpi_match_device()
Date:   Thu, 30 Jun 2022 22:55:41 +0300
Message-Id: <20220630195541.4368-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace open coded acpi_match_device() in acpi_smbus_cmi_add().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-scmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 6746aa46d96c..ba20f6c60e06 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -376,10 +376,9 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 	smbus_cmi->cap_read = 0;
 	smbus_cmi->cap_write = 0;
 
-	for (id = acpi_smbus_cmi_ids; id->id[0]; id++)
-		if (!strcmp(id->id, acpi_device_hid(device)))
-			smbus_cmi->methods =
-				(struct smbus_methods_t *) id->driver_data;
+	id = acpi_match_device(device, acpi_smbus_cmi_ids);
+	if (id)
+		smbus_cmi->methods = (struct smbus_methods_t *)id->driver_data;
 
 	acpi_walk_namespace(ACPI_TYPE_METHOD, smbus_cmi->handle, 1,
 			    acpi_smbus_cmi_query_methods, NULL, smbus_cmi, NULL);
-- 
2.35.1

