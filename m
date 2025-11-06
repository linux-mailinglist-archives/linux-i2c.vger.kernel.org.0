Return-Path: <linux-i2c+bounces-13975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3B8C38D59
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 172F13B7CB0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C12227B95;
	Thu,  6 Nov 2025 02:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="dfC3mi3l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011031.outbound.protection.outlook.com [52.103.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46C23EABA
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395308; cv=fail; b=SZH7OywQoGwpUrXQAZw3Y7iqp/w4kXG/K6PqKyQlIoofDCQ5BobkZYTYhxD6Q1VGrBL8t4cG8xy/wWN3EiZRNrLRuVUUh+Ydb3RElDS84HawrCM744i2ukEAcBcS8aTno1J0CASzK1Z3OUnphCIIOBrP7V+1n4HKOg7nw1t1POw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395308; c=relaxed/simple;
	bh=HldcWWWVLPpdDyGYdqEhSN32/n/nBlIJ5mDS1kTrvEI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e/urFdikTZGsTWJAzkYKLqbxR4DwgMFweKibiUrltLl0cthdPDZvy33/m1/NkPUu1c73E2JXaLUkzuouh1S9IFkuehQ3brdOoWOpIGHHUPn2EaCsdzMNyJ2Zo9raFm4siH72OxcLl8QjCVqIjhjzKkYkxOBE/4tIrr70ATk5zpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=dfC3mi3l; arc=fail smtp.client-ip=52.103.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBUK0zl401HwvWlezIQ51vqGYpu3hyDGmbJSNo/vma4H5zXlC4QSU/CvhYPa9WaShq+gjZlL6D8EGW0G4DUnzmz3TbQIgsKbPk5EuYrCSieHNIcr4NMEpt9d9C9z+ripww6dwkmCGJL+lg+PmiCKQS9uAXFI/JxasfJLVWre1pBRypQxG8R3eAfqtpz2bvzhGAIGOPov8lRHsNJGETrQ5gmtN7g9ErFHdtAMUtWp+vSqzltJoqFREMeDKFKIqxzHfTdNSi0xvViCo7BvEd4J67+fpEw6CxQPataFIr+f43yvqnTKZi8u3oaUFtULeN5rOjkUHIJVYRpa94tpaKBNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HsPKUrHWv2jG2EAWbrOthC6Q8tL4S1WTiDztHB6iL8=;
 b=c+BpqZvf6KnxcnDzCF/IVCjZAUJw3FC+PxSNWUPXI0I38uPfqFe1l65PAxh91CQSSel1aKJUP4MQ93UluzIiIa6H0wQXGc7QRYjvfNIQBnQrtb4vj9kISpXYUKZYNdjD30zRAKoVb0D5fcyilES5sxMIDcDVXFrgryiXp+fEBttGdXJ6i4mCPaty8U9MgAJaEEFGiWvOQrwydRseFi0Ya670P1+xGfqpoX6xRNEFLNyt7BPCIE9lUUhukMb2RNdO5kUqmyTBjJViB7iNfDN7iNZGrtGRSEe1/5S4pA1/lNhKwdRx8FbosbMtIa9RNe+SYP7V2gsHTFyj5lMAmk1AMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HsPKUrHWv2jG2EAWbrOthC6Q8tL4S1WTiDztHB6iL8=;
 b=dfC3mi3lJFCD2yQwv9GZIT6evfCCKr50Baar9FzyTJJm4MXQRntw64A0VmcWx+DH3PTit6mLFvI5aULDrw+XyLYiYuAntHnQImwTnAS2HNnkrPpeAAQRBN14bpeh6xuU9lw/b67bMyhSsHLJTzDSD7gu9FegSw5/BOLc6YOJJAT6G2Z6DQ16/PbwYq6fa0fzaEwMUgCm5s0Uuflde36K9D6I01Ci+S7f9meGkw2u4oVhjrIpv+7RGMeTaLevVj2pQkl3ZICp3erOcjdj8zKliIxBVymZSYGmKtqdxJQwL352Om0ARl+gEWbikmjSE+dx+4UpyLqlpCqTxNJcdtWoKg==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by SY3PPF8E5E02F08.ausprd01.prod.outlook.com (2603:10c6:18::422) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:15:01 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:15:01 +0000
