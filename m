Return-Path: <linux-i2c+bounces-7333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D2F999D65
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 09:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340A11C22A97
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 07:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726531E9095;
	Fri, 11 Oct 2024 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgserkGp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B6E635;
	Fri, 11 Oct 2024 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630271; cv=none; b=EjkzCTrqOqCkYBPYdMsWMn7oZYpPNkNR7B4KnMZpGzo6bNi3VhUtUYnTjM7/eBEqgzmsm5fWWWzHBZxNwW2nbWPZ1qsjK3gfiYnwFYX/zXDC5k7JZeNV2totA/42/m7l4gvh9M/K0hD1oiP/zLsej8SBRiFKA8wzZBrrxp/e1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630271; c=relaxed/simple;
	bh=LfoFcf+O6LeARd8IYkAT+g2zx962h72pKSjDzjIInqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F2Eg9kQNmlgI9CNWZexoCM/MYsNm1I6gc/YD8791rswGWfy7snibVFQRJD4Wu+Og0XLwp0ribsIvDON/ZnGQZqCKEZltABUZgaUiS7ooToLhcDa90iwEhk9WFxkVkElILdC+rdkk2LtVEhr1QHaY3zrXZzO52l+hhowWQgaMiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgserkGp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728630270; x=1760166270;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LfoFcf+O6LeARd8IYkAT+g2zx962h72pKSjDzjIInqM=;
  b=GgserkGpp/lxy/uv2HX6r2qwbFnz6ookOJ27EFNeEu6QWnnhBHbUE0hh
   lm1rKAsHes3rn+YU4mRycQsSzXSqD7rNAMtXDNGbVKTGmZpkS62pjP3NQ
   0M5KgzBBApCwrkwYygQfS4vS7E1p7NjCyhicNb9wHa6/n6bdA+aSxqCnm
   5dww2GQ5Wnp1E26RnkJhhgovYVBLWdtj3vOCXk+Fu2Wyqzu+taALjCY8W
   /IT5J2nXsX8TwGhpurBWYypwOzUgRrn3Pw2vXJgXUkdwwqiI5aqGzTNVw
   DlJcjaC/P4hr/0l3vxTz9vxS0FUgIkoAQ0o6iiMufgYi6RxKUWu/EP9kh
   g==;
X-CSE-ConnectionGUID: AG5eE0pLShGVsVlnO3DKCg==
X-CSE-MsgGUID: 6SVqvxOsQY+YEfN5T9RKxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27913487"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27913487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:04:30 -0700
X-CSE-ConnectionGUID: LWFPRkl8S7m7SS6+qBe0tQ==
X-CSE-MsgGUID: XwZGjZFjSieeAibi16j8gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76742993"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:04:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CDF2411F855;
	Fri, 11 Oct 2024 10:04:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sz9hI-0000oa-2S;
	Fri, 11 Oct 2024 10:04:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wentong Wu <wentong.wu@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 1/1] MAINTAINERS: Add an entry for the LJCA drivers
Date: Fri, 11 Oct 2024 10:04:14 +0300
Message-Id: <20241011070414.3124-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Intel La Jolla Cove Adapter (LJCA) set of
drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
It seems there never was one.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 251ae8a52066..ee5a5062729a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11601,6 +11601,16 @@ F:	drivers/crypto/intel/keembay/keembay-ocs-hcu-core.c
 F:	drivers/crypto/intel/keembay/ocs-hcu.c
 F:	drivers/crypto/intel/keembay/ocs-hcu.h
 
+INTEL LA JOLLA COVE ADAPTER (LJCA) USB I/O EXPANDER DRIVERS
+M:	Wentong Wu <wentong.wu@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+S:	Maintained
+F:	drivers/gpio/gpio-ljca.c
+F:	drivers/i2c/busses/i2c-ljca.c
+F:	drivers/spi/spi-ljca.c
+F:	drivers/usb/misc/usb-ljca.c
+F:	include/linux/usb/ljca.h
+
 INTEL MANAGEMENT ENGINE (mei)
 M:	Tomas Winkler <tomas.winkler@intel.com>
 L:	linux-kernel@vger.kernel.org
-- 
2.39.5


