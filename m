Return-Path: <linux-i2c+bounces-9845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AFAA63EFD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 06:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1839716CC15
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 05:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1663215165;
	Mon, 17 Mar 2025 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="zP72LJ55"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A66286A1;
	Mon, 17 Mar 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742187819; cv=none; b=u0Qsd3ZQXtvNnFjY5RP6BRlkwih/M1ex3ShIO07Ao98Me1SQ44B5WH2BOFq1HSQ/8RlEMb+4uFOjfG3zjrHJREJZj+T+QCoT141urzbJq75WDuGtvGfFLdvHOqgLCfxzwMDu+FwrtsHrUsHzzIqsFrcXWLlYAsfNrcNDCqI7UMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742187819; c=relaxed/simple;
	bh=2vD/39xrIeY47JBB4mgWEUPE7E+CTz3iO47JJcNKFIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jgbOui8Bbp6cAtasvW5gSa4wYmXoqmA2I7Iokl5iBStDeasee+rupG/NGlC/jMlkoJSu6nRxXgDMfRwKTu4vz2u1E8VVEfdDbM3YuOwD5sqZtohivLgu09fgvRM6YRNCSdIydwrznWGEkaKmnw4oFBZAq52wsiY3eSPFyZkCHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=zP72LJ55; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H4jvUK031114;
	Mon, 17 Mar 2025 01:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=r2bCI
	kLhw/rZksWEHKvCBsvGqUq/8+BhI3MfmB5oaQU=; b=zP72LJ55H5+PMkBWBI8kM
	wgrGwqGATyYvekz2Nvf5fVyumAFd5rqcVR/chcz3xSD7hxzm+FZLAMceFsN7OMo6
	gtf4C82SFng+/lhFaa4/TwFH9exf7u4Nvi58Y44+cr0dMIts7GMaHTeoozPZsIZ5
	iLLs/tuYUgys+wOC76Oo+Mw7IyvOsFmRwHVD7DWZxUWbye9tVe7mCXuAsA0NSUYT
	cjzsT4s1UHFzVpjm0qD2mGDcZ9B96/EkunmlulJQ0audp10PVCkQcCtzyCy7mDvv
	ikB7RBGJeCz7tucDaAk1SvqxbuR5Zcan5RNmGwQ0HoLtmFqqdDnJnJ7Ge7Be9dKp
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45d3d6g0mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 01:03:19 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 52H53ItO044495
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 01:03:18 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 17 Mar
 2025 01:03:18 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 17 Mar 2025 01:03:18 -0400
Received: from analog.ad.analog.com (KPALLER2-L03.ad.analog.com [10.117.223.28])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52H52jZF026775;
	Mon, 17 Mar 2025 01:03:07 -0400
From: Kim Seer Paller <kimseer.paller@analog.com>
Date: Mon, 17 Mar 2025 13:02:27 +0800
Subject: [PATCH 3/3] hwmon: (pmbus/ltc2978) add support for lt717x
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250317-hwmon-next-v1-3-da0218c38197@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742187765; l=5152;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=2vD/39xrIeY47JBB4mgWEUPE7E+CTz3iO47JJcNKFIo=;
 b=wCpAEGlpdIyjd2x8FP5UhX7oBOfoAK4VxCdSpwXz4t7htJYIhXfrdZl6EN2YQkbhIiKtz754r
 wuGTRQOUSLfBNsTEABHSlwceTOi/5vVvJxvGWnxEbOz2bGFCYnSZaM7
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: v8vYl_4d_NoVSvChkQsceWIoyRiiywce
X-Authority-Analysis: v=2.4 cv=MsRS63ae c=1 sm=1 tr=0 ts=67d7ad17 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=05dnua3z-gnXFUcAZTMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: v8vYl_4d_NoVSvChkQsceWIoyRiiywce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170034

Add support for LT7170 and LT7171. The LT7170 and LT7171 are 20 A, 16 V,
Single- or Dual-Phase, Silent Switcher Step-Down Regulators with Digital
Power System Management.

The relevant registers in the LT7170 and LT7171 are similar to those in
the LTC3887, but with fewer channels. This adds the chip ID and
identification of ASCII to differentiate between the LT7170 and LT7171.
These devices support polling for status updates and clearing peak
values. The data format for voltage, current, and temperature is set to
IEEE754 for precision and compatibility.

Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   |  6 +++---
 drivers/hwmon/pmbus/ltc2978.c | 44 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 675b0d4703d87c9d5654489d0d770661ff0dba11..6ce68dd333690c407311e256db3f3284bbb48861 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -233,9 +233,9 @@ config SENSORS_LTC2978_REGULATOR
 	depends on SENSORS_LTC2978 && REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear Technology
