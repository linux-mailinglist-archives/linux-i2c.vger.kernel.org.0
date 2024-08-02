Return-Path: <linux-i2c+bounces-5105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BE946064
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 17:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C85EB1F2384B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 15:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E3E1537CF;
	Fri,  2 Aug 2024 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SeBcRrTz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065813635B;
	Fri,  2 Aug 2024 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612178; cv=none; b=ArA8Ihndny4c0FGxhqkttWZUwnM0G/eWkTI29NpBWt6PCC++dPDhEt5ty79rhdPz4LF2n/rbokKk/dZyIJzFJ3Ibl98ztwniomDI8Cnc3SJipdPdGgRBdk0W+TqdyMaNpX2V5iAFyXV0rmIA5Kd93ZJ4bX+5KbmMpJ61YAvzgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612178; c=relaxed/simple;
	bh=Mi9Y+xmy1ElT5sK8rm9xC1qgF/e8CG6fNSUwJ3AhZnA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjU2AcR0QN7khRpucaO7Y96GIr3GryaPjEHRimTc43xtkoZOLAPRoO1wyIskpiQVj9jTnsygnPUUTuRpXkLE5QwFsqFYVQkDyVQTE9wGhtcSP1llgEUEs3TsbLp9+bGFhwCF/xsoBsyMavMqlxwfBy9cYj8ajGT5d4X9NkrNAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SeBcRrTz; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726UoSj029760;
	Fri, 2 Aug 2024 10:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=r+CFxhhE17OWEQBmFZ6GtK6X5uVmGBuwZ0nLgjAqFrY=; b=
	SeBcRrTzHiImOjjiHoTb7KCZyvSJdM31TkIFOZ4CHoG+sukku5elzez2xjDiDTdX
	Ikm9yVn0gLH9xjuOVOpkRw3e7RKD7l+fona8NDPcFKc9/dZAygOrEfasW/5+Utv2
	2RiSgg8RYnbm7IBDd4a+L5JeZiefCqFy+3sF2OFfxMZK0n4+01AkaiIT/7qFRBZW
	8T+0mMAvnPgKTvnIVZ3alvEKHLmwTyeYrCISe4i/AuppWKqr9xQ/Bakuvl1oa0fP
	f0Aw6dhhyrN65DWNyMM5GGgJ2Adj5yBlWF/g+u8wl1EFRG8tDGWZv0+J966iCwYd
	5JcD+YZFAxn742SPV3R7oA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdnrvxb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 10:22:20 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 16:22:18 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 16:22:18 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E0B08820247;
	Fri,  2 Aug 2024 15:22:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <wsa+renesas@sang-engineering.com>,
        <mika.westerberg@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v2 1/3] spi: Add empty versions of ACPI functions
Date: Fri, 2 Aug 2024 16:22:13 +0100
Message-ID: <20240802152215.20831-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802152215.20831-1-rf@opensource.cirrus.com>
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: oDm4-qHhnHqyuS3UZBMZDKxkJ2zBb6Tm
X-Proofpoint-GUID: oDm4-qHhnHqyuS3UZBMZDKxkJ2zBb6Tm
X-Proofpoint-Spam-Reason: safe

Provide empty versions of acpi_spi_count_resources(),
acpi_spi_device_alloc() and acpi_spi_find_controller_by_adev()
if the real functions are not being built.

This commit fixes two problems with the original definitions:

1) There wasn't an empty version of these functions
2) The #if only depended on CONFIG_ACPI. But the functions are implemented
   in the core spi.c so CONFIG_SPI_MASTER must also be enabled for the real
   functions to exist.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes since V1:
- This patch is new in V2.

 include/linux/spi/spi.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e4f3f3d30a03..d47d5f14ff99 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -902,12 +902,29 @@ extern int devm_spi_register_controller(struct device *dev,
 					struct spi_controller *ctlr);
 extern void spi_unregister_controller(struct spi_controller *ctlr);
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SPI_MASTER)
 extern struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
 extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
 						struct acpi_device *adev,
 						int index);
 int acpi_spi_count_resources(struct acpi_device *adev);
+#else
+static inline struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev)
+{
+	return NULL;
+}
+
+static inline struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
+						       struct acpi_device *adev,
+						       int index)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline int acpi_spi_count_resources(struct acpi_device *adev)
+{
+	return 0;
+}
 #endif
 
 /*
-- 
2.39.2


