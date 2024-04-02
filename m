Return-Path: <linux-i2c+bounces-2726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF99895591
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 15:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E78151F220E4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A006F84A52;
	Tue,  2 Apr 2024 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="VpJtmkAW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6D86120;
	Tue,  2 Apr 2024 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065245; cv=none; b=n9Je0ySzo79EHUKIOMZQSyyBhVqU/lHA8dmlcteJcYiQGvYYhbdXzI5OlFGII6JsJkdF+Hi9t3+x+d1ApegFQD5OtXQDWgKIi3G8EaRkqYmFMZvuPo0MCsQ4VaiCmbQxBp2yPRrxfFzMI4Me37Qp49mYYOaR9EtYcL/C7d8Iqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065245; c=relaxed/simple;
	bh=tkbUuA3wEqnmzNBY5THv0nrcpOjHlbmCRJarBzren8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=diUCMfiEdd/kYwwY+HS4OGxU/fRFpYqQSiO4nU7T92tNWM6EGK7v5AiWgtXCHalo1sxL9AtLWO+wn0fucp5qtG5vsWUdIIbS83BDE6DEcG7Rq1o29GLNAH7Z6mjfoyrJ7Hxo80yLovp2daBGSxxT7+mCtBJc3UIzLIG7K9wfuYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=VpJtmkAW; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432C6u3Y015315;
	Tue, 2 Apr 2024 06:40:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=uEV9UHWP3A0SU1BOSYyAnNmgag+DqDV7tR3/j0Iu1GI=; b=VpJ
	tmkAWj5dYxoSq3IMB9JiFCRfHqMAJDT+Y5HLjjwB0oC49mk89yrjojqqj0Ygu4J8
	sEEOWIo7KPcOewHyvMP9Dg+tMxkkO/2es4+jnzJW7nSYLSoU/d/yNnp400vmSeA8
	OlSBnbDwBfT2wCPRMzeGwTp3XGDr8+Cobcm/EXMxvbZETwsQhe3UIXvEFZ0G0nmz
	KOaSpxhguGRydWqP8Tyy5Sj/ESarM3ZuSEaQOy5rmE4WgRwoMMLjnF7BI4OWrGHP
	AbqNw+JH0ab1B69e7ml4uXmHVjQG/yW2x+/whtEQaynOROnpxovEQgB1VafqHU3B
	IYRMEe8Q6zUwPj4kVmQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x8hr70c93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:40:41 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 06:40:38 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 2 Apr 2024 06:40:38 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 6151D3F706C;
	Tue,  2 Apr 2024 06:40:38 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v6 3/4] i2c: octeon: Handle watchdog timeout
Date: Tue, 2 Apr 2024 06:40:13 -0700
Message-ID: <20240402134018.2686919-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402134018.2686919-1-pmalgujar@marvell.com>
References: <20240402134018.2686919-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hleqS_NdwZGJ8v82vtJPqDv-fP18Nz3l
X-Proofpoint-ORIG-GUID: hleqS_NdwZGJ8v82vtJPqDv-fP18Nz3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02

From: Suneel Garapati <sgarapati@marvell.com>

Add watchdog timeout handling to cater to the unhandled warnings
seen during validation on boards with different I2C slaves.
This status code reflects the state that controller couldn't
receive any response from slave while being in non-idle state
and HW recommends to reset before any further bus access.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-octeon-core.c | 8 ++++++++
 drivers/i2c/busses/i2c-octeon-core.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 76a5ec100d3039b840ba28ae7a817da447923d4f..5b7b942141e725c7f9071c217c728efce067cee6 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -182,6 +182,7 @@ static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
 static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 {
 	u8 stat;
+	u64 mode;
 
 	/*
 	 * This is ugly... in HLC mode the status is not in the status register
@@ -244,6 +245,13 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 	case STAT_RXADDR_NAK:
 	case STAT_AD2W_NAK:
 		return -ENXIO;
+
+	case STAT_WDOG_TOUT:
+		mode = __raw_readq(i2c->twsi_base + OCTEON_REG_MODE(i2c));
+		/* Set BUS_MON_RST to reset bus monitor */
+		mode |= BUS_MON_RST_MASK;
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + OCTEON_REG_MODE(i2c));
+		return -EIO;
 	default:
 		dev_err(i2c->dev, "unhandled state: %d\n", stat);
 		return -EIO;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 39481e23e36fad098cf72dfd764e368e778f2840..7af01864da7522fc9485511e1feb184e8659c74f 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -73,6 +73,7 @@
 #define STAT_SLAVE_ACK		0xC8
 #define STAT_AD2W_ACK		0xD0
 #define STAT_AD2W_NAK		0xD8
+#define STAT_WDOG_TOUT		0xF0
 #define STAT_IDLE		0xF8
 
 /* TWSI_INT values */
@@ -107,6 +108,9 @@ struct octeon_i2c_reg_offset {
 #define TWSX_MODE_HS_MODE	BIT(0)
 #define TWSX_MODE_HS_MASK	(TWSX_MODE_REFCLK_SRC | TWSX_MODE_HS_MODE)
 
+/* Set BUS_MON_RST to reset bus monitor */
+#define BUS_MON_RST_MASK	BIT(3)
+
 struct octeon_i2c {
 	wait_queue_head_t queue;
 	struct i2c_adapter adap;
-- 
2.43.0


