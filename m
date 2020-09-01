Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064F225A065
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgIAVED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:04:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:20771 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728237AbgIAVDg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Sep 2020 17:03:36 -0400
IronPort-SDR: DRQZ3nzC2auRw4bi9+lQ/PTkVFwUD4zH7DO3Cn9H+PCH9h1SgKMys56APxDOG3CoM404+n2YRM
 D57QWsvwnfMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158268523"
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; 
   d="scan'208";a="158268523"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 14:03:29 -0700
IronPort-SDR: uZ3+1zzBrRusLUt/WYH4PBQalrYNbZEe1XagkRO/QpAUURsefRyznweaSgxvWVd4IxtASVtcS8
 3Gwgss/diRMg==
X-IronPort-AV: E=Sophos;i="5.76,380,1592895600"; 
   d="scan'208";a="314874352"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 14:03:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 7D9042269A;
        Wed,  2 Sep 2020 00:03:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kDDRF-0002DO-Bx; Wed, 02 Sep 2020 00:03:33 +0300
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
Subject: [PATCH v7 2/6] ACPI: Add a convenience function to tell a device is in low power state
Date:   Wed,  2 Sep 2020 00:03:29 +0300
Message-Id: <20200901210333.8462-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901210333.8462-1-sakari.ailus@linux.intel.com>
References: <20200901210333.8462-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
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
 include/linux/acpi.h     |  5 +++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 94d91c67aeaeb..e3c488d4af0d4 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -1344,4 +1344,35 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
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
index 1e4cdc6c7ae20..276f6af99779f 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -976,6 +976,7 @@ int acpi_dev_resume(struct device *dev);
 int acpi_subsys_runtime_suspend(struct device *dev);
 int acpi_subsys_runtime_resume(struct device *dev);
 int acpi_dev_pm_attach(struct device *dev, bool power_on);
+bool acpi_dev_state_low_power(struct device *dev);
 #else
 static inline int acpi_dev_runtime_suspend(struct device *dev) { return 0; }
 static inline int acpi_dev_runtime_resume(struct device *dev) { return 0; }
@@ -985,6 +986,10 @@ static inline int acpi_dev_pm_attach(struct device *dev, bool power_on)
 {
 	return 0;
 }
+static inline bool acpi_dev_state_low_power(struct device *dev)
+{
+	return false;
+}
 #endif
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_PM_SLEEP)
-- 
2.20.1

