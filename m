Return-Path: <linux-i2c+bounces-1642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC984B86A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A215286313
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5A3132C1C;
	Tue,  6 Feb 2024 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3KZMtzn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E7132C0C
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231133; cv=none; b=aXpsqS7s30bOQROO8NJXXDN0/NQDPT5nF1dWncNfFIkes+TMJLzwsGWbJKe3sgbvXUp6oDZGj+re1QSl0igceOqiqtPkimyh4w9DlBttZ114UfMaCFLxW/gYA6Uruyyjnji9xg8jQtf7a+SuYLWnEAw4cFOyuX7hDNVVONTcbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231133; c=relaxed/simple;
	bh=eQewi6uV4XiXbYk11LIjiJ/M2sMvFRA5/5KJWhI5eC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaqlBnSnLgIg0YC/i4CV2qKF7edUTXMymO41qz9+yIVzWakH5gethQco6+RHA4A53Evg6C9HIeaXrIXcEPiP/WnttgGomxpr4lRrqthX6P9sd9vHFVvI9AjD3rA6HYU5BmQcZ9I5YP3jY1RNwEyAla/MNvSJGZb1iY+HH/4JuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3KZMtzn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231131; x=1738767131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eQewi6uV4XiXbYk11LIjiJ/M2sMvFRA5/5KJWhI5eC0=;
  b=B3KZMtznAF2I5fz8wiMXHO6R0rRbfFUJJx3ZIfhdH4Bnpge/MdB+o66F
   VpOVVpHQPkx5/qalwOnZ3EJem0gB0r9VaBGDpjfpdGJ9Vu6zFKkibpo4A
   fMlVGRadUc9bAFzHqR484Cyh1WuUEYceKtrszGq3OC20Rn1ab4vRHMsyV
   TXwomN2M7IwyxC/hKZGI6+fB61oeweK8P5q7djhu429osPtKdrNk6pgg/
   /NrdkeT3Cf6oQLzZj2iHxAZMKSSYZrV33U6Tg19av2Cd7X4m03QXJyXQ/
   tQsHlJwBM+tWg3hctu0AbvAAjYZqhV7jTo7ICPsct2lYT4uQn93Y/FKTa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206595"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206595"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933481923"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933481923"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:07 -0800
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
Subject: [PATCH v2 2/9] i2c: designware: Convert arbitration semaphore flag as semaphore type
Date: Tue,  6 Feb 2024 16:51:51 +0200
Message-ID: <20240206145158.227254-3-jarkko.nikula@linux.intel.com>
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

Make AMD PSP I2C bus arbitration semaphore flag as a type and add a
related flag bit mask. Only one bus semaphore implementation can be
active at a time so no need to reserve one flag bit for each of them.

Chosen mask size of 4-bits is large considering currently there is only
two semaphore implementations but there is no lack of free flag bits
either.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 2 +-
 drivers/i2c/busses/i2c-designware-core.h    | 4 +++-
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 63454b06e5da..5d788281fe7a 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -284,7 +284,7 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 	if (!dev)
 		return -ENODEV;
 
-	if (!(dev->flags & ARBITRATION_SEMAPHORE))
+	if ((dev->flags & SEMAPHORE_MASK) != SEMAPHORE_AMD_PSP)
 		return -ENODEV;
 
 	/* Allow to bind only one instance of a driver */
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4e1f0924f493..bac0aec3cb15 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -302,7 +302,9 @@ struct dw_i2c_dev {
 
 #define ACCESS_INTR_MASK			BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
-#define ARBITRATION_SEMAPHORE			BIT(2)
+
+#define SEMAPHORE_AMD_PSP			(1 << 4)
+#define SEMAPHORE_MASK				GENMASK(7, 4)
 
 #define MODEL_MSCC_OCELOT			(1 << 8)
 #define MODEL_BAIKAL_BT1			(2 << 8)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 855b698e99c0..efe9b8e0b7a2 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -50,7 +50,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
 	{ "AMD0010", ACCESS_INTR_MASK },
 	{ "AMDI0010", ACCESS_INTR_MASK },
-	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
+	{ "AMDI0019", ACCESS_INTR_MASK | SEMAPHORE_AMD_PSP },
 	{ "AMDI0510", 0 },
 	{ "APMC0D0F", 0 },
 	{ "HISI02A1", 0 },
-- 
2.43.0


