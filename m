Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA26D311602
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbhBEWr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:47:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:60933 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229959AbhBEN2w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:28:52 -0500
IronPort-SDR: bddQPWHzeoSAMSHsOqoxWeS/RdT8900zcMB6YvYOpHqkI72WAtuVnsB1vTmApN3vPfD9qvbHRd
 SA16q4rA4zqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="160589439"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="160589439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:56 -0800
IronPort-SDR: exWrynaxi8nwsAbdPFhPyxc/U2dfzuhauTirkVS6W2IifPhiOPeSDsPekze/NI4HnzifAq77Ov
 12UU4uW5QArw==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="393862627"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:53 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 822D7205D2;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GE-9P; Fri, 05 Feb 2021 15:25:05 +0200
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
Subject: [PATCH v10 1/7] ACPI: scan: Obtain device's desired enumeration power state
Date:   Fri,  5 Feb 2021 15:24:59 +0200
Message-Id: <20210205132505.20173-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
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
index 1d7a02ee45e05..cdff32f297122 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -987,6 +987,7 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
 
 static void acpi_bus_get_power_flags(struct acpi_device *device)
 {
+	unsigned long long dse = ACPI_STATE_D0;
 	u32 i;
 
 	/* Presence of _PS0|_PR0 indicates 'power manageable' */
@@ -1008,6 +1009,9 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
 	if (acpi_has_method(device->handle, "_DSW"))
 		device->power.flags.dsw_present = 1;
 
+	acpi_evaluate_integer(device->handle, "_DSE", NULL, &dse);
+	device->power.state_for_enumeration = dse;
+
 	/*
 	 * Enumerate supported power management states
 	 */
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 02a716a0af5d4..becfc9f57002b 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -276,6 +276,7 @@ struct acpi_device_power {
 	int state;		/* Current state */
 	struct acpi_device_power_flags flags;
 	struct acpi_device_power_state states[ACPI_D_STATE_COUNT];	/* Power states (D0-D3Cold) */
+	u8 state_for_enumeration; /* Maximum power state for enumeration */
 };
 
 /* Performance Management */
-- 
2.20.1

