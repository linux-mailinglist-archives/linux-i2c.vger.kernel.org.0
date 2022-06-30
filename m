Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54959562534
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 23:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237535AbiF3V3G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 17:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237582AbiF3V2k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 17:28:40 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164843700E;
        Thu, 30 Jun 2022 14:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656624520; x=1688160520;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vov2D8XGLh7l4fzlqjW0FYaJ1gTowtT9oIai97+IhHY=;
  b=lqc0a5cbBr/XdEfiZALSXhOhQpaT3KpFm4M8usVu2M16Y3M59+x7Ix6f
   WvD4pWHxR/xWnm3VylAAlPYLTR+4Vptd+CydB0+GPSXPc1hSTuURp8kjR
   qI56do2P/aC2Mjwgc1dkPG6UNnAjKQDN6YKv0S33VlUIzwd4UMU84c71T
   c4hGz4GF17AC/sZwUi3c2/BLkI9kPRQQgqUs36ZLq2cMrx2H+UC9k6287
   mMzAZlsPnZgw5Z3EoNOJXMhuiVdlb1as5JnbXf6zxLJimB7xLBkXV+TyQ
   k33omhVDZcebYMs+EQxMu+7EarIHZIWtAIO/I8sGRtGqL5DQqE8XpsLrJ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="280021839"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="280021839"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 14:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="588945471"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2022 14:28:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0B8D111E; Fri,  1 Jul 2022 00:28:30 +0300 (EEST)
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
Subject: [PATCH v1 1/5] ACPI: utils: Introduce acpi_match_video_device_handle() helper
Date:   Fri,  1 Jul 2022 00:28:15 +0300
Message-Id: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are a couple of users that open code functionality of matching
a given handle against ACPI video device IDs. The current approach
duplicates ID table along with the matching code. Consolidate it
under the acpi_match_video_device_handle() helper's hood.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/utils.c | 19 +++++++++++++++++++
 include/linux/acpi.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 3a9773a09e19..4800aba3b99c 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -929,6 +929,25 @@ static int __init acpi_backlight(char *str)
 }
 __setup("acpi_backlight=", acpi_backlight);
 
+static const struct acpi_device_id video_device_ids[] = {
+	{ACPI_VIDEO_HID, 0},
+	{}
+};
+
+/**
+ * acpi_match_video_device_handle - match handle against ACPI video device IDs
+ * @handle: ACPI handle to match
+ *
+ * Return: true when matches, otherwise false.
+ */
+bool acpi_match_video_device_handle(acpi_handle handle)
+{
+	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
+
+	return adev && !acpi_match_device_ids(adev, video_device_ids);
+}
+EXPORT_SYMBOL(acpi_match_video_device_handle);
+
 /**
  * acpi_match_platform_list - Check if the system matches with a given list
  * @plat: pointer to acpi_platform_list table terminated by a NULL entry
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 7b96a8bff6d2..c48e8a0df0cc 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -439,6 +439,8 @@ extern char *wmi_get_acpi_device_uid(const char *guid);
 
 extern char acpi_video_backlight_string[];
 extern long acpi_is_video_device(acpi_handle handle);
+extern bool acpi_match_video_device_handle(acpi_handle handle);
+
 extern int acpi_blacklisted(void);
 extern void acpi_osi_setup(char *str);
 extern bool acpi_osi_is_win8(void);
-- 
2.35.1

