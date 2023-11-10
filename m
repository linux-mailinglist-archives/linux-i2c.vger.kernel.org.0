Return-Path: <linux-i2c+bounces-16-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E17E8148
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA84EB20CCD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC5C3A287;
	Fri, 10 Nov 2023 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsprGHiW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7C39876
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:27:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C5010CF61;
	Fri, 10 Nov 2023 10:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640689; x=1731176689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+t/+ISVMikofYDc4BCdaYrj3cszrb8orFAWjbmSNNG4=;
  b=KsprGHiWKuLkain6y7D6j+vQl5rKqTWLuMaxUIHvH1qRQ6cgAQ9G7soQ
   Jo+JK8hBLxeJ9O9wE+qLGTfuScRxY6ONtiOgZoT1bucOrhCbkeM77y2NB
   hu6k7JT8rmu+nS9LkZNU3Rd+lm3zFl8KtkVwruCcf31g+t8N+fmWpcDWc
   pCOduZZ1ZNTUvkvUg53OscNrHMseGm064XPbd5y6MMgNn8GFG3H4kIrFt
   g4mklWQkZVRgdWn/01pNE6PSMU3AAcICusRaJsqH306Kts653Iyuso2z5
   hFbge1mnAHT/DaDzbSh1qPhvkjhgK5RGf1BUpHbxdpLbozXducSHHefYA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251938"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251938"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663753"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663753"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E04D0852; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 12/25] i2c: designware: Drop return value from i2c_dw_acpi_configure()
Date: Fri, 10 Nov 2023 20:11:32 +0200
Message-ID: <20231110182304.3894319-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_dw_acpi_configure() is called without checking of the returned
value, hence just drop it by converting to void.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 4 +---
 drivers/i2c/busses/i2c-designware-core.h   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index affcfb243f0f..8d2223d164e3 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -255,7 +255,7 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
 	kfree(buf.pointer);
 }
 
-int i2c_dw_acpi_configure(struct device *device)
+void i2c_dw_acpi_configure(struct device *device)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 	struct i2c_timings *t = &dev->timings;
@@ -285,8 +285,6 @@ int i2c_dw_acpi_configure(struct device *device)
 		dev->sda_hold_time = fs_ht;
 		break;
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index f8dd87cb0ae9..b7884f15e0e9 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -399,7 +399,7 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
-int i2c_dw_acpi_configure(struct device *device);
+void i2c_dw_acpi_configure(struct device *device);
 #else
-static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
+static inline void i2c_dw_acpi_configure(struct device *device) { }
 #endif
-- 
2.43.0.rc1.1.gbec44491f096


