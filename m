Return-Path: <linux-i2c+bounces-15145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 397E4D1D155
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 141A1303A5F3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F8437E30B;
	Wed, 14 Jan 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIjZCy1M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06AF37BE97;
	Wed, 14 Jan 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378815; cv=none; b=UOByPYnl1GIIsklyRV5MyERINojZL5/6MZX3AnxRP8DOUQsc2PH3KGLpt6veLoSuhp8cvo92oAg52eX3x0+yHIRra0bNvPYxhkC0/aPiX0oEJIZ0ZnEwhUSV+mcmpepvD+8DckmIvSpEXLfAbSsJKTuIJ/KdpoGwxTPPGV7KgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378815; c=relaxed/simple;
	bh=L+5h4GYJznzUGf/m7M7NoUPcOGq1NzqLPYBxYv2yceQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0gX68PP0RlQ0NKJ6Eoi4MJMqZlRxq5zRNFyGZbFOIo4K+yybWAVP2vIWd2bkCO632LdMx9Ok9mcd+Pm3Zse5NVpFUU0dgL2B2Yrhc6vseq45HPBvgqHO5v/nDczXlbe64ylw4WLsMRoOByyfJgKN3w29QGy0BSa7bVdKHN9N50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIjZCy1M; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768378811; x=1799914811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L+5h4GYJznzUGf/m7M7NoUPcOGq1NzqLPYBxYv2yceQ=;
  b=IIjZCy1MwC0ffk09f1QAupCxtVDG8AJgXaCBeatZiQXqXDOgr9AunpaZ
   NOBH5Sq3k/HvndFNHjS+8hUVmTewyVwb9enJqMS9lTntmPU0Z5f+tsv6C
   QMWXWODtjb3iViems2T0ITJCt8XxOsNdr25jwYOAKhdpFbQe+MneKziPI
   wSXBtEypCco53X0erDXoy/Oh75Nzdja5eA3A7+8kK8zkKg9CFb04f/1+7
   F8NT9KxhhYkfbWpmVaIOJF+jC8GQh7gBYK6vI8wIeKyMxCPCvNKR3PXah
   fIjWVylp+yQDsh9PQ/BmvcefbibfZNtr2AObfskTGp2ogOdJzwAkNb4dn
   w==;
X-CSE-ConnectionGUID: o6dsBKKuSfKbmO5XGasKgQ==
X-CSE-MsgGUID: oU7Kyt7nQUqzQV5jf1JESw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73513055"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73513055"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:19:59 -0800
X-CSE-ConnectionGUID: qldE213JTMuealmnd95ISA==
X-CSE-MsgGUID: KQmRoU1NTSW9pQ+0D3iPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204627060"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 00:19:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E9EBF98; Wed, 14 Jan 2026 09:19:55 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 0/2] i2c: designware: Clean up MODEL_* definitions
Date: Wed, 14 Jan 2026 09:17:49 +0100
Message-ID: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current way of recognizing models is not scalable and in most of the cases
just a replacement of well established device_is_compatible() approach.

For now take the low-hanging fruits and partially clean up those MODEL_*
definitions.

Andy Shevchenko (2):
  i2c: designware: Remove not-going-to-be-supported code for Baikal SoC
  i2c: designware: Use device_is_compatible() instead of custom approach

 drivers/i2c/busses/Kconfig                  |  1 -
 drivers/i2c/busses/i2c-designware-common.c  |  6 +-
 drivers/i2c/busses/i2c-designware-core.h    |  2 -
 drivers/i2c/busses/i2c-designware-platdrv.c | 70 +--------------------
 4 files changed, 2 insertions(+), 77 deletions(-)

-- 
2.50.1


