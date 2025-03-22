Return-Path: <linux-i2c+bounces-9980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A1A6CB0A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Mar 2025 15:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A28784A6E71
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Mar 2025 14:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE8322FF35;
	Sat, 22 Mar 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLkIOimq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAC1519BA;
	Sat, 22 Mar 2025 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742654865; cv=none; b=lSz06ZdkLcgjjxWI/U4yVJVfXmRqFrKG+EoZBZRlMG8LAI/LdPRqP9YRQMyJ59j5zVJbx/eaaQmOL9gXV2IDIN2tImy1fuqBxZAWC0avTpFoqeHXOcu+7riOynaf2HvfiTkfhYiIOXtIQ6jmPCW4NuVub6OzY5v0tRRDGLX0nZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742654865; c=relaxed/simple;
	bh=UWilmH81VvW/IyOdVadhkRch5eR9xkS9c8Maq6r0sQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpqWlp4YqC2IAy6htN0GcHKE0Cf3yriujFdgIO7fNphUpMsZ3bbaOLCoXR309YSWAHxv18BMq75L8eu73yzJIHWAgI/fY/7KeJGuS4apAFUQhXB3VCC1lJ21Q3+CXOlQt0yY0dKp0QD+EhX3Afuw2jRkL9o1NAEQIBFFJPP2amk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLkIOimq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742654863; x=1774190863;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UWilmH81VvW/IyOdVadhkRch5eR9xkS9c8Maq6r0sQc=;
  b=WLkIOimq8n9yB6sACSouuTFve95ie9g4PlakEL7isb83mXDeTTL6q4ol
   N0uKwVHhmWnUU5Pbb910a/6kgkxO0ZwUPK53J36kIgiA2jsiXbnTOT6WD
   Cb8IkHweybegl/QW1Qv+q1fmO+0Nex7JSoVEZ9csUgZpBYuqyRPYpckkT
   ViZ274ul6dOmOqbqTmfeelDDe1wrGuAnhckaTE9q9eJ72MPcGxq1HLhTT
   wzPgUtk0AaVxcdGBiuvTGP66LV9esaRjZdPSwGIu4WVRDgRmCj+unIvwu
   Otjzp1I7Y/6BTO1GRiYPLSLvye614ihaU8RVpEgaBHAeJmOJ4LF42lqjz
   w==;
X-CSE-ConnectionGUID: D4mFL0XLSOiA57eF2supvA==
X-CSE-MsgGUID: 8uu+lBCjQMO6RtTQqCKBcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43836778"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="43836778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 07:47:41 -0700
X-CSE-ConnectionGUID: ExEtizJFRXKkpM7SFsANTg==
X-CSE-MsgGUID: 2PBOnmn/TdK639h0Rp4iWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="124168338"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2025 07:47:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AB2C914B; Sat, 22 Mar 2025 16:47:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: qcom-geni: Use generic definitions for bus frequencies
Date: Sat, 22 Mar 2025 16:47:36 +0200
Message-ID: <20250322144736.472777-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 515a784c951c..ccea575fb783 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -71,7 +71,6 @@ enum geni_i2c_err_code {
 									<< 5)
 
 #define I2C_AUTO_SUSPEND_DELAY	250
-#define KHZ(freq)		(1000 * freq)
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
@@ -148,18 +147,18 @@ struct geni_i2c_clk_fld {
  * source_clock = 19.2 MHz
  */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
-	{KHZ(100), 7, 10, 12, 26},
-	{KHZ(400), 2,  5, 11, 22},
-	{KHZ(1000), 1, 2,  8, 18},
-	{},
+	{ I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26 },
+	{ I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18 },
+	{}
 };
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{KHZ(100), 8, 14, 18, 40},
-	{KHZ(400), 4,  3, 11, 20},
-	{KHZ(1000), 2, 3,  6, 15},
-	{},
+	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
+	{}
 };
 
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
@@ -812,7 +811,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				       &gi2c->clk_freq_out);
 	if (ret) {
 		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
-		gi2c->clk_freq_out = KHZ(100);
+		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
 	if (has_acpi_companion(dev))
-- 
2.47.2


