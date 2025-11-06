Return-Path: <linux-i2c+bounces-13976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36049C38D5C
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE91C34FEBD
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EC123D7D9;
	Thu,  6 Nov 2025 02:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="WngY2J6l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010076.outbound.protection.outlook.com [52.103.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48948217F27
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395310; cv=fail; b=cdnHCZ/FJl9QemWeHX3Om0WNsc47uUegdWVuoQKP7FNdRrT//l5nkB9GBlj6ThYpt5tGBA09KWLwwKAlu4Woam2Kx00YKJUbmihyi7/F/6MyeHbzvLfjnDcR4suRVqUN3tzGDo1fnyz9RAMta369T5BAlOktgExbKxraWO4XjsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395310; c=relaxed/simple;
	bh=DayuGBvPwuJURFBMnnwF61oMjQu6xyG0McuK3TQkOLM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=omUUQrd1lacdJv45aJ9a+Ml1xuse/ygS/2hW+O2D6UKu5Wunff+dOADgc4kCfKVfknq7ySxmxce15X3Y4D4M5CYRI9/itWLXJZomlKZECCLRpwveFwIO4MO1TkJF946kQvJG4mvNxX0QLIWDoefp5SH6PY/xIwny/9/4kFkWdJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=WngY2J6l; arc=fail smtp.client-ip=52.103.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8A5+paFEL2H0r0WktBYNdz1CU2A37NPr9RCbx7mgdwSuU9gnbVJIhiekR9SZM5aF7ICwD0tjR/ELjs6zOaH7h29IQR3E2bpoTj2RxTUkGElgK0yGHhcPJA6ysLqYQrI9PoHkFjLs63xhzUwJBrFTxa4JGh8p9LlpCd8tdwpUA6eElNxJv+a3THz/eHbmLv2LOJdNtva0Y8gL43vhc5xm3Fpm6/JRrQwSazycWuWB8Ak3S7KpBYeSXaC64SAyIM6FPOfjwCqflEX/M7URgeph0sZ6OyMCwzXnizhOwSmnHOTua5jimUZqvIyFXW+ZbijlOxhlzGx7dH2osVor8w5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bw6CWQ+WeGgl2oeNybk79A1QQtv6JvHc9u78yybmUAo=;
 b=Rp+vMzkxH56nuzCCYJbPG0JnOcGHP/qsTunYs0ewOpLV3VRxbFtQ5z95HSqg/c5n+2QJSvd7Cbe9bspHJIchCI/YUYYQW1y00HXjB1CWXy9IwdmN2rhqrtfgyZUitfB5ep6UNY3uOFzxVKPC7RHsU+gA6Y4MuIdKRz3o7fkPK7JlOaox4MgElV7LHwsbUA79q/s9T/Gr2XeaL14FPC2Odz+73gHoqhmqYSQNHLsUiWEQ++OH2J/Yk3ZkdyiDJyF5ui3SimMTK9kf329r9ixRBr+3nanCUYUQX3Wxidte9ObGxCMkY8rEW3BqfFLRqbHmiT/xbScmDKdl+EKOqNB60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw6CWQ+WeGgl2oeNybk79A1QQtv6JvHc9u78yybmUAo=;
 b=WngY2J6lHmW3/ZjZ1AgUrLMGluxoB1Ly4d884is3TLFJrJLl2Tp3P+TQIz+ZIIqMdcxmBfbOJW/mWAj4IYWilWWHpjXVaTva3YGVJTHOkYrQ2d5KF5YDmY0SgX83+9aNgPrb9uj6Gvpwb30pMt5i3qFMen+un00G7WPwqsd7ol4D2DpDR2iOrSewF5s9izzeJ4Qzasvcu/eYCOfbdEixvz8M1L5KzZG9/OFj+ofB/7xAa/ybhmBOp1GTXc9umbVBkAmNioZ1xk1NxqRjlPK7AhhOf3Blka0IGpcS2Ky3nfhFZdkanlCp+ibgJaoMa5SwERZ/sAcuVRE6a5XHlAVEmg==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by MEYPR01MB7181.ausprd01.prod.outlook.com (2603:10c6:220:144::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 02:15:02 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:15:02 +0000
From: Stephen Horvath <s.horvath@outlook.com.au>
To: Jean Delvare <jdelvare@suse.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Kamil Aronowski
	<kamil.aronowski@3mdeb.com>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: [PATCH v2 4/6] decode-dimms: Decode DDR5 common module information
Thread-Topic: [PATCH v2 4/6] decode-dimms: Decode DDR5 common module
 information
Thread-Index: AQHcTsMnImy2KzT6NEu/zxCyRAo94A==
Date: Thu, 6 Nov 2025 02:15:00 +0000
Message-ID: <20251106021356.208986-5-s.horvath@outlook.com.au>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|MEYPR01MB7181:EE_
x-ms-office365-filtering-correlation-id: ca49314c-2333-4ec7-138e-08de1cda4b69
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|19110799012|15080799012|38102599003|461199028|31061999003|40105399003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5/WF5UfRD0OGUeGnTSVJzPs7bgMeVDnRXMF9aAlYGYVe6e6Pvdtc1OMf7A?=
 =?iso-8859-1?Q?4yWgT9mXb+xW6/S6MnmA7Z+WrShWzqTtQlPaQhOf8L3gw0NTsg2iSYeVDW?=
 =?iso-8859-1?Q?/yX8qmrPES8XNaVmDAxuE2foY6vqsQL7YmMjxOTmWgPinyKVyw0+kXROs5?=
 =?iso-8859-1?Q?y23jD/SXJgjrYcIa8j0WfPAKL0p4JtEWw6jU34sYU8VIG0AozAS9UqyoZJ?=
 =?iso-8859-1?Q?7wK5AH7Ea7K99L+SkWSHxrf84hlVXN+Jzf78wgSBbqXRi5G5Wt0eS44Sv2?=
 =?iso-8859-1?Q?VLLNyfhXHzKG1dBD4HM2Q5AJ4OkMuP4FRPu/kMZv0JGQ4ayQA3KRXvh3Lr?=
 =?iso-8859-1?Q?N4WYSE55F1QbdQ2GK89TpCEE9oi2O6kyvcZfVq2QpTFbY+g8ybV35knPEa?=
 =?iso-8859-1?Q?ApoToFw/1HzAv6eDLmuLkJsAhYToN5RIanoqZKXzGupNA/35J0Xm0VmIxY?=
 =?iso-8859-1?Q?QcX7U0NJCpWABNin1u2YKEsvrUomxAA8IwHvooQO0jq9NxbRrAGiqVRLt4?=
 =?iso-8859-1?Q?Bho+oSqxOYeQ1w3WyStftRxMQ9Y1Uf/U1/8E29rYcOfYS2q3qb63DjmD4B?=
 =?iso-8859-1?Q?2N9iEc1KRD98Ha6qoOabrRQRbKNMMdhSCTi/OctVJ2Gg0b/kUVfBznHCHj?=
 =?iso-8859-1?Q?atsfFLXODqgQ1jE+xHrfbhBPIABTnmnNN+F8uFKwn4rzaCs0tXclAakF64?=
 =?iso-8859-1?Q?XvmuXjg5O+XZFLvJ6uv8kqXQpRiLEkspxaOOOr9YmwhjRZ3DsACKwaZ2+g?=
 =?iso-8859-1?Q?S2bsjAZoLs96wB69a5EKIbzMo1i+KNW0eq35RCGnrF0JpzpTg+dmZC4kmE?=
 =?iso-8859-1?Q?eSJLHvku9uh21z+Y4SezyiFl8iE66k8m6qYHxDYK18/I/sqvlpxFtYQDww?=
 =?iso-8859-1?Q?1nhnqZpW+ERD5+TBcrnMoZsrAwon8yccGtpz2xa5PLFYYvv01e0XnGdRfC?=
 =?iso-8859-1?Q?Mds6GHVT1P5ELy4LRJeMG8PSYbCf++/JQEOimlcUnPAUeBGIvZyGA+4LD4?=
 =?iso-8859-1?Q?BlpPyuJyumB1Mx1xcfIyWCitUHtZ90mjDFviPrOZKMP2oZmcdLYSv9/xW0?=
 =?iso-8859-1?Q?8ojgdlChwFzlgYgeBFoYgd46wMvF5D8tmXX2HWvjstbHsU9GU0+3fto+6Y?=
 =?iso-8859-1?Q?8P4JEaiwRDqry7eAigGndLf06x7bzAkNEGUbyUUrfOEea2QSY62ZEkjUrK?=
 =?iso-8859-1?Q?/vzkwOiP0DverUjCHT2qRPmNmzCfS+okpDzK7RXbxmrZsBg66f8q++1S+Z?=
 =?iso-8859-1?Q?KxfplHvIq433171W4/Tg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6D1JS2CRnZ6DY8YbgTU0EHZ3BXaTbCI/rhk40F/MM+sSic2bCmQH/UVSFh?=
 =?iso-8859-1?Q?rStRw1m6PJYBJv8ylVErwNz98y4HMWgpq/R6rii6h1cl8lujVdEQ2eIduM?=
 =?iso-8859-1?Q?sBOG0pCN7QBoZ9C+3Px0B2+W9bMqC6evDA4fibU09NiyXg+0Qr5DJaScUN?=
 =?iso-8859-1?Q?4Ie0a/gfzhRoMTVNbv2d4VTy987JY+E3m13+A34Cfg856ahkhlZ5ept5p4?=
 =?iso-8859-1?Q?Y2rEW972eei9hSFH1oBKPb73oL9Hf7jWxjwbTmwObA/7NbACU1se/RP+LW?=
 =?iso-8859-1?Q?bXLYaB27csmc5XPvOV/lS3r+UEKHVIvDfDQ2IYb4Wh7lYlUHbqBBFxRNfN?=
 =?iso-8859-1?Q?LG+rypQLfPK3xMvGSt4OBjDf5HOB2evZioLAYiDZQq6f21SyXJBb9/V4hH?=
 =?iso-8859-1?Q?FdQSAAQqvyHXHgHsIf6Wd5h/X13BlOlS9h+RmiLz7R5QY0EwYb8rZOMbLc?=
 =?iso-8859-1?Q?+blJeAGywNdEyRIgA6MyXGkAP/wXEF9FzR0lGcQAH4EmvMai9/xGryStro?=
 =?iso-8859-1?Q?Ah284ZvzZYMijXiiNResXAMeEf4whT0Cg/kGlfJ3xyi+78ziG9ZwqiGXwI?=
 =?iso-8859-1?Q?qdokUX/wCt6AbLC45x8tcy5iOITK4cGCooFm2ZX4fECjgYEvnb4573PnAm?=
 =?iso-8859-1?Q?0IqX16c5wTcmRPv5ZXQRTvmC0u5ihrz/erc5zQmlcTB2uvqgZtyxdptpWf?=
 =?iso-8859-1?Q?Q7leFBfb33qmbZvYujTkVoSPPlTWuuvtVmMKEp0FAyDO5vwsj/yqNmYluU?=
 =?iso-8859-1?Q?+0LFXBirOPKVs0ngn8htcvE8dOr8uHUsUXQ+PmExBwb6oYQPmDhGKgJuF/?=
 =?iso-8859-1?Q?etspgZpAiylVvq6bhr3NbKc8TPLGUruN03PGW+pJInyQPBz7y5Fx2427At?=
 =?iso-8859-1?Q?ZhsJtHxOkcGWmQAHLgqQ5Q1vvGoldMIjoLvqrreTwh4A3XNYfYCnmNKwUf?=
 =?iso-8859-1?Q?DNtekhN0RYp3bVNSwPKTd7lbVOjonY57Tn8K/0OSr5dQjy5jGG8j0ZDVHi?=
 =?iso-8859-1?Q?3XrKfQR+PSdOYOrOjgaG9EUEEW1QNAbmjJmZcyWlPP2dvJo4YcVEo8rMSp?=
 =?iso-8859-1?Q?n4MykbDoOptiixZUneOy2Fg6wi4uzKz9bbfF8elhqCkVY/TB0A+Sk1YWNC?=
 =?iso-8859-1?Q?NFNXijr7fi8MxFa+/ykPrL50HWh+RADRccwEh4QgYnKFGVlxghgLxQ7/bk?=
 =?iso-8859-1?Q?nTtn1rXfwxDvTOpObXgPnI3FAq7gePCTDd1qMc1FsFV5vymQRU1nEQ1JhQ?=
 =?iso-8859-1?Q?RUM2DVfZLlx1m6x3xZq+MCLjE43JaS8Ptptqy2DMI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9115-0-msonline-outlook-64061.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4586.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ca49314c-2333-4ec7-138e-08de1cda4b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:15:00.9104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB7181

Decode the extra manufacturer information that=0A=
was mentioned in a previous patch, but only the=0A=
info this is common between all DDR5 memory=0A=
modules.=0A=
=0A=
The physical size is now implemented too.=0A=
=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
 eeprom/decode-dimms | 36 ++++++++++++++++++++++++++++++++++++=0A=
 1 file changed, 36 insertions(+)=0A=
=0A=
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms=0A=
index a5fba1e..4fd4531 100755=0A=
--- a/eeprom/decode-dimms=0A=
+++ b/eeprom/decode-dimms=0A=
@@ -2350,6 +2350,42 @@ sub decode_ddr5_sdram($)=0A=
 =0A=
 	printl("Thermal Sensor",=0A=
 	       $bytes->[14] & 0x08 ? "Supported" : "No");=0A=
+=0A=
+# common module information=0A=
+	prints("Common Information");=0A=
+=0A=
+	my $spd_info_rev =3D $bytes->[192];=0A=
+	printl("SPD Module Info Revision", ($spd_info_rev >> 4) . "." . ($spd_inf=
o_rev & 0xf));=0A=
+=0A=
+	printl_cond($bytes->[196] & 0x80,=0A=
+		    "SPD Manufacturer",=0A=
+		    manufacturer_ddr3($bytes->[194], $bytes->[195]));=0A=
+	printl_cond($bytes->[200] & 0x80,=0A=
+		    "PMIC0 Manufacturer",=0A=
+		    manufacturer_ddr3($bytes->[198], $bytes->[199]));=0A=
+	printl_cond($bytes->[204] & 0x80,=0A=
+		    "PMIC1 Manufacturer",=0A=
+		    manufacturer_ddr3($bytes->[202], $bytes->[203]));=0A=
+	printl_cond($bytes->[208] & 0x80,=0A=
+		    "PMIC2 Manufacturer",=0A=
+		    manufacturer_ddr3($bytes->[206], $bytes->[207]));=0A=
+	printl_cond($bytes->[212] & 0xC0,=0A=
+		    "Thermal Sensors Manufacturer",=0A=
+		    manufacturer_ddr3($bytes->[210], $bytes->[211]));=0A=
+=0A=
+	prints("Physical Characteristics");=0A=
+=0A=
+	my $height =3D $bytes->[230] & 0x1f;=0A=
+	printl("Module Height",=0A=
+		$height =3D=3D 0x00 ? "15 mm or less" :=0A=
+		$height =3D=3D 0x1f ? "more than 45 mm" :=0A=
+		sprintf("%u mm", $height + 15));=0A=
+	printl("Module Thickness",=0A=
+		sprintf("%d mm front, %d mm back",=0A=
+			($bytes->[231] & 0x0f) + 1,=0A=
+			(($bytes->[231] >> 4) & 15) + 1));=0A=
+	printl("Module Reference Card",=0A=
+		ddr3_reference_card($bytes->[232], $bytes->[232]));=0A=
 }=0A=
 =0A=
 # Parameter: EEPROM bytes 0-127 (using 4-5)=0A=
-- =0A=
2.51.0=0A=
=0A=

