Return-Path: <linux-i2c+bounces-1802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD0C857056
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 301E6B25420
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53298154437;
	Thu, 15 Feb 2024 22:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MYzKRCpb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D319153BEA;
	Thu, 15 Feb 2024 22:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034924; cv=none; b=TxZZUrJJVEKH5myKmW/Ryz4SI48SnbGlyFFAYVeaRtZK/vYH2j6JyYf8iZdRqyUIsbHw+QUxVaFov+ckttMXwuEpmyEOHAYLyMmVQ9uTffNpN+oeWi4ja5lm2O2GeoKQjOdZ1avcsi/axSAedD+TAXINlNSQqd8SKonIwJppvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034924; c=relaxed/simple;
	bh=dAwPkU5VJJMi4CHR0KERMlNXkq1qgmEceK78GEleApI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y24w2J3wUVKfzisNJ8AAH3xHyCVPR915/sHaiTqr3ijRQXE3H3zuOaBrUNOliRyOn7uQIZgw2yn3Q8o0rXK7Dh3PXfm8aOIv8/Prq21bycbXq/yp7LLBMLFhNNzfuR8rsfJnWSLr5JbfS3D8K44Wzzac1N3VU2NrNnQWP6oAD10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MYzKRCpb; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FKOUKR002266;
	Thu, 15 Feb 2024 22:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ODxH4flBsSxTPu7P+G7uqK/TVCCy2iNAP3r6LUGYLcU=;
 b=MYzKRCpbzj5vM0n9SuLEz6KxkpSWKxx4DHhsI27InPJzj9hjojjwCngGD5zMCR1cIXIi
 u/FMM1TrXM6QWv1qsDMOmwa+7/cNIpmhngTy2LO6V4GnAcrn6yFQ1f8g+vgVuyJwOrmE
 IxMeRsyKaab9yldzmw092Kmf+vXnP8BazcQ2axF+Vo8ot2C+3Z1G+w6AXnXrSSl/8Oq+
 bGIQmcnLuVicYubAtFG+ir8lMwcQ5c7J4vMHZCn2rVxmsHgUE4bBoV32atWUQ7qH8ibo
 gk1xtEZwrcNsbvWFl4yUtGUBKHnmwMErbx08zXRP1X6b4dJai0gUg6maTkoYsofAuifG AQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q8n597m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJ6raS032589;
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyudr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM86Vs28246772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C4B658068;
	Thu, 15 Feb 2024 22:08:04 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 221995807C;
	Thu, 15 Feb 2024 22:08:04 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 07/33] ARM: dts: aspeed: p10 and tacoma: Set FSI clock frequency
Date: Thu, 15 Feb 2024 16:07:33 -0600
Message-Id: <20240215220759.976998-8-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: Ik0cGHrb8l2VvYEzn685OGUWkJ05c1C8
X-Proofpoint-ORIG-GUID: Ik0cGHrb8l2VvYEzn685OGUWkJ05c1C8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=783
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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
index cc466910bb52..a93a241d005a 100644
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


