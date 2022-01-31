Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647284A4A1E
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 16:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379366AbiAaPOq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 10:14:46 -0500
Received: from mga07.intel.com ([134.134.136.100]:19426 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378011AbiAaPOS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 10:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643642058; x=1675178058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vJUYQ/EJ/+uq9B5gt7mFGRv4EuD1lZY/DDkYVSbHwtk=;
  b=H47sRiEDjDi9jnUHsRBWZPUI4q1PBKBLijYH8pQPUTelmoYapBRBBgwc
   H3n2pDiZsBTYGzOzwmR70+HfB1Rnt1A2NlpoR/EWWqyH2lbLb9NHPqnHg
   C2Qqww2DJxuZqpaBl+tbWSqWZh8U+HkiBh4+/3xnD7Qw+CKwBR0RqStpf
   yUii2qn/jWQSZH+93FNDySd8ovQ5XXzPHfXxuH8Zfhok4MqwyJEr5aLGP
   e+6MIzLXwun+bhxCPjL5xdOTEiiB/HAkevQrz//JzSocrbqwGIne1JeLD
   m/kruB2CNOdNWbfiUKQuuI6duSfifETev3EL1NydK7mPV8i5yWSJoPDEJ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="310787725"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="310787725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="626393642"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2022 07:14:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D90843C5; Mon, 31 Jan 2022 17:14:15 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v4 2/8] pinctrl: intel: Check against matching data instead of ACPI companion
Date:   Mon, 31 Jan 2022 17:13:40 +0200
Message-Id: <20220131151346.45792-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
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
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 826d494f3cc6..48f55991ae8c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1626,16 +1626,14 @@ EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
 
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
@@ -1649,7 +1647,7 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
 		if (!id)
 			return ERR_PTR(-ENODEV);
 
-		table = (const struct intel_pinctrl_soc_data **)id->driver_data;
+		table = (const struct intel_pinctrl_soc_data * const *)id->driver_data;
 		data = table[pdev->id];
 	}
 
-- 
2.34.1

