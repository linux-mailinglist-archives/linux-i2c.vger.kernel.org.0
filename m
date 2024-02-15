Return-Path: <linux-i2c+bounces-1783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC8A857005
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316AE1F23C1B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCD41487E8;
	Thu, 15 Feb 2024 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="g1naOJmO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5014690E;
	Thu, 15 Feb 2024 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034909; cv=none; b=Z5+KcU7sgMzUuDi6HTSU79Wv2oAF19dPkmdJqN19TO6BI9u83k3n5Wtwzo5J9uK1Q5wX6xfUCWKgeFvDIc0tIlJKluK6px1agziLMoAug/gkQrqRJY7ihzu7gh6y03d6/aToL6T0mzegMyW7UcAZSpwwR6LS2zz++qORTr7FVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034909; c=relaxed/simple;
	bh=HehnAuv1ZYMsznUFMzhSA1GnXrpJWSxxtr7AKvAa4Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ux0rsXdgArnNUgKtbncRWVH11gCrclYV5/tEE4A2rYqgs+4Y0TFbhCDybkF7k16eLWF4ca8rfpKSfmYXCjM5Ppte00Sq25lIOjvbGQeVuGkQdyjY3/ACIgVuQ+w2tg2di7c+jtTlkaavlOpfILDBGuE6RcciFkos1Y3GATRMjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=g1naOJmO; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0bJf018030;
	Thu, 15 Feb 2024 22:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Dtf4pFRJxaKze/HISwspRMMKZvQZJYraVaCTtYgrlqE=;
 b=g1naOJmOgx2Bc68XO35iF9sp12d2R0FrtyJmi6EJ1hhEnsqm9f2agDF+ReL4LcB6aBr5
 urEAfEWHpV7gX9QkiQl5lt47/0AO2kcloJcIfIdaaf/E9nqvADicVxnTfSv24CbhZATD
 ZaowK33FUeJ1sJoiM+Sx25e/Ia4hZtvcHpErYYl+BhSttqMCBiXgRDaEpScgEWokWrwr
 s/2fUMp5knsxGsn1MiRjvF0o95AGWGtlfJG1PABRNUBJBbZHytXmh8qTqpPMsccoU+xo
 U4eEL9mLfJFA+B5vNiigPqnloWOzwlZWG658/tQ+uPyGBzGOrVv0OnDtgiCMfvuXh9MN 5Q== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg6bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:14 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FL3HqD010050;
	Thu, 15 Feb 2024 22:08:13 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm781s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:13 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8B1E12321532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:13 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D5055807E;
	Thu, 15 Feb 2024 22:08:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D70DF58063;
	Thu, 15 Feb 2024 22:08:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 26/33] ARM: dts: aspeed: FSI interrupt support
Date: Thu, 15 Feb 2024 16:07:52 -0600
Message-Id: <20240215220759.976998-27-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: mZoi6w3AQ-T8E4aklnpfqBCDxZ5lp3Q8
X-Proofpoint-ORIG-GUID: mZoi6w3AQ-T8E4aklnpfqBCDxZ5lp3Q8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=445 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

Enable FSI interrupt controllers for AST2600 and P10BMC hub master.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi        | 4 ++++
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index c4d1faade8be..e0b44498269f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -865,22 +865,26 @@ i2c: bus@1e78a000 {
 			};
 
 			fsim0: fsi@1e79b000 {
+				#interrupt-cells = <1>;
 				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
 				reg = <0x1e79b000 0x94>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_fsi1_default>;
 				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+				interrupt-controller;
 				status = "disabled";
 			};
 
 			fsim1: fsi@1e79b100 {
+				#interrupt-cells = <1>;
 				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
 				reg = <0x1e79b100 0x94>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_fsi2_default>;
 				clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+				interrupt-controller;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
index a93a241d005a..44e48e39e6e9 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
@@ -166,10 +166,12 @@ occ-hwmon {
 		};
 
 		fsi_hub0: hub@3400 {
+			#interrupt-cells = <1>;
 			compatible = "fsi-master-hub";
 			reg = <0x3400 0x400>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+			interrupt-controller;
 		};
 	};
 };
-- 
2.39.3


