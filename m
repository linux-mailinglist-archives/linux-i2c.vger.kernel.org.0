Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C4939A524
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 17:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFCQAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 12:00:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:44027 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhFCQAh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 12:00:37 -0400
IronPort-SDR: +oDJh2ACPQfw9pgIMXf8tM23yUm7Pu0afU4PlbUSDEC/34cpHzV+kr++o3/vADKBh+5Xwu6R4j
 NJzQ+PAQc7gQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="267937931"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="267937931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 08:58:52 -0700
IronPort-SDR: 3AmhiBndD5HRvHScAb/vzslKKjaUTZctjEY0b3QQjqF4uFahohc/ianMSQfCkc7ZXegh3TSTia
 HlM+vvfBFsUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="468012119"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2021 08:58:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DBDC1269; Thu,  3 Jun 2021 18:59:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsas@kernel.org
Subject: [PATCH v1 1/3] units: Add SI metric prefix definitions
Date:   Thu,  3 Jun 2021 18:59:08 +0300
Message-Id: <20210603155910.35530-1-andriy.shevchenko@linux.intel.com>
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

