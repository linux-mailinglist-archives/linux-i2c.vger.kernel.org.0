Return-Path: <linux-i2c+bounces-3057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAFA8ADE87
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A05E284842
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 07:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACD45026B;
	Tue, 23 Apr 2024 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Jwwtlv4R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A386653398;
	Tue, 23 Apr 2024 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713858419; cv=none; b=HG3SBgn1OA1Vvd4OlKGpcxCECidSbKS/VTroXvCuCLenOeJ7/JqM4Hp6cbQlTEIvvjyJgDqDHa5xhMJrPRWR41Vp0BG3PaKxBG0C64k9WqOO5KRKO1qQUh12LCOYvEB6vBVDb8qCqWMty6oKZT0GyInnypV9QbVQVaBheUk3MOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713858419; c=relaxed/simple;
	bh=yP6lxvuSymTxQOW4Swfu6DslntzpjimH+bXUZsw9kYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWi9TyXE4Z2rIiw6Ns00qEMOmsdUClHj274GCk7aQ8rT5Jew4Xc6LIBBU8BAD8anJSm8nvgyA4Lzwn/x+c7GelX2cFchWPhw6L3rG0Cg9mg9yK5upq7J50kq2HtIBoBsNTsgbnfPYKX8Pt8g+LKvSJEPdqtxHYEgfte8LLkyp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Jwwtlv4R; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5iwLN027446;
	Tue, 23 Apr 2024 00:46:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=EaoaSnjxTEUWcZWHn2en1F+5MPQmfw/Te+tM5XZu4yg=; b=Jww
	tlv4R8ghq1e014LM0RqyLi4pyF9QgJIvU7yjX1FsqHEPmCF1ONR6znL3N3/pF2M0
	7kQzdQCFyuWkXyQwx+3vSbHxhIgdUfWJDjaQ7u8sDG+815uF6pmQILn1CfCJ2vdb
	wscB2y/soFGrlQD9Ho5nuZguG6DwjTZgfBX0BqJeDxKIBtTSJmEq0ZkEYe65PZ8l
	C//07zeCWQIDPzeHZ4Pd/I1sSu6tVUu9+bOs3fph2gcPZeAUsEkCB1bG7cHzWbvA
	JcYN9CaCClCqGpwRIrr6dGHNSsBwbxkKcXFnmjFa2oiR6FPRIGOTRJUl2qJMz9pY
	cOSQmXT/Wjc46awqzgA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3xmd7gg849-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 00:46:54 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 23 Apr 2024 00:46:53 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 23 Apr 2024 00:46:53 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 0B1DD3F7051;
	Tue, 23 Apr 2024 00:46:53 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v7 5/5] i2c: thunderx: Adding ioclk support
Date: Tue, 23 Apr 2024 00:46:08 -0700
Message-ID: <20240423074618.3278609-6-pmalgujar@marvell.com>
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
X-Proofpoint-ORIG-GUID: LJUejYXpfgUN92J9d_k7wGo4j1Sp7OLY
X-Proofpoint-GUID: LJUejYXpfgUN92J9d_k7wGo4j1Sp7OLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_04,2024-04-22_01,2023-05-22_02

Read the ioclk property as reference clock if sclk not present in acpi
table to make it SOC agnostic.
In case, it's not populated from dts/acpi table, use the default clock
of 800 MHz which is optimal in either case of sclk/ioclk.

Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
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


