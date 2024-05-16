Return-Path: <linux-i2c+bounces-3543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF08C7C67
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD491280DA7
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C42C15FD08;
	Thu, 16 May 2024 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kq2SZSe1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9515FA70;
	Thu, 16 May 2024 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883594; cv=none; b=myD5akLUd/uySrzpyZbIsVPT/JxCsUYsMuuBn4yo8408sE4exfScz5qoQVd4tEZlxrAVRFFkNL1VMrOwNPt5XuUQ4p79H7j8zSVNQh0roHP0cORfPSZpegZaOtm6cp5Y9vhiIY0tmlEYZKwjlJJQynN70/Snxi3hj0Wz1Kfgyk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883594; c=relaxed/simple;
	bh=M9G0C5XMvwwySAScbo9qEW4QmuRwYiNTlRB1r+pCTRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VqYl3/w+enuBaanP90bp2HaEGhwSmrSkWO9YFZAaXB5a5CeCo5SHut/j2lCFRjlP3DvOUU6iLqWb/vxUm5BvOajCvgHGEv8UISGlv8nPJkXnDtmTYWLcnwmH/u2V+oXOqBagRlEzXiONeiCRm2sjCk+1/ayRoIPBXLV8u8oFPnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kq2SZSe1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHc0i9010903;
	Thu, 16 May 2024 18:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MU/yVusaZAzYIm5jhrcns6ij25EwWFQhZWpvdpTtNWw=;
 b=kq2SZSe1fmpTXPeJmkekUoZ2+rvZKdMUwdk+u1/kxhexzp3YPQwopRIhhhC/J2XNUMZY
 MOHa4AMfI2K+UYQKSXskxJyen9lkB9oilLP0ALehl0lZN3wANIMKZ4t3V0x3HrngGTN6
 TlGAsJ8vdjqqePp65s81H9u6NCBrvbvbjYSHl0eaqYaiJ0cXqcwgHaQXE+OylPuGsfP5
 u0z5pC7C2gqOQnFmOZMTr+pOdyo6L1Up34sxsAVzvG7AUYkaC+JAj9zBap2rkwTDGvEG
 woezbfUT1xsnd9z7+AA4NvPNMjYL9xOaXArnI1hlG/o+5rOxkl9Uqei64VcsWrMYbU/n dQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pq5r36c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHJCHp018780;
	Thu, 16 May 2024 18:19:22 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJJAa7930520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8739A5806A;
	Thu, 16 May 2024 18:19:19 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48E0258070;
	Thu, 16 May 2024 18:19:19 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 40/40] ARM: dts: aspeed: P10: Bump SPI max frequencies
Date: Thu, 16 May 2024 13:19:07 -0500
Message-Id: <20240516181907.3468796-41-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fphCgzX11WaTYDUihhaLg9Q_L_Mk4LGS
X-Proofpoint-ORIG-GUID: fphCgzX11WaTYDUihhaLg9Q_L_Mk4LGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=894 priorityscore=1501 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

These parts support 10MHZ.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 32 +++++++++----------
 .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi | 16 +++++-----
 .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi | 16 +++++-----
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
index 214b2e6a4c6df..1365dc95f1352 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
@@ -2797,7 +2797,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -2813,7 +2813,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -2830,7 +2830,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -2847,7 +2847,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -3170,7 +3170,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3186,7 +3186,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3203,7 +3203,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3220,7 +3220,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -3543,7 +3543,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3559,7 +3559,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3576,7 +3576,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3593,7 +3593,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -3916,7 +3916,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3932,7 +3932,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3949,7 +3949,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -3966,7 +3966,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
index 44e48e39e6e96..e11354bb384c2 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
@@ -94,7 +94,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -110,7 +110,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -127,7 +127,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -144,7 +144,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -261,7 +261,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -277,7 +277,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -294,7 +294,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -311,7 +311,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
index 57494c744b5d0..0ffb4ae6423fc 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
@@ -744,7 +744,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -760,7 +760,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -777,7 +777,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -794,7 +794,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
@@ -1117,7 +1117,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -1133,7 +1133,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -1150,7 +1150,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 
@@ -1167,7 +1167,7 @@ eeprom@0 {
 
 					compatible = "atmel,at25";
 					reg = <0>;
-					spi-max-frequency = <1000000>;
+					spi-max-frequency = <10000000>;
 				};
 			};
 		};
-- 
2.39.3


