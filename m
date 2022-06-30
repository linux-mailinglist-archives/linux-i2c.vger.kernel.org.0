Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B55456252E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 23:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237581AbiF3V2k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 17:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbiF3V2a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 17:28:30 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB1950737;
        Thu, 30 Jun 2022 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656624509; x=1688160509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cVLSgdqy7Mp0ViPp4OflMAPYFT4f/Xn/28iMuk2xBgQ=;
  b=CfivCdwlLoNgpZjzE8Eml0OXDdC1+o66ZllLG5mazizE6xj2v1e0Ew1/
   GcVj07RO5ZO1Z9BvjTNyKgs6ET+YomsUyMnuaOrXs4BbTJmveuvmtFJeL
   i2rFUV9d0DwJsZc2PfeQ/itDu5PwSS2jorcJJ88h+xQ81k46gpLU8Wl+F
   uTm633XbZCuj+lfVoIzZOARnraV92WgiOnvYXaKQJEVX/An6YFs/ow7SP
   afNaECp2lkWTKwWNvi3CTDREo9JlSD+ujhqo46PAWXOMUtmzojtF9kEue
   dc3QPntOChwk3RuVte6Ob/FQ8jABdp5g3fEgRJLx47uZiIYyeoeaqoYgO
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="265506575"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="265506575"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 14:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="591454757"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 30 Jun 2022 14:28:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1FBE113C; Fri,  1 Jul 2022 00:28:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v1 3/5] i2c: acpi: Convert to use acpi_match_video_device_handle() helper
Date:   Fri,  1 Jul 2022 00:28:17 +0300
Message-Id: <20220630212819.42958-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace open coded variant of acpi_match_video_device_handle() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 08b561f0709d..e6de54dec010 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -128,15 +128,6 @@ static int i2c_acpi_fill_info(struct acpi_resource *ares, void *data)
 	return 1;
 }
 
-static const struct acpi_device_id i2c_acpi_ignored_device_ids[] = {
-	/*
-	 * ACPI video acpi_devices, which are handled by the acpi-video driver
-	 * sometimes contain a SERIAL_TYPE_I2C ACPI resource, ignore these.
-	 */
-	{ ACPI_VIDEO_HID, 0 },
-	{}
-};
-
 static int i2c_acpi_do_lookup(struct acpi_device *adev,
 			      struct i2c_acpi_lookup *lookup)
 {
@@ -150,7 +141,11 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 	if (!acpi_dev_ready_for_enumeration(adev))
 		return -ENODEV;
 
-	if (acpi_match_device_ids(adev, i2c_acpi_ignored_device_ids) == 0)
+	/*
+	 * ACPI video devices, which are handled by the acpi-video driver,
+	 * sometimes contain a SERIAL_TYPE_I2C ACPI resource, ignore these.
+	 */
+	if (acpi_match_video_device_handle(adev->handle))
 		return -ENODEV;
 
 	memset(info, 0, sizeof(*info));
-- 
2.35.1