From: Stephen Horvath <s.horvath@outlook.com.au>
To: Jean Delvare <jdelvare@suse.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Kamil Aronowski
	<kamil.aronowski@3mdeb.com>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: [PATCH v2 2/6] decode-dimms: Decode DDR5 Manufacturer Data
Thread-Topic: [PATCH v2 2/6] decode-dimms: Decode DDR5 Manufacturer Data
Thread-Index: AQHcTsMnNQg4tx4fM0WDC/QnP1aWCQ==
Date: Thu, 6 Nov 2025 02:14:59 +0000
Message-ID: <20251106021356.208986-3-s.horvath@outlook.com.au>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|SY3PPF8E5E02F08:EE_
x-ms-office365-filtering-correlation-id: 4e9e637b-f445-4a9c-7f76-08de1cda4aa6
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8062599012|8060799015|15080799012|461199028|31061999003|38102599003|40105399003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DAwLD/P0beQhMIuYTYlAKRww1cTOWuZSa8Etu6BXqMq4Ld1sbN5MhfFdwv?=
 =?iso-8859-1?Q?gX9WA3Mhr8Rv2y+hIXhk1hz8O/wZtu7zJLj5aDszI4GVjDM4sXZBN0XuHD?=
 =?iso-8859-1?Q?HBN+E/WF1+vcvqZo+hrHQgNhN2fpmGiJ9sVHnKJTrCLbIEU902VlK6VaOf?=
 =?iso-8859-1?Q?XWbWErTuGuH65kFFHSY4VeWG37YlghCqvKXcyIZ4622Ih5JSlW9ZJtWZ3D?=
 =?iso-8859-1?Q?yx8mR7WVT169bggA9WwvsjGegk+M48HCzVd5uDB826oeFjgbLz8k2ggrmt?=
 =?iso-8859-1?Q?qe+VQuzuMcIx+UR5P1PC87nvk2yfJJ8tTPC86o5pAwClRC7zkJqwFROWpH?=
 =?iso-8859-1?Q?8tbPICKzOwoxu3FK2Mu6ot0HZueAMe+JaE8RMQuPsU+a/aQ0d1bg8alhaB?=
 =?iso-8859-1?Q?V0hYcJBDUAOPNhVnPlLB+ZW371hke+6fqhdnuwTJ0lmhNhOdpASiXYl4HK?=
 =?iso-8859-1?Q?tUvOU7YcJKNZud+RnkUbJRTpwicIBM0lkMV99OwOk6eKed5ZtiZr/exnsx?=
 =?iso-8859-1?Q?CmYu46mnYCnHyrUuTdjxyrmRPZgZ6hvLEGGdy02TxZkploEwbkvrscBfzS?=
 =?iso-8859-1?Q?zloX10iSzXCjJFxJdlvsRiaGRWspuQGVelpFQuE1gyvKKLzdaBj4SfmKL8?=
 =?iso-8859-1?Q?8uUE80tvEOYRlC/l1JU12Cq50A6dXQDpo858qAxTTHHYC6tjizOWxVgD0U?=
 =?iso-8859-1?Q?O9W9n/UR31aTsWEqcO6/TbqA4T1/rLp6QeiHNwI0hXNWjMYOrl5z1LXvau?=
 =?iso-8859-1?Q?YCEYTOqZACiK3uX6J2P6AxdqoCl0ERB6ZNjnCicvSHNACbaAR8yekxEf7z?=
 =?iso-8859-1?Q?X2836bHgd/Ncm6vvOmxclQRj0D0Vcw6+cM7LxJK7mC5K+BwJXWbosN9WlD?=
 =?iso-8859-1?Q?hoOHVSg635JKQU7UTZOOXGM3H9T4cRAVcsLEeYmD4vsDGswUszC8DvWcu3?=
 =?iso-8859-1?Q?CcPvZAss+1XuGCwxI0sYdpR8ki1RpbwQXlq/GuX5MyWGviTMWf264H9qIY?=
 =?iso-8859-1?Q?eENMAcwYAq2fcbxC6WVxqGYcvcs3H60sQo7qP/RMphrvxcwXxw/BZ0NeAQ?=
 =?iso-8859-1?Q?aTxVQQlPXKIyF5dhLj+sHcq6zvoB6Ez9cUPEE47U8Eiuppsk1T5LPiSOCu?=
 =?iso-8859-1?Q?xTmbL0siuTpHRG3T3GJg4vadCyU3RMRadumo/jcCC6xXHUR1dMko71ZhOe?=
 =?iso-8859-1?Q?ALYLVzg07P97NIyg8SYuYBFqaAQuL1PpNja1hXWG8elwjDoZZM78xQIUa6?=
 =?iso-8859-1?Q?IL7GwADSNeHN7LA8vstA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z3ciIlistprPrEc8h5NE6jDnX6dEPgfy1fl07monvLVZJhoXrbF9VPdwPK?=
 =?iso-8859-1?Q?l7qwyp2SPrytvfxFmSR4Cv7bR7YtYigBMLdUpUewm3rPYwu9sDMq8Iv028?=
 =?iso-8859-1?Q?JC3Bm8b7/qN6feWsWQRBa3gDbsKIyA+YjAIOmYSVq95LEBx1UCP2KSMkp2?=
 =?iso-8859-1?Q?hlrQK2qy+A950lrXwRt4D5dhgaEkU6L3eyaogYrLGTvy+UqaDt+Hp21cTP?=
 =?iso-8859-1?Q?Ii/5Nrjggu4cRSXNu2mAwHhue5Gv2Vl0qTk22Yx19uSrp72rnSPv71iEUK?=
 =?iso-8859-1?Q?HoMuXh3AH2IWhYHkYDNuCdyPzFxPDsS3zAoqeJvZ5GKs2tlLXLGOINf4yE?=
 =?iso-8859-1?Q?230rQqd8yve5/DCAu2XCFikzMkDOuk4bC5uStfJwofKynjgPG88UBQbA1O?=
 =?iso-8859-1?Q?6zfv7SmuDRKgLnlpog8ijYPGr9Xo4kBLNWC0dqaQsV/1+xTkCbiUj/Rnqz?=
 =?iso-8859-1?Q?EDLQgD7X+ggPROTRcBIrGL2OjBpmWSlEv5u0agwapXRQVsFl3sriYNvPOf?=
 =?iso-8859-1?Q?vocb4wHClU7KIOX/jsnmVdHdcxi6J4DsFirPxgBa7vZ8zPwyMe1XKiYAgd?=
 =?iso-8859-1?Q?Sh48AiVmtDveT1kaoOecweH8MZ1cu6EDWmuoqfrjRw/7nM/qhks5fXqvMy?=
 =?iso-8859-1?Q?tRPVfIuhIR6F82NxKZNRW6VatrQOwyXvBGCreiSAO0ItbJsgmbnnqE9L+7?=
 =?iso-8859-1?Q?gkg5KN+i69IcJPDFfZAmYoect0GgWwHOC1lonfsJM0tv5Niql7RFvsvMHD?=
 =?iso-8859-1?Q?bfFaqjEQmDrmzQ/VqV7QUvG8TuYfk1wxQHt2eA09s8OEWAyQPuLUPNnPA3?=
 =?iso-8859-1?Q?LVQCuP0XZgjy0KjFjDzyEZUxjtuWvwdhuAsXuiDf0fIkjuDTKqfkpwIW4y?=
 =?iso-8859-1?Q?QA6+wTV8P4+JyjPk2sRZEgfbGMqXDsqsk/pnd5ctsTnamgjUtHyBIHa8GV?=
 =?iso-8859-1?Q?Taj/C49U4h53OfYADv+cZ9PDHefEOmMBX4HwwjxpxezBcO+jRHq9xWXXxQ?=
 =?iso-8859-1?Q?/bEzdVxHEAEJ7riJWu2mqihAWHcVQUzdVjucCQMukg3+CJ+ylazK2u0TzT?=
 =?iso-8859-1?Q?/Lo7vUlXuEWz7Ledm8QFrrTtoQojvEqeNADnvgSMCTyn9WuXD3bLD/jCiR?=
 =?iso-8859-1?Q?wfFU8BReSXWDY//kxUy6YorfxFHqTzG8TrHByVhQO8DqPG1lDBEAHzLacU?=
 =?iso-8859-1?Q?jSfciTiXKINGbieOh2+vH3+SZNe2jY1Nd+Ii+nMvaToJSnDm1dijDC2KRS?=
 =?iso-8859-1?Q?3VCaf4Ily080T8sApR+GY6f5euTuB97EtdwIOE63M=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9e637b-f445-4a9c-7f76-08de1cda4aa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:14:59.5876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF8E5E02F08

