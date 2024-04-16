Return-Path: <linux-i2c+bounces-2960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57FE8A63C1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 08:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9001D28409D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 06:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B332628D;
	Tue, 16 Apr 2024 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfYCwy/3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8C8EEAB
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 06:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713249092; cv=none; b=YshdwpCA8rJCsLTie8TfLB2HhHsUrhBGbghntKbxjsUokE3UFu2LVbLyLZhXvjwGWnImnsHiqcALUGyi/2Svp8CGYgNfqE+VQgAkPDSf5lRKPrnaDIMl4qtIDm2aYlmvQ0P2b/QVIHRYL/1iK/QLWYoDLOFlUItfdgDjwSjCMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713249092; c=relaxed/simple;
	bh=SBu2jOfREO+rmzaoTZreupV/HQyAjnejIhptpU4lPW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3FHpE2qPwOA1OwNTxNVplv14lLwGYn9eWxXoA8q4c9Rugl6d+cs9H9XObpdyU/JC0CjmBkKQ2hCXqOObJuqzAmsqq9saoZ70eSjBjwoxHVRjq1L1/1mgWbQMhCMb5fzBI055nKDgdG40O616Fd1ftShipD241Md3dgggbnPYFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfYCwy/3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713249091; x=1744785091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SBu2jOfREO+rmzaoTZreupV/HQyAjnejIhptpU4lPW4=;
  b=WfYCwy/3FJ26qL3GatNaK4v7D51KcZJzBUYxEwWMObaANMYFVRhSKHWW
   hhMCwcGurzhVJ9X5nSRZj6T3U3Mengo85FLGzSUEg/zOWyFuNwRC0Q0dP
   mFQOlbSKumbrYCExHbrFyMwv1EqPLhB1aEB7/GvdhyTxYrDrfBOStF4Ng
   LV+290t1jQBnl+8TCCrUYf15aCrTbuNz+qDsV4t2hAeMoVvJmxS6TpHME
   +aZD/vUO546xSVXhsoz6D7Q2GRncvWzKM4vsWg1ZhTB/ZG4ddUs2dsU17
   GYK/UtcPHTfmIcsesEHPOyUuVxOTxZdUgI3fi/O+LQWmCejrjFPmX5Puw
   Q==;
X-CSE-ConnectionGUID: YLWQfquBQ8qJhCuy0J+M6A==
X-CSE-MsgGUID: Aw+XG8c1SVCo7gZNCBH5MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8530235"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8530235"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:31:30 -0700
X-CSE-ConnectionGUID: qgADT5ClQi2FMtOF7wDs+w==
X-CSE-MsgGUID: jviGUwS7SFmc+Mdjr2WXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26954636"
Received: from ehlflashnuc2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.57])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 23:31:28 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Shanth Murthy <shanth.murthy@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: designware: Add ACPI ID for Granite Rapids-D I2C controller
Date: Tue, 16 Apr 2024 09:31:25 +0300
Message-ID: <20240416063125.2303139-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shanth Murthy <shanth.murthy@intel.com>

Granite Rapids-D has additional I2C controller that is enumerated via
ACPI. Add ACPI ID for it.

Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4ab41ba39d55..926fb74a8570 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -46,6 +46,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "INT33C3", 0 },
 	{ "INT3432", 0 },
 	{ "INT3433", 0 },
+	{ "INTC10EF", 0 },
 	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
 	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
 	{ "AMD0010", ACCESS_INTR_MASK },
-- 
2.43.0


