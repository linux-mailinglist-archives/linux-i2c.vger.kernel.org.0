Return-Path: <linux-i2c+bounces-1641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99584B869
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077891F26855
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CB7132C04;
	Tue,  6 Feb 2024 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUO2ZSdt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B3133282
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231129; cv=none; b=GkCHMvKDQZvxx0BVlTjY0FQ5LYAr7B6YeopEwuqX/NvwR8e7TZeL/6TzCVee5gomVKWYrdqepJfDeli6baBFM6FxBjse1T0lZq8zIApYs1N0xhzZjVo416UCuVk1tlq88bximR10XuGh/YCgb5vjvt1Zra0z22oyU6bUVDGZhec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231129; c=relaxed/simple;
	bh=sKBP/0cCh2+waP1FdOLfePMO3191pbtjj5ecHS18hjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXgEu9Q+Gnfa6ZaTmr6Af+P0ANEPl/Ymx/x0Cp8wWyD3AvFkRXjtv3d3uD5KallJ8+gZgbszuX4Z8yHRWTfMe6ARoKxpzUkkKf6cEPsqmX1LUUb2Oh7IgDaUBxXsDgCNlO+gpE5BIfN9jha2FEuUfw/xbpsCgJ/Mv18pWoaZmKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUO2ZSdt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231128; x=1738767128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sKBP/0cCh2+waP1FdOLfePMO3191pbtjj5ecHS18hjs=;
  b=RUO2ZSdt8LmHHcDvD1qLcOcgqLfUfFcNb723mcPJ4Fkc/AbwZxBFdhnC
   EGgmic6aCqxESyhAwf2gb7ol2TBbdSA58zwATPl/j84Cb2RUHji1OE8tc
   0tez1Cqo4y/cWark8aLr5dcmMghbQwW0sqvvR82GlGQCbltAldGCZmIpt
   hRPHl8Ojj7xEF60rokC6Oxxlsq3Sc73k/6hw7HXho/6UESbTo+mzJ1c5s
   jyc1/Kdz2STiLFQF0cs5kosvt8Z5rmD5YCOiVx7y0fP7sKIUQ0fAqxHwb
   LJbjskA8JmKrWGHsM6paO4BE5NGzyEmQ0tFviKlHP8rcby+8xZ091DE9Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206579"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206579"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933481903"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933481903"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:04 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 1/9] i2c: designware: Add some flexiblity to the model info
Date: Tue,  6 Feb 2024 16:51:50 +0200
Message-ID: <20240206145158.227254-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>

Currently the way to identify a model is via a bit field, of which
4 bits are currently defined.

Use a shifted value to that more models can be defined.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a7f6f3eafad7..4e1f0924f493 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -304,10 +304,10 @@ struct dw_i2c_dev {
 #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
 #define ARBITRATION_SEMAPHORE			BIT(2)
 
-#define MODEL_MSCC_OCELOT			BIT(8)
-#define MODEL_BAIKAL_BT1			BIT(9)
-#define MODEL_AMD_NAVI_GPU			BIT(10)
-#define MODEL_WANGXUN_SP			BIT(11)
+#define MODEL_MSCC_OCELOT			(1 << 8)
+#define MODEL_BAIKAL_BT1			(2 << 8)
+#define MODEL_AMD_NAVI_GPU			(3 << 8)
+#define MODEL_WANGXUN_SP			(4 << 8)
 #define MODEL_MASK				GENMASK(11, 8)
 
 /*
-- 
2.43.0


