Return-Path: <linux-i2c+bounces-7640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8CD9B3FE9
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 02:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0D428350C
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 01:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC10218E361;
	Tue, 29 Oct 2024 01:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZUXO2TKl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316213C3F6;
	Tue, 29 Oct 2024 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165911; cv=none; b=prLV+oFeBbh8XMEJD5FtkPKV3O7aMGoMvplm5A61EaXviseEf3/xpezyae93JZo5Qs0cIqRt/pUFpzgYuCq87i7O+m7wOKAIh6gdSPvzIBkMgC9J3PhK68qpzaJNXJyriEcwXFCoPbl7Cd15o4NpFbTD0k3nLOmtZpaHxUhgPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165911; c=relaxed/simple;
	bh=FK7FJ1NakIuFl1DY4Wq7E0A24NQ2ar4oPQk7kkTCPcQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sm3rwak1vQMuoGnS5wcW+LQtGFqHpWDUZmGarcIW1IlcTfUgDIGveZJARX3ZNhlz07JeP9wpoLU8F7titCnFl4BpgAvsa8zNnS3vY/kuXTsGoU3Wsp8B+PVErsU4lRj7IdlVlQor2anS+QSDCRMjzs3rnvClzT4IFfxjbW+9UJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZUXO2TKl; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SMk9Lf027636;
	Mon, 28 Oct 2024 21:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=FWkrk
	QdfhdZu4b9/Od2xDQrjn4cLmKxHKOYM9xC/GVg=; b=ZUXO2TKlQjchgwTLmd7qt
	wkHpwycv0X458HFuYjbILmpuFszO3UJ/5gwjW7tZacc1dzWXFB2xaLFU/WPonpFj
	DESmwEgozLICKjK/G7157/YoCPze3mryc4n3InwVXjvKDxugM28GpZWq94hT4/1i
	jM36mTN8rtZEgkCukToMSYWcDHAdcVPdKj9tjpiXCSUS89CG+aHMlriM4yLtsseo
	KEMONmOE0wxohhoJS5oTfta9BTAzPwbVWyV7N7rfukTUlEFo5ZtaCTBf1AZhJTYX
	fs+3bzbbMvWOwhNaG76Yy5Q6oUKbAAXxzOreBHtn/FXkc8vHrFw40Px1txuzIr3x
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42gt92ukjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 21:38:11 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49T1cA8X018910
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 21:38:10 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 28 Oct 2024 21:38:09 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 28 Oct 2024 21:38:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 28 Oct 2024 21:38:09 -0400
Received: from MTINACO-L03.ad.analog.com (MTINACO-L03.ad.analog.com [10.117.223.14])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49T1bgJR031384;
	Mon, 28 Oct 2024 21:38:03 -0400
From: Mariel Tinaco <Mariel.Tinaco@analog.com>
To: <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare
	<jdelvare@suse.com>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        "Jonathan Corbet" <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH 3/3] hwmon: (pmbus/ltc2978) add support for ltc7841
Date: Tue, 29 Oct 2024 09:37:34 +0800
Message-ID: <20241029013734.293024-4-Mariel.Tinaco@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mYpGhXks3Cff0-9Btl0zeXOKFeTiXbdy
X-Proofpoint-ORIG-GUID: mYpGhXks3Cff0-9Btl0zeXOKFeTiXbdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290011

Add support for LTC7841. The LTC7841 is a high performance
PolyPhase® single output synchronous boost converter controller.
Multiphase operation reduces input and output capacitor
requirements and allows the use of smaller inductors than the
single-phase equivalent.

The relevant registers in the LTC7841 are similar to the
LTC7880, only reduced by some amount. So it's just a matter of adding
the chip id. The device also doesn't support polling, on top of the
reduced register set, so a separate case for setting the chip info is
added.

Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   |  6 +++---
 drivers/hwmon/pmbus/ltc2978.c | 20 ++++++++++++++++++--
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a4f02cad92fd..f6d352841953 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -224,9 +224,9 @@ config SENSORS_LTC2978_REGULATOR
 	depends on SENSORS_LTC2978 && REGULATOR
 	help
 	  If you say yes here you get regulator support for Linear Technology
