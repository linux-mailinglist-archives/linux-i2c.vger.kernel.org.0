Return-Path: <linux-i2c+bounces-7479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D439A41E8
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 17:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3BD7B24ADA
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B65D201101;
	Fri, 18 Oct 2024 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVCCUxvc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8713A409;
	Fri, 18 Oct 2024 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729263838; cv=none; b=LVE0phbPxzwTzKZS29ELNE674ZNkIQMmveETukHZW5pt5+BY2WXNpcRC2ppMaL1YcPedfzz0Iwh3RVx9TCWfy51NXGVxgawitetTu6qIccbpk47vVauUMKYGKAsKlSlcvKG7uvmI9x1JAOk0kJhW+fbwdPnloXsbDqAiosTxNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729263838; c=relaxed/simple;
	bh=GFkM6PHk98hrCzUjr+8tDYz2sC9iVifXqKkT60nHWq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tT+Zc3tlZGemcDI98fe2UNCakJ3cmwgGv6Odlhj30ML7WZ0SuneV4mbzvkonbfRLmXfZD1lVJMeulL556fH6SSebIQTYLF0OzMyvab0xW4W87zMyGmA+6IR2kEdTryIlKaHu5fHufIGkw2ATInGJLn/cvii+fBpesNu824I4Ipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVCCUxvc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729263837; x=1760799837;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GFkM6PHk98hrCzUjr+8tDYz2sC9iVifXqKkT60nHWq4=;
  b=dVCCUxvc5iWhSYYtzk7/W9AbkjTdrTIH7PNbc7gn92TDBBWIy4qmE5X/
   CUfFl70vieoNCl7H7LRAH7MQQpH8MFUNveBo+sb655jxOzthFCcn4bI95
   YW/KYmY84z4wlIlShqN6Sad8Hu5+hMqmA7tvQpBH8I/wAMtwrPBVtEZGE
   MMeKCRdd+SK1O3rExrbddCmoIlO6hIvKXGYTachnL63c5OQntMF9pmqWk
   JIkxLDkaqP9TINpSmRF0VhQ6cqWkpbBcsBEP+f8c3h1W8vimmKxwoxN/r
   R288bpFVAZTVDlUevUHCPdeO/Jn4/TiNAzzMVrqp8amzeg7f96aVA+vXB
   w==;
X-CSE-ConnectionGUID: ORwZ+aZVTAiw8NOYUhEFMQ==
X-CSE-MsgGUID: Hmo7jkWYRlG6ymnmv9vNng==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28956443"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28956443"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 08:03:41 -0700
X-CSE-ConnectionGUID: +AO1IUVVQIaxlxk0ObbMhQ==
X-CSE-MsgGUID: 1myw5a7RRee8joEzy7pSdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78941015"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2024 08:03:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 06A83343; Fri, 18 Oct 2024 18:03:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Date: Fri, 18 Oct 2024 18:03:37 +0300
Message-ID: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index f12d6b10a85e..af95d6e7f004 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_I2C_BOARDINFO)	+= i2c-boardinfo.o
 obj-$(CONFIG_I2C)		+= i2c-core.o
-i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
+i2c-core-y			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
 i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
 i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
-- 
2.43.0.rc1.1336.g36b5255a03ac


