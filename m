Return-Path: <linux-i2c+bounces-2701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B415E89386A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 08:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6941C1F21373
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 06:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133DBA37;
	Mon,  1 Apr 2024 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="C32W9/92"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA210F1;
	Mon,  1 Apr 2024 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711953197; cv=none; b=jQ+u16qaqmPAEqSC51XUiGKhpkBkqbUjLnaKsQ+XC1FWA5nGmcRPljt9zHpvq51YIM9u2C744i1YcSSzTmIuy9mzGSqHmU07cMaXFKPRKKPqVQYbTSIrEt9i7ps+yQ0KBcRGJUf2QygaHI3MxpmChPElpI0irv+BFKzqnogGi0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711953197; c=relaxed/simple;
	bh=0JMY6VdfKsSKx12FfWw6I+DdfcWxm4lbZgJjNmLKpZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vdk4vGXmbSgc4c44hgN9FXtUxZpRP/A1S8e687skVNoXKpKejTd19yK8LdA4LzpLv2qCoovBHM/lbEIdNBT5JdbxtMOvaGDlswuszcGxp/GzeZSqy/+31ofTJV63dYS+vTgS7NRW0CRtepVW+fvr5k6zzi/bdvK8B+WZBIn/dM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=C32W9/92; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42VMlR5O010926;
	Sun, 31 Mar 2024 23:33:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=NPqbJ/EVM7J6lCGcpbFhwJx8Oa2Ct1SMsBvy5II9QgE=; b=C32
	W9/925fhHL9RG3muvFneZw4Inu9o/5EQf+zhFJPtXXfqff7HJ0Dj4Sq7jHMVrkvR
	XFnSIsG7NEhqs/c0iNyn5uCQM/B8mVT827Sps0r6lVaJXzg8tu9bx1micKsaT22o
	EHY7J/Z+s1lBVUJ+wQkoArdSgwvevJ6iJpx8J3quUq7iUf8DYqzKpMmBPTFotfdZ
	LQ+yMgiNscTVMnCGBaOI27dk4MaWkkQ4FaUjTcdJGV3zqnWk+SsoVuh6qgQpVPHU
	jOeRS5AK0FwHTLoX4PmpeRYybGV3+j864VeOLLoWTi1GfztT16eslF2vric0rlRD
	Af/ROPbkOzEnGReRMtQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x7a7bsqxy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 23:33:11 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 31 Mar 2024 23:33:05 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 31 Mar 2024 23:33:04 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 92B763F705D;
	Sun, 31 Mar 2024 23:33:04 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v5 4/4] i2c: thunderx: Adding ioclk support
Date: Sun, 31 Mar 2024 23:32:18 -0700
Message-ID: <20240401063229.2112782-5-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240401063229.2112782-1-pmalgujar@marvell.com>
References: <20240401063229.2112782-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mihWR4MLu_sh02KHBBYEdDJW-bIb5zTi
X-Proofpoint-ORIG-GUID: mihWR4MLu_sh02KHBBYEdDJW-bIb5zTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_03,2024-03-28_01,2023-05-22_02

Read the ioclk property as reference clock if sclk not present in acpi
table to make it SOC agnostic.
In case, it's not populated from dts/acpi table, use the default clock
of 800 MHz which is optimal in either case of sclk/ioclk.

Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 31f11b77ab663626967c86086a03213876bf4a07..32d0e3930b675484138084e1bbed2e7cf898e1e1 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -27,7 +27,7 @@
 
 #define PCI_DEVICE_ID_THUNDER_TWSI	0xa012
 
-#define SYS_FREQ_DEFAULT		700000000
+#define SYS_FREQ_DEFAULT		800000000
 #define OTX2_REF_FREQ_DEFAULT		100000000
 
 #define TWSI_INT_ENA_W1C		0x1028
@@ -100,7 +100,8 @@ static void thunder_i2c_clock_enable(struct device *dev, struct octeon_i2c *i2c)
 		i2c->sys_freq = clk_get_rate(i2c->clk);
 	} else {
 		/* ACPI */
-		device_property_read_u32(dev, "sclk", &i2c->sys_freq);
+		if (device_property_read_u32(dev, "sclk", &i2c->sys_freq))
+			device_property_read_u32(dev, "ioclk", &i2c->sys_freq);
 	}
 
 skip:
-- 
2.43.0