-	  LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889, LTC7880,
-	  LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680, LTM4686,
-	  and LTM4700.
+	  LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889, LTC7841,
+	  LTC7880, LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
+	  LTM4686, and LTM4700.
 
 config SENSORS_LTC3815
 	tristate "Linear Technologies LTC3815"
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 73a86f4d6472..a6eb4d4b5487 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -23,7 +23,8 @@ enum chips {
 	/* Managers */
 	ltc2972, ltc2974, ltc2975, ltc2977, ltc2978, ltc2979, ltc2980,
 	/* Controllers */
-	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7132, ltc7880,
+	ltc3880, ltc3882, ltc3883, ltc3884, ltc3886, ltc3887, ltc3889, ltc7132,
+	ltc7841, ltc7880,
 	/* Modules */
 	ltm2987, ltm4664, ltm4675, ltm4676, ltm4677, ltm4678, ltm4680, ltm4686,
 	ltm4700,
@@ -50,7 +51,7 @@ enum chips {
 #define LTC3880_MFR_CLEAR_PEAKS		0xe3
 #define LTC3880_MFR_TEMPERATURE2_PEAK	0xf4
 
-/* LTC3883, LTC3884, LTC3886, LTC3889, LTC7132, LTC7880 */
+/* LTC3883, LTC3884, LTC3886, LTC3889, LTC7132, LTC7841 and LTC7880 only */
 #define LTC3883_MFR_IIN_PEAK		0xe1
 
 /* LTC2975 only */
@@ -80,6 +81,7 @@ enum chips {
 #define LTC3887_ID			0x4700
 #define LTC3889_ID			0x4900
 #define LTC7132_ID			0x4CE0
+#define LTC7841_ID			0x40D0
 #define LTC7880_ID			0x49E0
 #define LTM2987_ID_A			0x8010	/* A/B for two die IDs */
 #define LTM2987_ID_B			0x8020
@@ -548,6 +550,7 @@ static const struct i2c_device_id ltc2978_id[] = {
 	{"ltc3887", ltc3887},
 	{"ltc3889", ltc3889},
 	{"ltc7132", ltc7132},
+	{"ltc7841", ltc7841},
 	{"ltc7880", ltc7880},
 	{"ltm2987", ltm2987},
 	{"ltm4664", ltm4664},
@@ -654,6 +657,8 @@ static int ltc2978_get_id(struct i2c_client *client)
 		return ltc3889;
 	else if (chip_id == LTC7132_ID)
 		return ltc7132;
+	else if (chip_id == LTC7841_ID)
+		return ltc7841;
 	else if (chip_id == LTC7880_ID)
 		return ltc7880;
 	else if (chip_id == LTM2987_ID_A || chip_id == LTM2987_ID_B)
@@ -854,6 +859,16 @@ static int ltc2978_probe(struct i2c_client *client)
 		  | PMBUS_HAVE_POUT
 		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		break;
+	case ltc7841:
+		data->features |= FEAT_CLEAR_PEAKS;
+		info->read_word_data = ltc3883_read_word_data;
+		info->pages = LTC3883_NUM_PAGES;
+		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN
+		  | PMBUS_HAVE_STATUS_INPUT
+		  | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		  | PMBUS_HAVE_IOUT
+		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -907,6 +922,7 @@ static const struct of_device_id ltc2978_of_match[] = {
 	{ .compatible = "lltc,ltc3887" },
 	{ .compatible = "lltc,ltc3889" },
 	{ .compatible = "lltc,ltc7132" },
+	{ .compatible = "lltc,ltc7841" },
 	{ .compatible = "lltc,ltc7880" },
 	{ .compatible = "lltc,ltm2987" },
 	{ .compatible = "lltc,ltm4664" },
-- 
2.34.1