Decode the DRAM's manufacturer data for DDR5.=0A=
There are more manufacturers in the common and type specific sections,=0A=
but only the 'Manufacturing Information' section of the eeprom has been=0A=
implemented.=0A=
=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
 eeprom/decode-dimms | 51 +++++++++++++++++++++++++++++++++++++++++++++=0A=
 1 file changed, 51 insertions(+)=0A=
=0A=
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms=0A=
index baf85e0..9979259 100755=0A=
--- a/eeprom/decode-dimms=0A=
+++ b/eeprom/decode-dimms=0A=
@@ -2278,6 +2278,48 @@ sub decode_ddr4_mfg_data($)=0A=
 		    sprintf("0x%02X", $bytes->[349]));=0A=
 }=0A=
 =0A=
+# Parameter: EEPROM bytes 0-639 (using 512-554)=0A=
+sub decode_ddr5_mfg_data($)=0A=
+{=0A=
+	my $bytes =3D shift;=0A=
+=0A=
+	prints("Manufacturer Data");=0A=
+=0A=
+	printl("Module Manufacturer",=0A=
+	       manufacturer_ddr3($bytes->[512], $bytes->[513]));=0A=
+=0A=
+	printl_cond(spd_written(@{$bytes}[552..553]),=0A=
+		    "DRAM Manufacturer",=0A=
+		    manufacturer_ddr3($bytes->[552], $bytes->[553]));=0A=
+=0A=
+	printl_mfg_location_code($bytes->[514]);=0A=
+=0A=
+	printl_cond(spd_written(@{$bytes}[515..516]),=0A=
+		    "Manufacturing Date",=0A=
+		    manufacture_date($bytes->[515], $bytes->[516]));=0A=
+=0A=
+	printl_mfg_assembly_serial(@{$bytes}[517..520]);=0A=
+=0A=
+	printl("Part Number", part_number(@{$bytes}[521..550]));=0A=
+=0A=
+	printl_cond(spd_written(@{$bytes}[551]),=0A=
+		    "Revision Code",=0A=
+		    sprintf("0x%02X", $bytes->[551]));=0A=
+=0A=
+	if ($bytes->[554] !=3D 0xff) {=0A=
+		# DRAM Stepping may be a number or an uppercase ASCII letter=0A=
+		# 0x00-0xfe is valid, 0xff is invalid=0A=
+		my $stepping =3D $bytes->[554];=0A=
+		if ($stepping < 0x41 || $stepping > 0x5a) {=0A=
+			printl("DRAM Stepping",=0A=
+			       sprintf("0x%02X", $stepping));=0A=
+		} else {=0A=
+			printl("DRAM Stepping",=0A=
+			       sprintf("%c", $stepping));=0A=
+		}=0A=
+	}=0A=
+}=0A=
+=0A=
 # Parameter: EEPROM bytes 0-127 (using 64-98)=0A=
 sub decode_manufacturing_information($)=0A=
 {=0A=
@@ -2831,6 +2873,15 @@ for $current (0 .. $#dimm) {=0A=
 		} elsif (!$use_hexdump && $dimm[$current]->{driver} ne "ee1004") {=0A=
 			print STDERR "HINT: You should be using the ee1004 driver instead of th=
e $dimm[$current]->{driver} driver\n";=0A=
 		}=0A=
+	} elsif ($type eq "DDR5 SDRAM" ||=0A=
+		 $type eq "LPDDR5 SDRAM" ||=0A=
+		 $type eq "DDR5 NVDIMM-P" ||=0A=
+		 $type eq "LPDDR5X SDRAM") {=0A=
+		if (@bytes >=3D 640) {=0A=
+			# Decode DDR5-specific manufacturing data in bytes=0A=
+			# 512-639=0A=
+			decode_ddr5_mfg_data(\@bytes);=0A=
+		}=0A=
 	} else {=0A=
 		# Decode next 35 bytes (64-98, common to most=0A=
 		# memory types)=0A=
-- =0A=
2.51.0=0A=
=0A=

