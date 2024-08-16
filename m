Return-Path: <linux-i2c+bounces-5461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C9954FB8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 19:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96D16B21731
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFF21C0DF8;
	Fri, 16 Aug 2024 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1vzmDHU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE709558A5;
	Fri, 16 Aug 2024 17:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828359; cv=none; b=R+eFQBcUBWB6SnOt7VSRqNDU79yQwhAWT6/a+CnqgEBIUXJ3ophidoCgsfwUwjiZytTKw7p9A/tFo2HDGECm16TyOTLaHfhlZefwywGHAR9lnhoJN+k4mp8g1EzbyTf4JQ7YRW/RSTlOMNj4Qvp8mirvs81MiDMnRADsJAJxrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828359; c=relaxed/simple;
	bh=tRnRN8ENBDuDZ999a8CEzdjR6w8o5Zi1KFulJFuTB0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QA+4gkLyxuJwTR1jReGSV2rdwEeUOJD0U76hbSJidhufIT7bSE+bYP0aMUP4+KV3xaRKcSz6pfmMwxk6YTMkw2KA9v+RfiE3L/Y+S6NkUvzGP7eyKtIIO+4xJ4i38GcHzbIpc8+/coCCArVnupOPyJYqANOc1kIdaDi40slyda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1vzmDHU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723828357; x=1755364357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tRnRN8ENBDuDZ999a8CEzdjR6w8o5Zi1KFulJFuTB0M=;
  b=T1vzmDHUTeXT7T15wpZSwqYIz6xaNxO1UQ4smkYOU3YmLhRr44O543m1
   t3Q2M7QxjmMA/1d+6Y5WBVx6zg9NjcELWaqt0aSJCt0ZJDgEQChONNOpn
   aNbrdg8h1c+RHLXpX39PIj54A8H1iC/H3oCHePrwiZxFcGOrEX6hhK9jn
   2W0qZ0DPN3BXZXZLBkxmVcbEzS1eoGxpfSqJRLDlVUIZLbfuLTSQb/Lwg
   p03uo0rn1690Ngdg9hApENfn9cH9P1jpnWj+YrSwzRyRVsVnDtSB59A+H
   WAl2+12qCVZ9ab+ou9w5huQmW1oncmj8M6ENG7LBXmBIGUzpUdjc46Aie
   g==;
X-CSE-ConnectionGUID: vj6nA6pOSguCpGfAeMFOmA==
X-CSE-MsgGUID: G9Dsyl00T3exH2EvRJUesQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25888869"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="25888869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:12:36 -0700
X-CSE-ConnectionGUID: xAegudwXTsii1DlUF51Igg==
X-CSE-MsgGUID: vRw0PeVpSXywuUzAg+0Q3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59360355"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 10:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6381324F; Fri, 16 Aug 2024 20:12:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 0/7] i2c: designware: Cleanups (part 1)
Date: Fri, 16 Aug 2024 20:01:58 +0300
Message-ID: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 22 +++------
 drivers/i2c/busses/i2c-designware-platdrv.c | 50 +++++++++++++--------
 4 files changed, 42 insertions(+), 38 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


