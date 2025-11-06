Return-Path: <linux-i2c+bounces-13977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E952C38D5F
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0ABDF4E5796
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E0023EABD;
	Thu,  6 Nov 2025 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="GK0iWwyg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011031.outbound.protection.outlook.com [52.103.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FED1EB9FA
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395311; cv=fail; b=g6uM1ExkmQYcz5qegq769XXJK68lFzmGnO5UVToHghO3JPwLfwUU93iHNKzrAsInbfeD1qAcRzraEfusc3+WfoC4aLvegvWao4AaImZpcnyJIYIECE3Kkj1bAxqvhwf3stM4qDmu++yd8x9I1aJwFsfG+UY4ywWVWkEO8OwUh1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395311; c=relaxed/simple;
	bh=E9OUsDw7NnFU1WKvTrHiwyk9WGpEcnsbazfJfwjo6Hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kTTZn/XTNKq38ntIjmRBRu0RKlelJSM6Hsxq4uNUeF5VIjSV5URtRPrdOfvXBd4FowyR8kDylpAo9oCH/1Npd1lnZruDBsvt7RPTG/MqOA0U+6uOxMeiGDk6fjhxNaj2L0uu82MTGG3Oyg8UTSRAEkgCWhGcnJpevsC2TC12kSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=GK0iWwyg; arc=fail smtp.client-ip=52.103.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwDOZr2fHjg9g1gxOceUxKch9xrV7MSczdP0+3S/kb4RY0TEZiBYeWrQrbQZgJ87nzwPrxOqRNuXlbhsUpoHnLXNDM6ZW0YevZwUD+SmHPgdQlbmsp+ovK9YUF0d2D0FsExtzj9Ud3MsgDYhuAxrMYvgo3HPN8E2r1EkedwV0wREfWEnj4sTMrUOWJnY8kH9bnZudcOhJyxu0UX0v1SPaCrrc/wkhfnRIdGvxDbBDMx/HhlxBBHts7xWMMWHpqLN3OYpDBzXd1miqH1g5Y8wCoHRGt/8WwdIc5K7sNDioGBhnzLpnB8PyTiv1rLVf9vgFMh8j/qn4HZFgphTEWSEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c05INI5ZmjB8e+32gZ/re6C/Ws4f7/KuEn+zEL2qzxM=;
 b=g23oS9uLNbrToOqf7XXcRfC58U2P6DQWIeT8MLhDZweehsDY/Su8Pvq+E8WOO2PeyjAZ2xXop51lm6FyK9te1Tvev/pM9Vjk3WdbT4LV/MjgkogbA50SUNYYgsyfhD7Jm0Q5qWsfJ49BHqp/q/2JtmgC0F+0yPjmr4+aQR+4Elrm2Ioo6M/hwENSuNUz+TYCgxPVqgJBaAlgNlV0SLQz34oXNKzYgWXHuiUN1kMO1LXcJ9AtCzUY+ploPxgDbvltmYEUMSJvgBlefno/htp5Atp4b2s3qT3Y0pykPzTFjGNq41yg89Klgayxt+fT9vj/m4Rwg+F7Avwa2NLXdCeJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c05INI5ZmjB8e+32gZ/re6C/Ws4f7/KuEn+zEL2qzxM=;
 b=GK0iWwyg8PMsOYmlMQLdjsVF+BEHmAFTBhD0O7oEP6ZlIyq7M/mwEe4SMUhMTNfKoFYaU8dGpHeyQmRt0UeZuEv0twgxmNWdmPyjw1zZSkoi0SPwovl6v+Gnv7cemRtBBjw9M+yr+lAkwo1ZcFBMAqpzotzrRR9NzLfIws+Ayu9QIF9a7p79xN9h1iz7Sj4Kl2Ls6ltdARAHL+VXLudzJrK4WLcAuB2Td2Dsg+s5XRTouqtyJhRnKI/rBEcOaQcWASyhB7yt1gxV6U0WS2wJ2grmg+Yu5JIRIP74ULEZPuaOezvRYdsre8OLw/Htkw00iDp8VAl8tBeMYO6dwiORDg==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by SY3PPF8E5E02F08.ausprd01.prod.outlook.com (2603:10c6:18::422) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 02:14:59 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::630e:e55b:4105:c99b%7]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 02:14:59 +0000
From: Stephen Horvath <s.horvath@outlook.com.au>
To: Jean Delvare <jdelvare@suse.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Kamil Aronowski
	<kamil.aronowski@3mdeb.com>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: [PATCH v2 1/6] decode-dimms: Implement DDR5 checksum parsing
