Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A65939E03B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhFGPZX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:25:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:24482 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230434AbhFGPZU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 11:25:20 -0400
IronPort-SDR: ju35xT6NFlNRrbETWmzp5lhx+Gm7bkLsL3WlSyZr3XdnoMACQlShHwHVWK55w7Sg8b8uECThq+
 S+k3kYw40/EA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204611124"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="204611124"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 08:23:28 -0700
IronPort-SDR: VPYcu9LpLjRaNJp498khsubMmaiFY1UWv/nJ1JiEAOhpmjiGHfkmTkdjoh/mHNQuBXg3oYgisY
 t1Q1HBvw7rOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="469122169"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2021 08:23:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DC2C7C5; Mon,  7 Jun 2021 18:23:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH v2 1/3] units: Add SI metric prefix definitions
Date:   Mon,  7 Jun 2021 18:23:42 +0300
Message-Id: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sometimes it's useful to have well-defined SI metric prefix to be used
to self-describe the formulas or equations.

List most popular ones in the units.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 include/linux/units.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/units.h b/include/linux/units.h
index dcc30a53fa93..7366fcd45ec2 100644
--- a/include/linux/units.h
+++ b/include/linux/units.h
@@ -4,6 +4,22 @@
 
 #include <linux/math.h>
 
+/* Metric prefixes in accordance with Système international (d'unités) */
+#define PETA	1000000000000000LL
+#define TERA	1000000000000LL
+#define GIGA	1000000000L
+#define MEGA	1000000L
+#define KILO	1000L
+#define HECTO	100L
+#define DECA	10L
+#define DECI	10L
+#define CENTI	100L
+#define MILLI	1000L
+#define MICRO	1000000L
+#define NANO	1000000000L
+#define PICO	1000000000000LL
+#define FEMTO	1000000000000000LL
+
 #define MILLIWATT_PER_WATT	1000L
 #define MICROWATT_PER_MILLIWATT	1000L
 #define MICROWATT_PER_WATT	1000000L
-- 
2.30.2

