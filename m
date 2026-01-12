Return-Path: <linux-i2c+bounces-15065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA7D12F48
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07F95300462F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47CA35BDC4;
	Mon, 12 Jan 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9WxhHcJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7535A954;
	Mon, 12 Jan 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226168; cv=none; b=u2Nt5mGc0ffT0+mTVCydCA9F/ZnrD5Yqmz6+IEg2zR8Tbg4kjQ+AD7vPdIeWs3SaZ6nlHlWRQZhEVAjc4ZCMSIQbtqPNl1e6HbLOglbh9RC4NJwhaTc1oAxxl1l3fQeFfCqY2YqArsK6zBAvayGzr3fNhKiqGLE0susNYzE5em0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226168; c=relaxed/simple;
	bh=mHXs5sd8h4nNN7kN2KytA2MfTlKD9kjv84OYwPySlbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f61hAm+kDr072kHhATsG2ahGJAs1SYsWVTPlQUcIncuFhn0ck/68wBRCXVfaVLMGP3UJIv6PLNhmZGXgXl5C9ayPd7DthIAPafnVKiSkJaBiGgEQoH3V1Y9ybJK42ROZF3ok7Hyxhbe47Rnv5L+n27nWAnQ50+8JVE/W48VSmwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9WxhHcJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768226168; x=1799762168;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mHXs5sd8h4nNN7kN2KytA2MfTlKD9kjv84OYwPySlbg=;
  b=N9WxhHcJF8CdlEtukP1ta3Og87HzYAPI8GeVl5qMEQnXmPZTqIpD/m32
   Tdrsq+9tqVOKJc8SshlbYSh85cOp+qdpth9ZYwxySfvgJT4kExRx8iAeg
   lFqcOk9fwSyhIiEBk0Y6sNgqYyaoJLeU3+NU63/NmOdP4bwkpaEqgjeF4
   l+sfPJznjBBIOJEeV6GoGjXxNyYxV7TTlJH8+g3i+rPAeMIGRDwNoQw7I
   aXJHUxLu0z/BkIR0b6ONfqzgvdHA5OOumG0vHeGoOpwvQqDjTECmYZRSm
   1fpPSWRHFtdqeDHt24pjP7Klfs/v1IpwC0i2OFzDoKXi8/XjQXP9AM8At
   A==;
X-CSE-ConnectionGUID: ZdxvqpPJSimBoKsjZ/mGKw==
X-CSE-MsgGUID: a/el3HrCSbad93VwjXPnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69549013"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69549013"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:56:07 -0800
X-CSE-ConnectionGUID: 17MgwwMjQouglEfNeikSfA==
X-CSE-MsgGUID: +zxQH79hRim1cXDr6LzXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203731747"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jan 2026 05:56:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8260D98; Mon, 12 Jan 2026 14:56:04 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 0/2] i2c: mlxbf: A couple of cleanups
Date: Mon, 12 Jan 2026 14:55:09 +0100
Message-ID: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead definitions and reuse HZ_PER_MHZ predefined constant.
No functional changes.

Andy Shevchenko (2):
  i2c: mlxbf: Remove unused bus speed definitions
  i2c: mlxbf: Use HZ_PER_KHZ in the driver

 drivers/i2c/busses/i2c-mlxbf.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

-- 
2.50.1


