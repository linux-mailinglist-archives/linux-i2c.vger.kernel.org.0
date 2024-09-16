Return-Path: <linux-i2c+bounces-6784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C734E97A0F6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B364284A8E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F652155725;
	Mon, 16 Sep 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk0pZ6kd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85810145B0C;
	Mon, 16 Sep 2024 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488166; cv=none; b=T1rqVEVQrbr5+0mKTGN3jQMJE1dq68sUy/Bs6jaCV5/kKpZFbYijZA/l5/ShWnxlcKqlvjwXjtWkQfaXQZ30iIwDjNuVI08I21OH1zAHlV7StCNyT2tO4BCAkIauHqVHp9NRLEGj5XJ/O2kVOxIsbuJk0KnZu7jH1fADTN0BO5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488166; c=relaxed/simple;
	bh=Y2lSt+eudlUwNyz9FeX7T1GcsSKRwJJXpwQOFA2Qpp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvRa86seN0ZUhQG4U+WmnDp2k1JBrbUiVpR2pnEcEfZ1pEwlqQVhWRnmzHaXZTMyTyCZ6eZONH3yl2+ALig0ScNzq+Uo3aCNd1f96aViUQXLl52iynleoxlonzldayycMBY4GD7+F80PT6Xhac4EbHBRdUICs0FcWSaXpXvKmaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk0pZ6kd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488165; x=1758024165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y2lSt+eudlUwNyz9FeX7T1GcsSKRwJJXpwQOFA2Qpp8=;
  b=Nk0pZ6kdIQ9BoIrchsSpa8gyuKY6SXyfC4JTMyrrhRBC4x569otdPTJ1
   Sg6Y4GJ69tetq6UO/3xxmuPo1EStapxMP7OfQrUjaCMyzQm9RKPB5o0YC
   mCA+o+6vRJyN7kwHBIyK/FO/yhuQE0k7Qgh4jHKkuWKsAYRCVAFkWTN3i
   2MAdPUZAvWEDG0K5VJXfXdRf+q6C6uHW4N+YDVXO1BFsRqWDnZTXE3S3Q
   pkfPUN/C3yZ058G6EEDemLPbM7xxPvGgwFcA/kQX1WnldFSEJMlwV1scG
   Hv48pA0O+HU9Mkuy2kFXVWm66L6Q+vxVKYqxXo0YpHyjL50feCxnMnuXV
   Q==;
X-CSE-ConnectionGUID: 1q8rXOF7QZug5kcIFufx0w==
X-CSE-MsgGUID: sTI5/IjLQX+TjcwXpF70MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842795"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842795"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:42 -0700
X-CSE-ConnectionGUID: b48UdI+RQ/SeWSleeKpDBA==
X-CSE-MsgGUID: lF/pWoZSQvqcdifGb54hCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540769"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A2AF9481; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 00/11] i2c: isch: Put the driver into shape
Date: Mon, 16 Sep 2024 15:01:27 +0300
Message-ID: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver code is quite outdated WRT modern in-kernel APIs and
also has one non-critival bug.

The series is to address the above. Has been tested on
Minnowboard (Intel Tunnel Creek platform) with connected
LM95245 HW monitor chip.

v2:
- dropped applied patch
- fixed format specifier (LKP)

Andy Shevchenko (11):
  i2c: isch: Pass pointer to struct i2c_adapter down
  i2c: isch: Use string_choices API instead of ternary operator
  i2c: isch: Switch to memory mapped IO accessors
  i2c: isch: Use custom private data structure
  i2c: isch: switch i2c registration to devm functions
  i2c: isch: Utilize temporary variable to hold device pointer
  i2c: isch: Use read_poll_timeout()
  i2c: isch: Unify the name of the variable to hold an error code
  i2c: isch: Don't use "proxy" headers
  i2c: isch: Prefer to use octal permission
  i2c: isch: Convert to kernel-doc

 drivers/i2c/busses/i2c-isch.c | 321 +++++++++++++++++-----------------
 1 file changed, 164 insertions(+), 157 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


