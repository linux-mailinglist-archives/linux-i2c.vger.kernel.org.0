Return-Path: <linux-i2c+bounces-13978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062BC38D62
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 286EB4E90D3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792423EAA0;
	Thu,  6 Nov 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="fO/onbB5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010076.outbound.protection.outlook.com [52.103.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7B23EABA
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395312; cv=fail; b=gK+7IiSJ2PXqxsJbvTN74No4HTL2eei8RvMv32eoT4CqRlaCvbGBCaQluMVHAYsK5cuIsP9ImuNNZD9WY1uVkidq8RImAdT+nD1BpSsaNzejSU1EhmH8FaPAsKyOiTDYGmgBLz8keKJyLFSWPwWdbBfZ/JdaaY57BOlLQ8X2thE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395312; c=relaxed/simple;
	bh=d8mnwLNfKmPrXwfirFTAhaa2un+e4Z+EO9wpFQlaXZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A5wNoNDznEv1UzUiy5leNekyYUxqeeXKFKXjoTTBqTtJSK0vjcMN16kxfeV0+G/sgYBas5SV4XPfaNHXe/QZrnM1j3VSLdFCBGa0higfezv3Zw0nNi2tbzeeLm1FeDD9RzJ6GTXZmt5AFl1oC1v4nIxb1kwijI8j+rxv0ErJ0XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=fO/onbB5; arc=fail smtp.client-ip=52.103.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYNfmC0KJgxuqDmjBRq0QYyDdhoo9jzSlvhLYsJ2GjauVYSHQqbx4eNb3JVIA/cwbG/aTReuG2/iZDkgSd3EnvoudowaL+lHpmYzE889NsBaTUDD8VZbs2LSzJNXQeImk5tNJWkTATDTYeUcwim3hPqoperErmjZ5eTtu7QRumWCxr7ycFcQiOR2GiV/vHBr3VTnxRAzufiuBWERE8hns3+8SmJ2/gE1C8CCpycd5dgbjOH7u4Fw0xO+NzLdw9CmTKM541YCcSe2nKGMf8sxNiTb5uTqZxT6c0S5Khj5EUvjftl7v2Pb6xCKkxTXQ4olscUGSh5p169yCojUPWBK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObY0AHjSDAFyYswrYlL+KVmwl89MDFlQK8P7FrVUqas=;
 b=WVooU4Wj5WHUtbDL5FuSSCu2CN6FPA7JKiILfk03hPvQnbKZKXmoA9pGNP1AV5PA9ctIlQsQOputKwWphlT0fZN1PJ2nM9uuS+b08z27MT9mJ7m2zfLWvTePIoTXdNB8xCE7hm5lQMnnK5L2bDkNgafB+zekDJYmzWMze54W0270MTPkzd78x/v8eyvwuw7nXhi9Q31fPIfMhl8ylfj5vsJrx+PZjvLhjGD8m0vYk2uuW/knc7yIbMvVHJiURToUHmMwiMygnK9/OwMLTcK97cVDpqZpNlqDXgUY6ae8na+ajD+VjSUtrl+9HG0Gvpb7TmLthSts/weYf7m97cDSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObY0AHjSDAFyYswrYlL+KVmwl89MDFlQK8P7FrVUqas=;
 b=fO/onbB5eMYgQH+Gi1+xOZNZci4gUnR4sS7rer7HnTgnRYQk6rUljOLomUzhKMZPOj201TcKP/lXVWl/0e01qP8rVT5v+FIbIsOrxlfp+jy0BcJsHrL/kmWskgLAOaScBZzdl+Yl3p4bw033q2xHhgEEk3aLOByIDPPL/t2lQwH+r/9k2pFHkVgTzsjnCqjhk4z5A0V2Lng+a0xl+giO+fV7BQtcNSkUHoWYpXOJ2hMMk8ZVEocXsLt01EnUYIw3zTqqwjpp2ZvHFX83GQS6THkmx+4/gjTKGooDCLLCb75RDgdyhuX1wG61QrbGPZV4IHYYzfRBf+Eivd8xCNnJlQ==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by MEYPR01MB7181.ausprd01.prod.outlook.com (2603:10c6:220:144::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 02:15:03 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:15:03 +0000
From: Stephen Horvath <s.horvath@outlook.com.au>
To: Jean Delvare <jdelvare@suse.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Kamil Aronowski
	<kamil.aronowski@3mdeb.com>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: [PATCH v2 5/6] decode-dimms: Add basic decoding of type specific
 information for DDR5
Thread-Topic: [PATCH v2 5/6] decode-dimms: Add basic decoding of type specific
 information for DDR5
Thread-Index: AQHcTsMoivN83HfmvEiqoX7WunfF+w==
Date: Thu, 6 Nov 2025 02:15:01 +0000
Message-ID: <20251106021356.208986-6-s.horvath@outlook.com.au>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|MEYPR01MB7181:EE_
x-ms-office365-filtering-correlation-id: 1be8d7d8-b1b7-4471-eb4f-08de1cda4bd6
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|19110799012|15080799012|38102599003|461199028|31061999003|40105399003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rqg1XfIFQtJck8f0MSIo3muefGl1wAWOBUcYmcqAl7CxNMsxleZFJ8LDiL?=
 =?iso-8859-1?Q?mzqQhbkYfCnTPAVbqEdgJ4MUn2J2gEVkXQRY5xJ4LXY4RK4rBq3yEAxmGV?=
 =?iso-8859-1?Q?R353N7tyys0qrNa7iCKhbq/Ug6mmQVU8omviWUkVAVOu75fQbMUoWXHZFH?=
 =?iso-8859-1?Q?3h6HZeWXi20Ak/Z1utVPLnzPa60uN2kluZ49W3a8MpJv/Y/lhjG5PBsS/Y?=
 =?iso-8859-1?Q?iZnSNHA0eeQ6ntVRryO458JiGS/8qZa+bz/f8H+SERT9TBjCO4CuFuvf8H?=
 =?iso-8859-1?Q?du+SJ17nCYcSY8QcrW/PJzwCCXxwFqvZPYZ61ZyeVTjfYFIwXHZytwZFsu?=
 =?iso-8859-1?Q?VgGam3i9FUrklk56avTAEQtEdia7ubIVG4+ZpYyT91UhuXse1SGpBWZvz8?=
 =?iso-8859-1?Q?s8ZgoCjBl8mVPb4gQUAam4AjiSr5VTs2a7Oj6aiVqnCz8mMEyBHYX87KVE?=
 =?iso-8859-1?Q?fnug8mUghVWAr9r42JBj6bAM/t4ipjGsj4MfgrtAY49EARLYcbmMuZAuBY?=
 =?iso-8859-1?Q?9udMZU7fApPHVYzJhk0URHAbemcxrDzgAz2/AYHLqoYEvfdtrSk0hz1c7m?=
 =?iso-8859-1?Q?85YtOnTv3DnDVWRYLSVxdDtn+p5EmZjjyUF8UeNBIS4vMTJPdgNBDyaLsw?=
 =?iso-8859-1?Q?OdwYbZS0R36DBEgXzUNyuQorwIZqG+S/ulk9tBVk3vngECAvoKI0XQ6wBt?=
 =?iso-8859-1?Q?IV0a1dx325H59+QGSAPF+Rc8fkmp6meYi5w1Zo2CmX/y1Gs/UisrlqOhh5?=
 =?iso-8859-1?Q?nQ39zl6cXA7L79FfI+wkDdsDvJTNKuNSrK/QWXEklqfMkzRMInlTu92WHg?=
 =?iso-8859-1?Q?in9ksThd6PbhZX48bOsAHtmGsL/xoIZC0FZ8gurIU/HTl1ubHgdLb0xztG?=
 =?iso-8859-1?Q?8V7Fp8hkYGfOrSRh0McNjpQnYFnO+pbIQzY3YHLTmNYbzTUmkkb7Ofewog?=
 =?iso-8859-1?Q?1VHuwD5ViZb6oAlqJSlgswl7s4pSvNsVYoF7yRIEBsQsT0eTqQHR1EKpdj?=
 =?iso-8859-1?Q?ea9gdm7R/W3up66t4t7UhkH0mp9+MXhtg+KPTaWc2THV+lEJsX9sHKDCFs?=
 =?iso-8859-1?Q?Hnh6cIJX98VkmQAZf/VTX75cPA4O4yOL/3OeAFdiUWb2jdNNENR+ExSXVH?=
 =?iso-8859-1?Q?E2PMk0oZqHr3rugF17U46La7JtXtjTKvnZUiaOZZvWoQPILV+fOvLJvWvr?=
 =?iso-8859-1?Q?QY/k5edgnbXfj91v/XbxM9H8QCsolv/tXv0Fy6blT6ucKc89M5ZWmP55ya?=
 =?iso-8859-1?Q?F78XvxOJkvvCTfTlIkuQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fvTcIQ+9WtuTVma/qj6Eo5dOOxxE1eqHqwVRri6Qpfj7ECQEcb9g37cZ8+?=
 =?iso-8859-1?Q?BuHK+WR9FThAvm9uqv/7NNL8MZipahM1JTBOp9zIbJUkyWjgj78Dp1SQ+g?=
 =?iso-8859-1?Q?oWC/BpXAsGuRYuFN4yypZDO2QYgjaTZXPYgGg/znPxbz2MZCWBDzQd55gT?=
 =?iso-8859-1?Q?FK+yf9I5wbf7TFiQiHpynN31p23O9UxLRtQBIrlmmNm+Ys/JyESKTpvHnJ?=
 =?iso-8859-1?Q?IYOL3HBAE2gYaoQ997Lk9lelfAaGld2dt4iZAaFiFwELg4SpD8G5kgMp/C?=
 =?iso-8859-1?Q?0Q7qOw70cPQDXTCZN8Ome7XOaoyy7G5diLd2gSrm0+dyf4xKv/5Uy8uL4v?=
 =?iso-8859-1?Q?tYGQ9SlqQn0g/MXkLRU4trpd6xbIYdNiYxPACpQvzqG3z1uxmnEjbdhWZt?=
 =?iso-8859-1?Q?JwpJkpbazkY/LhVZJw+tSDxtcDVihUX/jW7k8kbIXXsGIoZnqMD/9bQVxv?=
 =?iso-8859-1?Q?TInY954HpcPvMZOhuIfTKYA+EA0N2IDwqXx+5GMhIx3CVpNlBHIuFl6C0G?=
 =?iso-8859-1?Q?/TnJNUZQvAJtXBWoczYI4gdY1ziNTQVSmwDk6h5Q94ytD+KQdgBPMMXnYH?=
 =?iso-8859-1?Q?AGURBTTnVf9ZaFYILUgoHV4c4rgbxoZq37aP4e65Vutv6pk/E357Oq4Mb1?=
 =?iso-8859-1?Q?zI/L3/4nHa0UOOz9dJTGGLvNdZF+OqWCNLGGGwEBjreR/z6qCMh8RKttDC?=
 =?iso-8859-1?Q?Qc95RRvXFwQhut7mjDh12I0rCVDdqC/PKNRxquUPhobxwT38h2zE7HuhaM?=
 =?iso-8859-1?Q?R2/u70xzQNowArHKFWhoiW6Dkil+7WROtqhytrjI7yG8EuFWO7/Y4ji10p?=
 =?iso-8859-1?Q?KqirVHfTKftQAWHK0XN/MVxdYEhG2bZ2dQto81A+FKtFtQ46CUY67zXzoJ?=
 =?iso-8859-1?Q?uN8SF1htoU97Dksu2XSP2OVUxuYVN4lM7ASw41ces2Dv0/ZH458vyLAbcz?=
 =?iso-8859-1?Q?4Uz3XYidENx4Yw3mT6FC1SJYuSnzJvZp2DVRMFzAbz58IyAhySzJSUZTAB?=
 =?iso-8859-1?Q?PmaSh5j9Wd+S7m8Ps72+M+29C6c3d3D1C/KgFqBWqDIjqrpkS28YL6TEyH?=
 =?iso-8859-1?Q?FElKp9j3emo90fZ4d4WoDDXljyNJFEtVNPOmkQB/0+f4e9d1c+xA5umWU6?=
 =?iso-8859-1?Q?ahC+T8FFUXMLPML4HGGKsqMMo9xVeu/j8kFHEql/TBHQGOgqZYdJ8fpe5i?=
 =?iso-8859-1?Q?baEpiVIdJv27rKOJ7CAqnNO8gF3SUnXvwonIiu3Ur4X9jvuJnszx3cnsjC?=
 =?iso-8859-1?Q?ax110Q5WVPTQ6nckAfl4QEdy7qixt0uuvvFn8GtWs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be8d7d8-b1b7-4471-eb4f-08de1cda4bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:15:01.6391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB7181

Decode more manufacturer information, but only the info that is specific=0A=
to certain types of DDR5 memory modules, and not common to all DDR5=0A=
modules.=0A=
=0A=
This is completely untested since my modules don't expose this. I also=0A=
only have UDIMMs.=0A=
=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
 eeprom/decode-dimms | 71 +++++++++++++++++++++++++++++++++++++++++++++=0A=
 1 file changed, 71 insertions(+)=0A=
=0A=
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms=0A=
index 4fd4531..2ef2eb9 100755=0A=
--- a/eeprom/decode-dimms=0A=
+++ b/eeprom/decode-dimms=0A=
@@ -2386,6 +2386,77 @@ sub decode_ddr5_sdram($)=0A=
 			(($bytes->[231] >> 4) & 15) + 1));=0A=
 	printl("Module Reference Card",=0A=
 		ddr3_reference_card($bytes->[232], $bytes->[232]));=0A=
