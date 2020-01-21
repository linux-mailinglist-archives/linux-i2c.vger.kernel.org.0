Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C40A7143E2F
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 14:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgAUNlv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 08:41:51 -0500
Received: from mga02.intel.com ([134.134.136.20]:28735 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729159AbgAUNlt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 08:41:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 05:41:49 -0800
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; 
   d="scan'208";a="275304981"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 05:41:45 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9EA1620B1D;
        Tue, 21 Jan 2020 15:41:39 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ittn4-0005K5-1c; Tue, 21 Jan 2020 15:41:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v4 6/6] Documentation: ACPI: Document probe-low-power _DSD property
Date:   Tue, 21 Jan 2020 15:41:57 +0200
Message-Id: <20200121134157.20396-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
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
 .../acpi/dsd/probe-low-power.rst              | 28 +++++++++++++++++++
 Documentation/firmware-guide/acpi/index.rst   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/firmware-guide/acpi/dsd/probe-low-power.rst

diff --git a/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
new file mode 100644
index 0000000000000..e0343ffefe071
--- /dev/null
+++ b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Probing I²C devices in low power state
+======================================
+
+Introduction
+============
+
+In some cases it may be preferred to leave certain devices powered off for
+the entire system bootup if powering on these devices has adverse side
+effects, beyond just powering on the said device. The _DSD property
+"probe-low-power" has been defined for this purpose.
+
+How it works
+============
+
+The property "probe-low-power" boolean property may be used to tell Linux
+that the I²C framework should instruct the kernel ACPI framework to leave
+the device in the low power state. If the driver indicates its support for
+this in its struct i2c_driver.probe_low_power field and the
+"probe-low-power" property is present, the device will not be powered on
+for probe.
+
+The downside is that as the device is not powered on, even if there's a
+problem with the device, the driver likely probes just fine but the first
+user will find out the device doesn't work, instead of a failure at probe
+time. This feature should thus be used sparingly.
diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
index ad3b5afdae77e..4e4ac675c0ff8 100644
--- a/Documentation/firmware-guide/acpi/index.rst
+++ b/Documentation/firmware-guide/acpi/index.rst
@@ -11,6 +11,7 @@ ACPI Support
    dsd/graph
    dsd/data-node-references
    dsd/leds
+   dsd/probe-low-power
    enumeration
    osi
    method-customizing
-- 
2.20.1

