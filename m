Return-Path: <linux-i2c+bounces-13409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FEBC3799
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 08:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26715400FC4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 06:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D342E8E0B;
	Wed,  8 Oct 2025 06:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="pigCNPWw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011028.outbound.protection.outlook.com [52.103.39.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A231F3B9E
	for <linux-i2c@vger.kernel.org>; Wed,  8 Oct 2025 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904886; cv=fail; b=KzI4zSLe/jca+meKX0tgTjEyxVdvk2iludxX9G+GQfsDRwkptpYwHLg6NgtgjKCVm697h/ZyUF4FzawmCL8V/xlAg5t+xH2jzRNZdb2L77FpWx3Bn01FQlMOHf6UmJSPti/tG1HRDQyGgjh0ZURge2GMzFmy53am8pnQR/Nej4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904886; c=relaxed/simple;
	bh=HFb/ZXX8ncDZJNw6Gbh6TzKvwSclB+JRHUOppZz6sz0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=B2N3U5Al6fx5oDZs7Dq+PZzo0C39FcXPMiWwhB5XuFrYqg25FOyRyHWME9ptNvpu5TaspMNE21pebENlYpxNo44oyuMjwAkairgHW9cNoEj0g8H7iPcjnQkyGx/z1EJPVZVHmR6z/m9IiYOCxBU5q0nar7N+sVSX1lnMQXwGvRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=pigCNPWw; arc=fail smtp.client-ip=52.103.39.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE/WFjC2wNbLqJGWsQFFix8iP5TmAO/TcvnQPYr8c7Rnzwr5hNIoa9bR6oznPImVbF0tT3aYL3/NS08bjB88g8FFPG+7UmAYIUfgmDEofOsWWWE0YjigTGxChLJYktTBA3WdU9XLalWPhj9zwa8bzw4zi5IDI1ziFos59dfzed2wC+jKI2mnRWjhpzWur0TuKzHFUHq/3wulabK3OeH4/hh37Hp1NeEQNWhjne2UdXXeRYoD6yxLig+FjmYSKBRH1S818sEh5aeYKqQaU8Af6NXCZRVwjIaCdwADkGU1xL+WXxKE5cXXiLMsCzzDzXhpcCb1EQayv0H2sE9kL+dgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frZroHGaBycFjIVED7xAWDadDmkLRkW7/OHd4Ugh880=;
 b=fRNSG2c0rYiMA8D49hxxmMS2nK/XGCXmD4p3wI9L8GoeHB+ayKlmUYJAWflJV2S+IpSjheVDv4+w6a3PQHBR9wouy2l10iJWzMRE1jLfDkUKAYEFwx9ieMwqCp6S415BRWo/4f9sS8NJDvpT6gNc4JOCFROx20PD81nutCjHQfCG2xYZJz95scbF84IvRzMCz2oGgN+BAc0O5ow4A8S1BDDGBwHwU7Q7FhHOvj5V5unvpni1BCe7mhCkDNfIGW7VN7M0ihj79wkQQYqE0NYsLYuk3YmSZ4/F3poAfFon8kHppagS9F8AbAic3WvTgpx3ACSa1wJ78NLyoXOwKBxEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frZroHGaBycFjIVED7xAWDadDmkLRkW7/OHd4Ugh880=;
 b=pigCNPWwePMD8LbTTSP8sZBqOBJwEcriTy3MHJv3bxLD2Q3g3rE8q844Mv1dSC1NFuOUjdPBJVGySa6o2Fgk4RDR3yiACx3Mwzf7wy6sP/EGf4LFCJp9NrvYL0w3//c5rfUQ0LTdYFBHvx+gQM+1Jzo6h/1Bw+4Pvy7V6wR4FqgQUwa7cAAKQXPNKlS3LSITiEmVNaM9nr4OHLBIZN4JepfcKk7Qqr3pU6mVksmbyGvNX6Zg5813tIww+M/CFaiTiop9vpbZpaHGIRBOdbn3OgDbycfx8/U47umR5EAlkRa9EWYkKVvrrlEqXQ0BMaTXXrXGNK65RVlpulcU6mrR6Q==
