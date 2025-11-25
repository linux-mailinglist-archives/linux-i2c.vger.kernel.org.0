Return-Path: <linux-i2c+bounces-14257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484EC84482
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 458C134B9A8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B847F2EDD7C;
	Tue, 25 Nov 2025 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYBOz7OH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC42EC0B6;
	Tue, 25 Nov 2025 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063778; cv=none; b=Pp0UzjgdPKf9R/BE8XSg6gvKdR5UKKLBWouAOJA09xnV5wfYGr4uHNNWZKz5DIKc2O+ou9uqaZXl8J3GOc+0dK/YszQ6kznKwb8lh5dVSBsnVTLcca1Az95xcXX9bAGDW7GyEPRwPf/oln/gMFVBlZ751d9/wEOMwmwHyZnS5UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063778; c=relaxed/simple;
	bh=A49ynttcQPpMOC7PfMS/4cNsyWV89BMbzoXpH2UmpTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LycQH4veyhGYEDjU3WboIcajRmfzKkvbXFB4VJGHyMuLH5nHfHjzn8FcnA3618UnTiwoECJ4D3qx26MHyMM1tgxbf3laYDTxs+ZI9LXrT/48fqLPu2/VvHcsYK7alDOC3Sdfi8NJ5mHrDCWixrg9cdno2/oqYlB5U3IlyE+SCqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYBOz7OH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764063777; x=1795599777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A49ynttcQPpMOC7PfMS/4cNsyWV89BMbzoXpH2UmpTY=;
  b=iYBOz7OH+HZCvDgnkrXxIKK9iLk0ehHtl5is4Cz/0OOzW7pFNW6j4See
   2joKyvRAZTkGuM0TkJWylALVhxWi543+gRMJlmzWIRJKuf9/bRVY2AlJ3
   PityngOmU/PXhrJm+AzSMHtFAdVVOWGN76PjlvSY9RCCO6m68aUXBDNza
   SUT57No8MhdLn92j8qcJpWGOfm1p9+vZuSX3e+Fk5prIfgZwwUN9sd6mE
   CTb8yjrpQrWJKQAzBqFB8XkCV9VcFZULjl/Pd8TtsXgM3/Ibl80GyHZYJ
   A4Sb8nursiHWeat7i4W9a7EIsq4igpzZ5SaznYKQM0+O1Bu9N7mhGXdPJ
   A==;
X-CSE-ConnectionGUID: 8+8eVjMzR+u3iYeaLF6qLw==
X-CSE-MsgGUID: i4OhZHJKRqqISdwXG+wAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76700496"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76700496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:42:54 -0800
X-CSE-ConnectionGUID: KOC6raNhSUqdCAirOwkDjA==
X-CSE-MsgGUID: QwSUdc52QWS8PxEJt+pwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223562651"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 01:42:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 43063A1; Tue, 25 Nov 2025 10:42:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 1/2] i2c: acpi: Return -ENOENT when no resources found in i2c_acpi_client_count()
Date: Tue, 25 Nov 2025 10:40:11 +0100
Message-ID: <20251125094249.1627498-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
References: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some users want to return an error to the upper layers when
i2c_acpi_client_count() returns 0. Follow the common pattern
in such cases, i.e. return -ENOENT instead of 0.

While at it, fix the kernel-doc warning about missing return value
description.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index ed90858a27b7..a7d36f8d7f2f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -84,8 +84,11 @@ static int i2c_acpi_resource_count(struct acpi_resource *ares, void *data)
  * i2c_acpi_client_count - Count the number of I2cSerialBus resources
  * @adev:	ACPI device
  *
- * Returns the number of I2cSerialBus resources in the ACPI-device's
+ * Return:
+ * The number of I2cSerialBus resources in the ACPI-device's
  * resource-list; or a negative error code.
+ *
+ * Specifically returns -ENOENT when no resources found.
  */
 int i2c_acpi_client_count(struct acpi_device *adev)
 {
@@ -97,7 +100,7 @@ int i2c_acpi_client_count(struct acpi_device *adev)
 		return ret;
 
 	acpi_dev_free_resource_list(&r);
-	return count;
+	return count ?: -ENOENT;
 }
 EXPORT_SYMBOL_GPL(i2c_acpi_client_count);
 
-- 
2.50.1


