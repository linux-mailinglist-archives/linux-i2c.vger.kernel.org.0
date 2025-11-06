Return-Path: <linux-i2c+bounces-13979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D6C38D65
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7D544E9D39
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C2D227B95;
	Thu,  6 Nov 2025 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="iHVSk2tz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010076.outbound.protection.outlook.com [52.103.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265B23D297
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395314; cv=fail; b=OFtEzslmi0dR6P7iRtNmfUfSimUcaG4DwfbnWR0dBzQvE7QltEaZBy0lahzWX9w/1KYa5eAYPEGEUPFNVeX0aDvGBwWWKXf7/MwGkWPH5NwOFJAyHIoZo04xTAyQ4ChJ6IVMHxxATott4IHijThvRIo0mne3agFuZ9vXjWC0Sxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395314; c=relaxed/simple;
	bh=aqntd7+XA4L5Dm0btB2hPn11oK5In5tqEoZTQVWZtSc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gc0aiwNB7OvOLR1dNF+sKEwrJ0+X4ERSqnOMLaOY7AFGJk0xduSsHMCd0THSfCtk3FvDg/iDlJcwO+S8gVAuRq83wOEYQEPGOxT3BAMAxped7Uua0aXqxaL1tLbBGTfAadIFlFP/MT2rcDFwubAAQqEcFhuS+tfizxngkKtKR6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=iHVSk2tz; arc=fail smtp.client-ip=52.103.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVuPqk2z0Qs5erm0BrHkb6Wi2bWgoV68hP/FXaUTn1vTMqe6zZvIHgf9OeTiPns5jYptQ47G0OHuv/ZWZX3TfGUFnzkqqVsSOCNhYfFOePJjdfW6Q8OgFlpo8PPYcIKzRZkKa5wrw/ojqdnW4F4L7lK/bKqE9SgaqwDVUD8+htByX7wLaU7RHisW1/wBooKXw/U3RngA3964chE/36JtNI5qD9BGsS1uJK57ht+jae6/LCK3Gomi1ZMDp0x8CTZK8KthbTUQdF0NUgw+HVi5ySYVmgXD1NJFGmUiQdeRxN4ZS2/lpJKNwT7mL4ptWeAdqYDXyoJRdirV3bm3PslAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hp0trP84O5I018xH7eqOpnO8Y6jxXFr385aol5Ww0yk=;
 b=AVsrjig3xMZjHHy9fO7xsXLRN+uBGn0V0h4AQ7jrriMAA0f2YbuaLsJZlFFOgAgKJkpWQ2BKMYcArUqEJtcYWdvMYgFdoqf0EHWccAaKWccVeUz04aV7SbJpqMLkfh2/soL18Cai6iC9gCxdsH71A0DZI/yrsBgSQwvCF5+vxN1SiqGuyfveImIDzdTvFShC6K0otAcFrdMLV2kToFDvsDmlnJ+bGwYYC2KVSJCfTZbdxklWTvwLpAgyNFEBd/1T1PopfrqHSYPMAyiV7wzz9GDWGabPpExzbex4/GxdFh1FrNRFyszpNkHIn28I7lX7KFl0d5X/TGPidvVtxcBRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hp0trP84O5I018xH7eqOpnO8Y6jxXFr385aol5Ww0yk=;
 b=iHVSk2tz4AC2weJSsYA3oCx2qoW3V/QIr8qetwZYRPL4z6hmSeehunDDJt1XoDKYtCbSMRmZf5amLbUvLVl6ZtlHPppxLmcBOIKZ8hIo/LErJUGOX2u/dgQi+723nmebHTinQH7/i0fyWPGucTjUO/kFzRKmb5s64Ck4TcewTZ0PAFSgm0LGipZcUYM+plkfA160GeTuXMyhzIM7gCDYWFfay6hLjdCr6KStQO3ttQYmqa84dO3YjeDwvWj8riQ2cQ5d6UTN9/KFyOr668J9yOWgyJeYWteDqkbGweCzvq8T1C1DsT8vvEJNZm6tgqqTpLZOWa4UTKLhjkar7To8vg==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by MEYPR01MB7181.ausprd01.prod.outlook.com (2603:10c6:220:144::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 02:15:04 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:15:03 +0000
From: Stephen Horvath <s.horvath@outlook.com.au>
To: Jean Delvare <jdelvare@suse.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Kamil Aronowski
	<kamil.aronowski@3mdeb.com>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: [PATCH v2 6/6] decode-dimms: Decode DDR5 error log
Thread-Topic: [PATCH v2 6/6] decode-dimms: Decode DDR5 error log
Thread-Index: AQHcTsMoqRcs1Ph9QEOQ3fEQqYZOTA==
Date: Thu, 6 Nov 2025 02:15:02 +0000
Message-ID: <20251106021356.208986-7-s.horvath@outlook.com.au>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|MEYPR01MB7181:EE_
x-ms-office365-filtering-correlation-id: c7885a53-3cd9-498a-5814-08de1cda4c2b
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|41001999006|19110799012|12121999013|15080799012|38102599003|461199028|31061999003|40105399003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NEzdtzBZ3vskxlE8rN7C+O+1icl+FYDtTWxD3KXPcp7DNRoWOUBZdPm7Kz?=
 =?iso-8859-1?Q?LsgNxB2DQ4v3fEiiWRPteEDYx8O5zXpszRSyWnt84gCn/Jt2b2EDcirAEo?=
 =?iso-8859-1?Q?SJkMKZX+W+e/sTCM/1xY1FQDCozx7SrFKUGSaY6Z59vBlHD1Id3GP2YLkJ?=
 =?iso-8859-1?Q?bsgTvyFooDoAYBmW+trMgcuvf7xl/5Rx5DluA9tiIV/vyaR5Kl1QP+9gS5?=
 =?iso-8859-1?Q?H9GrYEEB9/tG5rcJIZfiO0ORZaeeo4aB3+OqyvRm7DHp4efPl4Adr1Jn65?=
 =?iso-8859-1?Q?z5w6cZi8u3ZHsDpHKBZtjEf3VpnCTRhAccwKyd3iCLpFDdtya4mi0RLuoG?=
 =?iso-8859-1?Q?prpSThd0tlzW+G2vtjV/87/QBZuyOqbTjGN0oxg8/bKOY6zyPPQqHeV4DL?=
 =?iso-8859-1?Q?05gArlNtqLhNj17XNvfzm/isY43xEIZXD7j/DxvLXHz2DzXl76ry+fB4+i?=
 =?iso-8859-1?Q?A8epMDqPmNTSPPutBSEr4Stbdfl5ANbsd3wCsKAka4Jou7ERz10K+sQjah?=
 =?iso-8859-1?Q?4YsxCF1722QDJnCSWpH6exvPzQx5jGAPsZAex9oAL1q+aTFzrUcYxpHb2a?=
 =?iso-8859-1?Q?ex1kmeh/YIqYN7dy3lVePm1n3HiS84VMW2XE/G3qfxTRUfHTbJV+tGaOLg?=
 =?iso-8859-1?Q?wtQ8LtffyGKWZw2Aumk8AH/jdKdWWMnMqE1/Uy9N9L8FVcIrIY1biD6xuB?=
 =?iso-8859-1?Q?ZNYk3nOugRR75cfmmNSE+2xGK6AS1BAijAjVBdoh7PvmIzL0+rrJFh3tHu?=
 =?iso-8859-1?Q?Ds1o/DHFG2Yej9uly8zN4g3KG7Augcvk3c9/gCJDPb8foiu7osQmmYkH8I?=
 =?iso-8859-1?Q?UMZRGbGD1KTfNEshZRjcZZNI8E2xxz1PfpvA2r5u3fZPs9DuLo3Ui2YFbl?=
 =?iso-8859-1?Q?ORyuPBHiWK8JWysQURqBDU9R7mLq88eRBCAQv2KA3xsFSKiJvgPyH+leoK?=
 =?iso-8859-1?Q?pfLwFvUyNMGCi6yqmGPIhoGlZLOFVoWoPCrzRtXLp05r37YfPV8artZ61t?=
 =?iso-8859-1?Q?QQJYWiTRGVgZT2Uz/V7FaEeRF/MwzHY8JCGaB/vNvEs1njf0MFejKcIRZj?=
 =?iso-8859-1?Q?R4zFShBGAHjQgg/D1VdGL2H9PbBJxzp/5RFzG3OXFbta1WohnWu/Q9J0CQ?=
 =?iso-8859-1?Q?r9lKaCWLPNLZmSFk+40HrN8S+fAOOi2vJfz+7/jKqueP9uDCs9dVejuCF1?=
 =?iso-8859-1?Q?20A1M0N5xVOM9c3/Zx7i+UzrLhIhYV30FXsUU22iw/KexxBVrxB9JVYPDS?=
 =?iso-8859-1?Q?sYX3dPhyjocWZh5eK2ubJEbV3wnMv+JTJ5tGOTGVe1FVJBgQHJBKKaI4Af?=
 =?iso-8859-1?Q?lKlUTZOTyB1ol1PYBL/0IGdB9g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?STfSpONTdcRKhmk2CaF4hC26hgIkx2nfXAcS/xzE9cWKsuwPEJlFyWN5pZ?=
 =?iso-8859-1?Q?U9F1VG8rWh0aSV2arV4Ie7dndwu2lWCENfYPDsX8v2e2RGlPX+WXrcwvTa?=
 =?iso-8859-1?Q?pzoslmBe5CfYF7LwtDcwsVaf7GKRQCCoGDLBJ/PM1bpugUjUmsTZpk7NUj?=
 =?iso-8859-1?Q?NJfPxJkc12q6REk+c7XdRt2se+o051HkcAE+UEe0sCYmM7L4UIDgXTkTOj?=
 =?iso-8859-1?Q?+JZxDQpqsQJSlCCcmhGMyTZXofIAOHu9H86H9NzySa4uVTVNOAhONDRT47?=
 =?iso-8859-1?Q?jzdRatP/dGX05Kzc/ouxB/3/GzaqdoA4Y16MIBo9e7CAUReuZ5MNWMFbyH?=
 =?iso-8859-1?Q?1cJEU11ppuoijXasOFd9LPDkHBV/L9XbhBooej5C/R0hnZRrg5rhCv5rXJ?=
 =?iso-8859-1?Q?frICFl5PNRLNrOqvA2fUDKBUMQpDylWPB8xzgfmE4tskOithQIiUTThA1z?=
 =?iso-8859-1?Q?AVU5F4r3oOhBLOL9dewDp4B/8AB0krgCLuhrwBCTpwu1zlLa0G+931j1hM?=
 =?iso-8859-1?Q?5GqsvFGCpohuLLrEvxRRYmB77sbmTo3bH1C/JiNyeECrrCBJS/T16Cs7Yi?=
 =?iso-8859-1?Q?Hk2x4T1iGkfUpWVk7ZCQyomsyeurMmbVw3ByJQuFtHZL6bDyp2Ru+Qc1Hh?=
 =?iso-8859-1?Q?DXVI7qhlpFFqjRwX7Cnbkt3njMwZJgy8tscYotpjIgsnfa8LrHMBgTopGO?=
 =?iso-8859-1?Q?gUQ8SC2KGXFpgQvrkh8J108bdFTQPtbEY5REj09Iz+djzY9TNi6k7Wu0Tf?=
 =?iso-8859-1?Q?XPdZd/cSifJtv4kZoomWAov7EtaRP8cF9UAF1DWfaYvSt8VIvOoM99wXfk?=
 =?iso-8859-1?Q?42abTosUXm4RNpGeWeyoOV7eXz/yr1DHkq3zRDOxH8LAMN40qJ7OrQkS9w?=
 =?iso-8859-1?Q?er+GV1IeePNN5VJEQPNjPSWJIDe7XEXm244Y5F7GDAiGmTisQIflAbdJaZ?=
 =?iso-8859-1?Q?Gizy9E4WmiUHnUabjQQiYyFuNeacDtVQeTOkJZjzD+wQT3zDTnNO7z5ywp?=
 =?iso-8859-1?Q?OfazgHjtLslgkMdOAl6BTIY+GjsnSaEP3AfhqdBB/fcgO4bSR6OHazcw2U?=
 =?iso-8859-1?Q?iAez+y732iPWSIhEAGWPfbRRZWXvg/7mMOKOvv9UQgkyqxQ4NDaycberId?=
 =?iso-8859-1?Q?abXBmmDKtc1GphMLRFxk+yRsttlvfLfQMtwj+/tmdW35wooMM1ToBvBaMm?=
 =?iso-8859-1?Q?Ep6KjwYsOLcr/Cy5tJV5Hdi12cM+1e0Y5JtOpYyde+iBHBfGzFjSm9Z05n?=
 =?iso-8859-1?Q?ohfAiHQwuji8kh/whpUtnqTKqUgaL3FcbeqF+vqBk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c7885a53-3cd9-498a-5814-08de1cda4c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:15:02.4077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB7181

JESD400 specifies that an error log can be written to anywhere in the=0A=
end user programmable eeprom section, following a specific format. Code=0A=
to find and read this error log for DDR5 dimms has been added.=0A=
=0A=
This is also completely untested on actual hardware implementations,=0A=
only tested by reading some manually constructed files.=0A=
=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
 eeprom/decode-dimms | 105 ++++++++++++++++++++++++++++++++++++++++++++=0A=
 1 file changed, 105 insertions(+)=0A=
=0A=
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms=0A=
index 2ef2eb9..6bb1b2d 100755=0A=
--- a/eeprom/decode-dimms=0A=
+++ b/eeprom/decode-dimms=0A=
@@ -2656,6 +2656,108 @@ sub decode_ddr5_mfg_data($)=0A=
 	}=0A=
 }=0A=
 =0A=
