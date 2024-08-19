Return-Path: <linux-i2c+bounces-5486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED39565C3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DD291C21860
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E415CD54;
	Mon, 19 Aug 2024 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UG1K4j0m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70615B55D;
	Mon, 19 Aug 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056818; cv=none; b=IUSmyU7tHL3dpVQDYSZqxA7OJglBqKNyrvw90UUSGebo8iQ4i9uBnI0UNEgaO9MkfCdHLa219d8VklkI3jfJpasTu2yejwrOBW5x8mojhmKsrbtOd3woyYC88bd9DuHWVhwXW30Hv4Xs9UUPn12OHcSTPK2rNR/WjidoZgLl9qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056818; c=relaxed/simple;
	bh=KoT/31pGAd0xE2KmlmoMP1RqpQ6AxIOuaCMFure4zbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TUZtfeGnGTcS+++xzSRaAvW4+feA+fHZHeOaY+GQbIlIkSrLSkoSnPaWZQJre8RcH1uQqpkTSVduUbq7b4qx2s/pvMtiayOkGdRjWSKVoxPbQy84Aeit3jGJiAbhvufGmGzA8fyvoF+pmcXMMhbxQWDDk99XU3/W1VSpMvvXAAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UG1K4j0m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056816; x=1755592816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KoT/31pGAd0xE2KmlmoMP1RqpQ6AxIOuaCMFure4zbE=;
  b=UG1K4j0mUxFpYnAryd/yqkRvhyQM1xQyFk9PQdkGf4m3plC+uo9Dh8an
   vLWukVIpojfNyx2338AmjaCJGflly+W4wgJeSo3iDgFuhlUa36P2+H7WF
   PpGvBXdkbI0tQ/CStcAt8aS7lH6XAi5KvU/qSgEkeXX1tsoxShaU2IURH
   1gVyjhYka3wzbr5kjCw7qxuBNQZhvmb1hPFwviBM9UO2WaobV1IzOVVIs
   bMhyGM49nzna6ignABdfJZSRAqwcQoERDt4zEfi0XuDUXpWmVvZae1ZfS
   tHXbaYVn00QNazlRAKLzFfnMa1NY4/+wgwtzXLxNAiSCVaXwfT/4XxOkP
   A==;
X-CSE-ConnectionGUID: 6xic3sp+RKGwUBF8w0VwDw==
X-CSE-MsgGUID: 86xyg+u2Qu+e5KU/BJtX0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="21834862"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="21834862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:16 -0700
X-CSE-ConnectionGUID: CcEu4ocTQOOA+wsvlEKj0g==
X-CSE-MsgGUID: 5uWCnUFCQYeW43VtakzmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="91080205"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 01:40:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 20C37433; Mon, 19 Aug 2024 11:40:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v2 6/7] i2c: designware: Drop return value from i2c_dw_acpi_configure()
Date: Mon, 19 Aug 2024 11:39:10 +0300
Message-ID: <20240819084007.3700433-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
References: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_dw_acpi_configure() is called without checking of the returned
value, hence just drop it by converting to void.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 4 +---
 drivers/i2c/busses/i2c-designware-core.h   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 4160c5e57df4..f0d7cad92f1c 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -255,7 +255,7 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
 	kfree(buf.pointer);
 }
 
-int i2c_dw_acpi_configure(struct device *device)
+void i2c_dw_acpi_configure(struct device *device)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 	struct i2c_timings *t = &dev->timings;
@@ -285,8 +285,6 @@ int i2c_dw_acpi_configure(struct device *device)
 		dev->sda_hold_time = fs_ht;
 		break;
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 3e48f446ce53..ebcf816b731c 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -420,7 +420,7 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
-int i2c_dw_acpi_configure(struct device *device);
+void i2c_dw_acpi_configure(struct device *device);
 #else
-static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
+static inline void i2c_dw_acpi_configure(struct device *device) { }
 #endif
-- 
2.43.0.rc1.1336.g36b5255a03ac


