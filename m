Return-Path: <linux-i2c+bounces-6572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012597577D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBAE7B2661C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD341AAE36;
	Wed, 11 Sep 2024 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlwdF8Mm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CF1AB6EE;
	Wed, 11 Sep 2024 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069708; cv=none; b=FkqnkO7itOPK0BdVguLAZqHu+d3B48Z1w+TWf85cUJ3dkZovuV/VKg5o9rB92mHy9uFsxDIV2SvzV7YDFgH89ftwWVK+Sil/EZ41A3BMhKm1ikxiqoWRQGFJSP2CFBUTLoilLXZ1VpiWASLLS76yeFuytP/d+Xh0CrUnzQ6Lj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069708; c=relaxed/simple;
	bh=mV6ILRaBFdFJqNuFP2DqfImznEowX5VXUP5QeNB3dPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U9FU+StZgm5ybGcoykQFNhEA4d6siE4OszdlF2Op/czfX/w0otHiMma7KVXanj2xCL39heW43El+6N8V1DlJ9OcTfBNmMdzRI5+krk7viQFrFhlhbwoUeowOju3tct25jOxeDKcdQ/wdYGn6WjhwdYsTG+5mjXsdY2mmnOO8tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlwdF8Mm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069707; x=1757605707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mV6ILRaBFdFJqNuFP2DqfImznEowX5VXUP5QeNB3dPs=;
  b=BlwdF8MmPxYzfz8izESN8oISSYBWRL3cCqpSmvPHdQZLt2Hp3Y1gWm3X
   3G4jqTkA7KCUjXslwkpjizgMw76WheTi0cO7b0YAT6XNkIF/aiVq5mRlY
   0nhtlICiKADi6T7rJqKoZKJmGxS8jy808x2XtTK8yEKmGOT/U64gyu8UX
   g98NpQCycpqHbM3Sxclq4d1g/P8EeWMNQd/aDUyDJW446iZ+2ikCtaOHG
   j6v34TJ+VrPaIzOfFnTSCLyztDo+hRs6Quo6XCAxNSWDwzt8NZ7oDpXGn
   ylNVYrMxL8wygs9Xt6z2e9fJbxmP59RDPmAye59ZyxsQbcOuiLo3ACaz+
   A==;
X-CSE-ConnectionGUID: plLgWu0FTEOmZb7iiq91uQ==
X-CSE-MsgGUID: QzkbwBS3Tbq/Ne5bW2GYqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701820"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:24 -0700
X-CSE-ConnectionGUID: 6aevm9mLR/68/Ah9SL/IEQ==
X-CSE-MsgGUID: JVozvP9cTQ2KfsgJ7s9/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67255175"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 08:48:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 47139192; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 00/12] i2c: isch: Put the driver into shape
Date: Wed, 11 Sep 2024 18:39:13 +0300
Message-ID: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
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

Andy Shevchenko (12):
  i2c: isch: Add missed 'else'
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

 drivers/i2c/busses/i2c-isch.c | 324 +++++++++++++++++-----------------
 1 file changed, 165 insertions(+), 159 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


