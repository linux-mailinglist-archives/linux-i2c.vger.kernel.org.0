Return-Path: <linux-i2c+bounces-13980-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB137C38D68
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 03:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 949FC4EC5F1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 02:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E231B1CAA6C;
	Thu,  6 Nov 2025 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="JwJmPWsB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011031.outbound.protection.outlook.com [52.103.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884F23ED5E
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762395315; cv=fail; b=mKVGfIUHSYPvpxxdLJ/ltv2+KQgiAEaUhUK0sh1xNYT+tC4tjN58c+YHHxo3HCreMUon2Fk1y6K9vM4spZeA8qlcqH1iFxHOMWFaElqfrvxzeYnv05oz3zGh6yW6b6B1ehPfjWJtUM0/nBMTmYWFi/LS+FaGiNjhGJ3GIXFqcJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762395315; c=relaxed/simple;
	bh=+3a0qVw1liebazoFUkxyksxq2inL6pP5BSInzr37N0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cn2EJ0rSafjWH4YxK2DLD0RLZcLwgKBzPAcWmE4ORbakaecjhaRezEzHReIO4ke6Ot6Z5MmTQFMTpwXsbcnareQp5BVsVXqs8H1yXh30Kwsf+mvYUn1VhUFWA+VUKrYVSNy7gxSnakulmWKi8NEOZ9xFPi/OFeZOPkPyPqMcb+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=JwJmPWsB; arc=fail smtp.client-ip=52.103.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY/1tFtj0eOmmNEtXd9+HNskcuox3gQ2WF0PrE9LLvisFnvODnqSxwSFOyUbZJjPrY3TY3Pkw9s4awvEh2U8r5y9FnMOpMUqJZsGL7jYi2cVMUqRIs3yUmmtzyVVQr9JMus4Ar1gNtzjKZh6MBZAI3lVvBASz99hSbsD82EzvEsH40a7KuZmxHJRPHJfZXH3Oc5rkZNPd0hjVkVTszC34v14jDigGFT8Iu4nkXMCgQz1DjOIXAQN4xiZIMz/0HY59Xyw2fy/lqC367BuGS2hPZMfcMwC8+s5maw1m05SUL6JG7XVDy6TEDtRZxIrmJcE+R2cy/rGDi4lDQc0yqllfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+vAQn93BtQ2pgIa0SglsANYAlYSvXHdkWja2bIclr4=;
 b=HfZSaRao+I0kLYNT3IUnQk/gpKy/zY9yr/mto8+TDKKP9PxeVVm1JdnnnZG1veMPtmNsovtuSdXMXezcwMqoUsrieo8i1PvZNcYVyTb89/vd54ho8Mw23CNBMBN/0iYGQLaTcX3nx/AtbMk3rorpcJi1jjNDlwvQHCHm5doaIrkD9iicpadV4hnnlZc1vINi1+saIv2j+gOdN6A0d02V0L4RfmGwZ0xrBCkarRhLkonW2CGT3Y3UtNV6LdGzLSIZbEmMcxgcnXmk9jm8TyV9FBHC24p0r5r38hsy6Q2MFV4Iq35zkyJXbbJqjW+7GjJ3UrXM8lDY71FyR2soT5VmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+vAQn93BtQ2pgIa0SglsANYAlYSvXHdkWja2bIclr4=;
 b=JwJmPWsBKwfWcg6CyD8RO8bt+dmU4Rb/HgAYU3K6T7Hcg8J29iwDwktnqcD1ZViFklx9ytdQwYloG9JfejHM3G4L+c741ulBvDSWIO7+UZ1mbEdaVetCzBmcOh2HeH4xjC4fkiMVJJrJm8OEQ96lSMB/1LArn+SmqapLNhgZmO6q5Z2N+mXiQ9UpqG5qm9WFzWfTzIFzbJpBb4W40GVVN3KnweOc2eDCiXGy9G5XmKtT91mEBeNEF5h+ghJnYIQXt86jbIFr3nWU2VWfXb2MXivuXlgsZS/e2jQWgsn+b12kHaj+W4mcs8mpOaFje+QFrjRkgJ0SlBGx9mwRJHEaNA==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by SY3PPF8E5E02F08.ausprd01.prod.outlook.com (2603:10c6:18::422) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
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
Subject: [PATCH v2 3/6] decode-dimms: Decode timings and other data for DDR5
Thread-Topic: [PATCH v2 3/6] decode-dimms: Decode timings and other data for
 DDR5
