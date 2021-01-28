Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2473081D9
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 00:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhA1X3Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 18:29:25 -0500
Received: from mga06.intel.com ([134.134.136.31]:55147 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231645AbhA1X3T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 18:29:19 -0500
IronPort-SDR: +D+eCNrfk5MvQp6uFh98y8H3pkxk0rjufz1J18yq3jonoyC8WhIl0edG+3OgkczZif0LELRYRy
 LyWgt364o2Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="241856473"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="241856473"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:27:33 -0800
IronPort-SDR: hlr8EkA9peJ/k/cPmqW8tP0oIOQguldpmVA+yYsXDKWOaT8MJr+JcfiX2QqN9sXlLPhoFtmUzM
 zaLbHek99NSg==
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="411236742"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:27:29 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id C8A2521B1D;
        Fri, 29 Jan 2021 01:27:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l5GhF-0004FG-ON; Fri, 29 Jan 2021 01:27:29 +0200
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
Subject: [PATCH v9 3/7] Documentation: ACPI: Document _PRE object usage for enum power state
Date:   Fri, 29 Jan 2021 01:27:25 +0200
Message-Id: <20210128232729.16064-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the use of the _PRE object for setting desirable power state
during probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/firmware-guide/acpi/index.rst   |  1 +
 .../firmware-guide/acpi/low-power-probe.rst   | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
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
index 0000000000000..3437f8c8f233a
--- /dev/null
+++ b/Documentation/firmware-guide/acpi/low-power-probe.rst
@@ -0,0 +1,51 @@
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
+The _PRE object that evaluates to integer 0 may be used to tell Linux that the
+device should remain in the low power state during probe. If the driver
+indicates its support for this by setting the I2C_DRV_FL_ALLOW_LOW_POWER_PROBE
+flag in struct i2c_driver.flags field and the _PRE object evaluates to integer
+0, the device will not be powered on for probe.
+
+The downside is that as the device is not powered on, even if there's a problem
+with the device, the driver likely probes just fine but the first user will
+find out the device doesn't work, instead of a failure at probe time. This
+feature should thus be used sparingly.
+
+Example
+=======
+
+An ASL example describing an ACPI device using this property looks like
+this. Some objects not relevant from the example point of view have been
+omitted.
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
+		Name (_PRE, 0, NotSerialized)
+		{
+			Return (0x0)
+                }
+	}
-- 
2.20.1