+=0A=
+# type-specific settings=0A=
+	if ($spd_info_rev =3D=3D 0x11 &&=0A=
+	    ($type =3D=3D 0x02 || # UDIMM=0A=
+	    $type =3D=3D 0x03 || # SODIMM=0A=
+	    $type =3D=3D 0x05 || # CUDIMM=0A=
+	    $type =3D=3D 0x06)) { # CSODIMM=0A=
+		prints("Unbuffered Memory Module");=0A=
+=0A=
+		printl("Clock driver manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+	}=0A=
+=0A=
+	if ($spd_info_rev =3D=3D 0x11 &&=0A=
+	    ($type =3D=3D 0x01 || # RDIMM=0A=
+	    $type =3D=3D 0x04)) { # LRDIMM=0A=
+		prints("Registered Memory Module");=0A=
+=0A=
+		printl("Clock driver manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+		printl("Data buffer manufacturer",=0A=
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));=0A=
+	}=0A=
+=0A=
+	if ($spd_info_rev =3D=3D 0x11 &&=0A=
+	    ($type =3D=3D 0x07)) { # MRDIMM=0A=
+		prints("Multiplexed Rank Memory Module");=0A=
+=0A=
+		printl("Clock driver manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+		printl("Data buffer manufacturer",=0A=
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));=0A=
+	}=0A=
+=0A=
+	if ($spd_info_rev =3D=3D 0x10 &&=0A=
+	    ($type =3D=3D 0x0A)) { # DDIMM=0A=
+		prints("Differential Memory Module");=0A=
+=0A=
+		printl("Memory buffer manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+	}=0A=
+=0A=
+	if ($spd_info_rev =3D=3D 0x01 &&=0A=
+	    ($raw_type & 0xf0 =3D=3D 0x90)) { # NVDIMM-N=0A=
+		prints("Non-Volatile Memory Module");=0A=
+=0A=
+		printl("Clock driver manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+		printl("Data buffer manufacturer",=0A=
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));=0A=
+	}=0A=
+=0A=
+	if ($spd_info_rev =3D=3D 0x10 &&=0A=
+	    ($raw_type & 0xf0 =3D=3D 0xA0)) { # NVDIMM-P=0A=
+		prints("Non-Volatile Memory Module");=0A=
+=0A=
+		printl("Clock driver manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+		printl("Data buffer manufacturer",=0A=
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));=0A=
+	}=0A=
+=0A=
+	if ($spd_info_rev =3D=3D 0x10 &&=0A=
+	    ($type =3D=3D 0x08)) { # CAMM2=0A=
+		prints("Compression Attached Memory Module");=0A=
+=0A=
+		printl("Clock driver 0 manufacturer",=0A=
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));=0A=
+		printl("Clock driver 1 manufacturer",=0A=
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));=0A=
+	}=0A=
 }=0A=
 =0A=
 # Parameter: EEPROM bytes 0-127 (using 4-5)=0A=
-- =0A=
2.51.0=0A=
=0A=