Thread-Index: AQHcTsMnYuonGoWS806eRuNE3LcfqA==
Date: Thu, 6 Nov 2025 02:15:00 +0000
Message-ID: <20251106021356.208986-4-s.horvath@outlook.com.au>
References: <20251106021356.208986-1-s.horvath@outlook.com.au>
In-Reply-To: <20251106021356.208986-1-s.horvath@outlook.com.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB4586:EE_|SY3PPF8E5E02F08:EE_
x-ms-office365-filtering-correlation-id: 81439d24-e1f7-4bfa-9d73-08de1cda4b03
x-microsoft-antispam:
 BCL:0;ARA:14566002|12121999013|41001999006|19110799012|8062599012|8060799015|15080799012|461199028|31061999003|38102599003|40105399003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WsT28XlUNpBJwTuW/N+gRqqfpJsPJU8+K25yNU8WHMzk1V/e8eTwHtxVEj?=
 =?iso-8859-1?Q?1cl8sDrgOKMuDJ97UvIhwkp1Ts5rzNpOXACOg8YIvR4y7p+nmX7W+zes16?=
 =?iso-8859-1?Q?OjLd6U8XU38SUGiem4pPOTiWHua73x5rMMfUwUyQnWwcFbZfPOc+DWVV3B?=
 =?iso-8859-1?Q?SBsd6PCGYym9IazeSYUkNL8+rPMn9Fbg4Z79cyeqNVnRxwhRtW0iZKk1dw?=
 =?iso-8859-1?Q?AeGRk09z7TYKNmDBljqQ2OAEoGNZsQOSu3uFHX+70tMwmlgbvOI5BfhyVq?=
 =?iso-8859-1?Q?bwGB4C0gypMV7sdW/XJJCBNnksrvBqWGdNRaNsKhcOLfoQ+QMDUwUT8Wo1?=
 =?iso-8859-1?Q?EmXEgUfuUHIHFiyy+t4BuUot6zXSsyQ9mcQDUcPz7CqeHG7XLQaoqf6y0N?=
 =?iso-8859-1?Q?ie+vks1X69G+cX+MEyDvmrUs3eJmxVoHdl+D24s6HGsLNv5NVzlesvHtXC?=
 =?iso-8859-1?Q?50OKn6r6QpTX844p+tK0gWcfNkPJLgZNP1Q5xbdxOZ8izy/WxI8ULHrRE5?=
 =?iso-8859-1?Q?xCeattlkqrQQRNg0ha0h1MYkd2pI7aFBqJ58k9b2eQtF8cK6mbC+7sP51U?=
 =?iso-8859-1?Q?HlhzocwvNQnI+QvmI152BDoE3qtFxc3nKrlTtlL9IRyjNNsJUvsYyvS7e5?=
 =?iso-8859-1?Q?V1smDIj5PSaqfx+EWqKdyOmk2d+oVrXJTb//8nodiPn1pUAblxEMi/FQ3C?=
 =?iso-8859-1?Q?fjT9vVEafMXFZ09PmutBCoI265O+Qhxht2FneeZqCVVrEhFKEI6K3QI9NO?=
 =?iso-8859-1?Q?yOzke0N/OJUYpP9lGPN031mrVi+WHWWTk3QHsDjHPU+1QfTEOk4Np9182z?=
 =?iso-8859-1?Q?aT6FoQJFxkmlouPbrboUq0pwBPYgQeZ7ZIcK1iTIJ5ffM+X7Z28kED0l4G?=
 =?iso-8859-1?Q?fBoHrLBJ0vyAOyh4zAeOA5DJ8C26xSlflpCA/FUaQg7ie0VLu+s8DJXX6k?=
 =?iso-8859-1?Q?+PsHduE1ygSEActHpRH/9cN1mtlcRTadHJhBUx4UOjrdbKXnWS0OHa0pH/?=
 =?iso-8859-1?Q?sijo6saihVAe4iGty8PTUT6uHtnu/joE4Gr/UxHLMpcykvr3Rx+5q3h3ed?=
 =?iso-8859-1?Q?C8YaUGQ7wPBeGYguF2RwQhLT+iGnAEgmM40oF2+N+kdPEFdem6abJbtWHB?=
 =?iso-8859-1?Q?Q5NkKvgtlran4ytfgigBhGVzeo9mineibxVdcbZ7ULhyPnQqrt4xxf6M5U?=
 =?iso-8859-1?Q?cnqhVU2rk/TzKsa9VdQ3g4b2zmq8m/C5ZmpT18EzHCi7Aymc4BqqIjPi+V?=
 =?iso-8859-1?Q?O8NdDJnReqCwE7+i9CAy/L6mN3J7K5eamHQolXiaazfqgLZuEyLF+FjYpJ?=
 =?iso-8859-1?Q?Nr4tT0CnwFeZ9pVIHaP3PqCw1g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0xMUdGBrDwB4TIc1IBEjQe2RuWCMCMyXlnC79SSfJqR/LG8P8WjZj3Bv2o?=
 =?iso-8859-1?Q?lKM3QzuzRh2nGh+K7flwzmi9nlh8/q52w0U3G+chuDa0yKg7Uo29vmBHwS?=
 =?iso-8859-1?Q?2LI32cZZFBNQo3cDwZ90y6ECKER14ssTGheKRyyD75Okjyw/RFMmqAOt2B?=
 =?iso-8859-1?Q?Ua9/fjtuEOrEi9mybRxKOmxng2CHqjhAMgzNkQtzVyYbBGLGXnk1p6ogGH?=
 =?iso-8859-1?Q?dW2HqIU3daIW/tsB4gagrxxkgt/Xe/oQFU6QWMUJmRMk2/83vKnjOAxwmd?=
 =?iso-8859-1?Q?g+GjQRf0BeKlyj3xgfQvTL067wvFxxQfJBpcTlXRGCWKX4mukxqFnhB8No?=
 =?iso-8859-1?Q?lSSnmKTUik2MfzYayzo0+LKbF78KirqTM0/UgQhq4nwp0oj42uRfHII00B?=
 =?iso-8859-1?Q?XPqzjFG4Q5Ja3iHPEP6nJTITXhR8sW+c2xhf0WIGepc/JjVNUeLjl9/gFd?=
 =?iso-8859-1?Q?bpBEL8YA5OQox3kfNLYEh8Je5u0mVmOvH6CtNg0KkGcVSioeqCy1RQCrog?=
 =?iso-8859-1?Q?M/OYnq7wbkATAAB69sUYylOEm4LfFYHgzXKOuy7Gs6fiKN/IueUMl3emni?=
 =?iso-8859-1?Q?H3qWwT65cVFsLIqBcAoAMXpaFbf5mt13ZkeZUcmJQ7+8W8h0jovHVCat+i?=
 =?iso-8859-1?Q?bD3bDBrKXNhWJasOWQfC3x1pGaL6Iqh25nYSCsp844bPiH3VpEI7LUnAa5?=
 =?iso-8859-1?Q?6p8IUa3c1RKWJONPvD2taquweUaBPF3SZd38r14jKF28qdLeHyf2BRtOSp?=
 =?iso-8859-1?Q?pUqH8eA6RcjneUOVVJirEsKrAPm9smVEuB79Ls8wcA6tm1o5UFfzY3Opl2?=
 =?iso-8859-1?Q?giQgpUd2VJQ+DRkTbJV81B6iNswaW3S1QgI9UgMZSK3PweeygBvgAVXlf1?=
 =?iso-8859-1?Q?Pz4j/J82gjhEduHLE6L+rVgSbG//MMIZYqOf7CYkO7mCP3ZsemiLjzOArG?=
 =?iso-8859-1?Q?Dw+ttZ5VlgWYNWVmGjiQlQOrJhyaeRYN+lNKsf7svIDMM75m1NL00Oki+s?=
 =?iso-8859-1?Q?enyILeqYTRx6RPthTTKRG27o4RSvs3/IBFIDvhyPSz2HavKPtAp1zvVSrY?=
 =?iso-8859-1?Q?HiwXmWWpzpzNdDDeJzLd6sjt/s5C3mYa7f4ZzG6iEtBjwS4XTUN28/ZCxP?=
 =?iso-8859-1?Q?tDLdnvVVT3u/ME1fBAIgmsb6sEOyq4v9c63+cPFiRjRJeZG0u0Q4WrA1vk?=
 =?iso-8859-1?Q?Y4jrVkGPsDgkeLlb1Es/dHlqH96BjoT/dUduVt+l7uQFSjL6G+QSxfpBgU?=
 =?iso-8859-1?Q?PHwj7nUQRMEfFPbOIYrshLYUCbkdDcJoRlEBHtV4U=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81439d24-e1f7-4bfa-9d73-08de1cda4b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:15:00.1791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF8E5E02F08

