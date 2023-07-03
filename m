Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61908745BEA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjGCMOP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 08:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjGCMOP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 08:14:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48480115;
        Mon,  3 Jul 2023 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688386454; x=1719922454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z7bCMN6xKQi+ypGD5LL1aECtFx/TCb2DP0kRtZYvV10=;
  b=NgWm81nllrMuJmp/bRu/UKkw/UVojjh3HHK7yCFnShWqG/duNrkqWkgS
   CHgYchjvGjt+s2NGqsnMjDjjqOQrzUGn4zFXumNxx/nJhchWBXMeRtOrp
   efZY6DMhZw3cz+xW2Ly1+ftVY754CqoBtmjm/NZsbutC4gBQOYHzYf3cB
   sruHhESK3zosSYhn4/pjxMflqpSj5T7MXLytnlCfKF3E3a2hOJFBxK5v/
   E5p5jX3XaJ8MHnlPxBOldkk1SkdjtcKC7cBmEOx/duXd/U+pgloUKMpbK
   c2oolHZ5eAXsePF6oxXt1hG958l599byK6w8/GvCTQ3KsCmESOpsV9Mis
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361726055"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="361726055"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="788508188"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="788508188"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jul 2023 05:14:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 22DA81C7; Mon,  3 Jul 2023 15:14:13 +0300 (EEST)
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
Subject: [PATCH v4 4/5] ACPI: scan: Use the acpi_match_acpi_device() helper
Date:   Mon,  3 Jul 2023 15:14:10 +0300
Message-Id: <20230703121411.69606-5-andriy.shevchenko@linux.intel.com>
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

Instead of doing two pass parsing of the table, replace
acpi_match_device_ids() with acpi_match_acpi_device().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/scan.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index e75ed9123931..ec1c9bec8bae 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -928,26 +928,29 @@ static int acpi_bus_extract_wakeup_device_power_package(struct acpi_device *dev)
 	return err;
 }
 
+/* Do not use a button for S5 wakeup */
+#define ACPI_AVOID_WAKE_FROM_S5		BIT(0)
+
 static bool acpi_wakeup_gpe_init(struct acpi_device *device)
 {
 	static const struct acpi_device_id button_device_ids[] = {
-		{"PNP0C0C", 0},		/* Power button */
-		{"PNP0C0D", 0},		/* Lid */
-		{"PNP0C0E", 0},		/* Sleep button */
+		{"PNP0C0C", 0},				/* Power button */
+		{"PNP0C0D", ACPI_AVOID_WAKE_FROM_S5},	/* Lid */
+		{"PNP0C0E", ACPI_AVOID_WAKE_FROM_S5},	/* Sleep button */
 		{"", 0},
 	};
 	struct acpi_device_wakeup *wakeup = &device->wakeup;
+	const struct acpi_device_id *match;
 	acpi_status status;
 
 	wakeup->flags.notifier_present = 0;
 
 	/* Power button, Lid switch always enable wakeup */
-	if (!acpi_match_device_ids(device, button_device_ids)) {
-		if (!acpi_match_device_ids(device, &button_device_ids[1])) {
-			/* Do not use Lid/sleep button for S5 wakeup */
-			if (wakeup->sleep_state == ACPI_STATE_S5)
-				wakeup->sleep_state = ACPI_STATE_S4;
-		}
+	match = acpi_match_acpi_device(button_device_ids, device);
+	if (match) {
+		if ((match->driver_data & ACPI_AVOID_WAKE_FROM_S5) &&
+		    wakeup->sleep_state == ACPI_STATE_S5)
+			wakeup->sleep_state = ACPI_STATE_S4;
 		acpi_mark_gpe_for_wake(wakeup->gpe_device, wakeup->gpe_number);
 		device_set_wakeup_capable(&device->dev, true);
 		return true;
-- 
2.40.0.1.gaa8946217a0b

