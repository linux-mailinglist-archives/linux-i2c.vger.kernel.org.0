Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDB047C5B5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240863AbhLUSH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:07:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:28871 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236894AbhLUSH2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110048; x=1671646048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nwz96mDAYB2gmKI8bVpsfwylETs2xaB50GhG3S0F5YA=;
  b=TaHXYCwoyV9T7oVvznTMZJMN0s0cUTUv4393UyAxRV16ichWvO/QrNCW
   Ub0LenJY06u+ld2oJAWRjyBY+BKjx5IYNo5uuhDu9AEZ8o7GzEF74m7N9
   EqimZZ4qg5/rRlzbjWAqC/AdMgrQI4UIyuAm1Vlx73zDxnrXNDACkNKrc
   DbldzHGo/ddL8U5tnzdUmRnVk8LO2/L8wmoVTS6zKceN82JvCbfffDoXP
   IRUO1WqkBqGFKeUSg1wpNBa2xjredC+3d7JdH3yoP6Wll/Jd28KoPYtid
   IGwvjMlxlyx2jbR20blELVYg/Gi4PjsqguU8KuxVRex+S0NJ0FWgtpbJp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227751330"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227751330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 09:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="521805190"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 21 Dec 2021 09:41:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B5A8F331; Tue, 21 Dec 2021 19:41:09 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v2 4/8] pinctrl: intel: Check against matching data instead of ACPI companion
Date:   Tue, 21 Dec 2021 19:39:41 +0200
Message-Id: <20211221173945.53674-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221173945.53674-1-andriy.shevchenko@linux.intel.com>
References: <20211221173945.53674-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 85750974d182..7d8a7e7b0aef 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1598,16 +1598,14 @@ EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
 
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
@@ -1621,7 +1619,7 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
 		if (!id)
 			return ERR_PTR(-ENODEV);
 
-		table = (const struct intel_pinctrl_soc_data **)id->driver_data;
+		table = (const struct intel_pinctrl_soc_data * const *)id->driver_data;
 		data = table[pdev->id];
 	}
 
-- 
2.34.1

