Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C1243228E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 17:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhJRPUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 11:20:01 -0400
Received: from mga12.intel.com ([192.55.52.136]:57505 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232846AbhJRPT7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 11:19:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="208372722"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="208372722"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:15:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="462358708"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id A117820769;
        Mon, 18 Oct 2021 15:17:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1mcRa5-0001fb-LB; Mon, 18 Oct 2021 15:17:29 +0300
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
Subject: [PATCH 4/6] ACPI: Add a convenience function to tell a device is in D0 state
Date:   Mon, 18 Oct 2021 15:17:27 +0300
Message-Id: <20211018121729.6357-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
References: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a convenience function to tell whether a device is in D0 state,
primarily for use in drivers' probe or remove functions on busses where
the custom is to power on the device for the duration of both.

Returns false on non-ACPI systems.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/acpi/device_pm.c | 26 ++++++++++++++++++++++++++
 include/linux/acpi.h     |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 0028b6b51c877..19b33c028f356 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -1400,4 +1400,30 @@ bool acpi_storage_d3(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(acpi_storage_d3);
 
+/**
+ * acpi_dev_state_d0 - Tell if the device is in D0 power state
+ * @dev: Physical device the ACPI power state of which to check
+ *
+ * On a system without ACPI, return true. On a system with ACPI, return true if
+ * the current ACPI power state of the device is D0, or false otherwise.
+ *
+ * Note that the power state of a device is not well-defined after it has been
+ * passed to acpi_device_set_power() and before that function returns, so it is
+ * not valid to ask for the ACPI power state of the device in that time frame.
+ *
+ * This function is intended to be used in a driver's probe or remove
+ * function. See Documentation/firmware-guide/acpi/low-power-probe.rst for
+ * more information.
+ */
+bool acpi_dev_state_d0(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!adev)
+		return true;
+
+	return adev->power.state == ACPI_STATE_D0;
+}
+EXPORT_SYMBOL_GPL(acpi_dev_state_d0);
+
 #endif /* CONFIG_PM */
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 375715b0535fb..143ce7e0bee13 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1014,6 +1014,7 @@ int acpi_subsys_runtime_suspend(struct device *dev);
 int acpi_subsys_runtime_resume(struct device *dev);
 int acpi_dev_pm_attach(struct device *dev, bool power_on);
 bool acpi_storage_d3(struct device *dev);
+bool acpi_dev_state_d0(struct device *dev);
 #else
 static inline int acpi_subsys_runtime_suspend(struct device *dev) { return 0; }
 static inline int acpi_subsys_runtime_resume(struct device *dev) { return 0; }
@@ -1025,6 +1026,10 @@ static inline bool acpi_storage_d3(struct device *dev)
 {
 	return false;
 }
+static inline bool acpi_dev_state_d0(struct device *dev)
+{
+	return true;
+}
 #endif
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_PM_SLEEP)
-- 
2.30.2

