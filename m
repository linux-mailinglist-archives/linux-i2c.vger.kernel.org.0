Return-Path: <linux-i2c+bounces-10131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE2A7DA86
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 11:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16BF43ABA2F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25523236A;
	Mon,  7 Apr 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEfYZWwT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D0188734;
	Mon,  7 Apr 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019940; cv=none; b=hyZZk+3foFjjjPPrbHKgVnRfL88dXPDnFDuQLHzaECYv8McjVa48jak46+ndaU8o1yghMbwXtcNdWl9xJGCQ7/zTwaZWQh/oLs+EbYW2kE+UyVWz0Gph5/JBRwHXZWpgG5Zeze7JXgy8bwDugkNdpsiOImdZpUp/B9VaclLUSnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019940; c=relaxed/simple;
	bh=PLjZ2TrIGcRq48drG7P+AITO2PLYM26QcN7ZWtsMzu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9Bx3tmsW7PRDNX+IZWVEV6sGKR8Y0nLxigTjja7/Jmz4+kPQhg1mZESVhtyG1I6IW7i02MOhJgdClLYr175ZHG+Nmu35FbGMPQkK5/CSGmokU52sCZbIOHWokKiNxcsQpdS0o+gYBMv1+bEgEU5FdgB5BHL/H9/0AqAgET2QOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEfYZWwT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019938; x=1775555938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PLjZ2TrIGcRq48drG7P+AITO2PLYM26QcN7ZWtsMzu8=;
  b=NEfYZWwTGpThiKtnVEu5uN3LPpSEsy1aHkBqBArAcNObkpxgNeISjRMI
   KBLhecyN6MGt+xsKbjIMpM7kx+o89jQeoafU8DZ8KmCETVp3gR0+oRPM8
   eJYUxOY1rcl7V0iKiDp9z4CQgkeBJIVQ+RZX2AWOnDalj2iIGb1Cm7LBI
   hChw53G5XmaiDv3fLyCXtlzM1PXw7Pz7TN+O9On2a9VI5tT/M/l7ehTVc
   Wd3oT/gVj1gVsDlip7jrpVllc/Hi4HrCu3hkUTJyEWcIBNZxeoPbLdd1S
   4t8l2fUmtxseusOStF6+KHyNEEEcRJzlz7TrLj6ZdkpxTDoQ8BHputv14
   w==;
X-CSE-ConnectionGUID: E9wYErGTRnKzSIjGyQD9nQ==
X-CSE-MsgGUID: MkXQkhY9QliHaDHytXpRRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49188873"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49188873"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:58:57 -0700
X-CSE-ConnectionGUID: gePU7LjdQNOudI94bMbmxQ==
X-CSE-MsgGUID: b+cGYl3FRTSdm+DLdTHl5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128411722"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 02:58:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 744C4247; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/6] i2c: core: Move client towards fwnode
Date: Mon,  7 Apr 2025 12:55:11 +0300
Message-ID: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct i2c_board_info has of_node and fwnode members. This is
quite confusing as they are of the same semantics and it's tend
to have an issue if user assigns both. Luckily there is only a
single driver that does this and fix was sent today. Nevertheless
the series moves the client handling code to use fwnode and deprecates
the of_node member in the respective documentation.

Tomi, can you test this series + the patch we discussed earlier so it works as
expected?

In v2:
- covered i2c-core-slave.c where it makes sense
- covered i2c-core-of.c where it makes sense
- rebased on top of the latest code base

Andy Shevchenko (6):
  i2c: core: Drop duplicate check before calling OF APIs
  i2c: core: Unify the firmware node type check
  i2c: core: Switch to fwnode APIs to get IRQ
  i2c: core: Reuse fwnode variable where it makes sense
  i2c: core: Do not dereference fwnode in struct device
  i2c: core: Deprecate of_node in struct i2c_board_info

 drivers/i2c/i2c-core-base.c  | 59 ++++++++++++++++++------------------
 drivers/i2c/i2c-core-of.c    |  1 -
 drivers/i2c/i2c-core-slave.c | 11 ++++---
 include/linux/i2c.h          |  2 +-
 4 files changed, 37 insertions(+), 36 deletions(-)

-- 
2.47.2


