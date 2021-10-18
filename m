Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1AB432274
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 17:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbhJRPTJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 11:19:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:64667 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232259AbhJRPTI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 11:19:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="215435696"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="215435696"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="566102854"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 7A3EA2047E;
        Mon, 18 Oct 2021 15:17:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1mcRa5-0001fS-G2; Mon, 18 Oct 2021 15:17:29 +0300
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
Subject: [PATCH 1/6] ACPI: scan: Obtain device's desired enumeration power state
Date:   Mon, 18 Oct 2021 15:17:24 +0300
Message-Id: <20211018121729.6357-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
References: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Store a device's desired enumeration power state in struct
acpi_device_power during acpi_device object's initialisation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/acpi/scan.c     | 4 ++++
 include/acpi/acpi_bus.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index dce2c291b982b..a50f1967c73dc 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1017,6 +1017,7 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
 
 static void acpi_bus_get_power_flags(struct acpi_device *device)
 {
+	unsigned long long dsc = ACPI_STATE_D0;
 	u32 i;
 
 	/* Presence of _PS0|_PR0 indicates 'power manageable' */
@@ -1038,6 +1039,9 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
 	if (acpi_has_method(device->handle, "_DSW"))
 		device->power.flags.dsw_present = 1;
 
+	acpi_evaluate_integer(device->handle, "_DSC", NULL, &dsc);
+	device->power.state_for_enumeration = dsc;
+
 	/*
 	 * Enumerate supported power management states
 	 */
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 53b6e9f9de7b4..6b4eb5742869a 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -278,6 +278,7 @@ struct acpi_device_power {
 	int state;		/* Current state */
 	struct acpi_device_power_flags flags;
 	struct acpi_device_power_state states[ACPI_D_STATE_COUNT];	/* Power states (D0-D3Cold) */
+	u8 state_for_enumeration; /* Maximum power state for enumeration */
 };
 
 struct acpi_dep_data {
-- 
2.30.2