+# Parameter: EEPROM bytes 0-1023 (using 640-1023)=0A=
+sub decode_ddr5_error_data($)=0A=
+{=0A=
+	my $bytes =3D shift;=0A=
+=0A=
+	# Zero or more error logs may appear anywhere in any End User Programmabl=
e blocks of the SPD,=0A=
+	# including over SPD Block boundaries. They may be found by searching for=
 a four byte anchor string.=0A=
+=0A=
+	my $errors =3D [];=0A=
+=0A=
+	my $size =3D scalar @{$bytes} < 1023 ? scalar @{$bytes} : 1023;=0A=
+=0A=
+	for (my $ii =3D 0; $ii < $size - 640 - 23; $ii++) {=0A=
+		if (join('', @{$bytes}[640 + $ii .. 640 + $ii + 3]) eq "95707695") {=0A=
+			push @{$errors}, [@{$bytes}[640 + $ii .. 640 + $ii + 23]];=0A=
+			$ii +=3D 23;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	if (@{$errors} =3D=3D 0) {=0A=
+		# No error logs found=0A=
+		return;=0A=
+	}=0A=
+=0A=
+	prints("Error Log");=0A=
+=0A=
+	printl("Error Log Count", scalar @{$errors});=0A=
+=0A=
+	for (my $ii =3D 0; $ii < scalar @{$errors}; $ii++) {=0A=
+		my $error =3D @{$errors}[$ii];=0A=
+=0A=
+		# error location=0A=
+		printl_cond($error->[4] & (1 << 0), "Error $ii Type", "DRAM Uncorrectabl=
e Error");=0A=
+		printl_cond($error->[4] & (1 << 1), "Error $ii Type", "DRAM Correctable =
Error");=0A=
+		printl_cond($error->[4] & (1 << 2), "Error $ii Type", "DRAM ECS Error");=
=0A=
+		printl_cond($error->[4] & (1 << 3), "Error $ii Type", "hPPR Was Required=
");=0A=
+		printl_cond($error->[4] & (1 << 4), "Error $ii Type", "hPPR Resource Err=
or");=0A=
+=0A=
+		printl("Error $ii Location CPU", ($error->[5] >> 3) & 0x07);=0A=
+		printl("Error $ii Location CPUMC", (($error->[5] & 3) << 2) | ($error->[=
6] >> 6));=0A=
+		printl("Error $ii Location DIMM", ($error->[6] >> 4) & 0x01);=0A=
+=0A=
+		# these are active low=0A=
+		printl_cond(~$error->[6] & (1 << 3), "Error $ii Location Rank", "0 (sub-=
channel A)");=0A=
+		printl_cond(~$error->[6] & (1 << 2), "Error $ii Location Rank", "1 (sub-=
channel A)");=0A=
+		printl_cond(~$error->[6] & (1 << 1), "Error $ii Location Rank", "0 (sub-=
channel B)");=0A=
+		printl_cond(~$error->[6] & (1 << 0), "Error $ii Location Rank", "1 (sub-=
channel B)");=0A=
+=0A=
+		printl("Error $ii Location Parity", ($error->[7] >> 6) & 0x01);=0A=
+		if (($error->[7] >> 5) & 1) {=0A=
+			# chip identifier?=0A=
+			printl("Error $ii Location Chip", ($error->[7] >> 2) & 0x07);=0A=
+		} else {=0A=
+			# row address?=0A=
+			printl("Error $ii Location Bank Group", (($error->[7] & 0x03) << 1) | (=
($error->[8] & 0x80) >> 7));=0A=
+			printl("Error $ii Location Bank Address", ($error->[8] >> 5) & 0x03);=
=0A=
+			printl("Error $ii Location Row Address", (($error->[8] & 0x1f) << 12) |=
 ($error->[9] << 4) | ($error->[10] >> 4));=0A=
+			printl("Error $ii Location Column Address", (($error->[10] & 0x0f) << 7=
) | (($error->[11] & 0xf0) >> 1));=0A=
+		}=0A=
+=0A=
+		# also active low=0A=
+		printl_cond(~$error->[11] & (1 << 0), "Error $ii Location Device", "DQS6=
A");=0A=
+		printl_cond(~$error->[11] & (1 << 1), "Error $ii Location Device", "DQS7=
A");=0A=
+		printl_cond(~$error->[11] & (1 << 2), "Error $ii Location Device", "DQS8=
A");=0A=
+		printl_cond(~$error->[11] & (1 << 3), "Error $ii Location Device", "DQS9=
A");=0A=
+=0A=
+		printl_cond(~$error->[12] & (1 << 0), "Error $ii Location Device", "DQS8=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 1), "Error $ii Location Device", "DQS9=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 2), "Error $ii Location Device", "DQS0=
A");=0A=
+		printl_cond(~$error->[12] & (1 << 3), "Error $ii Location Device", "DQS1=
A");=0A=
+		printl_cond(~$error->[12] & (1 << 4), "Error $ii Location Device", "DQS2=
A");=0A=
+		printl_cond(~$error->[12] & (1 << 5), "Error $ii Location Device", "DQS3=
A");=0A=
+		printl_cond(~$error->[12] & (1 << 6), "Error $ii Location Device", "DQS4=
A");=0A=
+		printl_cond(~$error->[12] & (1 << 7), "Error $ii Location Device", "DQS5=
A");=0A=
+=0A=
+		printl_cond(~$error->[12] & (1 << 0), "Error $ii Location Device", "DQS0=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 1), "Error $ii Location Device", "DQS1=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 2), "Error $ii Location Device", "DQS2=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 3), "Error $ii Location Device", "DQS3=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 4), "Error $ii Location Device", "DQS4=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 5), "Error $ii Location Device", "DQS5=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 6), "Error $ii Location Device", "DQS6=
B");=0A=
+		printl_cond(~$error->[12] & (1 << 7), "Error $ii Location Device", "DQS7=
B");=0A=
+=0A=
+		# timestamp=0A=
+		my $year =3D ($error->[14] >> 2) + 2020;=0A=
+		my $month =3D (($error->[14] & 0x03) << 2) | ($error->[15] >> 6);=0A=
+		my $day =3D ($error->[15] & 0x3e) >> 1;=0A=
+		my $hour =3D (($error->[15] & 0x01) << 4) | ($error->[16] >> 4);=0A=
+		my $minute =3D (($error->[16] & 0x0f) << 2) | ($error->[17] >> 6);=0A=
+		my $second =3D $error->[17] & 0x3f;=0A=
+		printl("Error $ii Timestamp", sprintf("%04d-%02d-%02d %02d:%02d:%02d",=
=0A=
+						      $year, $month, $day, $hour, $minute, $second));=0A=
+=0A=
+		# DRAM refresh settings=0A=
+		# TODO=0A=
+=0A=
+		# measured temperature=0A=
+		# TODO=0A=
+	}=0A=
+}=0A=
+=0A=
 # Parameter: EEPROM bytes 0-127 (using 64-98)=0A=
 sub decode_manufacturing_information($)=0A=
 {=0A=
@@ -3218,6 +3320,9 @@ for $current (0 .. $#dimm) {=0A=
 			# Decode DDR5-specific manufacturing data in bytes=0A=
 			# 512-639=0A=
 			decode_ddr5_mfg_data(\@bytes);=0A=
+			# Decode DDR5-specific error log=0A=
+			# 640-1023 (max)=0A=
+			decode_ddr5_error_data(\@bytes);=0A=
 		}=0A=
 	} else {=0A=
 		# Decode next 35 bytes (64-98, common to most=0A=
-- =0A=
2.51.0=0A=
=0A=

