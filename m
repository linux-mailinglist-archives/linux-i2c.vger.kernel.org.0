Return-Path: <linux-i2c+bounces-9185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D96FA1B951
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3949916E06C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33783218E81;
	Fri, 24 Jan 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AaSh7Pu1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F61CF5EA;
	Fri, 24 Jan 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737732256; cv=none; b=H5R4RHKazJkkHHhZ5qJPe1PTPKbSSb+bJXrq5/Vf+tfczpui32zg+Q0DzWUGS0ExIrgV03dnm/3NXqx3QDu4la/tqSlVR+IObSmDN611Xzlc2r5Ix6NJMbK8pAf21dJXdzb+uGBsIFOyWkHBjKpgtQosz25HKXqpF7u+mUWZpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737732256; c=relaxed/simple;
	bh=S0OatCWVt8LkqqQNLFpvo4ZTB4T+SPNT/jCZ7ia+L0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BwILmnzBg3jseaJ5QGzv4NoqLmYoTXRhuGhBtHgv7j7/vzVVNVJz/BLfu4oCEaePdtRp3quiFPjfXOiGCJnC+1xZtCHAGEpzL3lxKpi2BIs0oUvysV2qtscZ4YtsphenHjKcbzWlzydA7QIjf2kNwekWY+gj+zHixl2kSGo5Ycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AaSh7Pu1; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OEmQRO005868;
	Fri, 24 Jan 2025 10:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5yDwb
	gRu2XNFRPIpD137WRd1gMV7xF0Bx98tmaIUTPE=; b=AaSh7Pu1/LFwKggPohtyC
	pUND19MZLsgdGiAjp/GlL3RgscKQQNY1we2dMAdLQMW0XFp9a3BRq4tGN6UY0zy/
	lwgTYfSZbuyjP91UdggKfZW1ReRY9JOTWc0jbCpdzY/z9tvyJ/TB5ZKoYqpXBmzy
	lvDVpWBwMW/jnw9BsXru9m2KjT2X/qKorn5QDKzXZdmJJt1p4BB6UvSzz8Ulizp2
	hnApIcQ82jl0tEpRJ7K2PGSYQhUI/YidjxE65mzcMJQtMkfewEAZtCmklOV6CYp6
	ErmULr0/JMrX3N7cgLU2TEuk7+f0VOB4A2PmE5HAv5Q4VAZ86P+qJ2D2bucx/4Y9
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ccxx05bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:23:56 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFNtUi035453
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:23:55 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 24 Jan
 2025 10:23:55 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:23:55 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFNS7T031971;
	Fri, 24 Jan 2025 10:23:45 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Fri, 24 Jan 2025 23:23:06 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/ltc2978) add support for ltm4673
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250124-ltm4673-v1-2-a2c6aa37c903@analog.com>
References: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
In-Reply-To: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737732208; l=4551;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=S0OatCWVt8LkqqQNLFpvo4ZTB4T+SPNT/jCZ7ia+L0I=;
 b=pcuL0LWLrDFxoYKjGQb6ACLyzmiwj7kY7Ut9tzf3o+isLeZd91vgXpZcfYfbzSMUx0cpk5Z7A
 SEhIpdM3OPrDbzoqIXLdf0uzkecFLcYXwiBXtVc8+Mg+1LJFwTJbdmN
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: fyPn65xsowY8tzNS9fKCaEYTKzJSuslB
X-Proofpoint-ORIG-GUID: fyPn65xsowY8tzNS9fKCaEYTKzJSuslB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

Add support for LTM4673. The LTM4673 is a quad output, dual 12A and dual
5A, switching mode DC/DC step-down μModule regulator integrated with
4-channel power system manager.

