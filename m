Return-Path: <linux-i2c+bounces-3319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F458B6439
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962801C21486
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE589181B8F;
	Mon, 29 Apr 2024 21:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DbA7HII1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA28181302;
	Mon, 29 Apr 2024 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424523; cv=none; b=XeiHlV+w221OJwRHxvQLQKF1GD7V87qqEoS4UiAZe9YRKPatABvTBrFOvLaie1aOxJfVp0yy+ViVBH43ganhmo/aQofIi/S6QCoBv8Qhme445Cz+FecnN497DA92PmkXX34oeIR5ZaoXmllJ8EJ6jVGp1qq+dUrhzTJ8vFgv6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424523; c=relaxed/simple;
	bh=ndr8VnzdIXjDYJ1cdY0AQDO3Wan0KTlUXpxakU0ifSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UoQJykgIh7CVQ8TCHfhbiWEmV35iM9nc7nHZ3r23racvBOFTH1zeOoiZI2hc3pzBJOHVj578qFutm3+hvrqXLnC24rIhJc5lP9FIoUDbwYXuPccYRsDa6jCeq7+/q8tt4fllecMShb57aymgaO/GKierVFqsMt6Z+fMTL/vv8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DbA7HII1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKl6Bk012896;
	Mon, 29 Apr 2024 21:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ichGNBf49wm3gmP5eIDEagCt3xVxUFfJv0UdOuTkU88=;
 b=DbA7HII1j0quth4QkRQMb6k8n5rwtblKsOMs9EkPJkNN77QKoYtV1aKNG4ZxSEJ6C8mv
 TU9i99gq6WE9AUHZTUQvbC/w+yz79MQJyV4E0L6gDilS2H5MS+Tuci6uXyDK/JZDNiju
 8N0GpRo5tYG4LODjvxBDVmIyUPqtQQSc27QPgykbdgo3s9H0fNvYgw+16hZ/LQHUrOZe
 SP7g99DdF6z0DnnQRG68ZaqZbOVk5pwSkX8RaRLIc/vxnq2dIKF8vSYQ7EEV73e6CaAw
 gDINB0rZ/QWDjfpfTrvA5wIQ6WwvavCxv6xUQTrl7bs/8gBsFsR7UOQK86xJdoBAh0o0 Tw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtj87845k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TJKUYX011750;
	Mon, 29 Apr 2024 21:01:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsdwm17ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:46 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1hYX17892076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:45 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B4AA58067;
	Mon, 29 Apr 2024 21:01:43 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 919E25804B;
	Mon, 29 Apr 2024 21:01:42 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 12/17] ARM: dts: aspeed: Add IBM P11 FSI devices
Date: Mon, 29 Apr 2024 16:01:26 -0500
Message-Id: <20240429210131.373487-13-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AePtwxgdWSlVIZ_hzho6V230_KAyUxP0
X-Proofpoint-ORIG-GUID: AePtwxgdWSlVIZ_hzho6V230_KAyUxP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Add the P11 FSI device tree for use in upcoming BMC systems.
Unlike P10, there is no system with only two processors, so
only the quad processor FSI layout is necessary.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Re-order everything
 - Update compatibles with the updated names from the documentation

 .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1538 +++++++++++++++++
 1 file changed, 1538 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi

