Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F773081DD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 00:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhA1X3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 18:29:23 -0500
Received: from mga04.intel.com ([192.55.52.120]:11312 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231513AbhA1X3T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 18:29:19 -0500
IronPort-SDR: 2Lfkh+y0XdiWFM1RhVKIyZOuERlW1SSeEgkgUQ3hjSQ4hok+tmNz/EE22sXEKBD5wfn1Aed3Ov
 FDisEphvnWhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="177768134"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="177768134"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:27:33 -0800
IronPort-SDR: WCx/m01j6xtYhvcaFuyKyMG1Fg0i7wPeQdkRETAoQEE5B85ceO473+mD9Kh3G/ttDLffWU4iLy
 GBRR/U0tf3GQ==
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="357611614"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:27:29 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id CEC7221D65;
        Fri, 29 Jan 2021 01:27:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l5GhF-0004FJ-PB; Fri, 29 Jan 2021 01:27:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v9 4/7] ACPI: Add a convenience function to tell a device is in low power state
Date:   Fri, 29 Jan 2021 01:27:26 +0200
Message-Id: <20210128232729.16064-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a convenience function to tell whether a device is in low power state,
primarily for use in drivers' probe or remove functions on busses where
the custom is to power on the device for the duration of both.

Returns false on non-ACPI systems.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/device_pm.c | 31 +++++++++++++++++++++++++++++++
 include/linux/acpi.h     |  6 ++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 096153761ebc3..1b5336af0b4cd 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -1336,4 +1336,35 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
 	return 1;
 }
 EXPORT_SYMBOL_GPL(acpi_dev_pm_attach);
+
+/**
+ * acpi_dev_state_low_power - Check the current ACPI power state of a device.
+ * @dev: Physical device the ACPI power state of which to check
+ *
+ * On a system without ACPI, return false. On a system with ACPI, return true if
+ * the current ACPI power state of the device is not D0, or false otherwise.
+ *
+ * Note that the power state of a device is not well-defined after it has been
+ * passed to acpi_device_set_power() and before that function returns, so it is
+ * not valid to ask for the ACPI power state of the device in that time frame.
+ */
+bool acpi_dev_state_low_power(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	int power_state;
+	int ret;
+
+	if (!adev)
+		return false;
+
+	ret = acpi_device_get_power(adev, &power_state);
+	if (ret) {
+		dev_dbg(dev, "Cannot obtain power state (%d)\n", ret);
+		return false;
+	}
+
+	return power_state != ACPI_STATE_D0;
+}
+EXPORT_SYMBOL_GPL(acpi_dev_state_low_power);
+
 #endif /* CONFIG_PM */
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4703daafcce9e..864786adb567c 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -982,6 +982,7 @@ int acpi_dev_resume(struct device *dev);
 int acpi_subsys_runtime_suspend(struct device *dev);
 int acpi_subsys_runtime_resume(struct device *dev);
 int acpi_dev_pm_attach(struct device *dev, bool power_on);
+bool acpi_dev_state_low_power(struct device *dev);
 #else
 static inline int acpi_subsys_runtime_suspend(struct device *dev) { return 0; }
 static inline int acpi_subsys_runtime_resume(struct device *dev) { return 0; }
@@ -989,6 +990,11 @@ static inline int acpi_dev_pm_attach(struct device *dev, bool power_on)
 {
 	return 0;
 }
+
+static inline bool acpi_dev_state_low_power(struct device *dev)
+{
+	return false;
+}
 #endif
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_PM_SLEEP)
-- 
2.20.1

