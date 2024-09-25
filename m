Return-Path: <linux-i2c+bounces-6987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077E986045
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7631F266A0
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA58C1A00C9;
	Wed, 25 Sep 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2dRC7IW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189701714B3;
	Wed, 25 Sep 2024 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268564; cv=none; b=e0uH+8a8DdpKSRa4T09A96mNKZSrn89s8JU+cxdb5qREBvtOTmjU0LOWF2kwshgB6eQnAUnY4tnHS+IIWPPcWUS12cUhUduaxdN+jlfw46ThkgopDFHPseep6RWHBjzMAAEvrEPMx+2jkSF73HtoYIC0M6R6I+JYdeNkOn5uYM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268564; c=relaxed/simple;
	bh=5RIOBrRF9ez0h7B4LKfAx/ru3PPT1T2Ok372Rz4lkHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slAy3GgTczerL+16idGIv4Teu872cX+dbYSM9Q+cbcyDqzeLVJeWgISzPyI/z01SuNOGLCMfNwO7cv1XUhITNGOOXHG2M8UIHdyuTCPv0hS5lhgedZNA2gzVYm6L3Fq9EqE/7T83sK0lsDY9iVcTy9Bgp67yXpCqXq0XlQIfRWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2dRC7IW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727268562; x=1758804562;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5RIOBrRF9ez0h7B4LKfAx/ru3PPT1T2Ok372Rz4lkHM=;
  b=l2dRC7IWawRFonmh9oz1DmTi7TmxizoMOEyC0FdKrue/jqYdo9Q6j7c3
   B5+kROy+GE3MD7ydjkQMhCgfv+0AyVEJUHuw1yXdhQqzGGaxVUry8D5ed
   xBT8j0Qjdqm59m6oRXEocqrD5Pu0bUvziZ9HDMiOVobhFXHQ7DXglZI1C
   sIf7f9fYnbkwYDebM5W1aev4VOJRBKQKmjmojcIM9VseLUGv48Y9RLX7X
   MJso/fRQ5Oqrq+Spd/KLPV2GPDySVVA8aG7nHNy69+uWMn+pgEIQNxkYd
   Hf2oJPLRRfD47t/yoCpov+bfUlcV7T1gTYdFUPIXdqWYBpVcSQ+8jyqWf
   Q==;
X-CSE-ConnectionGUID: xDJI6YCtRgGiaNJs7bwB6w==
X-CSE-MsgGUID: bV7Y/f7NTySq3KInOd/+2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36878353"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36878353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 05:49:21 -0700
X-CSE-ConnectionGUID: gk012kXYRS2dfqtsgr1flw==
X-CSE-MsgGUID: F7ua0lydS0+2RaSWx1JnIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72577337"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 05:49:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 87E85565; Wed, 25 Sep 2024 15:49:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 0/5] i2c: designware: Cleanups (part 4)
Date: Wed, 25 Sep 2024 15:44:18 +0300
Message-ID: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the subset of the patches [1] that should not affect any
functionality. Here are:
- tiding up the probe and remove functions
- dead and redundant code removal
- spelling fixes

In any case this is Cc'ed to AMD who reported a problem in [1]
presumably in the patch that is *not* included here.

Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]

This is assumed to be the last straightforward patch series to clean up
the driver. The rest is directly related or dependent on the reported
problem and needs more thinking and work. Perhaps I can do it in the
future.

Andy Shevchenko (5):
  i2c: designware: Use temporary variable for struct device
  i2c: designware: Get rid of redundant 'else'
  i2c: designware: Remove 'cond' from i2c_dw_scl_hcnt()
  i2c: designware: Use sda_hold_time variable name everywhere
  i2c: designware: Fix spelling and other issues in the comments

 drivers/i2c/busses/i2c-designware-amdpsp.c  | 10 ++--
 drivers/i2c/busses/i2c-designware-common.c  | 66 +++++++--------------
 drivers/i2c/busses/i2c-designware-core.h    | 12 ++--
 drivers/i2c/busses/i2c-designware-master.c  | 17 +++---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 39 ++++++------
 drivers/i2c/busses/i2c-designware-platdrv.c | 52 ++++++++--------
 drivers/i2c/busses/i2c-designware-slave.c   |  6 +-
 7 files changed, 90 insertions(+), 112 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


