Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313233C5E3C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 16:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhGLOWy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 10:22:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:21743 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233927AbhGLOWy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Jul 2021 10:22:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="273821538"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="273821538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 07:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="629677382"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2021 07:20:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7D03BFF; Mon, 12 Jul 2021 17:20:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH v3 1/3] units: Add SI metric prefix definitions
Date:   Mon, 12 Jul 2021 17:20:25 +0300
Message-Id: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
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
v3: converted to be unsigned values (Joe)
 include/linux/units.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/units.h b/include/linux/units.h
index dcc30a53fa93..4a25e0cc8fb3 100644
--- a/include/linux/units.h
+++ b/include/linux/units.h
@@ -4,6 +4,22 @@
 
 #include <linux/math.h>
 
+/* Metric prefixes in accordance with Système international (d'unités) */
+#define PETA	1000000000000000ULL
+#define TERA	1000000000000ULL
+#define GIGA	1000000000UL
+#define MEGA	1000000UL
+#define KILO	1000UL
+#define HECTO	100UL
+#define DECA	10UL
+#define DECI	10UL
+#define CENTI	100UL
+#define MILLI	1000UL
+#define MICRO	1000000UL
+#define NANO	1000000000UL
+#define PICO	1000000000000ULL
+#define FEMTO	1000000000000000ULL
+
 #define MILLIWATT_PER_WATT	1000L
 #define MICROWATT_PER_MILLIWATT	1000L
 #define MICROWATT_PER_WATT	1000000L
-- 
2.30.2

