Return-Path: <linux-i2c+bounces-9847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D2A63F0A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 06:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B66418869D0
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 05:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90857215F53;
	Mon, 17 Mar 2025 05:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="l/SZ0XLZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9221578B;
	Mon, 17 Mar 2025 05:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742187824; cv=none; b=KU/93Vepvos6mpT/y2XLvUJIz/ScFKwVoaaCHBp5nOr0YjS1TusgTK4Eoejkpsl83Wvjr9bM46LZd2QaANX1+YK7wnJLjzM/1VcpFDfuE9ByudH60x3jNuBLp7khjYovSQGOmlQ+Gs4qZFN6FzrpruAgnX/54jPzB57hurdGIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742187824; c=relaxed/simple;
	bh=n5/MwKB1/KHtYPfGeYeG0MxOi4B2fNrzPsOxMlXkkog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SJBmQBPlalUZ44YGKT05AFLPj6F2nzB97DX8QaDkz611Wio+I2w94+K9+2/1mdU07dxVH2ZCng4Nty3xznAaZFUujxCRXc3BAMLDFbZHnSYo5Xfut7KDWecpVHDtgXqsJdF4UbHvqlBENdOL71T7PCVqvZPhS4GW2UhjjyMqCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=l/SZ0XLZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H4jZO0006339;
	Mon, 17 Mar 2025 01:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=dZIPe
	hUdY0kRx3Jk6AQmPomn2HwpWSYoQbHsUQRqvm4=; b=l/SZ0XLZAHl3MpQxBg7D1
	VckUSGKRRRWeGEzbUvtg3m/L1Lo9gi+INU7DsNxZUbJTvej7dLKsTPh1LOqrH5vZ
	dRtQ9FeaAWprZfazkX9CurhBJCMoECrn0Q/AildDTB+nY9SK2UprupCx74Ns1rz9
	8TZZ8rfuJJC2R2Tfym+Dpl9L47k3ZDPJKQy9U3dFVSQpyjMJLrlkNqCgJdMfQegW
	E+QmAWr0RGJWol8Z9h14ikv2ffdYDeFlR06w8qBsG/Ao4aCMDGBHzzeBvtnTe8Tn
	JcDTc9SbKTrhAWXbreYqRMFNrfhyk8TBM8zXRCTUgJkyyD4lpf4ZHeFlEiE2Y1v5
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45ed0ag1vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 01:03:08 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 52H537WP044478
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 01:03:07 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 17 Mar
 2025 01:03:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 17 Mar 2025 01:03:07 -0400
Received: from analog.ad.analog.com (KPALLER2-L03.ad.analog.com [10.117.223.28])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52H52jZD026775;
	Mon, 17 Mar 2025 01:02:58 -0400
From: Kim Seer Paller <kimseer.paller@analog.com>
Date: Mon, 17 Mar 2025 13:02:25 +0800
Subject: [PATCH 1/3] hwmon: (pmbus/ltc7841) add support for LT717x - docs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250317-hwmon-next-v1-1-da0218c38197@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742187765; l=2729;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=n5/MwKB1/KHtYPfGeYeG0MxOi4B2fNrzPsOxMlXkkog=;
 b=TJNkDqi6YpZELxbxGZCMyN3kdd5PWQWRcaEY2QBjnUzvPONWL7fi0uCRcxq9msJ4ykHfQ7l+i
 sTYcyYMy0PIB44cNKPsjeH2pqHTGOU3kgp3sHXuA+cU9kek5SC6Cb+C
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: NaHpzcDUQaHqB-X5tbfY7XtJDV3EccDw
X-Proofpoint-GUID: NaHpzcDUQaHqB-X5tbfY7XtJDV3EccDw
X-Authority-Analysis: v=2.4 cv=A4NsP7WG c=1 sm=1 tr=0 ts=67d7ad0c cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=op1cdvfMgwh8lD2rSv0A:9 a=QEXdDO2ut3YA:10
 a=4AZt5i30kjcA:10 a=BQTpVySARZYA:10 a=jmTavHqNhv8A:10 a=t1hRRgMb2TAA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170034

Add LT7170 and LT7171 to compatible devices of LTC2978.

Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
 Documentation/hwmon/ltc2978.rst | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index feae53eb9fbf5cff8f7a484c163acad011315d8d..0b72d566cac709aeafe53d08680ad65221bfa33f 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -5,6 +5,22 @@ Kernel driver ltc2978
 
 Supported chips:
 
+  * Analog Devices LT7170
+
+    Prefix: 'lt7170'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7170.html
+
+  * Analog Devices LT7171
+
+    Prefix: 'lt7171'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7171.html
+
   * Linear Technology LTC2972
 
     Prefix: 'ltc2972'
@@ -223,6 +239,8 @@ Author: Guenter Roeck <linux@roeck-us.net>
 Description
 -----------
 
+- LT7170 and LT7171 are 20 A, 16 V, single- or dual-phase Silent Switcher
+- step-down regulators with Digital Power System Management.
 - LTC2974 and LTC2975 are quad digital power supply managers.
 - LTC2978 is an octal power supply monitor.
 - LTC2977 is a pin compatible replacement for LTC2978.
@@ -300,6 +318,7 @@ in1_reset_history	Reset input voltage history.
 
 in[N]_label		"vout[1-8]".
 
+			- LT7170, LT7171: N=2
 			- LTC2972: N=2-3
 			- LTC2974, LTC2975: N=2-5
 			- LTC2977, LTC2979, LTC2980, LTM2987: N=2-9
@@ -338,6 +357,8 @@ in[N]_reset_history	Reset output voltage history.
 
 temp[N]_input		Measured temperature.
 
+			- On LT7170 and LT7171, temp1 reports the chip
+			  temperature.
 			- On LTC2972, temp[1-2] report external temperatures,
 			  and temp 3 reports the chip temperature.
 			- On LTC2974 and LTC2975, temp[1-4] report external
@@ -411,9 +432,9 @@ power[N]_input		Measured output power.
 
 curr1_label		"iin".
 
-			LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
-			LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
-			and LTM4700 only.
+			LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886,
+			LTC3887, LTC3889, LTM4644, LTM4675, LTM4676, LTM4677,
+			LTM4678, LTM4680, and LTM4700 only.
 
 curr1_input		Measured input current.
 
@@ -431,6 +452,7 @@ curr1_reset_history	Reset input current history.
 
 curr[N]_label		"iout[1-4]".
 
+			- LT7170, LT7171: N=1
 			- LTC2972: N-1-2
 			- LTC2974, LTC2975: N=1-4
 			- LTC2977, LTC2979, LTC2980, LTM2987: not supported

-- 
2.34.1


