Return-Path: <linux-i2c+bounces-9295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0220AA270A6
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 12:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95A2F16538A
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 11:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B9B20C48D;
	Tue,  4 Feb 2025 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZFLOFK7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C0207669;
	Tue,  4 Feb 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669961; cv=none; b=i3mY2w9FdOQidf7wpr116aXgqa6xfxOBGSATaKwXrV+DN8ct+vD2LUvteKCLZ1twfdOM5RYLfRBInQhY1YL3B0Mh9V5Rz9FgO6A7FCNt6wTvl9IJmrzv3uZ9cyEOhvqNTnBCjR/vLmeDIbtjjwXPNlfX1V4W0ZTINmPSXJNkHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669961; c=relaxed/simple;
	bh=CZk3NRt+awXkFf9oDiWGmy0neYsma28NTK8sAxUNCLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBmuBE+g8GGyTJosUFP/M1ax/SXPHmDhBbAam7SA2Z7UK37y/rciieR8X/jFmUf6EiMw8JnViX+MckH7IUVd6zQXv9HO2RX+ksmg28u6foZMIC/tpLAZzV3NOS+yzQ2/BtfLGIkm8U8wt2sKFvOhlyIhQ0wvVvg+9yzZA4qdm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZFLOFK7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738669960; x=1770205960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CZk3NRt+awXkFf9oDiWGmy0neYsma28NTK8sAxUNCLs=;
  b=gZFLOFK7jMseWksAwDppdxq8glyQ1ZR0B2Kye/5Y6AEgsLFSS2S4pspk
   /ThTfPG1DL4AJ6mPbi3mEAup3pL1t9wwrrMM9LpprPZP8OxFBmw7hzV+i
   YHVfKtm/TIu+o4QhKRd4QnhFtYurZ9ixRw04DaANgzbq/TgdlDKN6KDIw
   N3LOcnOYZMnEWGMgVUJLYyxYjBrwFbkT/Cuj4yqeZHPdN0a4ydxRpBcpk
   iU0whpBU3PjrFHPCwaQJHYYQUfu/NEBIPYOOydH7hEnMF9/QKZ2KTGVjZ
   S2OOHagt9SsGebDzA0gk9RHfkbhKTlfa9tDuS6CA5Yj+0y4jy5wW5yVT+
   Q==;
X-CSE-ConnectionGUID: j8ReC7yWRJuvCbOnivbYog==
X-CSE-MsgGUID: h1OAVIt/SpOouiBYjUua4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43114377"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="43114377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 03:52:39 -0800
X-CSE-ConnectionGUID: R7xWqavETYWrCBfW09v7eg==
X-CSE-MsgGUID: 5wTh8YELQYWOT/BoSLYLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115760838"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2025 03:52:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 87825299; Tue, 04 Feb 2025 13:52:36 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Use my kernel.org address for I2C ACPI work
Date: Tue,  4 Feb 2025 13:52:36 +0200
Message-ID: <20250204115236.3973371-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to use my kernel.org address for I2C ACPI work.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26c8b7055531..1753e1a8b9d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10822,7 +10822,7 @@ S:	Odd Fixes
 F:	drivers/tty/hvc/
 
 I2C ACPI SUPPORT
-M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+M:	Mika Westerberg <westeri@kernel.org>
 L:	linux-i2c@vger.kernel.org
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
-- 
2.47.2


