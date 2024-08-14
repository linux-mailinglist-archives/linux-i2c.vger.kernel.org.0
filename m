Return-Path: <linux-i2c+bounces-5379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B07A951AAD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 14:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1081C210E8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 12:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2861B0106;
	Wed, 14 Aug 2024 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CKn8KUP+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13D1AED49;
	Wed, 14 Aug 2024 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723637826; cv=none; b=NPqMxPEBRCKjGfhC4L+t07mIB6FjgAYAL/wUic6JXhUz19mGqLaW7uGYla0RbTAHzAmHdoQAztrQ2GohUCpCJT0KxH46dPfkjoI1qB1S7v2XzsolIgbX36KSykmXgvwv2J5IjgdxLJr1Xr43Ry9jiGAMLwrZHh1wPsQey9gnQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723637826; c=relaxed/simple;
	bh=cQ6zoQsOcpFLXMWi3hosEVA+UT+cA/CHR4exBfpLGMA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dermAkfkuc3FkLYEO2xVKMLi6vlxalGULZjMuKliI24lBE4IkggJUzL5ZUEYKh34PugmUN/QmsfNDaGhPV3zyn7Cn5WZz43CSohg9x52al0kBN5bG8NE1y6zoSpgfZPJghG3qlbO2c1ZJ5yfYFVRwTJhfLOdlNGbTdavnfy2AZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CKn8KUP+; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E5j9hf020215;
	Wed, 14 Aug 2024 07:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fpfGa+ZFwQoEjVp1
	ybtTfwxTGsyWbIL6bk/kfKNVhL8=; b=CKn8KUP+AwqpsJ/LJQpMz0cnBWeNsZ2w
	Vwe+Fm9NYAwl4kaq0uAN/+AuCy03G9PsTg2HsNGRhFCpHbHOv7EcKSn8RUA1vgpA
	FHhRFVjifJAk4MwWBXLpKoBnvXHem687uguOQ1/9YfnB3nDRiuH4qQgSN/182dGs
	vOkBUWjC6RI95DBXDBkxMRB87HeIVjA+FLJk2fk5nfpRYP5eaUdxwhnSbGBoP1Vf
	WRFiWewCnVgSwjo4OiBxCCWLEjcP+W8N7DgnDt8kVg2bZTSp7pJ4BUQ67OrpCzl7
	DjzOMzGVbkCa0cVHSHXgjIfcVToIvLBQF+gZFMI51j9ix+NvVK7vzg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40x5kwmgna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 07:16:52 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 13:16:50 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 14 Aug 2024 13:16:49 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D32A5820241;
	Wed, 14 Aug 2024 12:16:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <wsa+renesas@sang-engineering.com>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "kernel test
 robot" <lkp@intel.com>
Subject: [PATCH] i2c: Use IS_REACHABLE() for substituting empty ACPI functions
Date: Wed, 14 Aug 2024 13:16:49 +0100
Message-ID: <20240814121649.261693-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zi_FY9r6dSfo3Z4GJql1AaNhbCkCdX64
X-Proofpoint-GUID: zi_FY9r6dSfo3Z4GJql1AaNhbCkCdX64
X-Proofpoint-Spam-Reason: safe

Replace IS_ENABLED() with IS_REACHABLE() to substitute empty stubs for:
    i2c_acpi_get_i2c_resource()
    i2c_acpi_client_count()
    i2c_acpi_find_bus_speed()
    i2c_acpi_new_device_by_fwnode()
    i2c_adapter *i2c_acpi_find_adapter_by_handle()
    i2c_acpi_waive_d0_probe()

commit f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI
functions") partially fixed this conditional to depend on CONFIG_I2C,
but used IS_ENABLED(), which is wrong since CONFIG_I2C is tristate.

CONFIG_ACPI is boolean but let's also change it to use IS_REACHABLE()
to future-proof it against becoming tristate.

Somehow despite testing various combinations of CONFIG_I2C and CONFIG_ACPI
we missed the combination CONFIG_I2C=m, CONFIG_ACPI=y.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI functions")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@intel.com/
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 7eedd0c662da..377def497298 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1066,7 +1066,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
+#if IS_REACHABLE(CONFIG_ACPI) && IS_REACHABLE(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 int i2c_acpi_client_count(struct acpi_device *adev);
-- 
2.39.2


