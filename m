Return-Path: <linux-i2c+bounces-3624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA68CC6DB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D0D1C20D95
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DEC146A75;
	Wed, 22 May 2024 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rVEi0nUu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E4145B2F;
	Wed, 22 May 2024 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406003; cv=none; b=kA/FCEJDWZDjUBExgNwRR0r9PryhSDKKeRewj61OCv010hCnE0TXfqCDVthxnFlWfWqCCkea+k7Z+l9HQPYLiuR69ENDEQRUwaLJnQjZk7RrELJ1jyGTEfSYo/HkZNtfNG5kAEF0g02P1ZOxVudU4vf7TOVXSIZd6w8AH5h4vno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406003; c=relaxed/simple;
	bh=cFWcpARcjYT9zgqi3WWrWm5Xze5Fb0jQpNzucFqM79k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BWaeySQ5Z2nnkc3jYyDb1Ds0qCNrPLLvk5wwdVaWSzAUeLoFJEN9zkEyysg/Cj3hLOQQB33uhOgesz8LEHDewV3J+3PH1R0YfKs4YUvrH0v2RWpxwRtJi6YkuOw5NGSQ2AZCFpJcGWFA9reIUe3oHC90UEecYthubRVV4lwK8Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rVEi0nUu; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MINKxp011088;
	Wed, 22 May 2024 19:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Lee03BLXifhyW6cVx+t02zzYMJGHqQXg03t0Uf26jiE=;
 b=rVEi0nUuZrtwZvO53NNDoN+BbhMBdsysL4A4/TzZ/C/0HeeTXJxF5F7ptxf6y018sz2t
 aq15g978utHsUGmweF1YPaX5SYxy4wcgFLZoSCjbbLkAjoN/fkJYDIv2exVEF/e7UV2+
 c9RO0SiA31zOedGJtyf6byl8/Qv+4QTfBCexDPeEFeYlL73ROKLqddFjtpSyA0uyW/Zz
 Th8NNetI3hofNBOsYS8fYUKxAS4amIpOimIWY9P0EOlCDjLRDAE9lTRS8dP8k3VUEtTR
 qTXSGCRsK9+RbpKgOQ0NyjjKF+r8ORdpJUTA2vp4+4qwvTI5OAYnoIF3SjPoUAgG+kIl sA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9nx0g4yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:36 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJ5Mav008123;
	Wed, 22 May 2024 19:25:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y78vm5a62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:35 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPVbs36700826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:33 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA8D58062;
	Wed, 22 May 2024 19:25:31 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FB095805D;
	Wed, 22 May 2024 19:25:31 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Date: Wed, 22 May 2024 14:25:21 -0500
Message-Id: <20240522192524.3286237-18-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2DIixh4kmnmVHg76-TI-thoi7B-3m9oJ
X-Proofpoint-GUID: 2DIixh4kmnmVHg76-TI-thoi7B-3m9oJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=943
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

The Huygens is a Rainier with modifed FSI wiring.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-ibm-huygens.dts     | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 5e3392621697a..ac2804c96554a 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-bonnell.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-fuji.dtb \
+	aspeed-bmc-ibm-huygens.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
 	aspeed-bmc-ibm-rainier-1s4u.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts
new file mode 100644
index 0000000000000..4a731b772fc0b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier.dts"
+
+/ {
+	model = "Huygens";
+};
+
+&fsim0 {
+	/delete-node/ cfam@0,0;
+	/delete-property/ cfam-reset-gpios;
+
+	bus-frequency = <100000000>;
+};
+
+&fsim1 {
+	#address-cells = <2>;
+	#size-cells = <0>;
+	status = "okay";
+	bus-frequency = <100000000>;
+};
-- 
2.39.3


