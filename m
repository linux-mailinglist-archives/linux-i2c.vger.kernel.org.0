Return-Path: <linux-i2c+bounces-9846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF2A63F01
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 06:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B013AD34D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 05:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3104E21518F;
	Mon, 17 Mar 2025 05:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OgOdDqzX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB076EEA9;
	Mon, 17 Mar 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742187820; cv=none; b=Lm4/YXKkaWUCxkFgZxGXbq0elG5pfoE3s9ACXBRGJDLOuvDH0edZ5wcWz7yJMI15xw2fKvyi41QEJ+QlLCBac9YiFDUGUU0DPKfHX/21Fk+QJR2Ecql4ZRjWcYrYQfF/6Chm67CnagoLmzOotTo8M1ign1zrb46YPnOZZwJACW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742187820; c=relaxed/simple;
	bh=YfuuxdkGLDGPsdea1H9tgT+439h+TBstXkGRKZ/wx6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NBLVRqg73+pN6GLvpdHMQbc6q5mGVi8bkI2fdXJswMA3LrUVj8SoKacnCyhfuNLH4ewdOeNgkMXnFVWJNfVVKeKZW5uzXwS151tD5rPcrk2Tjq70Yz4oudfybAHxhUbDFR2Y0eH3v6FisTfED7lTbghUTGS8/gfdl4jJNHxQndg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OgOdDqzX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H4jZLC006334;
	Mon, 17 Mar 2025 01:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=pL0k1
	pZJOH7b99W+EdOHRCHyoIN04moWTtxvOjJlBGk=; b=OgOdDqzXYu69pBxy7a93+
	6AffOyCm8IVR55czLy9V2CAenshEee9uu5XV9omgzTBOO8NC7grw5LzD/tmEvhSk
	reGl2lqQFhWwNhFRtsCGHviALErRLxF9crxxH7mqoFvmIsAbqpwUDSAnc6rPzT4Q
	+B2jGej++zdFbRuNMVnMYLo31GesRpt5UPkmFVTKdufR/lDHcBkGiA3PLjA3rjrs
	5GiPFeY04abfJ+XIERg/JF9ayUTu9+owKnocRmVcxaGZ0KW8NcKMTiRQ1esU6j9L
	Sfgc9NP+F7DdR3BoxdQWuOnFV8btPYGqSXstBIpHa8u/JFS42Qf9fpZSSyGv/bpV
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45ed0ag1vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 01:03:12 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 52H53Bli044487
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 01:03:11 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 17 Mar
 2025 01:03:11 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 17 Mar 2025 01:03:11 -0400
Received: from analog.ad.analog.com (KPALLER2-L03.ad.analog.com [10.117.223.28])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52H52jZE026775;
	Mon, 17 Mar 2025 01:03:03 -0400
From: Kim Seer Paller <kimseer.paller@analog.com>
Date: Mon, 17 Mar 2025 13:02:26 +0800
Subject: [PATCH 2/3] dt-bindings: hwmon: ltc2978: add support for LT717x
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250317-hwmon-next-v1-2-da0218c38197@analog.com>
References: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
In-Reply-To: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li
	<Frank.Li@nxp.com>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Kim Seer Paller <kimseer.paller@analog.com>,
        Cherrence Sarip <cherrence.sarip@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742187765; l=1401;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=YfuuxdkGLDGPsdea1H9tgT+439h+TBstXkGRKZ/wx6k=;
 b=CFyft7EcMfijFg8fBr5XbvCC9KtVGk19vek0GBTcBrssLEzWIp3d9xfPDGpcd6r9jjh2lis3/
 OfBrOjDcAjQA7oUDLrqF6tGjEDBeqT/EPaA6TJ5+QaBVL7VxdByPQbJ
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: kWwFueAPbadhn0n-OY8ywVCD1QboKn1y
X-Proofpoint-GUID: kWwFueAPbadhn0n-OY8ywVCD1QboKn1y
X-Authority-Analysis: v=2.4 cv=A4NsP7WG c=1 sm=1 tr=0 ts=67d7ad10 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=l4fRWFUdoYX3NKTZvhEA:9 a=QEXdDO2ut3YA:10
 a=MbOaIhJwtJxSSQ9TBknk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170034

Add LTC7170 and LT7171 to supported devices of LTC2978. It has similar
set of registers to LTC3887, differing only in number of channels and
some PMBUS status and functionalities.

Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index eeb6a4fe80b265ee364188f7b507425cbf34a48e..aa801ef1640b177ee55181c724b024b4857e0252 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -12,6 +12,8 @@ maintainers:
 properties:
   compatible:
     enum:
+      - lltc,lt7170
+      - lltc,lt7171
       - lltc,ltc2972
       - lltc,ltc2974
       - lltc,ltc2975
@@ -47,6 +49,7 @@ properties:
     description: |
       list of regulators provided by this controller.
       Valid names of regulators depend on number of supplies supported per device:
+      * lt7170, lt7171 : vout0
       * ltc2972 vout0 - vout1
       * ltc2974, ltc2975 : vout0 - vout3
       * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7

-- 
2.34.1


