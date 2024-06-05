Return-Path: <linux-i2c+bounces-3854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57E8FD892
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B052888DE
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2614168C0C;
	Wed,  5 Jun 2024 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="o5ku3jlD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669316131C;
	Wed,  5 Jun 2024 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622621; cv=none; b=K00EmK7QJ3voTOqtS8KfcwTzH6tpuVxOSBfflY2SHx9tBbARp0KyG6x98SZE4z3syvMGkHavGBZhGd+J55/uHsl77A6rm/A+ERUZi3G9TabSsMyFXdA3TuSy+bR6J87gXRoOv4uHcOL7MSxsMudQemjIC1G1WSG8ypCWniRKJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622621; c=relaxed/simple;
	bh=VhedKvPFFiUAnj/wYMChhGaaPqdpO862oYKVIuAtwT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJ6yBVein3ssGW5tQW6blaJI7yACDJaZcwE/cYE/i66rKeRnW4x31gU14tvrtWfXzmk6e47y8Mkt2BgIuu8CVbSwWojO75iwL0AsCPB1eCrWeri5rLWt3Fp2YQCP2lxnhVcMfRVvOUn30503JLp3cU1SrrH49+okUwhNK5ulJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=o5ku3jlD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LC7nl011974;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=n2ELCBKlduOnR5wTkTQugicJX8taWF2bAtKMB7UJJcw=;
 b=o5ku3jlDKGnNpkYTseiN9vGHPln5AmkJc9bNvPHIFr9vVa9sJoN5hWHuUG+B6IB1A//t
 DQ+tw/tIvHh/uBH/GRgf9Ohk+jpgGhd2uc1gXM9kf+J0b/JEP/skiXNTDu+0PqHVYsw6
 57H28QZQbmGjWxBcbkNqqPyBzQorDDNu4XNofJMhBxLUHnRjfiNSBCN1IAOH3WLVzyUh
 tlY7NHhZQkZ9DgJSMv3oR5BvJKy0FMPmchqp09cTt4qaPbV53er7aF7lsLffEflccJbq
 MJuDW7M5iXRSnDoaxTxf3n7OoU5yoRfnCRxbVPjO0qD/bbNbgroiBOw8eBE4v80cmyR7 hw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IMrJS008468;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNLdK11797064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 465E158068;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09EBF5806A;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 26/40] i2c: fsi: Calculate clock divider from local bus frequency
Date: Wed,  5 Jun 2024 16:22:58 -0500
Message-Id: <20240605212312.349188-27-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qOMgNStxmKtiBcL3iSuT9syNUUV56CE1
X-Proofpoint-ORIG-GUID: qOMgNStxmKtiBcL3iSuT9syNUUV56CE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=973 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

Use the new FSI device local bus clock to calculate the proper
i2c clock divder and look up an optional clock-frequency property
from device tree. Change the default clock divider to 7 now that
the default local bus clock divider has been reduced as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Change minimum clock div to 3
 - Use DIV_ROUND_UP instead of re-implementing it
 - Better logic for checking for clock-frequency property

 drivers/i2c/busses/i2c-fsi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 10332693edf0d..2404ace8c56fa 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -27,7 +27,8 @@
 
 #define FSI_ENGID_I2C		0x7
 
-#define I2C_DEFAULT_CLK_DIV	6
+#define I2C_DEFAULT_CLK_DIV	7
+#define I2C_DEFAULT_CLK_RATE	400000
 
 /* i2c registers */
 #define I2C_FSI_FIFO		0x00
@@ -150,6 +151,7 @@ struct fsi_i2c_master {
 	u8			fifo_size;
 	struct list_head	ports;
 	struct mutex		lock;
+	u32			clock_div;
 };
 
 struct fsi_i2c_port {
@@ -194,7 +196,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	if (rc)
 		return rc;
 
-	mode |= FIELD_PREP(I2C_MODE_CLKDIV, I2C_DEFAULT_CLK_DIV);
+	mode |= FIELD_PREP(I2C_MODE_CLKDIV, i2c->clock_div);
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
 		return rc;
@@ -680,6 +682,7 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_port *port;
 	struct device_node *np;
 	u32 port_no, ports, stat;
+	u32 lbus;
 	int rc;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -689,6 +692,19 @@ static int fsi_i2c_probe(struct device *dev)
 	mutex_init(&i2c->lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
+	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
+
+	lbus = fsi_device_local_bus_frequency(i2c->fsi);
+	if (lbus) {
+		u32 clock;
+
+		if (device_property_read_u32(dev, "clock-frequency", &clock) || !clock)
+			clock = I2C_DEFAULT_CLK_RATE;
+
+		i2c->clock_div = DIV_ROUND_UP(DIV_ROUND_UP(lbus, clock), 4) - 1;
+		if (i2c->clock_div <= 2)
+			i2c->clock_div = 3;
+	}
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
-- 
2.39.3


