Return-Path: <linux-i2c+bounces-10390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF1A8B192
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2FC17702D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E122DF81;
	Wed, 16 Apr 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+8rAt9u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105022A807;
	Wed, 16 Apr 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787059; cv=none; b=kWApiEuyYPyRC7LM2LB1JYVvXPBEOABorsuAOL8fOW/paMypviKlXFBzJC5QWImLM69trCLUkUVbjnBPxQafZXo0I5rZpwubk32FK9BEC1ZbZpIAebi5x39uzeHEgsl0PnqmHrahs/eG05eTyNZubbkEF1dS2Gc0FqLM8/+Iy98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787059; c=relaxed/simple;
	bh=TqyrK1fGaIL9Q5ygZqfrynGB8QeJRvXJh2Uecp9dXIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxBSycRtqkhw7m6F5xyYxMIsoVYG7JZKsE1X3SSrdT1jG2vzLLsNSAPMre3V9YQepxcSyxem5c/aG9IJ+7G43027ej8DoO0NUkidnSllmMbqY+xcwpye6GeR6G5+m2Vt2bL+PTSuhiJkJsd6CPj1wT3p8oq8ImudNhmF0L/aK+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+8rAt9u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787058; x=1776323058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TqyrK1fGaIL9Q5ygZqfrynGB8QeJRvXJh2Uecp9dXIs=;
  b=G+8rAt9uci99UpJkS7/qkn3m+uXlXsjiN0pVEqUOLxN958xKKIM1ngHG
   WRKoGcIKjxStfGARVQ/R7QMVc9zYhVYWTrttpGT7jyCQPM3wEVIjBlZ7k
   c4iXTllruP+Wb6jm0jME8vVB2VctFY3H+/G37BcRy8GBUtg3m+PYVQfJb
   QGoT4NVdLNS2QBuKMMmy5FlDXWc6aytdPyBKxa4PKwMofpDkeedjnAKgt
   Enz7l4gnFXSMphol4T2MocI31vh2wcf34qezUcV3zHS7CyPwjZTCMwHmc
   HbR+cLhpudVttB8LGxc3s8fImZ/eQhntzKQ2x73mV4b3PDGy8c743XBrL
   Q==;
X-CSE-ConnectionGUID: jj5FxL9oR4Crlvm8hbadyA==
X-CSE-MsgGUID: OGFDNSpZTj+OW6FpzCWNLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56983843"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56983843"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:17 -0700
X-CSE-ConnectionGUID: zEA2I4E1RBSOSqVvVj2Txw==
X-CSE-MsgGUID: xtSJB2rSS7ep1m0ZUTF0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130668507"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2025 00:04:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BCAC6741; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
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
Subject: [PATCH v5 6/7] i2c: core: Deprecate of_node in struct i2c_board_info
Date: Wed, 16 Apr 2025 10:01:36 +0300
Message-ID: <20250416070409.1867862-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two members of the same or quite similar semantics is quite confusing
to begin with. Moreover, fwnode covers all possible firmware descriptions
that Linux kernel supports. Deprecate of_node in struct i2c_board_info,
so users will be warned and in the future there is a plan to convert
the users and remove it completely.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


