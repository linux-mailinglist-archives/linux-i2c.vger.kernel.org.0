Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D98F7135D16
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 16:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730916AbgAIPor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 10:44:47 -0500
Received: from mga11.intel.com ([192.55.52.93]:17759 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732547AbgAIPoi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 10:44:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="371333764"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:35 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 15C8B20B52;
        Thu,  9 Jan 2020 17:44:33 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ipa01-000558-Du; Thu, 09 Jan 2020 17:45:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v3 2/5] ACPI: Add a convenience function to tell a device is suspended in probe
Date:   Thu,  9 Jan 2020 17:45:26 +0200
Message-Id: <20200109154529.19484-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a convenience function to tell whether a device is suspended for probe
or remove, for busses where the custom is that drivers don't need to
resume devices in probe, or suspend them in their remove handlers.

Returns false on non-ACPI systems.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/acpi/device_pm.c | 35 +++++++++++++++++++++++++++++++++++
 include/linux/acpi.h     |  5 +++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 5e4a8860a9c0c..87393020276d8 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -1348,4 +1348,39 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
 	return 1;
 }
 EXPORT_SYMBOL_GPL(acpi_dev_pm_attach);
+
+/**
+ * acpi_dev_low_power_state_probe - Tell if a device is in a low power state
+ *				    during probe
+ * @dev: The device
+ *
+ * Tell whether a given device is in a low power state during the driver's probe
+ * or remove operation.
+ *
+ * Drivers of devices on certain busses such as I²C can generally assume (on
+ * ACPI based systems) that the devices they control are powered on without
+ * driver having to do anything about it. Using struct
+ * device_driver.probe_low_power and "probe-low-power" property, this can be
+ * negated and the driver has full control of the device power management.
+ * Always returns false on non-ACPI based systems. True is returned on ACPI
+ * based systems iff the device is in a low power state during probe or remove.
+ */
+bool acpi_dev_low_power_state_probe(struct device *dev)
+{
+	int power_state;
+	int ret;
+
+	if (!is_acpi_device_node(dev_fwnode(dev)))
+		return false;
+
+	ret = acpi_device_get_power(ACPI_COMPANION(dev), &power_state);
+	if (ret) {
+		dev_warn(dev, "Cannot obtain power state (%d)\n", ret);
+		return false;
+	}
+
+	return power_state != ACPI_STATE_D0;
+}
+EXPORT_SYMBOL_GPL(acpi_dev_low_power_state_probe);
+
 #endif /* CONFIG_PM */
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 0f37a7d5fa774..fd00853074e1a 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -926,6 +926,7 @@ int acpi_dev_resume(struct device *dev);
 int acpi_subsys_runtime_suspend(struct device *dev);
 int acpi_subsys_runtime_resume(struct device *dev);
 int acpi_dev_pm_attach(struct device *dev, bool power_on);
+bool acpi_dev_low_power_state_probe(struct device *dev);
 #else
 static inline int acpi_dev_runtime_suspend(struct device *dev) { return 0; }
 static inline int acpi_dev_runtime_resume(struct device *dev) { return 0; }
@@ -935,6 +936,10 @@ static inline int acpi_dev_pm_attach(struct device *dev, bool power_on)
 {
 	return 0;
 }
+static inline bool acpi_dev_low_power_state_probe(struct device *dev)
+{
+	return false;
+}
 #endif
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_PM_SLEEP)
-- 
2.20.1

