Return-Path: <linux-i2c+bounces-1638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272C784B41A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 13:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98021B245CC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97810132474;
	Tue,  6 Feb 2024 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="PwY89Ou4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5276131E33;
	Tue,  6 Feb 2024 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219911; cv=none; b=QvlrRl1f7rhvz5aeWmNvJimgvxadTdvNNU6d+EImBi34nXVEw+kbPBL+Tskd/rpbWQqhPmfRjZ6r63tRGwWdUc2hRjvCRwgBj4/1v+z8Tc8rUNRJ4uxQZvm2H65F5mMVrdWiaHwlF+qDYxU2CCyHcBDDcWt6ncPacQA93AQWets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219911; c=relaxed/simple;
	bh=5MaI+SAJmeMZipScJnfmg2EXRGX8tvxaCG/kfIfa3yc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GwPQSbWrS6oHM5Ra85qt3U1zm/FjF6sYt/vYtD6DwH/WdBFaLbwQcNipfzRkt9ca1TONhX4Dg2H6H3JNJ9SQlVBZMi4MXVqafogRRTWXiaOWinD3JuNP6blwur1oZWZM5zvcCCpaTBil5nAH7U1ivTa6UdcLuNbTxwidn+kOipI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=PwY89Ou4; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416BBNGf024712;
	Tue, 6 Feb 2024 03:45:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=ej+YcMoyPkSvf5dqTkEkDG2azTmL1gzXIrSHqaw8k2s=; b=PwY
	89Ou4CP7KP/EL1UXGuITR96P9+zcw2ndN+d2w92oV28Fs3DHzrGC2sskqEKuY74h
	t6J8kfoMI8j4OfwUEaOO390T5h8KOhBZOVDNJIJiDK4f25rTNORSNEhEd4qZZ4WU
	Z768UmjV8R2VZYqzMk8LwO3vztbPpIoODoD72hw2XLyCjabVcGLnUcAKgyE3eta+
	oUddK0V6FD9BgD7EDwtIJXy67PxRKK8L8y6LMJgLxrc+3jQWP9UzgJ9ko1N62WPq
	3dJyJOqiklqwijWfXA7Fa3viPOSaZetb/ewSB9JnRmA9FKBUTShFxuL3vpN5FF4B
	vIMqJOMnoTWpc+XFxhA==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3w38y4j006-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 03:45:06 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 6 Feb
 2024 03:45:05 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Tue, 6 Feb 2024 03:45:05 -0800
Received: from localhost.localdomain (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id A503A3F7041;
	Tue,  6 Feb 2024 03:45:04 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v3 3/4] i2c: octeon: Handle watchdog timeout
Date: Tue, 6 Feb 2024 03:43:48 -0800
Message-ID: <20240206114349.32197-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240206114349.32197-1-pmalgujar@marvell.com>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: afM_f96TIEIfEP7b4ojVOv2hQGf_qfaS
X-Proofpoint-GUID: afM_f96TIEIfEP7b4ojVOv2hQGf_qfaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02

From: Suneel Garapati <sgarapati@marvell.com>

Status code 0xF0 refers to expiry of TWSI controller
access watchdog and needs bus monitor reset using MODE
register.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-octeon-core.c | 8 ++++++++
 drivers/i2c/busses/i2c-octeon-core.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 6636719ca8f005056230620e2cee19de7154e024..0c89d8d640424356f1ea4f7da11d528631ae7efd 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -178,6 +178,7 @@ static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
 static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 {
 	u8 stat;
+	u64 mode;
 
 	/*
 	 * This is ugly... in HLC mode the status is not in the status register
@@ -240,6 +241,13 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 	case STAT_RXADDR_NAK:
 	case STAT_AD2W_NAK:
 		return -ENXIO;
+
+	case STAT_WDOG_TOUT:
+		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		/* Set BUS_MON_RST to reset bus monitor */
+		mode |= BUS_MON_RST_MASK;
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+		return -EIO;
 	default:
 		dev_err(i2c->dev, "unhandled state: %d\n", stat);
 		return -EIO;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index e89f041550ace5f7cbcdd94146d0193abe51d466..e53fe60a41b7feb7ccc081cc671cec7be00c5a97 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -72,6 +72,7 @@
 #define STAT_SLAVE_ACK		0xC8
 #define STAT_AD2W_ACK		0xD0
 #define STAT_AD2W_NAK		0xD8
+#define STAT_WDOG_TOUT		0xF0
 #define STAT_IDLE		0xF8
 
 /* TWSI_INT values */
@@ -106,6 +107,9 @@ struct octeon_i2c_reg_offset {
 /* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
 #define TWSX_MODE_HS_MASK	(BIT(4) | BIT(0))
 
+/* Set BUS_MON_RST to reset bus monitor */
+#define BUS_MON_RST_MASK	BIT(3)
+
 struct octeon_i2c {
 	wait_queue_head_t queue;
 	struct i2c_adapter adap;
-- 
2.42.0


