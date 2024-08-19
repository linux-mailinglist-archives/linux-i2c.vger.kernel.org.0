Return-Path: <linux-i2c+bounces-5539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEE9573E2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316881F24305
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF73218A6BE;
	Mon, 19 Aug 2024 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSiWxYPq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9A189B95;
	Mon, 19 Aug 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093168; cv=none; b=LJAZquKGJM+4VUvThuT9fxrX6Q11Onx8hMI4fJLIKMufEE83iS1O6XBhbulxrXAX0lNgjXS3MapgCnFBWH6Q0yv87cKpufu264MKo1oEp6vgD+x0lB3ZEmEb8PghvfMEXMtD+zVkljR/FGy1HYmfeNJkHhgK6E13QMj5vgOgFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093168; c=relaxed/simple;
	bh=mkNNSMfBAMZW4Nn6ZBpwaRQOtJsQvyVVBJeOIk/+FXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs6zhtdzxp0Mg5Kpm6zf5JxbV9oEPBC7MfuEtYZgGAwwx7GTRh+kU8Pg1eTJppmAHZeAzUDCSrXUPa6REkhzBpySvD5SYILloMKc0EvoGFLPPOvpbvyNFWeErnlHu5MLHxRTB/Jn5ZSWpOPDFke4Y5qpeGh7YKmFHL6Hxzx8elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSiWxYPq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093167; x=1755629167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mkNNSMfBAMZW4Nn6ZBpwaRQOtJsQvyVVBJeOIk/+FXA=;
  b=MSiWxYPqRVAxOvX95HalIKP7Q3IVg1JZ6auSaLbairvR3KTuj/WDWHEp
   gev8Oum8qSaUseJ8QI+VZbXE6g9g8hxOtA4RMRiJHSVXR6odTR8PyGFR8
   xvbc7tE2KPCZQIqk6wM8GOKSRS6pJ+KeksrDtATFx6tPhh7OvWawLDStX
   zpYKd2FKeJqjhuDVMcosgPDNhL3BYmRvyACz8QzXRNJF38BL2PCvV5VG5
   l1FcaM54aAqwvRdNx8jFSZnoM3/TmKKE8rmoQ8/lZTlq/tx2blAgEiMWg
   AEwxawMW/unPlS/++zbOmnLvkStyawQXV4y/SHOvnzcpKh7IrEgyM7jTd
   A==;
X-CSE-ConnectionGUID: iGHC2ckqQiSX8qQBD0uzFg==
X-CSE-MsgGUID: n0ZKohzzReOKt5OHQORkQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22537643"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22537643"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:05 -0700
X-CSE-ConnectionGUID: SMEG9SJBTZ+OQQdX6/cJFA==
X-CSE-MsgGUID: YESGG5vAR9iWc5fzM2feTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60433946"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2024 11:46:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0560B2D8; Mon, 19 Aug 2024 21:46:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>,
	grom@black.fi.intel.com,
	84c04d074b1778886a1af1062a4ca9d9afd72306@black.fi.intel.com,
	Mon@black.fi.intel.com, Sep@black.fi.intel.com,
	17@black.fi.intel.com, "00:00:00"@black.fi.intel.com,
	2001@black.fi.intel.com
Subject: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 19 Aug 2024 21:45:06 +0300
Message-ID: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the subset of the patches [1] that should not affect any
functionality. Here is the unification of ID tables, a couple of
function prototypes, and other small cleanups.

In any case this is Cc'ed to AMD who reported a problem in [1]
presumably in the patch that is *not* included here.

Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]

v3:
- fixed one more rebase issue in patch 5 (LKP)

v2:
- fixed rebase issue in patch 5 (LKP)

Andy Shevchenko (7):
  i2c: designware: Replace a while-loop by for-loop
  i2c: designware: Let PCI core to take care about interrupt vectors
  i2c: designware: Add missing 'c' into PCI IDs variable name
  i2c: designware: Unify terminator in device ID tables
  i2c: designware: Always provide device ID tables
  i2c: designware: Drop return value from i2c_dw_acpi_configure()
  i2c: designware: Drop return value from dw_i2c_of_configure()

 drivers/i2c/busses/i2c-designware-common.c  |  4 +-
 drivers/i2c/busses/i2c-designware-core.h    |  4 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 22 ++----
 drivers/i2c/busses/i2c-designware-platdrv.c | 76 +++++++++------------
 4 files changed, 44 insertions(+), 62 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


