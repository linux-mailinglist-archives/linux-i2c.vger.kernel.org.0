Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E2D3081ED
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 00:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhA1Xa4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 18:30:56 -0500
Received: from mga11.intel.com ([192.55.52.93]:4524 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231310AbhA1X3S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 18:29:18 -0500
IronPort-SDR: shD4p6NIhhDYysjMOHVHh5S6pluVZI9JCxZsyDK4Hxw6NgEBIjEk05jhKaplqSoZrLDdWz6SI4
 G+K7y+RAXlrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="176824524"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="176824524"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:27:33 -0800
IronPort-SDR: +ZI6vXBLOqRjUcuHT/LG/VTH07moeD/Zdy9kQBygbrtWx9TEZE9zLp7UchICfQpI7U7kqq5+zu
 e91yvUuuJz/w==
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="354359314"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 15:27:29 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id BB510211D8;
        Fri, 29 Jan 2021 01:27:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l5GhF-0004F8-MI; Fri, 29 Jan 2021 01:27:29 +0200
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
Subject: [PATCH v9 1/7] ACPI: scan: Obtain device's desired enumeration power state
Date:   Fri, 29 Jan 2021 01:27:23 +0200
Message-Id: <20210128232729.16064-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Store a device's desired enumeration power state in struct
acpi_device_power_flags during acpi_device object's initialisation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/acpi/scan.c     | 6 ++++++
 include/acpi/acpi_bus.h | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 1d7a02ee45e05..b077c645c9845 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -987,6 +987,8 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
 
 static void acpi_bus_get_power_flags(struct acpi_device *device)
 {
+	unsigned long long pre;
+	acpi_status status;
 	u32 i;
 
 	/* Presence of _PS0|_PR0 indicates 'power manageable' */
@@ -1008,6 +1010,10 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
 	if (acpi_has_method(device->handle, "_DSW"))
 		device->power.flags.dsw_present = 1;
 
+	status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &pre);
+	if (ACPI_SUCCESS(status) && !pre)
+		device->power.flags.allow_low_power_probe = 1;
+
 	/*
 	 * Enumerate supported power management states
 	 */
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 02a716a0af5d4..020b850120883 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -258,7 +258,8 @@ struct acpi_device_power_flags {
 	u32 power_removed:1;	/* Optimize Dx->D0 */
 	u32 ignore_parent:1;	/* Power is independent of parent power state */
 	u32 dsw_present:1;	/* _DSW present? */
-	u32 reserved:26;
+	u32 allow_low_power_probe:1; /* Allow low power state in device probe */
+	u32 reserved:25;
 };
 
 struct acpi_device_power_state {
-- 
2.20.1

