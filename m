Return-Path: <linux-i2c+bounces-15049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E7D12BFA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9206E3007900
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA50E3596F1;
	Mon, 12 Jan 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVlT45Kt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D4358D09;
	Mon, 12 Jan 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224231; cv=none; b=tI8x1dUbhv58V3SB6alt/En2HMxTAfKCvuG0wpu9zz+MDXPyaPWAY1kMe4uiHJCZlJOi1jBHStWq1CfVagLxUtzfSMp3NFLtu0N3ySvmUXYcsZ/11+tKbh0k0L8Qurnx36TaeoScfkhONfGpaINfbww/cRpxzZP6+NyUtz+pxR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224231; c=relaxed/simple;
	bh=MUJ5R/5bwUZStTz7jyL97V37hUbZ3QF6XX869KBiYaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V9fe9Ka58of0f8LgSjVeNgtlM6ECw3fyKJRS2tNT0zurK0vin40Q4bmOKSIwKWn2Rln1tVtqETJXTPIJazam6X5bR5f+XXDoXkNrlG2zCBOTWxag4S6TSC9vvdlPrgN484oKz5toSau+ypom0II0K2LAnAjptlysUAb/8mzoYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVlT45Kt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768224230; x=1799760230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MUJ5R/5bwUZStTz7jyL97V37hUbZ3QF6XX869KBiYaY=;
  b=WVlT45KtXCm5VW7g57rNGnPqJF0bp18OFw6VkLp1tQg3LWqZxoFoxBKW
   rQ3Mvub2R8wrPsHLDtgBTAc9cvAQMeSJIO+b5saESDZkY+llbKQjb01kj
   4/nTze0FQzSQ+4B5Cy0jnh/uOYcdx7hfvagQINxvcIIRhQ9E0WyRiaG10
   H5ZyFtxz+0SwmBmFRuvxvhbRMa3OhfiX0TfF6CxvUq/Q3DHT7GEndu0FX
   n1EHbZ9WKBvhFQ2DLmsUvCjcs4pgQN8tXXiz1TQ3hSUIb8wATnqxfRGjJ
   osSL0W7gNbwuA2Y/CG6jd08SxDO7lP8Is/Sz0ZrNjYW59v426MpBO3gJn
   g==;
X-CSE-ConnectionGUID: VlZC784jT5qN3WFnlDUZ0A==
X-CSE-MsgGUID: 6Aw9plL5Qgqs7yGCEWymWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80602705"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80602705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:23:50 -0800
X-CSE-ConnectionGUID: TrLG80ZBTVa4zZuBpda8AQ==
X-CSE-MsgGUID: BMYP1mTuSRu1JHdG8Awqbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208563187"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:23:48 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A85E198; Mon, 12 Jan 2026 14:23:47 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/3] i2c: core: Tidy up fwnode handling
Date: Mon, 12 Jan 2026 14:22:39 +0100
Message-ID: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a few places in i2c core that can be amended when handling
fwnode. Hence this miniseries.

Andy Shevchenko (3):
  i2c: core: Check for error pointer for fwnode
  i2c: core: Replace custom implementation of device_match_fwnode()
  i2c: core: Use dev_fwnode()

 drivers/i2c/i2c-core-base.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.50.1