Decode size, timings, and other data for DDR5. The values in my BIOS do=0A=
seem to match up with those here, so I think this is correct.=0A=
=0A=
There are also more timings that I'd like to add in the future.=0A=
=0A=
Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>=0A=
---=0A=
 eeprom/decode-dimms | 230 ++++++++++++++++++++++++++++++++++++++++++++=0A=
 1 file changed, 230 insertions(+)=0A=
=0A=
diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms=0A=
index 9979259..a5fba1e 100755=0A=
--- a/eeprom/decode-dimms=0A=
+++ b/eeprom/decode-dimms=0A=
@@ -2127,6 +2127,231 @@ sub decode_ddr4_sdram($)=0A=
 	}=0A=
 }=0A=
 =0A=
+# DDR5 Rounding Algorithm=0A=
+sub ddr5_round($$)=0A=
+{=0A=
+	my ($tck, $twr) =3D @_;=0A=
+	my $correction =3D 3;  # 0.30% per the rounding algorithm=0A=
+	my $new_twr =3D $twr * (1000 - $correction);=0A=
+	$tck =3D ($new_twr / $tck) + 1000;=0A=
+=0A=
+	return $twr / int($tck / 1000);=0A=
+}=0A=
+=0A=
+# Return combined time in ns=0A=
+sub ddr5_ns($$)=0A=
+{=0A=
+	my ($bytes, $index) =3D @_;=0A=
+=0A=
+	return (($bytes->[$index + 1] << 8) | $bytes->[$index]) / 1000;=0A=
+}=0A=
+=0A=
+# Parameter: EEPROM bytes 0-639 (using 1-255)=0A=
+sub decode_ddr5_sdram($)=0A=
+{=0A=
+	my $bytes =3D shift;=0A=
+	my ($ctime, $ctime_max);=0A=
+	my $ii;=0A=
+=0A=
+	my @module_types =3D (=0A=
+		{ type =3D> "Reserved (0x00)",	},=0A=
+		{ type =3D> "RDIMM",		},=0A=
+		{ type =3D> "UDIMM",		},=0A=
+		{ type =3D> "SODIMM",		},=0A=
+		{ type =3D> "LRDIMM",		},=0A=
+		{ type =3D> "CUDIMM",		},=0A=
+		{ type =3D> "CSOUDIMM",		},=0A=
+		{ type =3D> "MRDIMM",		},=0A=
+		{ type =3D> "CAMM2",		},=0A=
+		{ type =3D> "Reserved (0x09)",	},=0A=
+		{ type =3D> "DDIMM",		},=0A=
+		{ type =3D> "Solder down",	},=0A=
+		{ type =3D> "Reserved (0x0C)",	},=0A=
+		{ type =3D> "Reserved (0x0D)",	},=0A=
+		{ type =3D> "Reserved (0x0E)",	},=0A=
+		{ type =3D> "Reserved (0x0F)",	},=0A=
+	);=0A=
+=0A=
+# SPD revision=0A=
+	printl("SPD Revision", ($bytes->[1] >> 4) . "." . ($bytes->[1] & 0xf));=
=0A=
+=0A=
+	my $raw_type =3D $bytes->[3];=0A=
+	my $type =3D $raw_type & 0x0f;=0A=
+	printl("Module Type", $module_types[$type]->{type});=0A=
+=0A=
+# time bases=0A=
+	if (($bytes->[19] & 0x03) !=3D 0x00 || ($bytes->[19] & 0xc0) !=3D 0x00) {=
=0A=
+		print STDERR "Unknown time base values, can't decode\n";=0A=
+		return;=0A=
+	}=0A=
+=0A=
+	my $twr =3D ddr5_ns($bytes, 40);=0A=
+=0A=
+# speed=0A=
+	prints("Memory Characteristics");=0A=
+=0A=
+	$ctime =3D ddr5_ns($bytes, 20);=0A=
+	$ctime =3D ddr5_round($ctime, $twr);=0A=
+	$ctime_max =3D ddr5_ns($bytes, 22);=0A=
+	$ctime_max =3D ddr5_round($ctime_max, $twr);=0A=
+=0A=
+	my $ddrclk =3D 2 * (1000 / $ctime);=0A=
+	my $tbits =3D 8 << ($bytes->[235] & 7);=0A=
+	my $pcclk =3D int ($ddrclk * $tbits / 8);=0A=
+	# Round down to comply with Jedec=0A=
+	$pcclk =3D $pcclk - ($pcclk % 100);=0A=
+	$ddrclk =3D int ($ddrclk);=0A=
+	printl("Maximum module speed", "$ddrclk MT/s (PC5-${pcclk})");=0A=
+=0A=
+# Size computation=0A=
+	my $rank_mix =3D $bytes->[234] & 0x40;=0A=
+	my $sdram_width0 =3D 4 << (($bytes->[6] >> 5) & 0x07);=0A=
+	my $sdram_width1 =3D 4 << (($bytes->[10] >> 5) & 0x07);=0A=
+	my $bus_width =3D 8 << ($bytes->[235] & 0x07);=0A=
+	my $ranks =3D (($bytes->[234] >> 3) & 0x07) + 1;=0A=
+	my $subchannels =3D 1 << (($bytes->[235] >> 5) & 0x07);=0A=
+=0A=
+	my $die_count0 =3D (($bytes->[4] >> 5) & 0x07) + 1;=0A=
+	my $die_3ds0 =3D $die_count0 > 2;=0A=
+	if ($die_3ds0) { $die_count0 >>=3D 1; }=0A=
+=0A=
+	my $die_count1 =3D (($bytes->[8] >> 5) & 0x07) + 1;=0A=
+	my $die_3ds1 =3D $die_count1 > 2;=0A=
+	if ($die_3ds1) { $die_count1 >>=3D 1; }=0A=
+=0A=
+	my $die_count =3D $die_count0 + $die_count1;=0A=
+	my $density0 =3D ($bytes->[4] & 0x1f) * 4;=0A=
+	my $density1 =3D ($bytes->[8] & 0x1f) * 4;=0A=
+=0A=
+	my $cap0 =3D $subchannels * ($bus_width / $sdram_width0) * $die_count0 * =
($density0 / 8) * $ranks;=0A=
+	my $cap1 =3D $subchannels * ($bus_width / $sdram_width1) * $die_count1 * =
($density1 / 8) * $ranks;=0A=
+	my $cap =3D $cap0 + $cap1;=0A=
+=0A=
+	printl("Size", $cap . " GB");=0A=
+=0A=
+	printl("Banks x Rows x Columns x Bits" . ($rank_mix ? " (Even Rank)" : ""=
),=0A=
+	       join(' x ', (1 << (($bytes->[7] >> 5) & 0x07)) * (1 << ($bytes->[7=
] & 0x07)),=0A=
+			   (( $bytes->[5]       & 0x1f) + 16),=0A=
+			   ((($bytes->[5] >> 5) & 0x05) + 10),=0A=
+			   (8 << ($bytes->[235] & 0x07))));=0A=
+=0A=
+	printl_cond($rank_mix, "Banks x Rows x Columns x Bits (Odd Rank)",=0A=
+		    join(' x ', (1 << (($bytes->[11] >> 5) & 0x07)) * (1 << ($bytes->[11=
] & 0x07)),=0A=
+			        (( $bytes->[9]       & 0x1f) + 16),=0A=
+			        ((($bytes->[9] >> 5) & 0x05) + 10),=0A=
+			        (8 << ($bytes->[235] & 0x07))));=0A=
+=0A=
+	printl("SDRAM Device Width" . ($rank_mix ? " (Even Rank)" : ""), "$sdram_=
width0 bits");=0A=
+	printl_cond($rank_mix, "SDRAM Device Width (Odd Rank)", "$sdram_width1 bi=
ts");=0A=
+=0A=
+	printl("Ranks", $ranks);=0A=
+	printl_cond($ranks > 1, "Rank Mix",=0A=
+		    $rank_mix ? "Asymmetrical" : "Symmetrical");=0A=
+	printl("Primary Bus Width", (8 << ($bytes->[235] & 7))." bits");=0A=
+	printl_cond($bytes->[235] & 0x18, "Bus Width Extension", (($bytes->[235] =
& 0x18) >> 1) ." bits");=0A=
+=0A=
+	my $taa;=0A=
+	my $trcd;=0A=
+	my $trp;=0A=
+	my $tras;=0A=
+=0A=
+	$taa  =3D ddr5_ns($bytes, 30);=0A=
+	$trcd =3D ddr5_ns($bytes, 32);=0A=
+	$trp  =3D ddr5_ns($bytes, 34);=0A=
+	$tras =3D ddr5_ns($bytes, 36);=0A=
+=0A=
+	printl("AA-RCD-RP-RAS (cycles)",=0A=
+	       ddr4_core_timings(ceil(($taa * 997 / $ctime + 1000) / 1000),=0A=
+				 $ctime, $trcd, $trp, $tras));=0A=
+=0A=
+# latencies=0A=
+	my %cas;=0A=
+	my $cas_sup =3D ($bytes->[28] << 32) + ($bytes->[27] << 24) +=0A=
+		      ($bytes->[26] << 16) + ($bytes->[25] << 8) + $bytes->[24];=0A=
+	my $base_cas =3D 20;=0A=
+=0A=
+	for ($ii =3D 0; $ii < 40; $ii++) {=0A=
+		if ($cas_sup & (1 << $ii)) {=0A=
+			$cas{$base_cas + ($ii * 2)}++;=0A=
+		}=0A=
+	}=0A=
+	printl("Supported CAS Latencies", cas_latencies(keys %cas));=0A=
+=0A=
+# standard DDR5 speeds=0A=
+	prints("Timings at Standard Speeds");=0A=
+	foreach my $ctime_at_speed (5/22, 5/21, 5/20, 5/19, 5/18, 5/17, 5/16,=0A=
+				    5/15, 5/14, 5/13, 5/12, 5/11, 5/10, 5/9, 5/8) {=0A=
+		my $best_cas =3D 0;=0A=
+=0A=
+=0A=
+		# Find min CAS latency at this speed=0A=
+		for ($ii =3D 39; $ii >=3D 0; $ii--) {=0A=
+			next unless ($cas_sup & (1 << $ii));=0A=
+			if (ceil(($taa * 997 / $ctime_at_speed + 1000) / 1000) <=3D $base_cas +=
 ($ii * 2)) {=0A=
+				$best_cas =3D $base_cas + ($ii * 2);=0A=
+			}=0A=
+		}=0A=
+=0A=
+		printl_cond($best_cas && $ctime_at_speed >=3D $ctime=0A=
+				      && $ctime_at_speed <=3D $ctime_max,=0A=
+			    "AA-RCD-RP-RAS (cycles)" . as_ddr(5, $ctime_at_speed),=0A=
+			    ddr4_core_timings($best_cas, $ctime_at_speed,=0A=
+					     $trcd, $trp, $tras));=0A=
+	}=0A=
+=0A=
+# more timing information=0A=
+	prints("Timing Parameters");=0A=
+=0A=
+	printl("Minimum Cycle Time (tCKmin)", tns3($ctime));=0A=
+	printl("Maximum Cycle Time (tCKmax)", tns3($ctime_max));=0A=
+	printl("Minimum CAS Latency Time (tAA)", tns3($taa));=0A=
+	printl("Minimum RAS to CAS Delay (tRCD)", tns3($trcd));=0A=
+	printl("Minimum Row Precharge Delay (tRP)", tns3($trp));=0A=
+	printl("Minimum Active to Precharge Delay (tRAS)", tns3($tras));=0A=
+	printl("Minimum Active to Auto-Refresh Delay (tRC)", tns3(ddr5_ns($bytes,=
 38)));=0A=
+	printl("Minimum Recovery Delay (tRFC1)", tns3(ddr5_ns($bytes, 42)));=0A=
+	printl("Minimum Recovery Delay (tRFC2)", tns3(ddr5_ns($bytes, 44)));=0A=
+	printl("Minimum Recovery Delay (tRFCsb)", tns3(ddr5_ns($bytes, 46)));=0A=
+	printl("Minimum Four Activate Window Delay (tFAW)", tns3(ddr5_ns($bytes, =
82)) . " (" . $bytes->[84] . " cycles)");=0A=
+	printl("Minimum Row Active to Row Active Delay (tRRD_L)", tns3(ddr5_ns($b=
ytes, 70)) . " (" . $bytes->[72] . " cycles)");=0A=
+	printl("Minimum CAS to CAS Delay (tCCD_L)", tns3(ddr5_ns($bytes, 73)) . "=
 (" . $bytes->[75] . " cycles)");=0A=
+	printl("Minimum Write Recovery Time (tWR)", tns3(ddr5_ns($bytes, 40)));=
=0A=
+	printl("Minimum Write to Read Time (tWTR_S)", tns3(ddr5_ns($bytes, 88)) .=
 " (" . $bytes->[90] . " cycles)");=0A=
+	printl("Minimum Write to Read Time (tWTR_L)", tns3(ddr5_ns($bytes, 85)) .=
 " (" . $bytes->[87] . " cycles)");=0A=
+=0A=
+# miscellaneous stuff=0A=
+	prints("Other Information");=0A=
+=0A=
+	my $package_type0 =3D $die_3ds0 ? "3DS" :=0A=
+			    $die_count0 > 1 ? "Dual-die package" :=0A=
+			    $die_count0 =3D=3D 1 ? "Monolithic" : "Unknown";=0A=
+	$package_type0 .=3D sprintf(" (%u dies)", $die_count0) if $die_count0 >=
=3D 2;=0A=
+	printl("Package Type" . ($rank_mix ? " (Even Rank)" : ""), $package_type0=
);=0A=
+=0A=
+	my $package_type1 =3D $die_3ds1 ? "3DS" :=0A=
+			    $die_count1 > 1 ? "Dual-die package" :=0A=
+			    $die_count1 =3D=3D 1 ? "Monolithic" : "Unknown";=0A=
+	$package_type1 .=3D sprintf(" (%u dies)", $die_count1) if $die_count1 >=
=3D 2;=0A=
+	printl_cond($rank_mix, "Package Type (Odd Rank)", $package_type1);=0A=
+=0A=
+	my $ppr =3D $bytes->[12] >> 7;=0A=
+	printl("Post Package Repair",=0A=
+	       $ppr =3D=3D 0x00 ? "One row per bank group" :=0A=
+	       $ppr =3D=3D 0x01 ? "One row per bank" : "Unknown");=0A=
+	printl("Soft PPR Undo/Lock", $bytes->[12] & 0x20 ?=0A=
+	       "Supported" : "Not Supported");=0A=
+	printl("MBIST PPR", $bytes->[12] & 0x02 ?=0A=
+	       "Supported" : "Not Supported");=0A=
+=0A=
+	printl("Module Nominal Voltage",=0A=
+	       ($bytes->[16] & 0xf0) =3D=3D 0x00 ? "1.1 V" :=0A=
+	       ($bytes->[16] & 0x0c) =3D=3D 0x00 ? "Unknown (1.1 V operable)" :=
=0A=
+	       ($bytes->[16] & 0x03) =3D=3D 0x00 ? "Unknown (1.1 V endurant)" : "=
Unknown");=0A=
+=0A=
+	printl("Thermal Sensor",=0A=
+	       $bytes->[14] & 0x08 ? "Supported" : "No");=0A=
+}=0A=
+=0A=
 # Parameter: EEPROM bytes 0-127 (using 4-5)=0A=
 sub decode_direct_rambus($)=0A=
 {=0A=
@@ -2177,6 +2402,10 @@ sub decode_rambus($)=0A=
 	"DDR4E SDRAM"	=3D> \&decode_ddr4_sdram,=0A=
 	"LPDDR4 SDRAM"	=3D> \&decode_ddr4_sdram,=0A=
 	"LPDDR4X SDRAM"	=3D> \&decode_ddr4_sdram,=0A=
+	"DDR5 SDRAM"	=3D> \&decode_ddr5_sdram,=0A=
+	"LPDDR5 SDRAM"	=3D> \&decode_ddr5_sdram,=0A=
+	"DDR5 NVDIMM-P"	=3D> \&decode_ddr5_sdram,=0A=
+	"LPDDR5X SDRAM"	=3D> \&decode_ddr5_sdram,=0A=
 	"Direct Rambus"	=3D> \&decode_direct_rambus,=0A=
 	"Rambus"	=3D> \&decode_rambus,=0A=
 );=0A=
@@ -2844,6 +3073,7 @@ for $current (0 .. $#dimm) {=0A=
 			"DDR4E SDRAM", "LPDDR3 SDRAM",	# 14, 15=0A=
 			"LPDDR4 SDRAM", "LPDDR4X SDRAM", # 16, 17=0A=
 			"DDR5 SDRAM", "LPDDR5 SDRAM",	# 18, 19=0A=
+			"DDR5 NVDIMM-P", "LPDDR5X SDRAM", # 20, 21=0A=
 		);=0A=
 		if ($bytes[2] < @type_list) {=0A=
 			$type =3D $type_list[$bytes[2]];=0A=
-- =0A=
2.51.0=0A=
=0A=

