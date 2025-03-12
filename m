Return-Path: <linux-i2c+bounces-9810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C740AA5E3EC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9523A25D6
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C58225A2D3;
	Wed, 12 Mar 2025 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhQqgvur"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D8258CF2;
	Wed, 12 Mar 2025 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805512; cv=none; b=nDdvNntAERTyBJXTqGuOy5A+W/HDjTJke4imxOzZKEtbGv5T/NW9o+0O//FfbjM7XJw0ARQDaADox+A3ChllLqUwcGM4BWbNUtwituR18TMMZnyH8rqczNi7H5ndw9q1aBvzNolP8YVJsjkTg4YlsZm73ffFPLG4Mqrnu5AZwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805512; c=relaxed/simple;
	bh=VjmtEJxQyuUAeqbxtsbBB1tsOJr3EnKvfppmPlAeS9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPGBZrBvvKfY8FW+I50nk7QnnyQfHDbMUh8j5sRKSUiQIpP1n34H4QNbl+KzS2SRn+6kGIYjLusrbUUYOzxTfIMUvCieKBc6SFbq91d3vQeKSjX9TWy222UhEuPKjLSGR/lAWWOi+eY7+gAnYzZqwo2kNBKxtKV2AA4mvSGdXV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhQqgvur; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805510; x=1773341510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VjmtEJxQyuUAeqbxtsbBB1tsOJr3EnKvfppmPlAeS9U=;
  b=FhQqgvur1/e6dL0ZMZIPWQHAdoUp0ZgbAjgRK93rx8ncKjzocNpD8EAN
   79k0OGoP3xMjp9O8fXoo20yCG7u2UMmzzsLUXgmG6hNZziHt+oomw1xfo
   aPKLWlzhtjKekinU/2yVFdsmiKW0JHfK8YtXo8yDIjyOi6oS7P8ZFAwDq
   Rat7gQnI7ab6WsyVPGSmu9O9VPhdJTucm8ERWdAJtc05GUbw3KlL0mckm
   UvnIl7EWoBt2KINFManz3brAq6JVcz/mYp9u8IarvoJTEFudVYpaMeNEj
   fba9YnEGoX8/y/N/8P2lBrBkr+FcIog8hz9Lt5LjztrtAQKEYhEuAF+/c
   A==;
X-CSE-ConnectionGUID: pSl04gNNRsKByn2mOA1gkQ==
X-CSE-MsgGUID: xAqd3RiNRDmARVdW/64AQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487221"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487221"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:46 -0700
X-CSE-ConnectionGUID: RHRG1bCQRqKWRbCnaw6Tig==
X-CSE-MsgGUID: +IVzrFM+T16rW1kVNJPy+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895067"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5D087271; Wed, 12 Mar 2025 20:51:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/6] i2c: core: Deprecate of_node in struct i2c_board_info
Date: Wed, 12 Mar 2025 20:48:53 +0200
Message-ID: <20250312185137.4154173-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
References: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two members of the same or similar semantics is quite confusing to begin with.
Moreover, the fwnode covers all possible firmware descriptions that Linux kernel
supports. Deprecate of_node in struct i2c_board_info, so users will be warned
and in the future remote it completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc..cc1437f29823 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -405,7 +405,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @addr: stored in i2c_client.addr
  * @dev_name: Overrides the default <busnr>-<addr> dev_name if set
  * @platform_data: stored in i2c_client.dev.platform_data
- * @of_node: pointer to OpenFirmware device node
+ * @of_node: **DEPRECATED** - use @fwnode for this
  * @fwnode: device node supplied by the platform firmware
  * @swnode: software node for the device
  * @resources: resources associated with the device
-- 
2.47.2


