Return-Path: <linux-i2c+bounces-8560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259139F409F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 03:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D464B188DCDE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 02:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2221482E7;
	Tue, 17 Dec 2024 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RmyoA3wT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0BC13D8B4;
	Tue, 17 Dec 2024 02:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734402096; cv=none; b=Usm6446ECUdO6+HP0K2MCBJ7aRuwtXK8GdtV3hwIFCJFxSrLsOysqg7oXvOBjr3O1Puc8yIuxdgk+rfSYhLrNuhG/VNesebrV1v/hX4gdrPjyQBjfqY9of2oVkl3nAMEzstp1f1qsBzphJIJyKlvurp5y+QWu59GnxVCJ8uUAog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734402096; c=relaxed/simple;
	bh=UHa7ej9TI8YT0/5EDyvkSIBcBz3U+Gkim0gsZpVgFnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFXqajZ3H5JX8tgp4B7TSG1tm0RdTT3ko8cuC/+NksJKBQxbFUVGSL8v0Aqbf8/tTWmU35jti/6NFIcXGYAhf287Ly2+CeGR7GneBW4h09Br+FbJlzTxWTdDolZGpguoraGORfBYaUCMj31k8p/0vvJeY3Lmo3hLsyWEgbJNNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RmyoA3wT; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEpbpm011370;
	Tue, 17 Dec 2024 02:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5wEGbTS/73BkrgT2d
	pX+JEj/BlMneZoSi/C5K2fmeDs=; b=RmyoA3wTTVMUTKEC/0H4Dx6ZNRwWosUeJ
	WPppdjmgpXe5lbfSV+FGSueFovJQ5Gsdem+q4oDVxhxXUX+Y5WKnKroalp4COIbL
	YpCbEZg5q/E9NAAZt1Ps5Gubh0fkX3l3SHNj1ynKrnv62sqCECTjYXeY6rNkQFrY
	Ma0KoIR1LSG6kgesdsqcVpn4nfffndLyEjJVql/aceBvNRjZy6Xlh/H4y/ro126q
	0dnTl9KX1f2R6P1UiR8WP70V/04XPVpt/McCdG823ws/CZXwXYMvf1IkuAQX82zM
	iMkjmKXkxrtPcgnJ4V2FkMimwkCsYbttzZtWevyzGT3KcUMfyki2g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb5rta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH2L1M1012323;
	Tue, 17 Dec 2024 02:21:01 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb5rt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:01 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNGSgZ011295;
	Tue, 17 Dec 2024 02:21:00 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjk0jne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:21:00 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH2Kwfa60948846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 02:20:58 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9687D58055;
	Tue, 17 Dec 2024 02:20:58 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 449905803F;
	Tue, 17 Dec 2024 02:20:56 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 02:20:56 +0000 (GMT)
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
Cc: Ninad Palsule <ninad@linux.ibm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
Date: Mon, 16 Dec 2024 20:20:41 -0600
Message-ID: <20241217022046.113830-4-ninad@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: DKQno20RUKfKDSjTxFwkG7hFXVqp6r9U
X-Proofpoint-GUID: qECwStAYKG2lAB06pxoRDCtd_q2q7rBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170015

Add INTEL Common Redundant Power Supply Versions crps185 bindings as
trivial. It is trivial because only compatibility string is required in
the device tree to load this driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 34e8ac1ddc24..fadbd3c041c8 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -149,6 +149,8 @@ properties:
           - injoinic,ip5306
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
+            # Intel common redudant power supply crps185
+          - intel,crps185
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
-- 
2.43.0


