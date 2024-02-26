Return-Path: <linux-i2c+bounces-1983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38421867CDB
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697CC1C2BAAF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6A412F5A0;
	Mon, 26 Feb 2024 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="A4NBfdmW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A112EBD3;
	Mon, 26 Feb 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966425; cv=none; b=mTgr0NP3yYm+YwNa0sQcsrrN73YJc1DYtLlHhW+Y/NRta76V8sMWgy8fAOeJBRLYvrQO8+bCUfaABrJi8RkswtWrGfkQH2imN3eLbJW7p6aOpIj2wmPYYG3QphDkpRFSi+EZnSKGstxkc6TLYfX8XDcbzptreQCoI1Jt/2mJ5w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966425; c=relaxed/simple;
	bh=8D8QTyVR6yty+U+qM3n9DVm64OloOOKGd9a1EBcdczA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kKod70pD4xfNn0CKYQYGxYBrW1QOTpgBMQzSE+ixQvdP80QHAklzq6Oeux+wWaMH8hj7kYO4EK0ZD+hs6lKTM9/QZQ16UIrLJiCJP4m6rq+ZTMdMf9lY2R6ehko/liCxA3m9+pNWpmZxDNvgXIXkoVC+B8kpbj5Z1EbNfrZ9GfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=A4NBfdmW; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGSHmj014969;
	Mon, 26 Feb 2024 16:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wUxZWtjBlpcd1C3yzncmoKg+sMI8k4edHwJPu5+uZXE=;
 b=A4NBfdmWBP8Gau9jo37+ogCnjTp1KEbKnoXtt4gwCcScM0Wnoh1TBUYKf6zDE5i7dCWD
 GT5RHR4c0+SA1/70umzyILxBnlehRmv7k/LjUmrXKF8+hNtxGxispvG2lI36cHYbQ8lO
 nCp48Sa1kAcZ0VWRcKdLLOjC6IVD2wwFsayPyXfBCQmVf4DIdV0AtyCBVtgJXpVBb4mG
 /oGUhI6dxputW4+H1GAUkVHYSMy/oslNo51O1jZaeVPwU9XnI1jb594KIXKnWtfCsVxh
 QnqDNySaSak5R8ZzCSmDur0cWiJDiwHA3TupaXpEH3k5FBJ9lWq9rWRBosD0an9wA6ON aA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgx6g8n9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:30 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG0x4S012312;
	Mon, 26 Feb 2024 16:53:29 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg21xvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:29 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrQvW8389610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:29 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C277458061;
	Mon, 26 Feb 2024 16:53:26 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B02E5805F;
	Mon, 26 Feb 2024 16:53:26 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 05/31] ARM: dts: aspeed: p10 and tacoma: Set FSI clock frequency
Date: Mon, 26 Feb 2024 10:52:55 -0600
Message-Id: <20240226165321.91976-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W2o1YKkJ9swY8dvkOCrjUxBs0ZnFesCL
X-Proofpoint-ORIG-GUID: W2o1YKkJ9swY8dvkOCrjUxBs0ZnFesCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=815
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Now that the driver doesn't hardcode the clock divider, set it
in the device tree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts | 1 +
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
index 213023bc5aec..96a8f727bc38 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
@@ -193,6 +193,7 @@ &fsim0 {
 	#address-cells = <2>;
 	#size-cells = <0>;
 
+	clock-frequency = <100000000>;
 	fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
 	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
 
diff --git a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
index 07ce3b2bc62a..44e48e39e6e9 100644
--- a/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
+++ b/arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
@@ -8,6 +8,7 @@ &fsim0 {
 	#size-cells = <0>;
 
 	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+	clock-frequency = <100000000>;
 
 	cfam@0,0 {
 		reg = <0 0>;
-- 
2.39.3


