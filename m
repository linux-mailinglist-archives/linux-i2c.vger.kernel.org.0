Return-Path: <linux-i2c+bounces-10392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A709EA8B19C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 800953A9D5A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80067232379;
	Wed, 16 Apr 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF6yHXLJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149822E406;
	Wed, 16 Apr 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787062; cv=none; b=KwDU1fpiAzZ5snLJNrQ61DzxFeJWxuITPGFNNjSyvE3UGVtmxz4NxLOyP5jJetWDbNLWg7XMIUUTYKG5WYwv7M/NKLkqYV+/BqNFYQNBJY0XaE4wM7O4yqwgE/AOM8iHuHFyUG7EsU0h+9hokwYjuA8ftbcfNv9sLi9SV8JP2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787062; c=relaxed/simple;
	bh=Qnusjt3KywGfg4n5heJMP9L6efJVKgC0CcxKPQkitR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JfiFCTJGF+gl2KFNYFS7csxCFHOWHFImdpoIEdfft4b4B2BOrsB66wHkRG9B6cpLuoH+tWtX3Tui0MQPTKnM+l0u8BXUdH8ApNRjs3yKT2UL0wtKNn1W8s+7PZt7+AponczG8p2SzMPK1oxbHHRMsqQwphKN8Cg8PydybdQbF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aF6yHXLJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787061; x=1776323061;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qnusjt3KywGfg4n5heJMP9L6efJVKgC0CcxKPQkitR8=;
  b=aF6yHXLJFxLf5PhYqfFEGuUpCTEpvWAIPv4QhWLNQsV9l6nBsl0aDb0o
   q36e9KE8yqwjXLoj83uo18F5GL4d3ZnCTDewd23HIsVdSGQurlwVkMy90
   Fn67BeT5UZziRRnXXNZ21SEqKVCvJXBDf24i88d/2D6GzYErRAzZ6dQU/
   NMMWut7CgEqEI50IF8rW0VHkPY2WZu63aY4m1e0ZTHe+YAylMR+kAChn0
   LkqR3/aLnmPp0x9QSm+KsM+YPhqZYf3fzgddSrwJl9vJQ1Z7nNypnMV8M
   cKMvWO/wyuqqGE23Z2SCvcCANgTvUFFzzHq5H39hlQ+AfVOeTDNO8tWpt
   Q==;
X-CSE-ConnectionGUID: asxDlJ1uR52DWs22SMQdKQ==
X-CSE-MsgGUID: Ox1wWFfoSkqNtI2AUIKi2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46241845"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46241845"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:15 -0700
X-CSE-ConnectionGUID: Ltf/ibX3SqKkQUFV+vV8lQ==
X-CSE-MsgGUID: aCJr/N7XSkaMv7OrtTH+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131315352"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 00:04:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 62FA9F4; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 0/7] i2c: core: Move client towards fwnode
Date: Wed, 16 Apr 2025 10:01:30 +0300
Message-ID: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The struct i2c_board_info has of_node and fwnode members. This is quite
confusing as they are of the same semantics and it's tend to have an issue
if user assigns both. Luckily there is only a single driver that does this
and fix is provided in the last patch. Nevertheless the series moves
the client handling code to use fwnode and deprecates the of_node member
in the respective documentation.

In v5:
- reformatted conditionals to make media CI happy (media CI)
- updated commit messages in patches 3 & 6 to make it more clear (Wolfram)

In v4:
- fixed spelling in the first patch commit message (Sakari)
- wrapped the commit message in the patch before the last (Sakari)
- added tag to the last patch (Tomi)

In v3:
- fixed compile issues with i2c-core-slave.c (LKP)
- fixed compile issues with IRQ APIs, i.e. missing header (LKP)
- added patch for the only user which assigns two fields (Tomi)
- added tags (Tomi)

In v2:
- covered i2c-core-slave.c where it makes sense
- covered i2c-core-of.c where it makes sense
- rebased on top of the latest code base

Andy Shevchenko (7):
  i2c: core: Drop duplicate check before calling OF APIs
  i2c: core: Unify the firmware node type check
  i2c: core: Switch to fwnode APIs to get IRQ
  i2c: core: Reuse fwnode variable where it makes sense
  i2c: core: Do not dereference fwnode in struct device
  i2c: core: Deprecate of_node in struct i2c_board_info
  media: i2c: ds90ub960: Remove of_node assignment

 drivers/i2c/i2c-core-base.c   | 61 +++++++++++++++++------------------
 drivers/i2c/i2c-core-of.c     |  1 -
 drivers/i2c/i2c-core-slave.c  | 12 ++++---
 drivers/media/i2c/ds90ub960.c |  1 -
 include/linux/i2c.h           |  2 +-
 5 files changed, 39 insertions(+), 38 deletions(-)

-- 
2.47.2


