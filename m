Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04C3252CEF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 13:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgHZLvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 07:51:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:45642 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729139AbgHZLvb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 07:51:31 -0400
IronPort-SDR: uhORCpgCt4K2QtCJXkYwrK8+AAfHSAWOhO34i0OVSPGtdxOTED7D51nTPSRfYeAzZmHq7cXLrH
 6VFNurD/xtLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="174324059"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="174324059"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:51:31 -0700
IronPort-SDR: NWN7TnPX9XtMQcf/dtvFTwu+mQMQBbsCSntQBSpupBkvPnyVaLhsK94SEcTf0+r42c/H5S04zH
 1ceirtnYBRVg==
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="499691480"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:51:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 8CEB820E50;
        Wed, 26 Aug 2020 14:50:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1kAu0e-0001bY-Ue; Wed, 26 Aug 2020 14:54:32 +0300
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
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [PATCH v6 6/6] Documentation: ACPI: Document allow-low-power-probe _DSD property
Date:   Wed, 26 Aug 2020 14:54:32 +0300
Message-Id: <20200826115432.6103-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
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
 .../acpi/dsd/allow-low-power-probe.rst        | 28 +++++++++++++++++++
 Documentation/firmware-guide/acpi/index.rst   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst

diff --git a/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
new file mode 100644
index 0000000000000..6fcc89162b898
--- /dev/null
+++ b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
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
+In some cases it may be preferred to leave certain devices powered off for the
+entire system bootup if powering on these devices has adverse side effects,
+beyond just powering on the said device. Linux recognizes the _DSD property
+"allow-low-power-probe" that can be used for this purpose.
+
+How it works
+============
+
+The property "allow-low-power-probe" boolean property may be used to tell Linux
+that the I²C framework should instruct the kernel ACPI framework to leave the
+device in the low power state. If the driver indicates its support for this by
+setting the I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag in struct i2c_driver.flags
+field and the "allow-low-power-probe" property is present, the device will not
+be powered on for probe.
+
+The downside is that as the device is not powered on, even if there's a problem
+with the device, the driver likely probes just fine but the first user will
+find out the device doesn't work, instead of a failure at probe time. This
+feature should thus be used sparingly.
diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
index ad3b5afdae77e..0070fcde9e669 100644
--- a/Documentation/firmware-guide/acpi/index.rst
+++ b/Documentation/firmware-guide/acpi/index.rst
@@ -11,6 +11,7 @@ ACPI Support
    dsd/graph
    dsd/data-node-references
    dsd/leds
+   dsd/allow-low-power-probe
    enumeration
    osi
    method-customizing
-- 
2.20.1

