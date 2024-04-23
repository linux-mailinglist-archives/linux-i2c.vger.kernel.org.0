Return-Path: <linux-i2c+bounces-3056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE78ADE85
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64361C2233C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 07:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCD152F68;
	Tue, 23 Apr 2024 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="V0X73/3O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C195026B;
	Tue, 23 Apr 2024 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713858413; cv=none; b=otlxL9dhFeAX00OEuHjSqWCXvdvu3O5XpYMyKmCKrr1na1rCAOqyzUxN4gjhLLAG1KFKDlWr1rr3hDjUnF7AmG/Hgm9E20s2fsvk/MZUqt+rZvRaY3IDIHjbXVQqX8mzlqOWuVgK+J9IJhwItPMsxGSsqFB7A8T2ZYfoqiGL2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713858413; c=relaxed/simple;
	bh=tkbUuA3wEqnmzNBY5THv0nrcpOjHlbmCRJarBzren8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=poMvp+iMlPU3Z/0wdrUx+WfqDAoW5fxCOOPbngKNILU4NCfWPXxUqxnk4p7m4lSH4DvClcuv0xyhnmB56P8xZH1aa0k9oTVXdnG1J1YJdViNpoCp3H/W7xpSfSbLZL9VZo8zE5s/sewQBe061mQq9Uk7f7VWok2FcaXeaRSf7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=V0X73/3O; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5bsc1016951;
	Tue, 23 Apr 2024 00:46:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=uEV9UHWP3A0SU1BOSYyAnNmgag+DqDV7tR3/j0Iu1GI=; b=V0X
	73/3OnH5tLBherzYdKArNfiCqoElDTBq1E4F5LFH7aASoOiXZJfHrMh/CHX7cuX3
	9iQDjzw5sywp7AnPX3j2pSV2fVzvH8z3/qb+YzOInycD+rk+Sz4cfVNA6kl0KYPW
	j6DNd2WCrwaNKqHq6tjPKCVhupC0rAIZDzHaWPUDvwcbLpbShk5dqYtXuHJczbjD
	Y/k0nFtimIrlVDV45dsRcEvWeQmcRIcgaRTUvZ2kxUWoTJcFbT7meLimjQPDrtgI
	SyVrS5DuZcUS7Bo8J3xA7zvSNQMnlSRDTswlvejb+3YlhTsz09bCspgrRvai+ts/
	vDgNZPi/ZxdeUF1TYIw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3xmd7gg841-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 00:46:49 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 23 Apr 2024 00:46:47 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 23 Apr 2024 00:46:47 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id BDE0B3F7051;
	Tue, 23 Apr 2024 00:46:47 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v7 4/5] i2c: octeon: Handle watchdog timeout
Date: Tue, 23 Apr 2024 00:46:07 -0700
Message-ID: <20240423074618.3278609-5-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423074618.3278609-1-pmalgujar@marvell.com>
References: <20240423074618.3278609-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Om1yH6rr8vJf6CA6_03ZBTTiK1vL_S9v
X-Proofpoint-GUID: Om1yH6rr8vJf6CA6_03ZBTTiK1vL_S9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_04,2024-04-22_01,2023-05-22_02

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


