Return-Path: <linux-i2c+bounces-10118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93742A7D297
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 05:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDC107A451E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9084221F07;
	Mon,  7 Apr 2025 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="gH61NABS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7421D3F1;
	Mon,  7 Apr 2025 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997722; cv=none; b=uSoLscETyMIG52NRk73gxVYnVGIBQu2qvVf+3rF8hUZS6lXSMlZescjuEhWUrR1IOxzZ+0CRIU4Cv+8gr3IbjlKBTgdfwpK1mWCvvOCVhKMfllfIRCCQtvhaZpmurNcQMGVGq5KacRq9ZGTwrdFupwrYNfxz9D5ofjgsFebKA2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997722; c=relaxed/simple;
	bh=Q/Gq6KvG6AV22p7bSsvxcoCGXEPbYJzHpHnrnHj2Uy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A0rj1P/sIAP133BcBaPH6SF1Jo5vmjMybyzWOXpT0f5qLyszQDWA6m77TZPFt1Bv1tlVqTM6HtZlAXy7CnN656huRZmUMKMtPqneXlgltOMRbhL63d19S54WvsoXMcunNMl/TpCtn5UQrkoWsulujlQXoGWHBaYv8rPmoAksupI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=gH61NABS; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5371lqgD000934;
	Sun, 6 Apr 2025 23:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+9KYs
	J9cwDq4kavjStrpEhRzyPMYaaC4bFY2PbwvTbA=; b=gH61NABSfMXcEvS4AGLKE
	fhCWEnzZZDdGaAtUduYuE8Sp7A+TwCFQ9j1OJTRGAJGKlxlcqkIv8OabEOLuBXy2
	y/kRL9lI/RlI95N3YliJjkzzP60R6uAwTwn4cFzGoTnXTZLjmUQx7zk/b1njCcaW
	/Nqj/kL82b8wN8E6l3Rz6Z7dB6/LIFKsgJsA3Wc53IILdD1wf/ZlEXSF9JaGbGMC
	VonWOgZ2J3ojVNl6STZ+SwsM1XRcExRuleggTKQPrF/EuaBGfsvYTCu8c6PB2JF+
	Rmu2o34qEFwJhn3R90trh08Az34c6P6G9x14qZLoLMMtULbTy7B5KZ9A4EfgvDIv
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45ujugby6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 23:48:20 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5373mJmd042637
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 6 Apr 2025 23:48:19 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 6 Apr 2025
 23:48:19 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 6 Apr 2025 23:48:19 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.24])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5373m1a4015369;
	Sun, 6 Apr 2025 23:48:11 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 7 Apr 2025 11:47:24 +0800