Received: from VI1PR02MB4429.eurprd02.prod.outlook.com (2603:10a6:803:b2::14)
 by PR3PR02MB6121.eurprd02.prod.outlook.com (2603:10a6:102:66::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Wed, 8 Oct
 2025 06:28:01 +0000
Received: from VI1PR02MB4429.eurprd02.prod.outlook.com
 ([fe80::fcf4:21c7:f28e:cfb2]) by VI1PR02MB4429.eurprd02.prod.outlook.com
 ([fe80::fcf4:21c7:f28e:cfb2%5]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 06:28:01 +0000
From: Michael Graichen <michael.graichen@hotmail.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: "giorgio.nicole@arcor.de" <giorgio.nicole@arcor.de>
Subject: [Bug] i801 kernel NULL pointer dereference
Thread-Topic: [Bug] i801 kernel NULL pointer dereference
Thread-Index: AQHcOBcwm+/BepPXbU2w+5R5JpJSkw==
Date: Wed, 8 Oct 2025 06:28:01 +0000
Message-ID:
 <VI1PR02MB4429C04E3E4E5312C47DAB99ABE1A@VI1PR02MB4429.eurprd02.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR02MB4429:EE_|PR3PR02MB6121:EE_
x-ms-office365-filtering-correlation-id: 7ee0e5f6-5ebf-4ac3-7bb6-08de0633d4dd
x-ms-exchange-slblob-mailprops:
 WaIXnCbdHrNsJbj7NxvUrpSYkT7K1zyUo667ZgAhdsYEZvWuX7Xqu+aAWylufLCwaTYA0h1ABc2/nB9oqnNOzIkT+F3Wu88+UvZCtJ+Gx4QNoxfuW2Ueyofndk/udbaEK2OtwGxgtQKEMSSZk+AQZkk/A/oqtTAUNHS8lLj6XvDlZNPiVEocNKay5Vi8aGkvcpswBWCMUfGowFcchUyz+ioBEB2T95uvOLootHyTqWB9dyqMl0oc6hbVM26vPOvwkjMxFT0SdKFUt4cwLcgShDg5VOG3ZxlJwAKAiCvVG4MZNu3A/c/Vjv61N7cI0dmQiF1GFACvCbUmTCgEh82rzSQdNs/tnJt2TF4emEUiKJaCSNgM3jnYscuGDHzTiOpazLplOtiBiIbFhgfLR+P4LsFm6CNObgh9Xx2dujtgaLQ2hClVjlTiH7ezRnMbYmxd747sZCjOFs39MlNgYRiAZ3lTrmTRsabeHo7QYT6Ep4PpFPwCfU9l9TDVjzsGl4/ZMa+zMa2TQ14izaj39XMbDX8Kf5IKsSSPXtNzsqClBEzm5P1ZVYktQXN45N7qhOEpFH5plveS4Rw6XH0VbNTSkr46kGUJ48ZjRm3oKHLwHlHEqx/18/lb8CxpOMq5PTgURNwltuBR3DpfotAGZWgFU6L8CzZDZWsBIVbGXdh/K9eujDkU1wWsOuye7JOScqj3y4o+a+aeuczLih7xjsdy3nEC272/DseV6ts/zyxAqw8au5wtj6MY3zoIlgczcVcIoZG3zfzkXZU=
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799015|19110799012|41001999006|8062599012|461199028|15030799006|15080799012|31061999003|40105399003|51005399003|440099028|39105399003|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?A4FGivxAFdtphH+Sf/3W42nF4nGej/wOq+uqxZWCp5IFb789qtybvbV/Yp?=
 =?iso-8859-1?Q?TAKSbtRB2gb7gzNqv4RWvESWkk8UrFZC4CDcxXmFNqURyqiPLacDzL5iHY?=
 =?iso-8859-1?Q?3X+OtgWxri9GpBU6hcuUFXf8M2GkrOoeqOEWrAmrjs4SCIYVWQNS4sKr8n?=
 =?iso-8859-1?Q?FsPeMWXeEWlXPkj7QSVtWytxDPOa6BEOgC3fPmBsOxS490rm6MSsm0EhOK?=
 =?iso-8859-1?Q?hho69qKRShYN+AnEe2D6e6Q4x2afRYscFkQIVgqXSKSukucsBgHYo9k9UJ?=
 =?iso-8859-1?Q?10KWLnDDOfuYcGFo0Wp92cy2a9poY4KBIO5zS///xmREG5EmMbyxYALGQc?=
 =?iso-8859-1?Q?DGb2kzjBr220Eqe+e6d9ea7S6qbmVo8YHVMZg6TKyhJ+/ZtUeLWnh0TzgU?=
 =?iso-8859-1?Q?2Gg/Uo0RmCJ3YH6Kgp6JKbtT/wJYJuK5Bl3hJ2pUJth78noJs9vhmEZKjH?=
 =?iso-8859-1?Q?NxnfBwokSM3RTs6GciF/vMGZSJ8NiBDWe8ZxOGWKQjAyGOJB1uL2g9Hvxk?=
 =?iso-8859-1?Q?7SxlKTuj+JO3uZAt5L4UaGYd1XE7CSvo+WjUV52o+y49rwwqoeA+M5Losa?=
 =?iso-8859-1?Q?2v3V1SjbHzTxSlOJVHXVmyAy9XiV7a85/5eV/on+DfeNjwYsSttviwFvOV?=
 =?iso-8859-1?Q?R8/dGx17m2ZD+J9t7gSWNG+M6Czx7JxVrizGIROojJN1fzpz45yO6pQ1kd?=
 =?iso-8859-1?Q?pJXhiqVPVIPXIfHHQU5xvJom0v0hDmNJPHUEScUtypCsaIxFvK8hDFif0z?=
 =?iso-8859-1?Q?+yG3xkYhSutftUXy87eETl3n6hmS2dKAJeK9FL+nyL/4c4hd3ncvdzQ/qr?=
 =?iso-8859-1?Q?8m2qokKW4OtRf3mHCr+YvgzPxVsp4eU7ssSvqyuIjdd9l/y5wxcJTDgIrT?=
 =?iso-8859-1?Q?+2jWfmMfwBMOr5DepD2vhhyGgBXk2V/cabDruz1+2d/887SidWG5qOQUXV?=
 =?iso-8859-1?Q?+RpCpb/Rfesmp2e2MtVv4aaQwbVNkNDU0SY4YXg7bMy2Z7bIuKi0zbCm0R?=
 =?iso-8859-1?Q?FF3KM1gVeUXOqsFFEgeDAw43JmrH0EK+SZ0++DDP/3sb1yjO2uNalyA0Ga?=
 =?iso-8859-1?Q?kyuXrRCs8D01Ztfy9oBBaW4IoHb47MsIgr0VjKxQgeG3RUEnw8w+KcnbgZ?=
 =?iso-8859-1?Q?9cZrPj9YhaGuARSBv285v0aEYvZYJoWqEFzZGs3liGvErp4vT2KpBUxrrh?=
 =?iso-8859-1?Q?THd0AvcALrb/+JZQvHKanyq+OE0B85M5OYmjadBBwbdSyf/yi7LJIRcJCY?=
 =?iso-8859-1?Q?nrdWvxnrpXKoPl9HtVRNBZbXmXZqffxGmtlrGV8+g2ZVmRX/a7q9/jpFc8?=
 =?iso-8859-1?Q?O7xKeMBXawawtMKY6cJHYPihqw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cab8oCw1GHIv4wfukrJPzZcqp7eD+uxnX+/z7WRpLRBDZLCp/sySU4cBuV?=
 =?iso-8859-1?Q?sdyEJ9LDu7sa3pDE6uh8sz2Kj0GN6vf5VF06DVc16rOVLQqCoXFk3J3SGc?=
 =?iso-8859-1?Q?LAhzdDCJS2eYP0ZHjHJKbc6oZygi7+Y3vTkl1+/RCG32O+ZGnHsSGMoxLV?=
 =?iso-8859-1?Q?Y60ppgXC+yO8EzYpH5mxW7QG1OD078iEZeSHlxZF9sJVA9VSKHD9H4JaNa?=
 =?iso-8859-1?Q?Xa70BRzrYMe5Bou+BMJiWRkrlWtRMWBxAK1alqEYRPpJyDbeAwDrwykGaT?=
 =?iso-8859-1?Q?5qRRRXIWiEgjlH1V6fv63LcWuzAPOV13dHaKCGKes/YFE5xegyjdsZX5T9?=
 =?iso-8859-1?Q?YAc5aZ0XDVj/xOmMYBGBxPZG6d+uR6See1OV83T1zij/y5uywphhXtAZp7?=
 =?iso-8859-1?Q?8SWXiF1TLenFet/0fw/A8VNA8qmBjHqavM2wppeKmVvO9U/DInTPqvKJ7q?=
 =?iso-8859-1?Q?I7pg10UHukFZFoAHk8N+deXlToMZm9Rx5KZ+VPIG+/pkgJBILs4yCjXAkv?=
 =?iso-8859-1?Q?vjmsIPIl069zzt1sqrKOcAlwWDzgIfinfzABI8A6zFeGzx3IIli6rxTndT?=
 =?iso-8859-1?Q?SwUAQT1ouGd5mKNJFL5G6/I4MSguNavJxh2O7GPcQYCwGygHMNvq7dgTkl?=
 =?iso-8859-1?Q?keD2YmSkUOVdidTxCmQNFbDJQXogREd5PsMuPSN1GXn+peB0HLxXNseMAX?=
 =?iso-8859-1?Q?4sbBv6FcVGa2M71v2CfsrzC6ljY0oRRTbonpRpIinsGDe/jsWrrPdgAFPN?=
 =?iso-8859-1?Q?Z/5sT4RKWfh2ui9UoMwyuiGRPKFZhCZZdosthcg8YrcGA1t2iCpiwyzpJV?=
 =?iso-8859-1?Q?tQJaGV0y1JaamNK9PVqLB7Mc+YPY6WBrzojpZg5VeJDW9736opBXCTFLnd?=
 =?iso-8859-1?Q?2Y+JZKm5kEHAXQW75MUXaP3KQg0/rvtFvXmu0q7silKdGHvHSnKbufesGn?=
 =?iso-8859-1?Q?XspKFomt4OqJ3q1iFjUIHFpPBug8Km9AYYAb8apWOo6/u6iTECAM39pKfY?=
 =?iso-8859-1?Q?Wl0JGJbZb6oWQXFxHUsRxqiSfxhgNEoztNAZUtW12ALVuHmC0NATX0cdGw?=
 =?iso-8859-1?Q?kDnICN7xpAnucG0zQ6wrGEun6x27ZbqKMvooQcV7TbBLIAbEL8AQOka0tk?=
 =?iso-8859-1?Q?VWK2m0PGcM8gxFHn4tl538JiPpQONDBc8yUOlFbSz8uacvC/XeiYNvBQZu?=
 =?iso-8859-1?Q?xi7pPH3W0gNFVoNIFCMTPm5gKbasnh/Q/+OWQB5WTGpPjisrSmqO16zhqT?=
 =?iso-8859-1?Q?FZs2Ncw9yKPVNnIyCx/Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-5faa0.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB4429.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee0e5f6-5ebf-4ac3-7bb6-08de0633d4dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 06:28:01.7471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6121

Hi, =0A=
=0A=
I ran into a kernel NULL pointer dereference with my Kontron COMe-m4AL10.=
=0A=
=0A=
After digging the ACPI code I found the reason in i2c-i801.c -> i801_acpi_i=
o_handler -> i2c_lock_bus=0A=
Here i801_acpi_io_handler tries to get the lock but priv->adapter.lock_ops =
are not there yet.=0A=
=0A=
For me I fixed it with =0A=
=0A=
@@ -1455,11 +1455,12 @@ i801_acpi_io_handler(u32 function, acpi_physical_ad=
dress address, u32 bits,=0A=
 	/*=0A=
 	 * Once BIOS AML code touches the OpRegion we warn and inhibit any=0A=
 	 * further access from the driver itself. This device is now owned=0A=
 	 * by the system firmware.=0A=
 	 */=0A=
-	i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);=0A=
+	if (priv->adapter.lock_ops)=0A=
+		i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);=0A=
 =0A=
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {=
=0A=
 		priv->acpi_reserved =3D true;=0A=
 =0A=
 		pci_warn(pdev, "BIOS is accessing SMBus registers\n");=0A=
@@ -1475,11 +1476,12 @@ i801_acpi_io_handler(u32 function, acpi_physical_ad=
dress address, u32 bits,=0A=
 	if ((function & ACPI_IO_MASK) =3D=3D ACPI_READ)=0A=
 		status =3D acpi_os_read_port(address, (u32 *)value, bits);=0A=
 	else=0A=
 		status =3D acpi_os_write_port(address, (u32)*value, bits);=0A=
 =0A=
-	i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);=0A=
+	if (priv->adapter.lock_ops)=0A=
+		i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);=0A=
 =0A=
 	return status;=0A=
 }=0A=
 =0A=
 static int i801_acpi_probe(struct i801_priv *priv)=0A=
