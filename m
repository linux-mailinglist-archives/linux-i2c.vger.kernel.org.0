Return-Path: <linux-i2c+bounces-3638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3EB8CC713
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BF8E1C20C9D
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662A114A4C1;
	Wed, 22 May 2024 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EtzUDjx8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D4148859;
	Wed, 22 May 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406009; cv=none; b=rfoiSCrEUj31+aUO0oI4fdL/6xyFd8Czbvjj4bgHX1P9Q2lG2a/CnAXsYmKF8B1O/LyOr82luWBuMG2mIz38skmd+NDkN7RgbPyAdmnDPknNSyazCRE5k03m1iyPH9BoVnSV2loc66NnbTi4ymYnVlWjX0RyBpoa6tkQYt/wJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406009; c=relaxed/simple;
	bh=so/mAaimo4YUFOIxeSddD0OiNIPa+CWrnkywJc8Erhw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FXe8p9PR4vxp6ES/MMlL5/D/SpkFDXHEP/CvnTMt3gtAmgSFjn6dXKaor8FQFTt7RQLX4vgylA7zR41YT8ZdSbp5369DuoQsp0CJ+SDiCoNnx5y8k1iitz4enZbjI21H2EQSSSQvNwAWgxTSOt8tHVjnzZeIe1LiCBFDCFNT6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EtzUDjx8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHp9Xi018575;
	Wed, 22 May 2024 19:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4pORVVcsA6Howf6k5wKer88rPHPM+CRiI07jqlHbYv8=;
 b=EtzUDjx8NRF+GkoiV+jV3bE8578plVUif5IEQa65meygjvpsuQ5cUxgE6unykC8BShOK
 kY4KmrtQzOWdtoS7cUTZZV8ouFRAHYeaCASbKasEY5qU5v1885YtIyIyE4JdZtRRqpz2
 N+C3k+pRwcJSjc2kfsg7VlArMnsInuFv0KgJJLHx2a6OUQ9a+9IYRVqXK4N2nozm94le
 P5kmXMyx0AaMtrjOboETbSMiTxTlMfK9Rd/hO965qhsmABMQNhHMAJ+7emSlmMYWjtzF
 rnApw17h5lOrQHj2hN86neT5uJxAG82s51uO87P0dK2qA0jzmvNtBJsU5t1zmMRY+EX/ Jg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9k7tgkph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:34 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJACp6008126;
	Wed, 22 May 2024 19:25:33 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y78vm5a5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:33 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPUqU43123266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:32 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAB2F58061;
	Wed, 22 May 2024 19:25:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5262F58069;
	Wed, 22 May 2024 19:25:30 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:30 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 15/20] ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
Date: Wed, 22 May 2024 14:25:19 -0500
Message-Id: <20240522192524.3286237-16-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: K5ZnNuZClZ0A91LR60zmoRvKNRLg-uiB
X-Proofpoint-GUID: K5ZnNuZClZ0A91LR60zmoRvKNRLg-uiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=656
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

The 4U Blueridge is identical to the Blueridge system but has two extra
power supplies.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../aspeed/aspeed-bmc-ibm-blueridge-4u.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts
new file mode 100644
index 0000000000000..839aad4ddd917
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-blueridge.dts"
+
+/ {
+	model = "Blueridge 4U";
+};
+
+&i2c3 {
+	power-supply@6a {
+		compatible = "ibm,cffps";
+		reg = <0x6a>;
+	};
+
+	power-supply@6b {
+		compatible = "ibm,cffps";
+		reg = <0x6b>;
+	};
+};
-- 
2.39.3


