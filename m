Return-Path: <linux-i2c+bounces-10136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60288A7DA8E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 12:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FEE188AA59
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F9F23496B;
	Mon,  7 Apr 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hdzhcmfw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D2F23535D;
	Mon,  7 Apr 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019944; cv=none; b=A4BpjNj0t/HhkII0+/fx5dw7k6xvGWNCeNrDs/Z7DfTFpVj+OUb84rXpBucyitFk1CgAukRSgOTteoHs3XCRmTc7DqSQldSn3mzIvc/UxVUKsr64SMMlq3348RNtFeiAcJUb6878wNLgg3yPRL3iHWOvpMN+9kycnq8ORO49DPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019944; c=relaxed/simple;
	bh=VjmtEJxQyuUAeqbxtsbBB1tsOJr3EnKvfppmPlAeS9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6BiAecczSpjSnuy5yFK+8HcsyjE7vAAOJASESGxp+wmnl/cmn6h96ICckxEOhfJ63cgB0l1qWK6MwOjwPIW6xeeCBsdtn6FqZuhR1qs03vWI5WBZMlDQ87vtIY47dG4TiXg55n9E0rL58IedVALMbm4EmsDzLA0BeEgFhYcZpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hdzhcmfw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019943; x=1775555943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VjmtEJxQyuUAeqbxtsbBB1tsOJr3EnKvfppmPlAeS9U=;
  b=HdzhcmfwCp918hYcCmCqwwnFO9klzdyuYWZ88Zi3yrgy0/t5EsghAXYe
   ByD/2RosRgU4yPje/qmWoS4fdtc2lIBnkLYS+Du3SHM8AWzbq6KBgtl65
   cT7a3IIU/9i8Cc7m/27DEgcWv6Dww9D7dv5ki6pRIImbnB9n6/hCH/x7D
   mDf7suEUZDCXyP6v9I31Dd8uaue3nmCTXfFWskC1ytZ0o3GeN4VITAobn
   mj7yolfSbkeaT1FUtmau/YmxFX4KugA86ffjHVBrcBuaRFrh4zqE3ZVCr
   Ms4y6W8Yq/pTSiV4WfWHofDnw+TIjZ4QkqmHV9yNqskLwDTmlEV+V0hMl
   g==;
X-CSE-ConnectionGUID: gkAYI08jRw2hs5t2vxQqxQ==
X-CSE-MsgGUID: E0rLP0w6R/q+NuVeVt0CIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49188888"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49188888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:59:00 -0700
X-CSE-ConnectionGUID: EtnsPpHFRO22RdxLKxLZEg==
X-CSE-MsgGUID: wNJRQu/8QLOOlM850Hwvgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128411738"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 02:58:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8A2F5CE; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 6/6] i2c: core: Deprecate of_node in struct i2c_board_info
Date: Mon,  7 Apr 2025 12:55:17 +0300
Message-ID: <20250407095852.215809-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
References: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two members of the same or similar semantics is quite confusing to begin with.
Moreover, the fwnode covers all possible firmware descriptions that Linux kernel
supports. Deprecate of_node in struct i2c_board_info, so users will be warned
and in the future remote it completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc..cc1437f29823 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -405,7 +405,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @addr: stored in i2c_client.addr
  * @dev_name: Overrides the default <busnr>-<addr> dev_name if set
  * @platform_data: stored in i2c_client.dev.platform_data
- * @of_node: pointer to OpenFirmware device node
+ * @of_node: **DEPRECATED** - use @fwnode for this
  * @fwnode: device node supplied by the platform firmware
  * @swnode: software node for the device
  * @resources: resources associated with the device
-- 
2.47.2


