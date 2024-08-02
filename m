Return-Path: <linux-i2c+bounces-5107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E385594606B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 17:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85A8EB25414
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 15:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E278A15C15A;
	Fri,  2 Aug 2024 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kKYX2syx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34004175D2D;
	Fri,  2 Aug 2024 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612196; cv=none; b=RMp9Qeka7PvhopQDtWDGwQjni2BdMDVjs5ytUbzq22rXf6LY1mNowJs/7wh6T3XcTT3Zp9+b5YTj87zKEoHxwYsTOEbEm1q6Ku0pJSGTCIt/jCE60JNkN+PGDLj6KVerxsOBmWocKiU9UwOeGMik3duDdrLOd/plj9Ru7TRv3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612196; c=relaxed/simple;
	bh=oc3MwRnxQ8dOmRxTTNh25pYz7hkDA1kfmwPGKXDk500=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NX3mrP/Cd/WbpCqQMwLD7M4C7DbHiE1JrM0glnf/C4taAcDx9yMPK2H7YSKWth+x5/gpY0iKpR6mCXWxqCfW8vdsrYx8N/JRjTDlzN3Hh97s+hiw38bnM8bCwpADPYijFO9MXGLGrQtrr+ZY6VddDNPHih92yY/H4roEFXhPBCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kKYX2syx; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726i5rw032551;
	Fri, 2 Aug 2024 10:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AQrdiELB5JNgJfN36r4kK6/49cWfOLb3tsBhkMX5rts=; b=
	kKYX2syxZ3Kj17i+lD6QRo0Cq3N6H3XHZUwxDfFE7biTKTmXBScrlyiknxYe3bpk
	jUmZXmMLa2yS7z8qxRYz7+HypqP+yVhxiKSnijnnl9csYyif1BNWsocG0DqPymbQ
	aeAR9DbMGBXFbFyFKU+t1BH6r+bJAuTf9jae43g4CL5aaNJINn5RhQKqgJHsdZZl
	e/KO2jgfq2t71o720eHEQ8sSj4IpelYjgkBXZs6jRDiE8Dsigzzp9MsV1f5NovSc
	Y3x8zA8BmYAeY7hfdv+PztiV8Ld4wmSkCJEfxtYRFDyfT7XAhdanvZl2BHvhgAAC
	QAskR7KecT2pt9K9gAthbg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdxruc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 10:22:20 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 16:22:18 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 16:22:18 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5B605820244;
	Fri,  2 Aug 2024 15:22:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <wsa+renesas@sang-engineering.com>,
        <mika.westerberg@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v2 2/3] i2c: Fix conditional for substituting empty ACPI functions
Date: Fri, 2 Aug 2024 16:22:14 +0100
Message-ID: <20240802152215.20831-3-rf@opensource.cirrus.com>
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
X-Proofpoint-GUID: CAbWXScuf5HYT2Ot1uFF23DE34mAzYP5
X-Proofpoint-ORIG-GUID: CAbWXScuf5HYT2Ot1uFF23DE34mAzYP5
X-Proofpoint-Spam-Reason: safe

Add IS_ENABLED(CONFIG_I2C) to the conditional around a bunch of ACPI
functions.

The conditional around these functions depended only on CONFIG_ACPI.
But the functions are implemented in I2C core, so are only present if
CONFIG_I2C is enabled.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes since V1:
- This patch is new in V2.

 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 07e33bbc9256..7eedd0c662da 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1066,7 +1066,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 int i2c_acpi_client_count(struct acpi_device *adev);
-- 
2.39.2


