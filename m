Return-Path: <linux-i2c+bounces-5697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8F95BDEA
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 20:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C55EBB25E8B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 18:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7561D04B8;
	Thu, 22 Aug 2024 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8/evVXO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A41D04A1;
	Thu, 22 Aug 2024 18:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349866; cv=none; b=MsXN33LpA2qx72rTtRbUh0QLWUiDBm7QvtOP6iCHYkpipA3JHKaiMPRypgQhsdfJibOkrWRWtvC64RWC/+un/u4KS0GpPUxscByKbUeIu/q1bOeqJMtBsGlC9dqSrO1QsU7svlXyCy3p/Dho24ChlZ7YNcZWdQBwhGkzEhbQ83c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349866; c=relaxed/simple;
	bh=qVYVhUMTC1cNRXtELMHBe7oHLjVZhvAPP3Sbr1kirQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MTAxGvbRSxGR+jKSYLJx63ibjiPh/HxoYUHxNyejDlG65q4SQsexA+0t5fReMmByfWVEqwOdN4J2WV84rut7JCviXOWdJPT7tSdFUnsMKfYUvbre+ryExq6zix5K3LOC5pIrFp+VFofcazP0UE2FYOybTlOFrifRYuQ6jmcQwz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8/evVXO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724349865; x=1755885865;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qVYVhUMTC1cNRXtELMHBe7oHLjVZhvAPP3Sbr1kirQ8=;
  b=W8/evVXO/FPF4SCPCVqfbe1I5r+e2yDr0zBo4GUy/eKpXDBw8rJ24W6h
   hpDCbYwivLgmiP8ejth/92YyPV7/D44b5sgZR0rd36eOefcdbQqTQ7sAN
   cHP6PsXqq8GCxXrztU1JHdLpJ9kX+Lp5FO2T36tAriS31YDoiCCPk5Y7I
   bZOuPR/2kDL71hXMBTXAt8edj3bwJwMeg3rLU2oydIUf6lRVTizH1/Nd/
   DSFdv2KwTi8Rtld2RGDcR8yJcCgdmEYQBfxZSEjEBZbPde++C0AZoLftf
   AtmUcnHuTjhzMunZocOfdEZQTij3ySaevNCuK1sQ8SfQV/Fw99HJhP/9+
   A==;
X-CSE-ConnectionGUID: JZhJ1D+BS2i/7YlyBsxjCw==
X-CSE-MsgGUID: aqEMAncHTAm+JsuREuoUOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26656200"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26656200"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:04:20 -0700
X-CSE-ConnectionGUID: LmJSY5tzQn2ME9EU6Wba3w==
X-CSE-MsgGUID: 3CTjxjJGQK6LxCEXgXNs5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="62074204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 11:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 43C112AA; Thu, 22 Aug 2024 21:04:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 0/5] i2c: designware: Cleanups (part 2)
Date: Thu, 22 Aug 2024 20:58:36 +0300
Message-ID: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the subset of the patches [1] that should not affect any
functionality. Here are:
- consolidation of FW parsing and configuring code 
- some function renaming / dropping
- switching to export namespace

In any case this is Cc'ed to AMD who reported a problem in [1]
presumably in the patch that is *not* included here.

Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]

Andy Shevchenko (5):
  i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
  i2c: designware: Consolidate firmware parsing and configuring code
  i2c: designware: Unify the firmware type checks
  i2c: designware: Move exports to I2C_DW namespaces
  i2c: designware: Remove ->disable() callback

 drivers/i2c/busses/i2c-designware-common.c  | 73 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h    | 13 +---
 drivers/i2c/busses/i2c-designware-master.c  |  4 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 18 ++---
 drivers/i2c/busses/i2c-designware-platdrv.c | 53 ++-------------
 drivers/i2c/busses/i2c-designware-slave.c   |  6 +-
 6 files changed, 88 insertions(+), 79 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


