Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8997031740A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Feb 2021 00:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234222AbhBJXLq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 18:11:46 -0500
Received: from mga03.intel.com ([134.134.136.65]:18268 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232578AbhBJXKR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Feb 2021 18:10:17 -0500
IronPort-SDR: xAr1KMuC7k01DlyKh1KTe2apER90107GxEkfJIF3Sq8gHCxgfSvmMezHpewT0roB3FLpYHtDhR
 FcxihCcsdJ8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="182233228"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="182233228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 15:08:06 -0800
IronPort-SDR: 5LKcnIsjQMODyiwUZavTP9a10ehotS3GefcEwHkWUX1Go+g3zfMdXJu29F3a9GLNx/g0MfJdxx
 FCbvpVPszeSg==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="361506953"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 15:08:03 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 464A4204A6;
        Thu, 11 Feb 2021 01:08:01 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l9yaW-0007tQ-TP; Thu, 11 Feb 2021 01:08:00 +0200
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
Subject: [PATCH v11 1/7] ACPI: scan: Obtain device's desired enumeration power state
Date:   Thu, 11 Feb 2021 01:07:54 +0200
Message-Id: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210230800.30291-1-sakari.ailus@linux.intel.com>
References: <20210210230800.30291-1-sakari.ailus@linux.intel.com>
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
index a184529d8fa40..6a9b4a92c4f66 100644
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

