Return-Path: <linux-i2c+bounces-8576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C779F5480
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 340357A4B82
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 17:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7751FA8DD;
	Tue, 17 Dec 2024 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ihuk+tVr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA461F866E;
	Tue, 17 Dec 2024 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456988; cv=none; b=oA36qtib6JRKylEFP+Ni4eudY+wBJPka5g/UtADoCzRfFIfoIR6noCGTxYa54w2SqN67LU3xhH4Z877XxgfGUDoEfKdHCpiAP0burp0UXl1BhFbCnRmA7GaZhT19jHxlldP7RW/9uGg4jVisA6wLRApDaLAJcYgQwOGYsDAc+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456988; c=relaxed/simple;
	bh=wU38PfH5w0kByQPjSXCr1vrzHjkvY0x9gfZBz4zjhBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0ycjvqaXg8nG4re+qex0So/LhSuJJGyrYjklEZ5njYBxSd2G7ijJ98ej4EbfVn/Nje7oLXChlzmdqg3W7r2MSXeWNst/lSLxXnUjE7pdt8sXw/9CkezHVbax1LpVo8XtUhbtlUrT88qk61UoAqCYHJmWifcO610GWJ9NNNVtjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ihuk+tVr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHC0E7f025028;
	Tue, 17 Dec 2024 17:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=R5+873Ef+Kkj4YNDK
	n1lh7cr/++D0FfitFuPzZwixKs=; b=ihuk+tVrXDQsy71FbIUDoh1uBCvvJCZtX
	CBAZXP0U/QSDZC6LZ1XoryD070i5T7StMea4l88VM7uhvAOabmweJu7hFqC2non9
	PToHQ3YpkaKGAzGkLMoTFq0Fdml8gcZ0QYeSJ4lKFvLjEpEuAA3YXWT5JuVYw79L
	cnIT8npbEEYoV2DL0AQ0KkjnvBvv37GfNMt68lZEuoP67IqVjgsvqqQSi9pcAC1f
	koY9xjf9lJGpD3cw1UmSu875i9MJMM55xPtwiTsGorD4Fz2goQB12ggJ+Qs6hk0c
	1lbp9ehlUTJsKv034DPUQjtAzD7YNTObUw9NeXeeONFZoQcLDhqHw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1aca3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BHH40gC021414;
	Tue, 17 Dec 2024 17:35:49 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1aca3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:49 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHFIwE7014435;
	Tue, 17 Dec 2024 17:35:48 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqy406x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:48 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BHHZl6632899780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 17:35:47 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2009C58059;
	Tue, 17 Dec 2024 17:35:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD2BE58058;
	Tue, 17 Dec 2024 17:35:45 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 17:35:45 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Date: Tue, 17 Dec 2024 11:35:35 -0600
Message-ID: <20241217173537.192331-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217173537.192331-1-ninad@linux.ibm.com>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wkWp5cporoFO1BP6_dFdfcnPS-qlhero
X-Proofpoint-ORIG-GUID: HNkbUGJPCFAxkqRCJFNudlAMYRsDbKmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=854 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170134

The system1 uses Intel common redundant (crps185) power supplies so move
to correct new crps driver.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 8f77bc9e860c..360b9ce3c850 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -681,22 +681,22 @@ &i2c2 {
 	status = "okay";
 
 	power-supply@58 {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x58>;
 	};
 
 	power-supply@59 {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x59>;
 	};
 
 	power-supply@5a {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x5a>;
 	};
 
 	power-supply@5b {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x5b>;
 	};
 };
-- 
2.43.0


