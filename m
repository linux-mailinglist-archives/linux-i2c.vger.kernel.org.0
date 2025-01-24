Return-Path: <linux-i2c+bounces-9184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F202A1B95C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C699F3B1CD4
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1341C1F12;
	Fri, 24 Jan 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="x3AsKs8q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681EF157472;
	Fri, 24 Jan 2025 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737732254; cv=none; b=SMPES710yHaSh8bTCtoKUzviFhFeFZkP/8TNal0wpdZN9h0/DIWppPd93egLjUAycJEIjJKlyWFKItsxIYvodbshhQLID56/4wtv9PCV+9vHnfZ58neAVrhQBoh4obJV1TTz7xND14+oqYlUui7BaJyJLRkH9gmnytzVLN9xOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737732254; c=relaxed/simple;
	bh=PGuI0JLIVjpGnULisAvMvFjaUwqArdGsj4uhFT1lLNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FWuZHBs9D8XIR7AItGjq9wuXz6lG7NdHUO8ktlx73AzPUQAQcVnRjxNmMTEfH0yua+C689z7t0IUFL+a5FSSgnAHy2cy7O6cIxj68W3jgBuIHMoTX7aYJuE5FkctGhCXntEROlDlxiuDCwJN75XmSrCJTJ10yApCvgEoSOOmJgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=x3AsKs8q; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OEmR73005901;
	Fri, 24 Jan 2025 10:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=I2M2m
	Jc54AZspiplENGZAzMnsQXIE8Nf5Jgs5knMQ50=; b=x3AsKs8qKZIQbul+56s8n
	tEBIvAaDuklNXjicXzDHMUUF1bICapmZ8uoweTaTpGFIzN3KAzkiBVzCZNdedPQJ
	p96ppCgRULuSu1g9Q21LX42LlJJ4BpYjO0NLL4IR9GoCTUUsr01mQ4d7AIHtf/Fd
	TcaHlCX/Y4euo1k5zE3jebCMg7vf7p18oohC5l56AErr7zvSkuOZKDZqnh8WUqFf
	jPC5i8JBQKM9U9ksaSWMn93cuK5HSk2dsfQY/N61lBs2ZhVIkTd8mTrwQOTl6kFc
	Ac67bgCLQ0redIAce/34wxXkW5zghyNf/L2zGJz6VYUWq8f3Gan88Cs1t/zD6TM9
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ccxx05bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:23:52 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFNp3b035450
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:23:51 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:23:51 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:23:51 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:23:51 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFNS7S031971;
	Fri, 24 Jan 2025 10:23:41 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Fri, 24 Jan 2025 23:23:05 +0800
Subject: [PATCH 1/2] dt-bindings: hwmon: ltc2978: add support for ltm4673
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250124-ltm4673-v1-1-a2c6aa37c903@analog.com>
References: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
In-Reply-To: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737732208; l=1184;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=PGuI0JLIVjpGnULisAvMvFjaUwqArdGsj4uhFT1lLNM=;
 b=TpgQ7ETJ/VlDtLfHpMyMVcdQv4f9qa2RDZkNGpSODsGR0i1t1d0Rd6qMbmLVyKcpI3BNIcRk3
 RaAZh+4ZXT0BeCIjA9uzcVQ34jxhSoC7d/w6MF9DIh6OrEO6FcRHvPc
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: qu86LbBAzopp9omX-xjT-Z1vBDGyLupM
X-Proofpoint-ORIG-GUID: qu86LbBAzopp9omX-xjT-Z1vBDGyLupM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

Add LTM4673 to supported devices of LTC2978. Unlike other LTM46xx
devices, LTM4673 is a μModule regulator that outputs four channels.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index 37e1dc9c7dd3798ed4b2a90b46f17c99f88b0d52..eeb6a4fe80b265ee364188f7b507425cbf34a48e 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -30,6 +30,7 @@ properties:
       - lltc,ltc7880
       - lltc,ltm2987
       - lltc,ltm4664
+      - lltc,ltm4673
       - lltc,ltm4675
       - lltc,ltm4676
       - lltc,ltm4677
@@ -55,6 +56,7 @@ properties:
       * ltc7880 : vout0 - vout1
       * ltc3883 : vout0
       * ltm4664 : vout0 - vout1
+      * ltm4673 : vout0 - vout3
       * ltm4675, ltm4676, ltm4677, ltm4678 : vout0 - vout1
       * ltm4680, ltm4686 : vout0 - vout1
       * ltm4700 : vout0 - vout1

-- 
2.39.5


