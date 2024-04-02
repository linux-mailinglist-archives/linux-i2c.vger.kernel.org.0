Return-Path: <linux-i2c+bounces-2727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F78955A2
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 15:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FAA6B2E81E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 13:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E94586268;
	Tue,  2 Apr 2024 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="SWVb/P57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A786254;
	Tue,  2 Apr 2024 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065248; cv=none; b=ginTTODiZqcuOmYVIEi9BvlAtaibGj2BeK9CbyUN2pdlbO6nEl+RyhPFXtMVN85i7i8mO9TW5PSZ4fyOxDthtW9MS56yZTsPkC9cDXuXkJmuSJDfs5zwjbmbUcplQEi4VGmyFA3CjtT/QwUpTa0kdYypDv5od+OjLcjnr66EMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065248; c=relaxed/simple;
	bh=0JMY6VdfKsSKx12FfWw6I+DdfcWxm4lbZgJjNmLKpZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEzWo28wjFHppV9CILfWg1OP00fPNrdgsJ6/YY5gmfEEM2DhzEXOKBQ1bK3W+UGalFtFmDicq5LHmSw/T0ue31bj9o6hbl454q4OaYALNLdcfbTNf6Iq7iULjBlUZvNDiXevII1ope/hYVz9rqdFWaQhTUHpXZM9utiLc2fOB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=SWVb/P57; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432C6u3Z015315;
	Tue, 2 Apr 2024 06:40:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=NPqbJ/EVM7J6lCGcpbFhwJx8Oa2Ct1SMsBvy5II9QgE=; b=SWV
	b/P57exIoBwx4Mj5HkIG9cYJesA9l5I1PpyxGjn8SD2eZlDP+5iHS6sKn+nVwnj2
	EEO+jemqWr3a9bFbQakdh2+z4sXNa7PQkJp53byNqwx6M7RKfO2qUZrIqisB1tb4
	eTysNPE+ebGLYrdJj1ftyaw40OTTw083hlJaJaiNXIzj8mAN24fSPizHimk7Yxxu
	PAJ5+UzHgYATfYyJJalofRlMYdIdnhPb5Pc487z18pOFfTExc/pSVWnntQgrYx+U
	dQ3rq+ABjK2nnUnBL6pdl7gMknQC/nP4+xJ85PRS/UJINI2KP/y5mEXPTTtkhRvY
	hQoO19C5QSbtuIjtigA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x8hr70c9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:40:44 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 06:40:43 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 2 Apr 2024 06:40:43 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 534043F706C;
	Tue,  2 Apr 2024 06:40:43 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v6 4/4] i2c: thunderx: Adding ioclk support
Date: Tue, 2 Apr 2024 06:40:14 -0700
Message-ID: <20240402134018.2686919-5-pmalgujar@marvell.com>
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
X-Proofpoint-GUID: kEYOF7EZWBI5mAXJQT_AiYK-bt7kAz2Q
X-Proofpoint-ORIG-GUID: kEYOF7EZWBI5mAXJQT_AiYK-bt7kAz2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02

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