-	  LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889, LTC7841,
-	  LTC7880, LTM4644, LTM4673, LTM4675, LTM4676, LTM4677, LTM4678,
-	  LTM4680, LTM4686, and LTM4700.
+	  LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
+	  LTC7841, LTC7880, LTM4644, LTM4673, LTM4675, LTM4676, LTM4677,
+	  LTM4678, LTM4680, LTM4686, and LTM4700.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 658cb1173291006d83033a6363ac52d24635abaf..8f5be520a15db3d61dcd6df38ece6c74b232f85b 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -23,8 +23,8 @@ enum chips {
 	/* Managers */
 	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
 	/* Controllers */
-	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7132,
-	ltc7841, ltc7880,
+	lt7170, lt7171, ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887,
+	ltc3889, ltc7132, ltc7841, ltc7880,
 	/* Modules */
 	ltm2987, ltm4664, ltm4673, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680,
 	ltm4686, ltm4700,
@@ -62,6 +62,7 @@ enum chips {
 
 #define LTC2978_ID_MASK			0xfff0
 
+#define LT7170_ID			0x1C10
 #define LTC2972_ID			0x0310
 #define LTC2974_ID			0x0210
 #define LTC2975_ID			0x0220
@@ -537,6 +538,8 @@ static int ltc2978_write_word_data(struct i2c_client *client, int page,
 }
 
 static const struct i2c_device_id ltc2978_id[] = {
+	{"lt7170", lt7170},
+	{"lt7171", lt7171},
 	{"ltc2972", ltc2972},
 	{"ltc2974", ltc2974},
 	{"ltc2975", ltc2975},
@@ -615,7 +618,7 @@ static int ltc2978_get_id(struct i2c_client *client)
 		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 		if (ret < 0)
 			return ret;
-		if (ret < 3 || strncmp(buf, "LTC", 3))
+		if (ret < 3 || (strncmp(buf, "LTC", 3) && strncmp(buf, "ADI", 3)))
 			return -ENODEV;
 
 		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
@@ -630,6 +633,25 @@ static int ltc2978_get_id(struct i2c_client *client)
 
 	chip_id &= LTC2978_ID_MASK;
 
+	if (chip_id == LT7170_ID) {
+		u8 buf[I2C_SMBUS_BLOCK_MAX];
+		int ret;
+
+		ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
+						    sizeof(buf), buf);
+		if (ret < 0)
+			return ret;
+
+		if (!strncmp(buf + 1, "LT7170", 6) ||
+		    !strncmp(buf + 1, "LT7170-1", 8))
+			return lt7170;
+		if (!strncmp(buf + 1, "LT7171", 6) ||
+		    !strncmp(buf + 1, "LT7171-1", 8))
+			return lt7171;
+
+		return -ENODEV;
+	}
+
 	if (chip_id == LTC2972_ID)
 		return ltc2972;
 	else if (chip_id == LTC2974_ID)
@@ -741,6 +763,20 @@ static int ltc2978_probe(struct i2c_client *client)
 	data->temp2_max = 0x7c00;
 
 	switch (data->id) {
+	case lt7170:
+	case lt7171:
+		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
+		info->read_word_data = ltc3883_read_word_data;
+		info->pages = LTC3883_NUM_PAGES;
+		info->format[PSC_VOLTAGE_IN] = ieee754;
+		info->format[PSC_VOLTAGE_OUT] = ieee754;
+		info->format[PSC_CURRENT_OUT] = ieee754;
+		info->format[PSC_TEMPERATURE] = ieee754;
+		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+		  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+		break;
 	case ltc2972:
 		info->read_word_data = ltc2975_read_word_data;
 		info->pages = LTC2972_NUM_PAGES;
@@ -927,6 +963,8 @@ static int ltc2978_probe(struct i2c_client *client)
 
 #ifdef CONFIG_OF
 static const struct of_device_id ltc2978_of_match[] = {
+	{ .compatible = "lltc,lt7170" },
+	{ .compatible = "lltc,lt7171" },
 	{ .compatible = "lltc,ltc2972" },
 	{ .compatible = "lltc,ltc2974" },
 	{ .compatible = "lltc,ltc2975" },

-- 
2.34.1