This adds only the chip id, the checks for the manufacturer special id,
and the relevant attributes for the device's pmbus_driver_info.
The device does not support clear peaks.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/ltc2978.rst |  8 ++++++++
 drivers/hwmon/pmbus/Kconfig     |  4 ++--
 drivers/hwmon/pmbus/ltc2978.c   | 25 +++++++++++++++++++++++--
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index 651ca4904c6649748f366b023fbb337ec25b22b0..feae53eb9fbf5cff8f7a484c163acad011315d8d 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -151,6 +151,14 @@ Supported chips:
 
     Datasheet: https://www.analog.com/en/products/ltm4644
 
+   * Linear Technology LTM4673
+
+    Prefix: 'ltm4673'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/ltm4673
+
    * Linear Technology LTM4675
 
     Prefix: 'ltm4675'
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 419469f40ba0283c72b71071566efec575263e98..675b0d4703d87c9d5654489d0d770661ff0dba11 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -234,8 +234,8 @@ config SENSORS_LTC2978_REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear Technology
 	  LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889, LTC7841,
-	  LTC7880, LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
-	  LTM4686, and LTM4700.
+	  LTC7880, LTM4644, LTM4673, LTM4675, LTM4676, LTM4677, LTM4678,
+	  LTM4680, LTM4686, and LTM4700.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 4c306943383ab368ad5f9700c1e09bc873822e44..658cb1173291006d83033a6363ac52d24635abaf 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -26,8 +26,8 @@ enum chips {
 	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7132,
 	ltc7841, ltc7880,
 	/* Modules */
-	ltm2987, ltm4664, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680, ltm4686,
-	ltm4700,
+	ltm2987, ltm4664, ltm4673, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680,
+	ltm4686, ltm4700,
 };
 
 /* Common for all chips */
@@ -86,6 +86,8 @@ enum chips {
 #define LTM2987_ID_A			0x8010	/* A/B for two die IDs */
 #define LTM2987_ID_B			0x8020
 #define LTM4664_ID			0x4120
+#define LTM4673_ID_REV1			0x0230
+#define LTM4673_ID			0x4480
 #define LTM4675_ID			0x47a0
 #define LTM4676_ID_REV1			0x4400
 #define LTM4676_ID_REV2			0x4480
@@ -554,6 +556,7 @@ static const struct i2c_device_id ltc2978_id[] = {
 	{"ltc7880", ltc7880},
 	{"ltm2987", ltm2987},
 	{"ltm4664", ltm4664},
+	{"ltm4673", ltm4673},
 	{"ltm4675", ltm4675},
 	{"ltm4676", ltm4676},
 	{"ltm4677", ltm4677},
@@ -665,6 +668,8 @@ static int ltc2978_get_id(struct i2c_client *client)
 		return ltm2987;
 	else if (chip_id == LTM4664_ID)
 		return ltm4664;
+	else if (chip_id == LTM4673_ID || chip_id == LTM4673_ID_REV1)
+		return ltm4673;
 	else if (chip_id == LTM4675_ID)
 		return ltm4675;
 	else if (chip_id == LTM4676_ID_REV1 || chip_id == LTM4676_ID_REV2 ||
@@ -869,6 +874,21 @@ static int ltc2978_probe(struct i2c_client *client)
 		  | PMBUS_HAVE_IOUT
 		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		break;
+	case ltm4673:
+		data->features |= FEAT_NEEDS_POLLING;
+		info->read_word_data = ltc2975_read_word_data;
+		info->pages = LTC2974_NUM_PAGES;
+		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+		  | PMBUS_HAVE_TEMP2;
+		for (i = 0; i < info->pages; i++) {
+			info->func[i] |= PMBUS_HAVE_IIN
+			  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+			  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+			  | PMBUS_HAVE_PIN
+			  | PMBUS_HAVE_POUT
+			  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+		}
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -926,6 +946,7 @@ static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,ltc7880" },
 	{ .compatible = "lltc,ltm2987" },
 	{ .compatible = "lltc,ltm4664" },
+	{ .compatible = "lltc,ltm4673" },
 	{ .compatible = "lltc,ltm4675" },
 	{ .compatible = "lltc,ltm4676" },
 	{ .compatible = "lltc,ltm4677" },

-- 
2.39.5


