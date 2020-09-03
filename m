Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB1125BCF3
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 10:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgICIPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 04:15:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:11134 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728807AbgICIPo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 04:15:44 -0400
IronPort-SDR: 8aasJwJ8OdVhdK3q6ewGNN2YoXr/Dii7kTgbnPljM2Elw8Im+GYEWN/wYb9bzN2n+CkO6Vx2+Y
 FsGTc2yhYnDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="154939220"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="154939220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 01:15:43 -0700
IronPort-SDR: EAXJbZnsEs/BQyZ5dVBgJOC2gV6IhKzVeGK0MVe2vovYcr93xjn8kWkFFVu84U62kXLFXI5bgB
 J+Edj+OLZDhw==
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; 
   d="scan'208";a="331719609"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 01:15:40 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 78D092098B;
        Thu,  3 Sep 2020 11:15:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kDkPO-0001cC-J5; Thu, 03 Sep 2020 11:15:50 +0300
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
Subject: [PATCH v8 2/6] Documentation: ACPI: Document i2c-allow-low-power-probe _DSD property
Date:   Thu,  3 Sep 2020 11:15:46 +0300
Message-Id: <20200903081550.6012-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the probe-low-power _DSD property and how it is used with I²C
drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../acpi/dsd/i2c-allow-low-power-probe.rst    | 60 +++++++++++++++++++
 Documentation/firmware-guide/acpi/index.rst   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/firmware-guide/acpi/dsd/i2c-allow-low-power-probe.rst

diff --git a/Documentation/firmware-guide/acpi/dsd/i2c-allow-low-power-probe.rst b/Documentation/firmware-guide/acpi/dsd/i2c-allow-low-power-probe.rst
new file mode 100644
index 0000000000000..7e7ed3ad3ac69
--- /dev/null
+++ b/Documentation/firmware-guide/acpi/dsd/i2c-allow-low-power-probe.rst
@@ -0,0 +1,60 @@
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
+beyond just powering on the said device. Linux recognizes the _DSD property [1]
+"i2c-allow-low-power-probe" that can be used for this purpose.
+
+How it works
+============
+
+The boolean device property "i2c-allow-low-power-probe" may be used to tell
+Linux that the I²C framework should instruct the kernel ACPI framework to leave
+the device in the low power state. If the driver indicates its support for this
+by setting the I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag in struct i2c_driver.flags
+field and the "i2c-allow-low-power-probe" property is present, the device will
+not be powered on for probe.
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
+		Name (PRT4, Package() {
+			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
+			Package () {
+				Package () { "i2c-allow-low-power-probe", 1 },
+			}
+                })
+	}
+
+References
+==========
+
+[1] Device Properties UUID For _DSD.
+    https://www.uefi.org/sites/default/files/resources/_DSD-device-properties-UUID.pdf,
+    referenced 2020-09-02.
diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
index ad3b5afdae77e..1f87b7072d1e6 100644
--- a/Documentation/firmware-guide/acpi/index.rst
+++ b/Documentation/firmware-guide/acpi/index.rst
@@ -11,6 +11,7 @@ ACPI Support
    dsd/graph
    dsd/data-node-references
    dsd/leds
+   dsd/i2c-allow-low-power-probe
    enumeration
    osi
    method-customizing
-- 
2.20.1

