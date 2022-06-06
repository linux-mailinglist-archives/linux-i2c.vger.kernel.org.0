Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508CD53E832
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241751AbiFFQl6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 12:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiFFQl4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 12:41:56 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2543417063;
        Mon,  6 Jun 2022 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654533715; x=1686069715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cOu3jRGTW0KgXBqJv9jcdMCL/k7Jmllrb7yTFDGi3W0=;
  b=nER6QsbtxPOgUL/mOcGWMlo56wsfzHIVuM6vUwTo5xB1G8O0XIL9L4NM
   sKv43Jeng4ijmFXtRHoY9jM90yF5zd4GuDJt5rMq7oufqsrjWfLuiSeTf
   PWfUw/vkAiWlowMx/oUA/MP09s/qm9To7dcf0PmxgAtGOXt4IM3PhOa0t
   +BtDuXgFDKp6+t/bxYKDB34j1g0qjZPYgobFzuWR1mk1PVLXxAoKoGz7N
   SmKMIy7eVXx7jwcoWlmhtVquTHkdB237uMEMqpZ8cQ/deD5T1dKZdftNS
   oZVIl7kaoa7wj7j28Pe0D25ptXF6VEtM6m1DJB3Stvs0H4Zrzhk2gDmO/
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276710527"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276710527"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="608819816"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 06 Jun 2022 09:41:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6F8789A9; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 02/12] pinctrl: intel: Check against matching data instead of ACPI companion
Date:   Mon,  6 Jun 2022 19:41:28 +0300
Message-Id: <20220606164138.66535-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In some cases we may get a platform device that has ACPI companion
which is different to the pin control described in the ACPI tables.
This is primarily happens when device is instantiated by board file.

In order to allow this device being enumerated, refactor
intel_pinctrl_get_soc_data() to check the matching data instead of
ACPI companion.

Reported-by: Henning Schild <henning.schild@siemens.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index ffc045f7bf00..fd093e36c3a8 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1641,16 +1641,14 @@ EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
 
 const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
 {
+	const struct intel_pinctrl_soc_data * const *table;
 	const struct intel_pinctrl_soc_data *data = NULL;
-	const struct intel_pinctrl_soc_data **table;
-	struct acpi_device *adev;
-	unsigned int i;
 
-	adev = ACPI_COMPANION(&pdev->dev);
-	if (adev) {
-		const void *match = device_get_match_data(&pdev->dev);
+	table = device_get_match_data(&pdev->dev);
+	if (table) {
+		struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+		unsigned int i;
 
-		table = (const struct intel_pinctrl_soc_data **)match;
 		for (i = 0; table[i]; i++) {
 			if (!strcmp(adev->pnp.unique_id, table[i]->uid)) {
 				data = table[i];
@@ -1664,7 +1662,7 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
 		if (!id)
 			return ERR_PTR(-ENODEV);
 
-		table = (const struct intel_pinctrl_soc_data **)id->driver_data;
+		table = (const struct intel_pinctrl_soc_data * const *)id->driver_data;
 		data = table[pdev->id];
 	}
 
-- 
2.35.1