Subject: [PATCH v3 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-dev_adpm12160-v3-1-9cd3095445c8@analog.com>
References: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
In-Reply-To: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743997681; l=4639;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=Q/Gq6KvG6AV22p7bSsvxcoCGXEPbYJzHpHnrnHj2Uy4=;
 b=LlSREyHNZK8KZm6BOXM1IBb0Ycg/dr8qZ+7kHOxtt6+UxDJ2zPP950zqOnEDfac1tK6BcFV8F
 n7hLXTLAdD+Dz/oYgs//LZKSPnMPQGWE9JumPTtchatkhPD8gJ+j0RX
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: xBn6nwNo-uGBZWy5vujcfUas6l6yWf6z
X-Authority-Analysis: v=2.4 cv=KKJaDEFo c=1 sm=1 tr=0 ts=67f34b04 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gAnH3GRIAAAA:8 a=6t2fGIkV4s4Gta6eLoEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xBn6nwNo-uGBZWy5vujcfUas6l6yWf6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070025

The max344** family has an issue with some PMBUS address being switched.
This includes max34451 however version MAX34451-NA6 and later has this
issue fixed and this commit supports that update.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max34440.c | 48 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff24e7b5e2fd1956a65e6bd2bfcbb9..d6d556b0138532f0a55ffe73eae760cf41aa4ab8 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -34,16 +34,21 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
 /*
  * The whole max344* family have IOUT_OC_WARN_LIMIT and IOUT_OC_FAULT_LIMIT
  * swapped from the standard pmbus spec addresses.
+ * For max34451, version MAX34451ETNA6+ and later has this issue fixed.
  */
 #define MAX34440_IOUT_OC_WARN_LIMIT	0x46
 #define MAX34440_IOUT_OC_FAULT_LIMIT	0x4A
 
+#define MAX34451ETNA6_MFR_REV		0x0012
+
 #define MAX34451_MFR_CHANNEL_CONFIG	0xe4
 #define MAX34451_MFR_CHANNEL_CONFIG_SEL_MASK	0x3f
 
 struct max34440_data {
 	int id;
 	struct pmbus_driver_info info;
+	u8 iout_oc_warn_limit;
+	u8 iout_oc_fault_limit;
 };
 
 #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
@@ -60,11 +65,11 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 	switch (reg) {
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
 		ret = pmbus_read_word_data(client, page, phase,
-					   MAX34440_IOUT_OC_FAULT_LIMIT);
+					   data->iout_oc_fault_limit);
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
 		ret = pmbus_read_word_data(client, page, phase,
-					   MAX34440_IOUT_OC_WARN_LIMIT);
+					   data->iout_oc_warn_limit);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page, phase,
@@ -133,11 +138,11 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 
 	switch (reg) {
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
-		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
+		ret = pmbus_write_word_data(client, page, data->iout_oc_fault_limit,
 					    word);
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
-		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
+		ret = pmbus_write_word_data(client, page, data->iout_oc_warn_limit,
 					    word);
 		break;
 	case PMBUS_VIRT_RESET_POUT_HISTORY:
@@ -235,6 +240,25 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	 */
 
 	int page, rv;
+	bool max34451_na6 = false;
+
+	rv = i2c_smbus_read_word_data(client, PMBUS_MFR_REVISION);
+	if (rv < 0)
+		return rv;
+
+	if (rv >= MAX34451ETNA6_MFR_REV) {
+		max34451_na6 = true;
+		data->info.format[PSC_VOLTAGE_IN] = direct;
+		data->info.format[PSC_CURRENT_IN] = direct;
+		data->info.m[PSC_VOLTAGE_IN] = 1;
+		data->info.b[PSC_VOLTAGE_IN] = 0;
+		data->info.R[PSC_VOLTAGE_IN] = 3;
+		data->info.m[PSC_CURRENT_IN] = 1;
+		data->info.b[PSC_CURRENT_IN] = 0;
+		data->info.R[PSC_CURRENT_IN] = 2;
+		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
+		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
+	}
 
 	for (page = 0; page < 16; page++) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
@@ -251,16 +275,30 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 		case 0x20:
 			data->info.func[page] = PMBUS_HAVE_VOUT |
 				PMBUS_HAVE_STATUS_VOUT;
+
+			if (max34451_na6)
+				data->info.func[page] |= PMBUS_HAVE_VIN |
+					PMBUS_HAVE_STATUS_INPUT;
 			break;
 		case 0x21:
 			data->info.func[page] = PMBUS_HAVE_VOUT;
+
+			if (max34451_na6)
+				data->info.func[page] |= PMBUS_HAVE_VIN;
 			break;
 		case 0x22:
 			data->info.func[page] = PMBUS_HAVE_IOUT |
 				PMBUS_HAVE_STATUS_IOUT;
+
+			if (max34451_na6)
+				data->info.func[page] |= PMBUS_HAVE_IIN |
+					PMBUS_HAVE_STATUS_INPUT;
 			break;
 		case 0x23:
 			data->info.func[page] = PMBUS_HAVE_IOUT;
+
+			if (max34451_na6)
+				data->info.func[page] |= PMBUS_HAVE_IIN;
 			break;
 		default:
 			break;
@@ -494,6 +532,8 @@ static int max34440_probe(struct i2c_client *client)
 		return -ENOMEM;
 	data->id = i2c_match_id(max34440_id, client)->driver_data;
 	data->info = max34440_info[data->id];
+	data->iout_oc_fault_limit = MAX34440_IOUT_OC_FAULT_LIMIT;
+	data->iout_oc_warn_limit = MAX34440_IOUT_OC_WARN_LIMIT;
 
 	if (data->id == max34451) {
 		rv = max34451_set_supported_funcs(client, data);

-- 
2.34.1


