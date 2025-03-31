Return-Path: <linux-i2c+bounces-10070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D2A75F60
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Mar 2025 09:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DA0E7A3E8C
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Mar 2025 07:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB031ADC7E;
	Mon, 31 Mar 2025 07:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRb9ECmN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC13273F9;
	Mon, 31 Mar 2025 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405419; cv=none; b=QFFsdO8iN4SXYvdg8tfz2UY5WDc20VXkDOLt5vWFFG1c6b/bUzianWRQ9gJW/DHX5FitO8oNrEHHpgm4wKkNNHniGD4ZMSX4Sy4j/Z6QLOywKf3G2TYP0qQJlEpimY3NXjVX70Zy6t0gOtZwdZLI4EwJQiAGZija7UudV3yku4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405419; c=relaxed/simple;
	bh=NO9lYwQiYAhG5PP0Uf7qu8xrRfbHqtFPvo89un60yYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rn610mKxGT9fp3L6+l3zBc1A9Cq4QdA4A/KsEGRzJzB5tgPwHJJkAARyqh/N1l49eCFN4f+bHHddI5ofPy/tQCkROnbDE8mXqfeizs3pd1N4USrYXeZbGvJZR5B5ymziQ1Qcfx0Ks3jOYRgYl/cu1Qb0QAW1XIN1phwLajgiaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRb9ECmN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405418; x=1774941418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NO9lYwQiYAhG5PP0Uf7qu8xrRfbHqtFPvo89un60yYA=;
  b=kRb9ECmNX3GBnEg+oWFcx2jQ4MsknCgEXUhS59chThv9ZfATnuPleIPh
   DzGW7UQjeL6jHtX+zOyAHVOHbAhBUgKUos2Z2oZIMGzhTeo6SPO51xU9T
   ivvoU83Vm+zXUIlRi6WOHPiCCqlHM0/BY8/TUY9UjY6lUyZ75ib/zVR9t
   7GcEGMaVtsHhuEA+mfsbTd/0RodkIshcRoOlgUJlggEgVraDNKe2l+32y
   V7CDdA1acKCXOzIPqrSSvtIX3TucOuWYJ6xNbi+YsbL7F2TafWKwGIbMh
   AVCWUcSBEZSMXVMxe+oFzpsuHvGaVFe2NiQeHbZ44ipAL16Yg2/r5kO5Q
   w==;
X-CSE-ConnectionGUID: njrnNe1yT4uzE9ZeI4EAOg==
X-CSE-MsgGUID: 0upk4tf1Sa23Kr8YnUWxiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="55676888"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="55676888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:16:56 -0700
X-CSE-ConnectionGUID: RRZn+VlQT3iYdOH6jFVPlw==
X-CSE-MsgGUID: cbcLpFNMRxOS5wXYyddi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126014798"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2025 00:16:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 310621B4; Mon, 31 Mar 2025 10:16:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: atr: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:16:46 +0300
Message-ID: <20250331071646.3987361-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fwnode.h is not supposed to be used by the drivers as it
has the definitions for the core parts for different device
property provider implementations. Drop it.

Note, that fwnode API for drivers is provided in property.h
which is included here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-atr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 8fe9ddff8e96..783fb8df2ebe 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -8,12 +8,12 @@
  * Originally based on i2c-mux.c
  */
 
-#include <linux/fwnode.h>
 #include <linux/i2c-atr.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-- 
2.47.2