=0A=
but maybe you have an other idea?=0A=
=0A=
Best Regards =0A=
Michael=0A=
=0A=
=0A=
[    2.886356] i2c_dev: i2c /dev entries driver=0A=
[    2.887567] BUG: kernel NULL pointer dereference, address: 0000000000000=
000=0A=
[    2.888074] i801_smbus 0000:00:1f.1: SMBus using PCI interrupt=0A=
[    2.900657] #PF: supervisor read access in kernel mode=0A=
[    2.900657] #PF: error_code(0x0000) - not-present page=0A=
[    2.900657] PGD 0 P4D 0 =0A=
[    2.900657] Oops: Oops: 0000 [#1] SMP=0A=
[    2.900657] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rt3+=
 #1 PREEMPT_{RT,LAZY}  24eb1a7680e5ea716fccf03bb3b920ddd8669371=0A=
[    2.900657] Hardware name: Default string Default string/COMe-m4AL10 E2,=
 BIOS M4A1E906.001 02/02/2024=0A=
[    2.900657] RIP: 0010:i801_acpi_io_handler+0x31/0xa0=0A=
[    2.900657] Code: 40 20 41 57 49 89 f7 be 02 00 00 00 41 56 4d 8b b0 58 =
03 00 00 41 55 41 89 fd 4c 89 c7 41 54 41 89 d4 55 48 89 cd 53 4c 89 c3 <ff=
> 10 80 bb a8 03 00 00 00 75 10 48 8b 83 58 03 00 00 4c 3b b8 e0=0A=
[    2.900657] RSP: 0000:ffff9c144002b888 EFLAGS: 00010282=0A=
[    2.900657] RAX: 0000000000000000 RBX: ffff92b503bd2028 RCX: ffff92b5008=
142e0=0A=
[    2.900657] RDX: 0000000000000008 RSI: 0000000000000002 RDI: ffff92b503b=
d2028=0A=
[    2.900657] RBP: ffff92b5008142e0 R08: ffff92b503bd2028 R09: ffff92b503b=
d2028=0A=
[    2.900657] R10: ffff92b500a03120 R11: ffffffffb24540d0 R12: 00000000000=
00008=0A=
[    2.900657] R13: 0000000000000000 R14: ffff92b500aac000 R15: 00000000000=
0f040=0A=
[    3.142063] ata2: SATA link down (SStatus 4 SControl 300)=0A=
[    2.900657] FS:  0000000000000000(0000) GS:ffff92b5c8511000(0000) knlGS:=
0000000000000000=0A=
[    2.900657] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[    2.900657] CR2: 0000000000000000 CR3: 000000010262d000 CR4: 00000000003=
506f0=0A=
[    2.900657] Call Trace:=0A=
[    2.900657]  <TASK>=0A=
[    2.900657]  acpi_ev_address_space_dispatch+0x160/0x480=0A=
[    2.900657]  ? i801_func+0x50/0x50=0A=
[    2.900657]  acpi_ex_access_region+0x282/0x510=0A=
[    2.900657]  acpi_ex_field_datum_io+0x85/0x590=0A=
[    2.900657]  ? kmem_cache_alloc_noprof+0x74/0x120=0A=
[    2.900657]  acpi_ex_extract_from_field+0x400/0x450=0A=
[    2.900657]  ? acpi_ut_create_internal_object_dbg+0xb5/0x120=0A=
[    2.900657]  acpi_ex_read_data_from_field+0xc7/0x420=0A=
[    3.210643]  acpi_ex_resolve_node_to_value+0x1de/0x4a0=0A=
[    3.210643]  acpi_ex_resolve_to_value+0x175/0x4e0=0A=
[    3.210643]  acpi_ds_evaluate_name_path+0xdb/0x140=0A=
[    3.210643]  acpi_ds_exec_end_op+0x298/0x830=0A=
[    3.210643]  acpi_ps_parse_loop+0x121/0xa00=0A=
[    3.210643]  acpi_ps_parse_aml+0xb9/0x5c0=0A=
[    3.210643]  acpi_ps_execute_method+0x16d/0x3d0=0A=
[    3.210643]  acpi_ns_evaluate+0x185/0x5b0=0A=
[    3.210643]  acpi_evaluate_object+0x192/0x410=0A=
[    3.210643]  acpi_smbus_cmi_access+0x1e3/0x3f0=0A=
[    3.210643]  ? smbus_cmi_remove+0x20/0x20=0A=
[    3.210643]  __i2c_smbus_xfer+0x105/0x3c0=0A=
[    3.210643]  i2c_smbus_xfer+0x72/0xe0=0A=
[    3.210643]  i2c_default_probe+0xa0/0xf0=0A=
[    3.210643]  ? device_for_each_child+0x60/0x80=0A=
[    3.210643]  i2c_detect.isra.0+0x14a/0x1a0=0A=
[    3.210643]  ? rt_spin_unlock+0x13/0x30=0A=
[    3.210643]  ? kfree+0xf7/0x230=0A=
[    3.210643]  ? i2c_detect.isra.0+0x1a0/0x1a0=0A=
[    3.290678] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)=0A=
[    3.210643]  __process_new_driver+0x1b/0x20=0A=
[    3.210643]  bus_for_each_dev+0x65/0xa0=0A=
[    3.210643]  i2c_register_driver+0x6c/0x90=0A=
[    3.210643]  ? coretemp_init+0x180/0x180=0A=
[    3.210643]  do_one_initcall+0x73/0x150=0A=
[    3.210643]  kernel_init_freeable+0x1cb/0x210=0A=
[    3.210643]  ? rest_init+0xc0/0xc0=0A=
[    3.210643]  kernel_init+0x16/0x110=0A=
[    3.210643]  ret_from_fork+0x10e/0x130=0A=
[    3.210643]  ? rest_init+0xc0/0xc0=0A=
[    3.210643]  ret_from_fork_asm+0x11/0x20=0A=
[    3.210643]  </TASK>=0A=
[    3.210643] CR2: 0000000000000000=0A=
[    3.210643] ---[ end trace 0000000000000000 ]---=0A=
[    3.210643] RIP: 0010:i801_acpi_io_handler+0x31/0xa0=0A=
[    3.210643] Code: 40 20 41 57 49 89 f7 be 02 00 00 00 41 56 4d 8b b0 58 =
03 00 00 41 55 41 89 fd 4c 89 c7 41 54 41 89 d4 55 48 89 cd 53 4c 89 c3 <ff=
> 10 80 bb a8 03 00 00 00 75 10 48 8b 83 58 03 00 00 4c 3b b8 e0=0A=
[    3.210643] RSP: 0000:ffff9c144002b888 EFLAGS: 00010282=0A=
[    3.210643] RAX: 0000000000000000 RBX: ffff92b503bd2028 RCX: ffff92b5008=
142e0=0A=
[    3.210643] RDX: 0000000000000008 RSI: 0000000000000002 RDI: ffff92b503b=
d2028=0A=
[    3.210643] RBP: ffff92b5008142e0 R08: ffff92b503bd2028 R09: ffff92b503b=
d2028=0A=
[    3.210643] R10: ffff92b500a03120 R11: ffffffffb24540d0 R12: 00000000000=
00008=0A=
[    3.210643] R13: 0000000000000000 R14: ffff92b500aac000 R15: 00000000000=
0f040=0A=
[    3.210643] FS:  0000000000000000(0000) GS:ffff92b5c8511000(0000) knlGS:=
0000000000000000=0A=
[    3.210643] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[    3.210643] CR2: 0000000000000000 CR3: 000000010262d000 CR4: 00000000003=
506f0=0A=
=0A=