diff --git a/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
new file mode 100644
index 000000000000..a1896570b6e3
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
@@ -0,0 +1,1538 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 IBM Corp.
+
+/ {
+	aliases {
+		i2c100 = &cfam0_i2c0;
+		i2c101 = &cfam0_i2c1;
+		i2c110 = &cfam0_i2c10;
+		i2c111 = &cfam0_i2c11;
+		i2c112 = &cfam0_i2c12;
+		i2c113 = &cfam0_i2c13;
+		i2c114 = &cfam0_i2c14;
+		i2c115 = &cfam0_i2c15;
+		i2c202 = &cfam1_i2c2;
+		i2c203 = &cfam1_i2c3;
+		i2c210 = &cfam1_i2c10;
+		i2c211 = &cfam1_i2c11;
+		i2c214 = &cfam1_i2c14;
+		i2c215 = &cfam1_i2c15;
+		i2c216 = &cfam1_i2c16;
+		i2c217 = &cfam1_i2c17;
+		i2c300 = &cfam2_i2c0;
+		i2c301 = &cfam2_i2c1;
+		i2c310 = &cfam2_i2c10;
+		i2c311 = &cfam2_i2c11;
+		i2c312 = &cfam2_i2c12;
+		i2c313 = &cfam2_i2c13;
+		i2c314 = &cfam2_i2c14;
+		i2c315 = &cfam2_i2c15;
+		i2c402 = &cfam3_i2c2;
+		i2c403 = &cfam3_i2c3;
+		i2c410 = &cfam3_i2c10;
+		i2c411 = &cfam3_i2c11;
+		i2c414 = &cfam3_i2c14;
+		i2c415 = &cfam3_i2c15;
+		i2c416 = &cfam3_i2c16;
+		i2c417 = &cfam3_i2c17;
+
+		sbefifo100 = &sbefifo100;
+		sbefifo101 = &sbefifo101;
+		sbefifo110 = &sbefifo110;
+		sbefifo111 = &sbefifo111;
+		sbefifo112 = &sbefifo112;
+		sbefifo113 = &sbefifo113;
+		sbefifo114 = &sbefifo114;
+		sbefifo115 = &sbefifo115;
+		sbefifo202 = &sbefifo202;
+		sbefifo203 = &sbefifo203;
+		sbefifo210 = &sbefifo210;
+		sbefifo211 = &sbefifo211;
+		sbefifo214 = &sbefifo214;
+		sbefifo215 = &sbefifo215;
+		sbefifo216 = &sbefifo216;
+		sbefifo217 = &sbefifo217;
+		sbefifo300 = &sbefifo300;
+		sbefifo301 = &sbefifo301;
+		sbefifo310 = &sbefifo310;
+		sbefifo311 = &sbefifo311;
+		sbefifo312 = &sbefifo312;
+		sbefifo313 = &sbefifo313;
+		sbefifo314 = &sbefifo314;
+		sbefifo315 = &sbefifo315;
+		sbefifo402 = &sbefifo402;
+		sbefifo403 = &sbefifo403;
+		sbefifo410 = &sbefifo410;
+		sbefifo411 = &sbefifo411;
+		sbefifo414 = &sbefifo414;
+		sbefifo415 = &sbefifo415;
+		sbefifo416 = &sbefifo416;
+		sbefifo417 = &sbefifo417;
+
+		scom100 = &scom100;
+		scom101 = &scom101;
+		scom110 = &scom110;
+		scom111 = &scom111;
+		scom112 = &scom112;
+		scom113 = &scom113;
+		scom114 = &scom114;
+		scom115 = &scom115;
+		scom202 = &scom202;
+		scom203 = &scom203;
+		scom210 = &scom210;
+		scom211 = &scom211;
+		scom214 = &scom214;
+		scom215 = &scom215;
+		scom216 = &scom216;
+		scom217 = &scom217;
+		scom300 = &scom300;
+		scom301 = &scom301;
+		scom310 = &scom310;
+		scom311 = &scom311;
+		scom312 = &scom312;
+		scom313 = &scom313;
+		scom314 = &scom314;
+		scom315 = &scom315;
+		scom402 = &scom402;
+		scom403 = &scom403;
+		scom410 = &scom410;
+		scom411 = &scom411;
+		scom414 = &scom414;
+		scom415 = &scom415;
+		scom416 = &scom416;
+		scom417 = &scom417;
+
+		spi10 = &cfam0_spi0;
+		spi11 = &cfam0_spi1;
+		spi12 = &cfam0_spi2;
+		spi13 = &cfam0_spi3;
+		spi20 = &cfam1_spi0;
+		spi21 = &cfam1_spi1;
+		spi22 = &cfam1_spi2;
+		spi23 = &cfam1_spi3;
+		spi30 = &cfam2_spi0;
+		spi31 = &cfam2_spi1;
+		spi32 = &cfam2_spi2;
+		spi33 = &cfam2_spi3;
+		spi40 = &cfam3_spi0;
+		spi41 = &cfam3_spi1;
+		spi42 = &cfam3_spi2;
+		spi43 = &cfam3_spi3;
+	};
+};
+
+&fsim0 {
+	#address-cells = <2>;
+	#size-cells = <0>;
+	status = "okay";
+	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <0>;
+
+		scom@1000 {
+			compatible = "ibm,p9-scom";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,i2c-fsi";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_i2c0: i2c-bus@0 {
+				reg = <0>;	/* OMI01 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom100: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo100: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c1: i2c-bus@1 {
+				reg = <1>;	/* OMI23 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom101: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo101: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom110: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo110: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom111: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo111: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c12: i2c-bus@c {
+				reg = <12>;	/* OP4A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom112: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo112: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c13: i2c-bus@d {
+				reg = <13>;	/* OP4B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom113: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo113: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom114: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo114: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam0_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom115: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo115: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_spi0: spi@0 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi1: spi@20 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi2: spi@40 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi3: spi@60 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+
+			occ {
+				compatible = "ibm,p10-occ";
+
+				hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi_hub0: fsi@3400 {
+			compatible = "ibm,p9-fsi-controller";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&fsi_hub0 {
+	cfam@1,0 {
+		reg = <1 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <1>;
+
+		scom@1000 {
+			compatible = "ibm,p9-scom";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,i2c-fsi";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_i2c2: i2c-bus@2 {
+				reg = <2>;	/* OMI45 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom202: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo202: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c3: i2c-bus@3 {
+				reg = <3>;	/* OMI67 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom203: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo203: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom210: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo210: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom211: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo211: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom214: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo214: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom215: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo215: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c16: i2c-bus@10 {
+				reg = <16>;	/* OP6A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom216: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo216: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam1_i2c17: i2c-bus@11 {
+				reg = <17>;	/* OP6B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom217: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo217: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_spi0: spi@0 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi1: spi@20 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi2: spi@40 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi3: spi@60 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+
+			occ {
+				compatible = "ibm,p10-occ";
+
+				hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi@3400 {
+			compatible = "ibm,p9-fsi-controller";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			no-scan-on-init;
+		};
+	};
+
+	cfam@2,0 {
+		reg = <2 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <2>;
+
+		scom@1000 {
+			compatible = "ibm,p9-scom";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,i2c-fsi";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam2_i2c0: i2c-bus@0 {
+				reg = <0>;	/* OM01 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom300: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo300: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c1: i2c-bus@1 {
+				reg = <1>;	/* OM23 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom301: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo301: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom310: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo310: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom311: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo311: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c12: i2c-bus@c {
+				reg = <12>;	/* OP4A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom312: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo312: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c13: i2c-bus@d {
+				reg = <13>;	/* OP4B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom313: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo313: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom314: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo314: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom315: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo315: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam2_spi0: spi@0 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam2_spi1: spi@20 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam2_spi2: spi@40 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam2_spi3: spi@60 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+
+			occ {
+				compatible = "ibm,p10-occ";
+
+				hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi@3400 {
+			compatible = "ibm,p9-fsi-controller";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			no-scan-on-init;
+		};
+	};
+
+	cfam@3,0 {
+		reg = <3 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <3>;
+
+		scom@1000 {
+			compatible = "ibm,p9-scom";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,i2c-fsi";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam3_i2c2: i2c-bus@2 {
+				reg = <2>;	/* OM45 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom402: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo402: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c3: i2c-bus@3 {
+				reg = <3>;	/* OM67 */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom403: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo403: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom410: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo410: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom411: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo411: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom414: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo414: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom415: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo415: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c16: i2c-bus@10 {
+				reg = <16>;	/* OP6A */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom416: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo416: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c17: i2c-bus@11 {
+				reg = <17>;	/* OP6B */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fsi@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom417: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo417: sbefifo@2400 {
+							compatible = "ibm,odyssey-sbefifo";
+							reg = <0x2400 0x400>;
+						};
+					};
+				};
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam3_spi0: spi@0 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam3_spi1: spi@20 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam3_spi2: spi@40 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam3_spi3: spi@60 {
+				compatible = "ibm,spi-fsi";
+				reg = <0x60>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					compatible = "atmel,at25";
+					reg = <0>;
+					address-width = <24>;
+					pagesize = <256>;
+					size = <0x80000>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+
+			occ {
+				compatible = "ibm,p10-occ";
+
+				hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi@3400 {
+			compatible = "ibm,p9-fsi-controller";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			no-scan-on-init;
+		};
+	};
+};
-- 
2.39.3


