Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD9A311605
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbhBEWsD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:48:03 -0500
Received: from mga12.intel.com ([192.55.52.136]:61266 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhBENcm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:32:42 -0500
IronPort-SDR: leOgntPwmnYSChsVUgDrn8OD1MXye/2Cb3nWWCKkc3ZO7mTk9XPjYZEBNPevcZjf7/2MFNsv2/
 ioY6CRNZnHJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="160589445"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="160589445"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:57 -0800
IronPort-SDR: tsFjqPXflkKVrUq2GBeFF08LfZfad/IyEnl8GBObhJxqdcToZHgFwnVZJxHtPExxEYBvyftzFA
 jY9NJToJRXJQ==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="373390607"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:53 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 90B8420D38;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GL-C1; Fri, 05 Feb 2021 15:25:05 +0200
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
Subject: [PATCH v10 3/7] Documentation: ACPI: Document _DSE object usage for enum power state
Date:   Fri,  5 Feb 2021 15:25:01 +0200
Message-Id: <20210205132505.20173-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the use of the _DSE object for setting desirable power state
during probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 Documentation/firmware-guide/acpi/index.rst   |  1 +
 .../firmware-guide/acpi/low-power-probe.rst   | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/firmware-guide/acpi/low-power-probe.rst

diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
index f72b5f1769fb2..d02712acccbc0 100644
--- a/Documentation/firmware-guide/acpi/index.rst
+++ b/Documentation/firmware-guide/acpi/index.rst
@@ -25,5 +25,6 @@ ACPI Support
    acpi-lid
    lpit
    video_extension
+   low-power-probe
    extcon-intel-int3496
    intel-pmc-mux
diff --git a/Documentation/firmware-guide/acpi/low-power-probe.rst b/Documentation/firmware-guide/acpi/low-power-probe.rst
new file mode 100644
index 0000000000000..b96804d959a6c
--- /dev/null
+++ b/Documentation/firmware-guide/acpi/low-power-probe.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Probing I²C devices in low power state
+======================================
+
+Introduction
+============
+
+In some cases it may be preferred to leave certain devices powered off for the
+entire system bootup if powering on these devices has adverse side effects,
+beyond just powering on the said device.
+
+How it works
+============
+
+The _DSE (Device State for Enumeration) object that evaluates to integer 0 may
+be used to tell Linux the highest allowed D state for a device during probe. If
+the driver indicates its support for this by setting the
+I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag in struct i2c_driver.flags field and the
+_DSE object evaluates to integer higher than the D state of the device, the
+device will not be powered on (put in D0 state) for probe.
+
+The D states and thus also the allowed values for _DSE are listed below. Refer
+to [1] for more information on device power states.
+
+.. code-block:: text
+
+	Number	State	Description
+	0	D0	Device fully powered on
+	1	D1
+	2	D2
+	3	D3hot
+	4	D3cold	Off
+
+The downside is that as the device is not powered on, even if there's a problem
+with the device, the driver likely probes just fine but the first user will
+find out the device doesn't work, instead of a failure at probe time. This
+feature should thus be used sparingly.
+
+References
+==========
+
+[1] https://uefi.org/specifications/ACPI/6.4/02_Definition_of_Terms/Definition_of_Terms.html#device-power-state-definitions
+
+Example
+=======
+
+An ASL example describing an ACPI device using _DSE object to tell Operating
+System the device should remain powered off during probe looks like this. Some
+objects not relevant from the example point of view have been omitted.
+
+.. code-block:: text
+
+	Device (CAM0)
+        {
+		Name (_HID, "SONY319A")
+		Name (_UID, Zero)
+		Name (_CRS, ResourceTemplate ()
+		{
+			I2cSerialBus(0x0020, ControllerInitiated, 0x00061A80,
+				     AddressingMode7Bit, "\\_SB.PCI0.I2C0",
+				     0x00, ResourceConsumer)
+		})
+		Name (_DSE, 0, NotSerialized)
+		{
+			Return (0x4)
+                }
+	}
-- 
2.20.1

