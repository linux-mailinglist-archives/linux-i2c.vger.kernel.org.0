Return-Path: <linux-i2c+bounces-8561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003B9F40A4
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 03:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01AAA1634A2
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 02:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35AC14D6F6;
	Tue, 17 Dec 2024 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="coxSEJeB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D10413DB9F;
	Tue, 17 Dec 2024 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734402097; cv=none; b=MlF8MJpfi+zDNCJPN60chS0FU1wVMM9of9dlHEBRM/C45isyOcKL6A5o5CninPLiQPNjXGRkWEeki6gU5NVVJMT0fi7Zepu4ebGl91I7vHztgxkZltlMEIwWIoxwOmwItqWYTZbK5cIGf9dTK4RdCrmC6PqeRlzrdNKOaXxPIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734402097; c=relaxed/simple;
	bh=wU38PfH5w0kByQPjSXCr1vrzHjkvY0x9gfZBz4zjhBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBHaXHBEGL8u1CAF+3j2nM5WS8dqvf91w+kRWBcZmkx11dDrJGnFBQNBEr2Yj5Imm2cVv0nJEgo0V230Do0wMktmsMOFMr8dM/Ez1/4ndbxCYqozvojxQrCgxVSJTMypypHS9vEcRj94Q1B17R5Hkj+0MRWF/0dln0HMWIAb1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=coxSEJeB; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNxsEi031039;
	Tue, 17 Dec 2024 02:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=R5+873Ef+Kkj4YNDK
	n1lh7cr/++D0FfitFuPzZwixKs=; b=coxSEJeBZW+rihxQCTg71FkvkltMawUyZ
	X8ndzBJQFETaZD5y5TRdxG/OAtIgXZKQZrpNdatP9o4I4vTfZ7f07AY041kQVOlh
	5dAPynb1ol/vSJVMaC2U7nNAN06XeUjL+gceofoeqZehoak93uo09vtAbRF+1Oq5
	eXJV7tfmf2cVtA1ybzBDSBKHbBiwP136EaWrvHqPzqNJ05w4H9Mav33PT2+8m1QE
	EOSgZFxKtsD/KD+EogknuLt+NFdLOINcnh+9h9fddxC0T2HP6b3nE2aQS+sG6RCo
	khVnibnn6mgfRLJlDFMAZ/I3qvHsUcOz1QZPh0aVvpKI7IgwtcHcg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh0e8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH2L324019106;
	Tue, 17 Dec 2024 02:21:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh0e8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNZEMa014451;
	Tue, 17 Dec 2024 02:21:02 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21geff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:02 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH2L1LJ25100868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 02:21:01 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0956A5804E;
	Tue, 17 Dec 2024 02:21:01 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF5DE5803F;
	Tue, 17 Dec 2024 02:20:58 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 02:20:58 +0000 (GMT)
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
Subject: [PATCH v3 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Date: Mon, 16 Dec 2024 20:20:42 -0600
Message-ID: <20241217022046.113830-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217022046.113830-1-ninad@linux.ibm.com>
References: <20241217022046.113830-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hh6hmXv8fYBKd3e_O6u3orwmVtIhLBJp
X-Proofpoint-ORIG-GUID: n5cTMYJWosxJBRjSSeEGaPy4pf0XyB1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=854 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170015

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


