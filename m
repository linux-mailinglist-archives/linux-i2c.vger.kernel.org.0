Return-Path: <linux-i2c+bounces-9397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7DA32BFD
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A0A3AB6A7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDF8254AF8;
	Wed, 12 Feb 2025 16:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cka/+aPn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052CD1E7C19;
	Wed, 12 Feb 2025 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378228; cv=none; b=YpPcnFefLipAtIfbk9PyaknaYwmCEvV5gW8MXAcbEYyJD1L1/DVCVJzbMUDujfoJTAoK9s8+MqPe/O7WSVv+6ZG3slD0JIHK+B3dUW5IOPNctvnfkN1EI+cQt66kw8ELeXnr/NaMIM3tZw+SX/lAcKMMp4TOAh1PDJDmpdmkMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378228; c=relaxed/simple;
	bh=P6aII8ilsDybwTSbYzyPmA7MsJN4GMm9OftXYL5dhUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXcsyZJpXD4Dh2S4BI6zC/4Fawh2RBMUwM9z7DlSuGTqdOTU7KrRUtFbev9fDp0XjYHBxiufqUzjQ1JUuemOEvt3Qbm+6ttZD8CFadzVCGFmMYvrxwUgEbKnUlBRrB7+6wbMRltcbyzHOsytI3vlQt3/X+TvPWUASkAdWRoNTZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cka/+aPn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378227; x=1770914227;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P6aII8ilsDybwTSbYzyPmA7MsJN4GMm9OftXYL5dhUw=;
  b=Cka/+aPnwHuCXHJ6omvU7q6vxq95iyWJEqdX0AbT8u/dnq1fw+YTaSVT
   Tab4lu562ffNcwtNKclNUY1sUMdvnqj6aLXiRjew63yyt/7ZbgUJa5Asq
   bJ1PzeRZBxEbhUxi4jzBMJ6eicZf8O+F5w+CtyGY4UdpK8VrvBAqY6T84
   nE78ppJQ3wl9/E4Zt/+fMXAWV0CoAAYi+4QCvzgbW+83j2jScngKgelf1
   PtoCc/uXNOWLJnjahNTkE23StufXLvadKc1NjYK86dOp1VlDF+3wVeGHG
   Hz/dfRl9E9gATCFdeW4aX/46k0gW3uZURBH82hBc+20QIfcgSnZyKAWo7
   A==;
X-CSE-ConnectionGUID: qgZOSIjgThCNAUa1i+G+8Q==
X-CSE-MsgGUID: Kk9VdGl/QgqnTu2AGs7Apw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39280410"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39280410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:37:05 -0800
X-CSE-ConnectionGUID: BHLNabmMSCuW5RGaffta8w==
X-CSE-MsgGUID: Jni5FjuLTdKM4CS9pQzuWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="112643531"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2025 08:37:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7A1D911E; Wed, 12 Feb 2025 18:37:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: core: Propagate all possible errors when requesting recovery GPIOs
Date: Wed, 12 Feb 2025 18:37:01 +0200
Message-ID: <20250212163701.2407540-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If GPIO is available but we can't get it by some other, than deferred probe,
reason, propagate it to the caller.

No functional change since i2c_register_adapter() still cares only about
deferred probe.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 35a221e2c11c..8c0d8793a2c2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -374,19 +374,20 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 	 * GPIO recovery is available
 	 */
 	if (!bri->scl_gpiod) {
-		gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
-		if (PTR_ERR(gpiod) == -EPROBE_DEFER) {
-			ret  = -EPROBE_DEFER;
+		gpiod = devm_gpiod_get_optional(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
 			goto cleanup_pinctrl_state;
 		}
-		if (!IS_ERR(gpiod)) {
+
+		if (gpiod) {
 			bri->scl_gpiod = gpiod;
 			bri->recover_bus = i2c_generic_scl_recovery;
 			dev_info(dev, "using generic GPIOs for recovery\n");
 		}
 	}
 
-	/* SDA GPIOD line is optional, so we care about DEFER only */
+	/* SDA GPIO line is optional */
 	if (!bri->sda_gpiod) {
 		/*
 		 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
@@ -394,18 +395,19 @@ static int i2c_gpio_init_generic_recovery(struct i2c_adapter *adap)
 		 */
 		gpiod_direction_output(bri->scl_gpiod, 0);
 		udelay(10);
-		gpiod = devm_gpiod_get(dev, "sda", GPIOD_IN);
+
+		gpiod = devm_gpiod_get_optional(dev, "sda", GPIOD_IN);
 
 		/* Wait a bit in case of a SDA glitch, and then release SCL. */
 		udelay(10);
 		gpiod_direction_output(bri->scl_gpiod, 1);
 
-		if (PTR_ERR(gpiod) == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
 			goto cleanup_pinctrl_state;
 		}
-		if (!IS_ERR(gpiod))
-			bri->sda_gpiod = gpiod;
+
+		bri->sda_gpiod = gpiod;
 	}
 
 cleanup_pinctrl_state:
@@ -427,12 +429,14 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	bool is_error_level = true;
 	char *err_str;
+	int ret;
 
 	if (!bri)
 		return 0;
 
-	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	ret = i2c_gpio_init_recovery(adap);
+	if (ret)
+		return ret;
 
 	if (!bri->recover_bus) {
 		err_str = "no suitable method provided";
-- 
2.45.1.3035.g276e886db78b


