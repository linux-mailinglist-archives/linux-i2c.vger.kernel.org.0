Return-Path: <linux-i2c+bounces-12123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E04B19361
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 12:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9364A176621
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 10:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544422877E3;
	Sun,  3 Aug 2025 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="NZglza77"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98CB2586EB;
	Sun,  3 Aug 2025 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754216131; cv=none; b=tsyb9inobRFH0IvxHcfz1qVejKBcqgXHPTlh5SQeR34fTZ1cmmG7tMyzGViUmGHIrFeXDj3nSWG1f4SgbKQI6xiqgtWWf8V/iPScWqpSl5wV2Ki78bKRU0Ov51dzk1Ex+ewFlU0LDdgRbHZ+DKTj3YX5GvXlEnwZ+utLjuoB3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754216131; c=relaxed/simple;
	bh=YkAIdA0wS6vvnDvoMgKi1ODLHsAtDofUEjVzPu9/D5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FkWrD7sOgyOxCxWpr01XLIl8pwztI0UDzjgySZPixWto59AQCPAM8nDc98J1fnY94GR3VUTIq+t5f74CACGIDDjAz8M4T0t1SHVKF1CSOQ6G5S3fLnA77ysu4vQAJ17wr/FelAU9bMCqAivOTY812p9XzG/avUZJrPHjUbi3UM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=NZglza77; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739uqbp006041;
	Sun, 3 Aug 2025 03:15:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=Y
	zUKtZavrf07QMFJuMBgP+p3PBmZTtlhpBLApN1p820=; b=NZglza77cQoHR88or
	JI3+nM3ybL1GBXyNE0Lspo7z8oSlHCHMrpWNrN6ebPo7boByE/MQe9pvPPHaiBcZ
	vhbIWodPBF63bAiUWduEjyX4yIwqGItJQ23siIotGte9htI0j+MxQZ6Mr6VttKkA
	6DR79/L5iS1vtqQ99T62Fn7gPV8HXf3zJpCXBtmpq7kH042sCthE/K+Ak8Z6yfee
	36uN0GgrHpBLsRXcSVE9fmUTpcp52XvhFUSLazWbwHitGZEIlDVOEeDw0jFjGhqZ
	Axt+7rhLiMwBTvWx0ht5Ou2xpFRVAymlw7vVNig63CwPKADcCpvHM7ICVlwDki6p
	tu+Pg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 489u22ru0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 03:15:12 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 3 Aug 2025 03:15:14 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 3 Aug 2025 03:15:14 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id 944A23F70A5;
	Sun,  3 Aug 2025 03:15:10 -0700 (PDT)
From: <enachman@marvell.com>
To: <gregory.clement@bootlin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH v2 1/1] i2c: mv64xxx: prevent illegal pointer access
Date: Sun, 3 Aug 2025 13:15:07 +0300
Message-ID: <20250803101507.659984-2-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250803101507.659984-1-enachman@marvell.com>
References: <20250803101507.659984-1-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=F7xXdrhN c=1 sm=1 tr=0 ts=688f36b0 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=2OwXVqhp2XgA:10 a=M5GUcnROAAAA:8 a=mi5DaCqa8Q0MJUv9qP0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: K6AA8XYq0or-8DpajKEfkp-m8Ts8RwSc
X-Proofpoint-ORIG-GUID: K6AA8XYq0or-8DpajKEfkp-m8Ts8RwSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MCBTYWx0ZWRfX8e/RkC0v5tRZ 1MfUPvyxxY1cIdhYT01dS5uKgdbJaj+oPhcNq0GnEDFTqmvt0GVC/BBj907cUJpFxl0Pa6z3ROU E0crEIMW6iuOj9tVhzz/ZF0Ug/YVY4Ia39bfhgTVUg8QEYFlRfHtg1uJzXQ2meGvFNDWV/al39A
 4pocXmwYF2dDgS9hznGB28Je9ZXZtEfIbgW2YUR6LD1V1TTJt1nDdnzUQtt6jCj+Xlc9aWgskTO xLXFHHORNEWrGtTedJBoajZJ9nA4NI7xvUxob3iXhprPfPFlhHhpDShWg10wqupKmNTYtjqifJt Na+nGxcjiMiGNInd98VdZG9nh67zOtN9l0SeSExRJj32UiMpIWw/7ZpFs/tgCeuT6EntGUvCmc8
 X5s2xxrw3SlP2qDIYa9xlF0JRNPuIC2K3fGfrnZqQX1KvAJAIhlLDMPVXXqjkZeh2Ud6GW6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01

From: Elad Nachman <enachman@marvell.com>

Spurious interrupts left while i2c controller still at RX or TX state
would try to access the RX or TX buffer pointer, which is NULL.
Add check to verify buffer pointer is not NULL before reading or writing
the buffer for additional TX or RX operations.

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