Thread-Topic: [PATCH v2 1/6] decode-dimms: Implement DDR5 checksum parsing
Thread-Index: AQHcTsMm8IChfmp+EkeRUUoG2V6A7g==
Date: Thu, 6 Nov 2025 02:14:58 +0000
Message-ID: <20251106021356.208986-2-s.horvath@outlook.com.au>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|SY3PPF8E5E02F08:EE_
x-ms-office365-filtering-correlation-id: d883961c-76c7-4510-954d-08de1cda4963
x-microsoft-antispam:
 BCL:0;ARA:14566002|12121999013|41001999006|19110799012|8062599012|8060799015|15080799012|461199028|31061999003|38102599003|1602099012|40105399003|3412199025|4302099013|440099028|10035399007|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?I9BRmdYZhOnbwFlX7g6Gfkfj9limTb8ZmzHtJM/l5yKM2iBua4HAbsHuJ4?=
 =?iso-8859-1?Q?wit9rJHapuaaevwf/pycZK1WUWU00B0h9mLi7zGI7sz8sNDNNea1tzWHjx?=
 =?iso-8859-1?Q?1ItR7PYWUbmF3zUQNM5yIqyQBrSLkbQRpAfccwhGsVas9Un63gcEbfNdl0?=
 =?iso-8859-1?Q?8Q7DhL2zRWB3sKfESwLWSrVJ9VS5nqelomdTpVQJwboNLiAlufEv6iNiuL?=
 =?iso-8859-1?Q?kjFJ8xz/Iy69ZLcjqxE5IEVdMdfMAhglWqA6JZ8JGOzvnbls9iBza5lRtP?=
 =?iso-8859-1?Q?zJAjWRdOJdVjeaUfAeDecuQxS1ODf3yvalrt8iizqCL+AhjMFrpAiwe29c?=
 =?iso-8859-1?Q?zKJIy6pWP38P/3wL4HinEqC7KMulq53tKuHv0kQ615Na7V5cWvxeCAt9Ns?=
 =?iso-8859-1?Q?09UNH2hr0/IeNDRwsksckDqZL3NjfCNPrJojWCiV/p6XzKzwcChajEi+cj?=
 =?iso-8859-1?Q?HdHEwFQaG+oOdbXSSDZ11RAiKeWq1w4JQlNbimTUutujImWGNQCvvmLWb+?=
 =?iso-8859-1?Q?II1hKhYkMG6UqF9mscEAswA9uNKjBChHre0qygohNAKVPzzFBC7vqEFW3r?=
 =?iso-8859-1?Q?Z/T1pwCpQDIV04UnNc/vqweuvymfVU3xfl3pQlWhI3B9wXK0+lprag8njG?=
 =?iso-8859-1?Q?cwoBy7SxaQWIoMyvCFAg3xU5RjRCwmMadqGyW5yP1jI0aTyg0r9NyigenF?=
 =?iso-8859-1?Q?irm6aS9lufDu2n9jPaCzzTQ5s/CBBrXyh046xmmKnPvVxey/goCistZSbs?=
 =?iso-8859-1?Q?fbpz3z//IVwlYi7Gkc5u0DENMhdQd0IlneOHf55NwqHJBRYVSNj+BJpQI9?=
 =?iso-8859-1?Q?KxOTWC1WyrOHNTOxgL7voqMvE7vA98dMP1zi/t25nrzNTDLbto5t2pMPnj?=
 =?iso-8859-1?Q?Z/gTySdg6OSfZs/6L/EIsBDXGmQD6kXmdeRLfb1qohLiViIZWEbf+uk1xR?=
 =?iso-8859-1?Q?aaOvHVYZ+THkqJKwSKhgtnY/NKUj6WLkygmMxnQ1pG59INlepdM01GrUga?=
 =?iso-8859-1?Q?tXiVRbpZpqDegcCRH7pEUiz2EU5jMxqRh26A9wwiYdlWYFGKJB6/ldXklP?=
 =?iso-8859-1?Q?IwNSP5oEpBVnq6R5Mb0N9qI0EZ2Myrt8pJVBdbwgBUTOW+yhr4KwBkk0Pt?=
 =?iso-8859-1?Q?sdAR9wKLML72oi/1Y+di8SjzyS9Pc6oA4QCA3haD0OIXc/sYy3jqGS9WSk?=
 =?iso-8859-1?Q?VsyPrm9B/T+gyesSp23gLiuv1n8GJmu2V+SDjtqeUGI6is5ZfMp9rIfQHs?=
 =?iso-8859-1?Q?s1c8Q3AAbyhjjfcYCUqCFpKJMjHr9SPSjbU2/mCN9CnFtoZmbgoXaxaCJK?=
 =?iso-8859-1?Q?5zeCLgacezi1p60681AM8XSS00fxm87+MfIR+udu/iI4VSphqbYOvokMwg?=
 =?iso-8859-1?Q?hWT889CFDfQ2yGWHsMl+1v8O0M9V689Md3yG4jQGsYNxMqr75XmcUI27Y0?=
 =?iso-8859-1?Q?oUR6PETI56mfrqExg0feAwpGTgo2LFt2mubPpw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6BITGMrYrYd4Cb2Vu1RM5tyilR8kg0wD0AZBn6Jp4blStY8ATvMII2d52W?=
 =?iso-8859-1?Q?3VOUqHAPb75XjMuAMzf8CQqpBcFC9O+ZufT+xLjigh4Jo6Y9MyYm+/C+Ub?=
 =?iso-8859-1?Q?QYx9PXkQKcHpglrJAV5/BJC586NOvQKbr1YZbVZf0xHLt5OE6VLqszzdi+?=
 =?iso-8859-1?Q?jM09dUqKCOE7XrzIw+Ka5jKtdquznOYIKSby6xvn/lHUslpcFNeG0lVeiW?=
 =?iso-8859-1?Q?0pLpfICD7pxgqrt/C53ew4EcaGFYZJ4FC6T1kXMrYfc3LZtWAtd0SjMEp3?=
 =?iso-8859-1?Q?0rCDx0a08IxF5OG7HPss26lkP+7cozZ+WZbyqfBC+4vlDclIvXxhQsLAG9?=
 =?iso-8859-1?Q?NkmoomAPVEry4Pe3Gn7i3xJHoWhRInMqd1y/k1BtR4ZGSqkC9JN0oG1pWN?=
 =?iso-8859-1?Q?x8kAE7Lvx1BzHmgISWKI4gTnBvwGsrVbu8fJuyxgOLyGiOIjhfGHYldIQ6?=
 =?iso-8859-1?Q?hkq01JDsgw+X0w4Vqv0l++fjV7No/0Knhr9IbhBrQGFRaW+ZeUsDckC4NX?=
 =?iso-8859-1?Q?FgQhTQc/3HEs22xaHCoRVu04+GvnTGQcvUtcdRxNYdcgSxmUs+UW/zgA0x?=
 =?iso-8859-1?Q?GHOqmyeIoat6SDhB/Mu6biJMVwmvjFvLf5HmOG0hy1VDe2z3eqZCi9NReZ?=
 =?iso-8859-1?Q?DDAJszHpRdzXzYpq7weLJD2srfxBdHgyVBwUGzAQvuZNM1qogYAkXFXGsS?=
 =?iso-8859-1?Q?F26YDcF3aodN7UiZ4Jt+X1aRieT0w9GjupOadGYBHpTLEHI9Nli9wiva+0?=
 =?iso-8859-1?Q?VlwgrW1DZtuicARer3Qt2nPekLb61ZeEJrOu2v++E6Af16/fV3qzpCeOzC?=
 =?iso-8859-1?Q?oDigdP/ZvWYUIfxSs6zbFEOqmewSVqHHBaql5797ZtGLFm9T1XbWTP9vn9?=
 =?iso-8859-1?Q?1ArhchfOoVjuD1cYNHev8lA8Hg6sNbi5KEn6OEOHGazugL7qcfFW5udBEc?=
 =?iso-8859-1?Q?7aAtjvMR863DQe8z45ffGF1Af19jhbTc7ZUu3DAOMqvYlbjhI0MFuyujMS?=
 =?iso-8859-1?Q?MkmJ4Vvy6ngAlGQl7FP2nvRvI/AVrfI8j540BkyCt36Cr74JWgZbp0sg0P?=
 =?iso-8859-1?Q?MoefLZRCLANLMQnJLe8COrnC8ry77JH6Z4Cvcy2yUAOWlzVy8XYbAk3/N5?=
 =?iso-8859-1?Q?0x6DMsSKx/o0nrhvXCS+OdUeL8KEJoy1uwy6bjlZuyvP3m1UBSONuxfXoV?=
 =?iso-8859-1?Q?hbvFkCzg1Yzuotm6ZW1qOSTh4YyoGH8BMw913PVoEBN6Yc5yirI72gr0pL?=
 =?iso-8859-1?Q?oANyC2GUupZyn+OFlpwJ9XO9ndRlNF08F4VtjXMtw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d883961c-76c7-4510-954d-08de1cda4963
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:14:58.7200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF8E5E02F08

