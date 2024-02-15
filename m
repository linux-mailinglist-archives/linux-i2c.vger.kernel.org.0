Return-Path: <linux-i2c+bounces-1800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906F85704C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BCFD1C21C08
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC511487D8;
	Thu, 15 Feb 2024 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="idf+UuKk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2C151CC6;
	Thu, 15 Feb 2024 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034919; cv=none; b=eoBxFxruQUV+xU3FC99/ugGuVX/IZoNA1+d4ceKJnuzsIlQlO3j/7LXqS4JyXJ7dZHKD1kUoudFydRQpn9Tr4Bn0Yg0MjEbZpbbc3CvfLFPXdFwpBD7Jzs48tiMv4iRUzZjlX8Nf62Gr/a3unwMise5bzN4/VczFmbAmUuOanIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034919; c=relaxed/simple;
	bh=lblN2MxrNHftFgMgHVzLgv+0vLc3TPzvtG1g+PjEmhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZzAZuzqq982DrX5k/kRX/bY7PKETS9wrxWr9pwFFHyKiMyRzfATWEtwOLtdViA+dc1EfsaDCuBhGXqZAg3OehBKt5DUzk468zBENNDyeH5KkEItdU3BTLG6EnKeZ9kOpRru7BL6ZY/lBm/MGvGKgfLcxdQUX+DXRodyWOTYYweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=idf+UuKk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLX1AO019281;
	Thu, 15 Feb 2024 22:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xd7lrsen2it77yQmo7Ql0gP9UsW8IXDRnS5i0NzUgnI=;
 b=idf+UuKkauTb1zwU63vMpUta0cjhC50VLLdP8iR5kWnep3iuKeUJJU2evqtEwBy7EiUT
 eC3B1BwEC3Pv6AtXyfXnrvr3gQQAKFedcypris9f/Mtc0oBvGWIKEPjBmhwGJgtveLZu
 v4Lgt4nto1wJNeqoFn/umcvztNZNRlZfAFkgxOVqQRdCzoMzDvb6p7feYGYf69KJ5axD
 8bVNKCaDZ3QIvQUZAD+GRfw6JyJs+hTUX5Xu5/YHDfSumtzyBBgE+16LazpcluTHlcrU
 h+fiGxL24rR0QYhiDxF0j3phHSr5q2qO8d9mZMWHh/gZOAcHGj3x7pBf3BWMo9EcBMoa kQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9tmf8mx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLKApd010063;
	Thu, 15 Feb 2024 22:08:08 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm7811-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:07 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM844v34865452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:07 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF2725807A;
	Thu, 15 Feb 2024 22:08:02 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CEAC58072;
	Thu, 15 Feb 2024 22:08:02 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 02/33] clk: ast2600: Add FSI parent clock with correct rate
Date: Thu, 15 Feb 2024 16:07:28 -0600
Message-Id: <20240215220759.976998-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qu9m3EEKVKG-DGbpYkJKjIZdu1nYUI1H
X-Proofpoint-ORIG-GUID: qu9m3EEKVKG-DGbpYkJKjIZdu1nYUI1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

In order to calculate correct FSI bus clocks, the FSI clock must
correctly calculate the rate from the parent (APLL / 4).

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/clk/clk-ast2600.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 909c3137c428..faf88324f7b1 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -19,7 +19,7 @@
  * This includes the gates (configured from aspeed_g6_gates), plus the
  * explicitly-configured clocks (ASPEED_CLK_HPLL and up).
  */
-#define ASPEED_G6_NUM_CLKS		72
+#define ASPEED_G6_NUM_CLKS		73
 
 #define ASPEED_G6_SILICON_REV		0x014
 #define CHIP_REVISION_ID			GENMASK(23, 16)
@@ -157,7 +157,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	[ASPEED_CLK_GATE_UART11CLK]	= { 59,  -1, "uart11clk-gate",	"uartx", 0 },	/* UART11 */
 	[ASPEED_CLK_GATE_UART12CLK]	= { 60,  -1, "uart12clk-gate",	"uartx", 0 },	/* UART12 */
 	[ASPEED_CLK_GATE_UART13CLK]	= { 61,  -1, "uart13clk-gate",	"uartx", 0 },	/* UART13 */
-	[ASPEED_CLK_GATE_FSICLK]	= { 62,  59, "fsiclk-gate",	NULL,	 0 },	/* FSI */
+	[ASPEED_CLK_GATE_FSICLK]	= { 62,  59, "fsiclk-gate",	"fsiclk", 0 },	/* FSI */
 };
 
 static const struct clk_div_table ast2600_eclk_div_table[] = {
@@ -821,6 +821,9 @@ static void __init aspeed_g6_cc(struct regmap *map)
 
 	hw = clk_hw_register_fixed_factor(NULL, "i3cclk", "apll", 0, 1, 8);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_I3C] = hw;
+
+	hw = clk_hw_register_fixed_factor(NULL, "fsiclk", "apll", 0, 1, 4);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_FSI] = hw;
 };
 
 static void __init aspeed_g6_cc_init(struct device_node *np)
-- 
2.39.3


