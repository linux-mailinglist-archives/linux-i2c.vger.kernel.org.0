Return-Path: <linux-i2c+bounces-12064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1579B14A56
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 10:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 369B71AA020E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 08:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FCB283121;
	Tue, 29 Jul 2025 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="eQf8Ffl5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865E276048;
	Tue, 29 Jul 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778753; cv=none; b=am9hTdsdHgc5HCSGD+OnSagrxlKFUyvTUAjlNaVMfvwcME0OzP6hDdQW/LO2zKGseL9kCFADqF02YkWG//ZlSgb2oqQVMCe/jLTj+B+qJk21Wd5aVKhgY9kANcUyeDk+7KFsqt3MI5N5XJGJ9iDxwUmicgwHWI9JzVJyxHv7qHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778753; c=relaxed/simple;
	bh=ncoz8npPWeEDciha/k1u2VMI+5ssjNwUSg7Xtx7GnOg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AOaCEjwLEpGzZtr98TXzuVXEiNRb7EdTXDkVongQQUkfa6daz9VNQ+aj5OZQRkEiAmjnz1VCCycAur+TQe7dj6Q8hxrT6Frd6Q1bQq5EeLtcZtZ9KCYgDk8a7N2hd2TCC+4O5+mTaqOrH2l9/Q4nQKHq2W7w1yXS7MRSr4hRt3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=eQf8Ffl5; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8FK5N020608;
	Tue, 29 Jul 2025 01:45:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=gONPDYrHEEC95Gr3SY0tiwk
	FUefeZqvbBzfDrFe7Xak=; b=eQf8Ffl5qPDpXO5xS59KdceIqlM/ep3DpDnYoT4
	jysBSUeioidPH3xBSuDgV2/gojy8pxMpSV38hjFgVDotdqsgCsl3767VLeX89wvO
	xDo5vjqwhiPNS4Kx3Rspl9s+1Bbbw7Wx01NxP2w1XN/YDgWEuNlDtQ/3QEJWkGeP
	XLcp2OMFRwHiZUqM2gSuT4hiRWcMjMqLjcYm56M0K3jxCv1YU/DDPvsFSjZ0FyS4
	25NJiOlpIrjQ8feysJ7HXgt4z6pCqFPPg6cgNUaJTxmF6rLvRLd1vq437s+Q3ryy
	JYGu3Ju3LKEP69lKqfC81v316HnTrhuFsx5yLqIuozKYXcw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 486tma01k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 01:45:45 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Jul 2025 01:45:46 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Jul 2025 01:45:46 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id 2C7F13F7053;
	Tue, 29 Jul 2025 01:45:42 -0700 (PDT)
From: <enachman@marvell.com>
To: <gregory.clement@bootlin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH] i2c: mv64xxx: prevent illegal pointer access
Date: Tue, 29 Jul 2025 11:45:23 +0300
Message-ID: <20250729084523.3220002-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA2NyBTYWx0ZWRfX3SpsiKFwu60w Y1dNriqJhFlDE68p+RrOoDNqPPvA/4l4w3LxJkn+0rIvRCREHHvPQ9kjACDiY2CARlKPyy9zS7u WbLZUZhSPr83m918Iginqh63pqssLJV5t0cv4kP5eIUySMyHS0KtmW5nCI0Z/dRbany+D0L+8eI
 LXDzKkv5Twh2sO/hw2NIOGKEeAPtkQUg25AUmRx1ZUTOmAXdv5eplE9NVgQOtojMDLbCYPv1OKJ p33JtaKBiHyyTe7afkl2HLcT0+lBlCH5yub5ok+Fo9wyODNKJiPFoalRAKuMkrzOXiI02PBWepo WH2HeS6aR0DX4q6/Fo7O/4TaNH5U8E90srNQZEepOUMlmXflZHzAEEfetBZ2FE7Vqrbem94Pjni
 MsbTUEGn2qFXMjnltHKQbqe42IiDsfXuvb7FlK5OFDb9Np6Bq7+SFSjV3GvQJeZvvPW6m6WA
X-Proofpoint-GUID: 36usaOd5oBRzcbHZ3WjxrRglgtFwLODj
X-Proofpoint-ORIG-GUID: 36usaOd5oBRzcbHZ3WjxrRglgtFwLODj
X-Authority-Analysis: v=2.4 cv=XZ+JzJ55 c=1 sm=1 tr=0 ts=68888a39 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Wb1JkmetP80A:10 a=M5GUcnROAAAA:8 a=mi5DaCqa8Q0MJUv9qP0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01

From: Elad Nachman <enachman@marvell.com>

Spurious interrupts left while i2c controller still
at RX or TX state would try to access the RX or TX
buffer pointer, which is NULL.
Add check to verify buffer pointer is not NULL before
reading or writing the buffer for additional TX or RX
operations.

Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 8fc26a511320..e6baa9c520b4 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -390,14 +390,18 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 		break;
 
 	case MV64XXX_I2C_ACTION_SEND_DATA:
-		writel(drv_data->msg->buf[drv_data->byte_posn++],
-			drv_data->reg_base + drv_data->reg_offsets.data);
+		if (drv_data->msg && drv_data->msg->buf)
+			writel(drv_data->msg->buf[drv_data->byte_posn++],
+				drv_data->reg_base + drv_data->reg_offsets.data);
 		writel(drv_data->cntl_bits,
 			drv_data->reg_base + drv_data->reg_offsets.control);
 		break;
 
 	case MV64XXX_I2C_ACTION_RCV_DATA:
-		drv_data->msg->buf[drv_data->byte_posn++] =
+		if (drv_data->msg && drv_data->msg->buf)
+			drv_data->msg->buf[drv_data->byte_posn++] =
+				readl(drv_data->reg_base + drv_data->reg_offsets.data);
+		else
 			readl(drv_data->reg_base + drv_data->reg_offsets.data);
 		writel(drv_data->cntl_bits,
 			drv_data->reg_base + drv_data->reg_offsets.control);
-- 
2.25.1


