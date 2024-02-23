Return-Path: <linux-i2c+bounces-1943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40286120D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 13:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 846E9B21795
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 12:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5267E571;
	Fri, 23 Feb 2024 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Lt1cPt7s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1257D41D;
	Fri, 23 Feb 2024 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708693080; cv=none; b=QwF5dYoj7jwEpf6NrK+3zCZFvPoupsEbG5TJKKqvb6fNl0le1zlE1DcNh3XMfkIJG7dB5uvoZvrHp4h5hBhPFdnL4DU3U71JwTApUB/F9nxhYW6c+jS3LuKuiPbv3t2lXwOHTvKBYLnE/djp6KV25QvRqPEBzMyiFSKvTHTjoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708693080; c=relaxed/simple;
	bh=XY+tm2y5szb1MPyuNun+X4TyUoDY4PILE91SoZn1BWQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HANvOBtL2yRtHlRzBnaueMo/RCvcvIfc1gNoliBdKMUO6sVwU+4WjTq4nGknf/j48tX/cRexNMOs3Ss0nQNCs/G24JaN1DjR/JMmIH+DRssrwXoq3yU6eyIsSZ0B96tualv+DioB2a+7HEw/6++mHMfb1SvA8Q7U0OI7P/Mgf1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Lt1cPt7s; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N9DE6P025225;
	Fri, 23 Feb 2024 04:57:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=Dcw4/NuS5Pt5aps560w6ajK4Y/CAv7RaToXMkJYe4LY=; b=Lt1
	cPt7se2HzN2i9YzVJFSb+4vp16BsxVKr11y4PAgiKxfwv/sBXPLf/gtVAxMv/j6V
	gibnNYXgeDpNN8hI99/5+WMPSJXyyPz4KxlH3+y3JoJ1SbBC2OrFmxh7IWApARjH
	zbPKrOm3wKmhnKXcXtn92y/M7o81A+zZy1DtNacr+v4rwB0TWDy+n/VFWAZQeC0C
	osT7ScX92k5JOSD3mG5vJ+fA1mtj9UnctVdK/XLKUc0bSKPiZ6UoHnjmLdx958P5
	/tLFOgS3mKEpL6obSSD4e5RELg34LUE+dhB0k3+luClcGZXPnndUv65FWQxxpvz8
	kmrT7xu+Yu2Tpyj4Xcg==
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3werhd8mdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 04:57:53 -0800 (PST)
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 23 Feb
 2024 04:57:51 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Fri, 23 Feb 2024 04:57:51 -0800
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 9ED193F70D0;
	Fri, 23 Feb 2024 04:57:50 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v4 3/4] i2c: octeon: Handle watchdog timeout
Date: Fri, 23 Feb 2024 04:57:24 -0800
Message-ID: <20240223125725.1709624-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223125725.1709624-1-pmalgujar@marvell.com>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZFMqlN20SjT6PJboqfdFGzdRV-d37KY7
X-Proofpoint-ORIG-GUID: ZFMqlN20SjT6PJboqfdFGzdRV-d37KY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02

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
index 36e7beeab25c63c2341313d6aa3421049ad92990..7cc50fe6ad3d032241bf2cc2e49c0343b72a6c03 100644
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
+		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		/* Set BUS_MON_RST to reset bus monitor */
+		mode |= BUS_MON_RST_MASK;
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+		return -EIO;
 	default:
 		dev_err(i2c->dev, "unhandled state: %d\n", stat);
 		return -EIO;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 5927d24926ce898efbee111046092960e48ce3ff..aa0a6cf6ad67185cd116a2d674dccf97c57600c1 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -72,6 +72,7 @@
 #define STAT_SLAVE_ACK		0xC8
 #define STAT_AD2W_ACK		0xD0
 #define STAT_AD2W_NAK		0xD8
+#define STAT_WDOG_TOUT		0xF0
 #define STAT_IDLE		0xF8
 
 /* TWSI_INT values */
@@ -104,6 +105,9 @@ struct octeon_i2c_reg_offset {
 /* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
 #define TWSX_MODE_HS_MASK	(BIT(4) | BIT(0))
 
+/* Set BUS_MON_RST to reset bus monitor */
+#define BUS_MON_RST_MASK	BIT(3)
+
 struct octeon_i2c {
 	wait_queue_head_t queue;
 	struct i2c_adapter adap;
-- 
2.43.0


