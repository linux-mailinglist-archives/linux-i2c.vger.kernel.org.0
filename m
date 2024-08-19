Return-Path: <linux-i2c+bounces-5484-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA99565BE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 496F11F22750
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F110F15B97C;
	Mon, 19 Aug 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvLAk5id"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5915B118;
	Mon, 19 Aug 2024 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056816; cv=none; b=TLifape+sYUeBVUoIP7zu+bvrFPV6pNnXU22radHKIlyIVnEPxOxCfPN4lLPisye/FGomz7Dsu/raElyzr+Li1xpk5eZT97g7IDcOuaqfh3SMBQPwfY4kWORAF3oxgb9o54gV9I/1n3QF7572GlaHa69+qs1590k9/TLTdM/6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056816; c=relaxed/simple;
	bh=t9j8GBOOx3Xbysu3h86E+HknzwPW5lDD4H2USyl6NIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJelAQDrCoL0ZLUf+iEG0yHJ21Ak3S5gnNhenopNCTS6rs2biTNAD0iF/wraY6sj8TFe7mxIQA6WaVdARgWHx8KUt9FTB4FjAGeFlO185dXsSuPyvrKHUsg06WR1he/EFUiVa8aijEi6xSXQMMcrR7LKBYh6S1Bduaw8pjHYo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvLAk5id; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056815; x=1755592815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t9j8GBOOx3Xbysu3h86E+HknzwPW5lDD4H2USyl6NIE=;
  b=VvLAk5idhyP0gTSs98uxlE6HzcTA1s1VVWzt49kfkO1hho0aJAlP0BVH
   /0XYqtdlA/dfaZLiR9O6RlSHwwJ7QBhGKGZxxIy9ueT7zBi1oxVaL3zIS
   Mi4nsoIgO1Io7xSwt7XxJ5luu/biwr8i+yqqWfLYyCvFs9yZx2G7uHF6Q
   ygp4GXRhv4a/0c4PoMdZY01yhYhd38E1Du0Mti/Q0XJhjVltr4i5fyYRb
   okeXYZMZvRwCKOKhX9UirnyS84iaLt470cb+IGsjOZnvI+LLnGNSByUgm
   ouOJS/N3A4TW2SAze1jfGSEWEux/N7DtmJ7wgVHYFEI7Z/fFJPs0Kdt+G
   g==;
X-CSE-ConnectionGUID: 9sBcx5PrS9G2bXGRri8UeQ==
X-CSE-MsgGUID: IijytFKKQOuOM8e/STxLpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22170971"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="22170971"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:12 -0700
X-CSE-ConnectionGUID: ZzfbuZX4SVWajn/dhk3M4w==
X-CSE-MsgGUID: nPh0KLeWSJ6P/9BK32uycA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60007798"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2024 01:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CE4EF16D; Mon, 19 Aug 2024 11:40:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v2 0/7] i2c: designware: Cleanups (part 1)
Date: Mon, 19 Aug 2024 11:39:04 +0300
Message-ID: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 22 ++-----
 drivers/i2c/busses/i2c-designware-platdrv.c | 72 +++++++++------------
 4 files changed, 42 insertions(+), 60 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


