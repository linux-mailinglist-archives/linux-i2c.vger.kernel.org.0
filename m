Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF81310BE2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 14:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhBENco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 08:32:44 -0500
Received: from mga17.intel.com ([192.55.52.151]:27051 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhBEN2w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:28:52 -0500
IronPort-SDR: HMda+JDJ6wSQaig/Y66hxemEet48FqLM3w/x/zYpwarsGgvF0Jg1FJUaq5kwgE072slJ/2HMBb
 fxIqNThzQ8Wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="161185331"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="161185331"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:57 -0800
IronPort-SDR: 8xB7uGNbhzbDEtmhZopEqMhzKsMzmDhzd70XXHPvml2U/KrUhlS+Pa6rErtslb1cKlfUN56Tx+
 FKMAWbhLpY1g==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="357699229"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:53 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 98A9820D41;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GO-Cw; Fri, 05 Feb 2021 15:25:05 +0200
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
Subject: [PATCH v10 4/7] ACPI: Add a convenience function to tell a device is in low power state
Date:   Fri,  5 Feb 2021 15:25:02 +0200
Message-Id: <20210205132505.20173-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/acpi/device_pm.c | 23 +++++++++++++++++++++++
 include/linux/acpi.h     |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 096153761ebc3..5a58be779a8cd 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -1336,4 +1336,27 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
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
+
+	if (!adev)
+		return false;
+
+	return adev->power.state != ACPI_STATE_D0;
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

