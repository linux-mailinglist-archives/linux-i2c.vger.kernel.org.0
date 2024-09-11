Return-Path: <linux-i2c+bounces-6573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56825975784
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29FEDB272DC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E452A1AE864;
	Wed, 11 Sep 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fgzpf+wO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF221AC8A3;
	Wed, 11 Sep 2024 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069710; cv=none; b=UcUJ/eOkWXX+S8i86K8nom61+49uNCfnu9zoYaoTBirPRRFKv3EdSIVLj9ktK0tImGXtElRfBFTqWxdCiFlKzOAUnWbCZ1Hucb6jmjNs50u2NfkW16yCdlubfOYIvxIY3+iYkGdRGIkCRtn6a2uplPeeRsNxZcTezs4SQvvUPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069710; c=relaxed/simple;
	bh=fbdMbu/WJ3UEOautWFpku/qMpEGheGBW2zuf4DXNYiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njjT93FF56nheXTeEhZq9O51quxeWogP+6/EAU1igC0JRJKyyy83zyyOn2NsBUcnewJMtjDcfDNExytwuqrDC4B7FYp+ziy6RSLEDM6gxJg5bVwt3sCut7ERrOo4R87m6i3QZygu957Kk2IqME4QN/MsxC0bqs1VvAs/mYb0cpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fgzpf+wO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069709; x=1757605709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fbdMbu/WJ3UEOautWFpku/qMpEGheGBW2zuf4DXNYiQ=;
  b=Fgzpf+wOPL4nOWRbRdLFOBap4n2VutwoZUEtCbXutbOnJURPFz3C0b5+
   Pfc6MPeDB6gVNwLqKvS7w0v+2DBCzK3O3JHr9b3EMFaE4Hu/6tYdbH0Xu
   WTyV9JjG+0uQ23/8Ov4X75kq4YPYVcyohHvyXdkcv0sYi9d481yO2JCWb
   5H6dKvBhiPYXQO07kdNnB2Ryk0FHJubJob4eGMHzZ9aaJxuPc1ctEwHmw
   ikVNv98oi6LavHy/N9HGLmn3zlRdsJQJl1jpomFNeeSUvqWEg7bAgsjun
   NpBo0ctzjD8knmIA9k9s1HJnjt9mNm7O0GsyL62fpQEupIsDtXs6eK9vD
   Q==;
X-CSE-ConnectionGUID: 3LBulcMFQWO2op0qRR3izg==
X-CSE-MsgGUID: rj7F/FjmQgax2WZL6LFvEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701828"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:24 -0700
X-CSE-ConnectionGUID: AUjjk1B3QVOV311pcL8wig==
X-CSE-MsgGUID: C+fM6kAzR4+7YVs5WgffvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67255177"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 08:48:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 573B3170; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 01/12] i2c: isch: Add missed 'else'
Date: Wed, 11 Sep 2024 18:39:14 +0300
Message-ID: <20240911154820.2846187-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In accordance with the existing comment and code analysis
it is quite likely that there is a missed 'else' when adapter
times out. Add it.

Fixes: 5bc1200852c3 ("i2c: Add Intel SCH SMBus support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 33dbc19d3848..f59158489ad9 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -99,8 +99,7 @@ static int sch_transaction(void)
 	if (retries > MAX_RETRIES) {
 		dev_err(&sch_adapter.dev, "SMBus Timeout!\n");
 		result = -ETIMEDOUT;
-	}
-	if (temp & 0x04) {
+	} else if (temp & 0x04) {
 		result = -EIO;
 		dev_dbg(&sch_adapter.dev, "Bus collision! SMBus may be "
 			"locked until next hard reset. (sorry!)\n");
-- 
2.43.0.rc1.1336.g36b5255a03ac


