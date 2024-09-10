Return-Path: <linux-i2c+bounces-6509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FF973D4F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4A01F26B21
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620B91A4B99;
	Tue, 10 Sep 2024 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYpPQ97R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825A41A4ACC;
	Tue, 10 Sep 2024 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985895; cv=none; b=Nk1XUwkMKl8VZPBQd6Vx3+e2hmyyNy6gLgfENBziYdJfvck+eo2uXV4sqz7YDUXEZIsyF0lHhAYK0lxS6HJWfbwJ1Ub2zGht1fsZRY8O4vrtvSkpWO+LYyJgRV80k9H5NEqZyZsdMkyxN59d+3lMpxqEsaX6gMvZoP2zWnAzC6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985895; c=relaxed/simple;
	bh=NjkH6nq0zdGgFw8tEDfkTDX4YZtbOj0w1QW4WyCmRA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NvYrt2xvO6OOKeIF808EiCrd/Gq51giumSJts5DloLNfUC5qxEqEn0PLgfOhF1gdrZR4vfEv2WYqf+x+o9DhUxUR9BJejDiVoa71KHLpl8Tkfi62A1LCu0Bn4qJL9JjUkAwAR7pzMbSprjcqYYoYxMi/8pY6KE7GB86tmlRcs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYpPQ97R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725985894; x=1757521894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NjkH6nq0zdGgFw8tEDfkTDX4YZtbOj0w1QW4WyCmRA8=;
  b=hYpPQ97RfVSX64WdBrKecPAyjjHxzGlmz4bUs3ZysIBfM/jTriJWa0gF
   wA/OjcUFTRKh/OGCuSkZ24mCYNA+1LsWBTA+FkTrQUkEi3FwPU9Oal3Y6
   EdYUUeMfhWFlRmjUBUYCifGJidayfoCztHFfSJf7lDw+xLESnJWzURgjG
   l02Bk5FyKgrjbAJHP38PEnMjOQe2I2shCardGFhArcMANcPAPT+hZ/dDk
   RmcD48Siv6gWwM/6moq8XWw4sLZd3kILRsTSsHdyLQ1u/lKDUuG/F54ZC
   35oWezmuK8uSWpY4bfeQsL/R2V4px9kidd1PVKrcOCzpTYV+Nesb4xxeA
   g==;
X-CSE-ConnectionGUID: EBTp1paWQ+yMGDMVQNr4Iw==
X-CSE-MsgGUID: ti9QFw9YRAGZVtRrHtk93A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35341736"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35341736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:31:33 -0700
X-CSE-ConnectionGUID: AbAddAqzRO2zEyp0omRupA==
X-CSE-MsgGUID: nvhtRhYjS/G8F3bugdY9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71681499"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2024 09:31:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DB5EA326; Tue, 10 Sep 2024 19:31:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 0/3] i2c: designware: Cleanups (part 3)
Date: Tue, 10 Sep 2024 19:28:43 +0300
Message-ID: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the subset of the patches [1] that should not affect any
functionality, i.e. consolidation setting of the firmware node.

Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]

Andy Shevchenko (3):
  i2c: designware: Uninline i2c_dw_probe()
  i2c: designware: Propagate firmware node
  i2c: designware: Use pci_get_drvdata()

 drivers/i2c/busses/i2c-designware-common.c  | 16 ++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    | 17 ++---------------
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  6 ++----
 drivers/i2c/busses/i2c-designware-platdrv.c |  3 ---
 4 files changed, 20 insertions(+), 22 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


