Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A6916A9B2
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgBXPPp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:45 -0500
Received: from mga09.intel.com ([134.134.136.24]:62974 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728008AbgBXPPo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="384165586"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2020 07:15:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 497961A5; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 03/40] i2c: core: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:14:53 +0200
Message-Id: <20200224151530.31713-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 2 +-
 drivers/i2c/i2c-core-base.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8f3dbc97a057..b52d2d8f7258 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -318,7 +318,7 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 		lookup->min_speed = lookup->speed;
 
 	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
-		lookup->force_speed = 400000;
+		lookup->force_speed = I2C_FAST_MODE_FREQ;
 
 	return AE_OK;
 }
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cefad0881942..1116d0e2de6d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1612,13 +1612,13 @@ void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_de
 
 	ret = device_property_read_u32(dev, "clock-frequency", &t->bus_freq_hz);
 	if (ret && use_defaults)
-		t->bus_freq_hz = 100000;
+		t->bus_freq_hz = I2C_STANDARD_MODE_FREQ;
 
 	ret = device_property_read_u32(dev, "i2c-scl-rising-time-ns", &t->scl_rise_ns);
 	if (ret && use_defaults) {
-		if (t->bus_freq_hz <= 100000)
+		if (t->bus_freq_hz <= I2C_STANDARD_MODE_FREQ)
 			t->scl_rise_ns = 1000;
-		else if (t->bus_freq_hz <= 400000)
+		else if (t->bus_freq_hz <= I2C_FAST_MODE_FREQ)
 			t->scl_rise_ns = 300;
 		else
 			t->scl_rise_ns = 120;
@@ -1626,7 +1626,7 @@ void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_de
 
 	ret = device_property_read_u32(dev, "i2c-scl-falling-time-ns", &t->scl_fall_ns);
 	if (ret && use_defaults) {
-		if (t->bus_freq_hz <= 400000)
+		if (t->bus_freq_hz <= I2C_FAST_MODE_FREQ)
 			t->scl_fall_ns = 300;
 		else
 			t->scl_fall_ns = 120;
-- 
2.25.0

