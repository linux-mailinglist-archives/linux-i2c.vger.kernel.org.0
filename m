Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B721AF28F
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 19:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDRRL4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 13:11:56 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:45274 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgDRRL4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Apr 2020 13:11:56 -0400
Received: from 185.80.35.16 (185.80.35.16) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.415)
 id 37811bb2075f5abb; Sat, 18 Apr 2020 19:11:51 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans De Goede <hdegoede@redhat.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 8/9] PM: sleep: core: Rename DPM_FLAG_LEAVE_SUSPENDED
Date:   Sat, 18 Apr 2020 18:53:20 +0200
Message-ID: <5178791.3jI3yRa1Fz@kreacher>
In-Reply-To: <5673945.BT02kTCndr@kreacher>
References: <1888197.j9z7NJ8yPn@kreacher> <5673945.BT02kTCndr@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Rename DPM_FLAG_LEAVE_SUSPENDED to DPM_FLAG_MAY_SKIP_RESUME which
matches its purpose more closely.

No functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Wolfram Sang <wsa@the-dreams.de> # for I2C
---

-> v2:
   * Rebased.
   * Added tags received so far.

---
 Documentation/driver-api/pm/devices.rst     | 4 ++--
 Documentation/power/pci.rst                 | 2 +-
 drivers/acpi/acpi_tad.c                     | 2 +-
 drivers/base/power/main.c                   | 2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 include/linux/pm.h                          | 6 +++---
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index 4ace0eba4506..f342c7549b4c 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -803,7 +803,7 @@ general.]
 However, it often is desirable to leave devices in suspend after system
 transitions to the working state, especially if those devices had been in
 runtime suspend before the preceding system-wide suspend (or analogous)
-transition.  Device drivers can use the ``DPM_FLAG_LEAVE_SUSPENDED`` flag to
+transition.  Device drivers can use the ``DPM_FLAG_MAY_SKIP_RESUME`` flag to
 indicate to the PM core (and middle-layer code) that they prefer the specific
 devices handled by them to be left suspended and they have no problems with
 skipping their system-wide resume callbacks for this reason.  Whether or not the
@@ -825,7 +825,7 @@ device really can be left in suspend.
 
 For devices whose "noirq", "late" and "early" driver callbacks are invoked
 directly by the PM core, all of the system-wide resume callbacks are skipped if
-``DPM_FLAG_LEAVE_SUSPENDED`` is set and the device is in runtime suspend during
+``DPM_FLAG_MAY_SKIP_RESUME`` is set and the device is in runtime suspend during
 the ``suspend_noirq`` (or analogous) phase or the transition under way is a
 proper system suspend (rather than anything related to hibernation) and the
 device's wakeup settings are suitable for runtime PM (that is, it cannot
diff --git a/Documentation/power/pci.rst b/Documentation/power/pci.rst
index 9e1408121bea..f09b382b4621 100644
--- a/Documentation/power/pci.rst
+++ b/Documentation/power/pci.rst
@@ -1029,7 +1029,7 @@ into D0 going forward), but if it is in runtime suspend in pci_pm_thaw_noirq(),
 the function will set the power.direct_complete flag for it (to make the PM core
 skip the subsequent "thaw" callbacks for it) and return.
 
-Setting the DPM_FLAG_LEAVE_SUSPENDED flag means that the driver prefers the
+Setting the DPM_FLAG_MAY_SKIP_RESUME flag means that the driver prefers the
 device to be left in suspend after system-wide transitions to the working state.
 This flag is checked by the PM core, but the PCI bus type informs the PM core
 which devices may be left in suspend from its perspective (that happens during
diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
index 33a4bcdaa4d7..7d45cce0c3c1 100644
--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -624,7 +624,7 @@ static int acpi_tad_probe(struct platform_device *pdev)
 	 */
 	device_init_wakeup(dev, true);
 	dev_pm_set_driver_flags(dev, DPM_FLAG_SMART_SUSPEND |
-				     DPM_FLAG_LEAVE_SUSPENDED);
+				     DPM_FLAG_MAY_SKIP_RESUME);
 	/*
 	 * The platform bus type layer tells the ACPI PM domain powers up the
 	 * device, so set the runtime PM status of it to "active".
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index dbc1e5e7346b..aaa4aaf41d27 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1247,7 +1247,7 @@ static int __device_suspend_noirq(struct device *dev, pm_message_t state, bool a
 	 * to be skipped.
 	 */
 	if (atomic_read(&dev->power.usage_count) > 1 ||
-	    !(dev_pm_test_driver_flags(dev, DPM_FLAG_LEAVE_SUSPENDED) &&
+	    !(dev_pm_test_driver_flags(dev, DPM_FLAG_MAY_SKIP_RESUME) &&
 	      dev->power.may_skip_resume))
 		dev->power.must_resume = true;
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c98befe2a92e..b6270e69f853 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -357,7 +357,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	dev_pm_set_driver_flags(&pdev->dev,
 				DPM_FLAG_SMART_PREPARE |
 				DPM_FLAG_SMART_SUSPEND |
-				DPM_FLAG_LEAVE_SUSPENDED);
+				DPM_FLAG_MAY_SKIP_RESUME);
 
 	/* The code below assumes runtime PM to be disabled. */
 	WARN_ON(pm_runtime_enabled(&pdev->dev));
diff --git a/include/linux/pm.h b/include/linux/pm.h
index cdb8fbd6ab18..35796fc49e7a 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -547,7 +547,7 @@ struct pm_subsys_data {
  * NO_DIRECT_COMPLETE: Do not apply direct-complete optimization to the device.
  * SMART_PREPARE: Check the return value of the driver's ->prepare callback.
  * SMART_SUSPEND: No need to resume the device from runtime suspend.
- * LEAVE_SUSPENDED: Avoid resuming the device during system resume if possible.
+ * MAY_SKIP_RESUME: Avoid resuming the device during system resume if possible.
  *
  * Setting SMART_PREPARE instructs bus types and PM domains which may want
  * system suspend/resume callbacks to be skipped for the device to return 0 from
@@ -562,13 +562,13 @@ struct pm_subsys_data {
  * invocations of the ->suspend_late and ->suspend_noirq callbacks provided by
  * the driver if they decide to leave the device in runtime suspend.
  *
- * Setting LEAVE_SUSPENDED informs the PM core and middle-layer code that the
+ * Setting MAY_SKIP_RESUME informs the PM core and middle-layer code that the
  * driver prefers the device to be left in suspend after system resume.
  */
 #define DPM_FLAG_NO_DIRECT_COMPLETE	BIT(0)
 #define DPM_FLAG_SMART_PREPARE		BIT(1)
 #define DPM_FLAG_SMART_SUSPEND		BIT(2)
-#define DPM_FLAG_LEAVE_SUSPENDED	BIT(3)
+#define DPM_FLAG_MAY_SKIP_RESUME	BIT(3)
 
 struct dev_pm_info {
 	pm_message_t		power_state;
-- 
2.16.4




