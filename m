Return-Path: <linux-i2c+bounces-15066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A286CD12F57
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C685C300EDBB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3E71EEA3C;
	Mon, 12 Jan 2026 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YN1uvboQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E1352F95;
	Mon, 12 Jan 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226169; cv=none; b=ccrC15YmjuicdBAL27tdH1YDsOA1jNtq4Y6W9//J/cmODoLDMvMSo0RhbxuvDKiqFj4lZtH5aG/JHEvzVQqu/QOWWCI+fvm+v5bPnb/X2vNKE0SdkAAwyJCfOpxMKD3W4FR5zWK8j89xnswiF4QbCcXTWBKh7h9vpypug1A7PjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226169; c=relaxed/simple;
	bh=gGX2FfAPk6M8Ih0BqvPOm0ic4advloeSToIYe9TDyXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5WUEb9Pm8wGSXAadgvnPsm7EMINNq3jpyl2SqU/65pQegk1XYrYLNqD3DM+aQx/yP86/k+o0mZ8BtbaG9kq0eO//cFzcllYJRWKptKgrQlHZkbESZOxBSt1mWAbQEA8CukirPl31P8joeJB9DO7NVZwz/4qsc3KPOJnERlZrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YN1uvboQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768226169; x=1799762169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gGX2FfAPk6M8Ih0BqvPOm0ic4advloeSToIYe9TDyXA=;
  b=YN1uvboQxb5HU1X/KmL845f+0DhDzGSPFUIVLR0QYrND1MWxjuUd5D0S
   XsWClTkAlWq2EvRPhBP2V/CV5KV3h1nJLSG4OtaZ7S0fukXjICS3yWVSS
   0MIpDLv3dnNgxbFYzpKlgCR6wQgZg2QtfiQbWjpiCWdwmRhoQaje1JBnB
   d0df7D/8aGIYOqucar2OlRrxA2qbBmpAfywl9DMFKT1MaFv/ahKUjLwue
   n2pYX3OieEXpcwm+K4IwxvafqjsjohvrV0LXnUVnblbhlGwxoyg93wZiR
   fD7kPV/gPD8pqefHN9dlkuwZoOJgJXzWUjeJBQznRKoHGu2pfgEDJrk86
   Q==;
X-CSE-ConnectionGUID: 6mkVqmXBS/m9QxvJoqPeYg==
X-CSE-MsgGUID: ndoKZkWfQ5uhuT9IXize1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69397031"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69397031"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:56:07 -0800
X-CSE-ConnectionGUID: /IoJN4lTTFy/PWQeLTVimA==
X-CSE-MsgGUID: sNKw4g8WRlqF0gElGDIDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208246185"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 05:56:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 857A699; Mon, 12 Jan 2026 14:56:04 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 1/2] i2c: mlxbf: Remove unused bus speed definitions
Date: Mon, 12 Jan 2026 14:55:10 +0100
Message-ID: <20260112135603.4150952-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
References: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver had been converted to use standard constants for the bus speed
a long time ago. Remove the leftover definitions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 746f65989138..9f0048044112 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -324,12 +324,6 @@
 		.name = (str) \
 	}
 
-enum {
-	MLXBF_I2C_TIMING_100KHZ = 100000,
-	MLXBF_I2C_TIMING_400KHZ = 400000,
-	MLXBF_I2C_TIMING_1000KHZ = 1000000,
-};
-
 enum {
 	MLXBF_I2C_F_READ = BIT(0),
 	MLXBF_I2C_F_WRITE = BIT(1),
-- 
2.50.1