The CRC for the DDR5 SPD is located at bytes 510-511 of the SPD data.=0A=
There is now functionality to read upto byte 512 and calculate the CRC16=0A=
if byte 2 indicates DDR5 memory and byte 0 indicates at least 512 bytes.=0A=
=0A=
This patch is based off of a patch by Guenter Roeck, linked below.=0A=
=0A=
Link: https://lore.kernel.org/linux-hwmon/efb77b37-30e5-48a8-b4af-eb9995a28=
82b@roeck-us.net/=0A=
Cc: Guenter Roeck <linux@roeck-us.net>=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
 eeprom/decode-dimms | 27 +++++++++++++++++++++++----=0A=
 1 file changed, 23 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms=0A=
index 32e840a..baf85e0 100755=0A=
--- a/eeprom/decode-dimms=0A=
+++ b/eeprom/decode-dimms=0A=
@@ -2402,7 +2402,12 @@ sub spd_sizes($)=0A=
 	my $bytes =3D shift;=0A=
 	my $type =3D $bytes->[2];=0A=
 =0A=
-	if ($type =3D=3D 12 || $type =3D=3D 14 || $type =3D=3D 16 || $type =3D=3D=
 17) {=0A=
+	if ($type =3D=3D 18 || $type =3D=3D 19 || $type =3D=3D 20 || $type =3D=3D=
 21) {=0A=
+		# DDR5=0A=
+		my $spd_len =3D 256 * ((($bytes->[0] >> 4) & 7) + 1);=0A=
+		my $used =3D $spd_len;=0A=
+		return ($spd_len, $used);=0A=
+	} elsif ($type =3D=3D 12 || $type =3D=3D 14 || $type =3D=3D 16 || $type =
=3D=3D 17) {=0A=
 		# DDR4=0A=
 		my $spd_len =3D 256 * (($bytes->[0] >> 4) & 7);=0A=
 		my $used =3D 128 * ($bytes->[0] & 15);=0A=
@@ -2511,10 +2516,16 @@ sub calculate_crc($$$)=0A=
 sub check_crc($)=0A=
 {=0A=
 	my $bytes =3D shift;=0A=
+	my $is_ddr5 =3D ($bytes->[0] & 0x70) =3D=3D 0x30;=0A=
 	my $crc_cover =3D $bytes->[0] & 0x80 ? 116 : 125;=0A=
+	my $crc_start =3D 126;=0A=
+	if ($is_ddr5) {=0A=
+	    $crc_cover =3D 509;=0A=
+	    $crc_start =3D 510;=0A=
+	}=0A=
 	my $crc =3D calculate_crc($bytes, 0, $crc_cover + 1);=0A=
 =0A=
-	my $dimm_crc =3D ($bytes->[127] << 8) | $bytes->[126];=0A=
+	my $dimm_crc =3D ($bytes->[$crc_start + 1] << 8) | $bytes->[$crc_start];=
=0A=
 	return ("EEPROM CRC of bytes 0-$crc_cover",=0A=
 		($dimm_crc =3D=3D $crc) ? 1 : 0,=0A=
 		sprintf("0x%04X", $dimm_crc),=0A=
@@ -2617,7 +2628,8 @@ sub get_dimm_list=0A=
 	if ($use_sysfs) {=0A=
 		@drivers =3D ('eeprom',=0A=
 			    'at24',=0A=
-			    'ee1004');	# DDR4=0A=
+			    'ee1004',	# DDR4=0A=
+			    'spd5118');	# DDR5=0A=
 	} else {=0A=
 		@drivers =3D ('eeprom');=0A=
 		$dir =3D '/proc/sys/dev/sensors';=0A=
@@ -2642,7 +2654,8 @@ sub get_dimm_list=0A=
 				next unless defined $attr &&=0A=
 					    ($attr eq "eeprom" ||=0A=
 					     $attr eq "spd" ||=0A=
-					     $attr eq "ee1004");	# DDR4=0A=
+					     $attr eq "ee1004" ||	# DDR4=0A=
+					     $attr eq "spd5118");	# DDR5=0A=
 			} else {=0A=
 				next unless $file =3D~ /^eeprom-/;=0A=
 			}=0A=
@@ -2684,6 +2697,12 @@ for my $i (0 .. $#dimm) {=0A=
 		 $dimm[$i]->{chk_spd}, $dimm[$i]->{chk_calc}) =3D=0A=
 			checksum(\@bytes);=0A=
 	} else {=0A=
+=0A=
+		# Check for DDR5 protocol type 18, 19, 20, 21 and size >=3D 512=0A=
+		if ($bytes[2] >=3D 18 && $bytes[2] <=3D 21 && ($bytes[0] & 0x70) >=3D 0x=
30) {=0A=
+			# DDR5's checksum is at 510-511=0A=
+			push(@bytes, readspd(@bytes, 512, $dimm[$i]->{file}));=0A=
+		}=0A=
 		($dimm[$i]->{chk_label}, $dimm[$i]->{chk_valid},=0A=
 		 $dimm[$i]->{chk_spd}, $dimm[$i]->{chk_calc}) =3D=0A=
 			check_crc(\@bytes);=0A=
-- =0A=
2.51.0=0A=
=0A=

