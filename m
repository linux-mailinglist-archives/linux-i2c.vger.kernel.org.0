Return-Path: <linux-i2c+bounces-10087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F4AA79B2D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 07:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3C491745C7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 05:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E61D19E7ED;
	Thu,  3 Apr 2025 05:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="iSB1ausD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB319CD1B;
	Thu,  3 Apr 2025 05:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743657426; cv=none; b=Vi86NLqAfYsyo87iqa07jy35hunGwIQxRqsQTTwobN/iCdmv63jrFvr+gtUrjtqlwvWuWHhmUVxsxRwFl0qUcV7WbmRfTHV0uK8i95RKbXH5nMyzv30caG7a16/VvI2L+NIRsNR7SNqx0QfFc57wMDprVB4E+PfQv3q6GpFKQHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743657426; c=relaxed/simple;
	bh=cVuNS+DRtc+csr0MyW7dtx4uMCHBawUVP2l5ps4By3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L6Yn/Z2StyEo3aXoyKgRHR0lxjOXIFiIL6T0bdpm95/pn0RqjiCseRfilW/8RS38ual05IkEpUrLduJm4Y7BlFEvZ4F05eccxpJ/Db7mhLpUqiXkLk/m74ZwvYEQxedN6DFap2UOfdZGGOJb18xCS5EaZ7wffwa6aFid3gjymRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=iSB1ausD; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5331EN8K023380;
	Thu, 3 Apr 2025 01:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vldjS
	mGb5gleMfY+/XhDeGTRVpODkjt5e6c2uJV/oTM=; b=iSB1ausDez4AZSgQOGT60
	dIbBwekRVrda480AgVGZE4TwkIRXlHUajzKbX1W8bODAh/7rSJBNGpiCxYVZx5iC
	gX4nUkBWk0DpaDp8PnOymM0hQWX1+6ruZArgKIp4sDiS1AHrQA7D0ts/N39+gdT1
	/YE2M6anBJxljozmf6qh9RZUNTRnUn1WmVBDM1hYpfNuKdYbgQfut1WipxHnaBOr
	a/btYuu196vCAwzdvn7fPg5ONfBWlvCgoQyGI25mPxM/TdP4mZNwk49T6cjhUXvV
	YLtYNOcyV5lGUfRWEHzhyrFWJJVuLmepPO+fN5muKP/TtvEwbNk0FPzdRSmLmCBx
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45rcrwkvc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 01:16:49 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5335Gm3V051009
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Apr 2025 01:16:48 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 3 Apr 2025 01:16:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 3 Apr 2025 01:16:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 3 Apr 2025 01:16:48 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.13])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5335GSPT006832;
	Thu, 3 Apr 2025 01:16:39 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 3 Apr 2025 13:16:18 +0800
Subject: [PATCH v2 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250403-dev_adpm12160-v2-1-bbf40faae988@analog.com>
References: <20250403-dev_adpm12160-v2-0-bbf40faae988@analog.com>
In-Reply-To: <20250403-dev_adpm12160-v2-0-bbf40faae988@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743657389; l=4945;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=cVuNS+DRtc+csr0MyW7dtx4uMCHBawUVP2l5ps4By3E=;
 b=/hJbmHgHIkOP7ontZzCzAn/D3qT/NVA3NLqOt2GyD18TZx1GLWvjiqJ65GnjPAELSWLwxqpgk
 oJ+IE4qpBgLB/u1AqMGlazoTv9idFAqeMNiEMEdzRQqhbSgV0MAZXvL
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 7WrKtoYlhV0RRNhMGEhnX5TtHF5ZBwoo
X-Proofpoint-ORIG-GUID: 7WrKtoYlhV0RRNhMGEhnX5TtHF5ZBwoo
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=67ee19c1 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gAnH3GRIAAAA:8 a=6t2fGIkV4s4Gta6eLoEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030026

The max344** family has an issue with some PMBUS address being switched.
This includes max34451 however version MAX34451-NA6 and later has this
issue fixed and this commit supports that update.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/hwmon/pmbus/max34440.c | 55 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff24e7b5e2fd1956a65e6bd2bfcbb9..585746806663409bc97042647f6c0aba4c6f520a 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -34,16 +34,22 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
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
+	bool pmbus_addr_fixed;
+	u32 iout_oc_warn_limit;
+	u32 iout_oc_fault_limit;
 };
 
 #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
@@ -60,11 +66,11 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
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
@@ -133,11 +139,11 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 
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
@@ -235,6 +241,24 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	 */
 
 	int page, rv;
+	bool max34451_na6 = false;
+
+	rv = i2c_smbus_read_word_data(client, PMBUS_MFR_REVISION);
+	if (rv < 0)
+		return rv;
+
+	if (rv == MAX34451ETNA6_MFR_REV) {
+		max34451_na6 = true;
+		data->pmbus_addr_fixed = true;
+		data->info.format[PSC_VOLTAGE_IN] = direct;
+		data->info.format[PSC_CURRENT_IN] = direct;
+		data->info.m[PSC_VOLTAGE_IN] = 1;
+		data->info.b[PSC_VOLTAGE_IN] = 0;
+		data->info.R[PSC_VOLTAGE_IN] = 3;
+		data->info.m[PSC_CURRENT_IN] = 1;
+		data->info.b[PSC_CURRENT_IN] = 0;
+		data->info.R[PSC_CURRENT_IN] = 2;
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
@@ -494,6 +532,7 @@ static int max34440_probe(struct i2c_client *client)
 		return -ENOMEM;
 	data->id = i2c_match_id(max34440_id, client)->driver_data;
 	data->info = max34440_info[data->id];
+	data->pmbus_addr_fixed = false;
 
 	if (data->id == max34451) {
 		rv = max34451_set_supported_funcs(client, data);
@@ -501,6 +540,14 @@ static int max34440_probe(struct i2c_client *client)
 			return rv;
 	}
 
+	if (data->pmbus_addr_fixed) {
+		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
+		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
+	} else {
+		data->iout_oc_fault_limit = MAX34440_IOUT_OC_FAULT_LIMIT;
+		data->iout_oc_warn_limit = MAX34440_IOUT_OC_WARN_LIMIT;
+	}
+
 	return pmbus_do_probe(client, &data->info);
 }
 

-- 
2.34.1


