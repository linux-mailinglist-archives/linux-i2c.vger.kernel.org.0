Return-Path: <linux-i2c+bounces-13164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A3CB9F450
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 14:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B9BE4E3617
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 12:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E683226E6FE;
	Thu, 25 Sep 2025 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RW2j2NP+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DB27B500;
	Thu, 25 Sep 2025 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803462; cv=fail; b=RHkAcsXm0rckhaj4DzKPX7EVnmzBOnop5JYLlbpDX3AWZbJXkdY0cEDAqB0mGcVQ3evjXVQJj+2GKUIopwjIQfbf/yURZUPxNY41tFoDjAXQDy85pmEciVhqss+fh98b2iyCo99EeXca/jPP2x+/Zvnj2/uX8yO01TT0UvtsW68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803462; c=relaxed/simple;
	bh=GPw7qjlWxM2wwB+VoA7eGjemUEroQH4iKKHt3liKwfQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rQaS2xr+QS4mA33JQTiuZXRul5aSCztNY+e4OVwb1jhRfPh4Uz09mWc/QnobopZqM0i5oCKW40cYp2aZge8o0QaA4cjP0rJu2vWvRBkoHMsPKnmD4EthFUXzpCy2JVOkWGTBPuDKPL6Ih57+2gfDiD1DkyH6Ex33hg4DVc4G7Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RW2j2NP+; arc=fail smtp.client-ip=52.101.46.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAPNNNzpn4OSPgAnPWGhAMI8xpIh8854uOdqWM4D8BSWspBanvEdh/HI7CjA4tudfPhvPug6ytq2/08D668sRZnHeCVW7iLEqwbYWOoM84kw1IcDe+x2F8F/7hMOVUdf05EOq47smMjQuRFOBahIqpLpu7Fcu7r4i+fFv8Xv9YDGoDuluYYPGOqvn9J20rThr6IV1M4gJq6CG5Sd1Nffr9ac/Dh2EIhTKGMiC+cJVN0wNfhYITeLBk2u8P3Ty6XGFpYBV5vWyh5p0b/qWGs+dTsZr8eyjf7GqTvElL+wO9T2GH3H+Xjwig9yGx/NSHP+kyADLv3quN+g9Npg/W9Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLBjfY2oPvan3yMzP4i5sMEedFdBK7RdDs9fze69MGU=;
 b=kqhOTtaocr/AAUVgTZLgrIFO4kE8jq5mIuu+J+eEoN3V/GH8tr4Es+JsziQ6tAZo6ARU0i7d77msbkFnSsueOicJjo86GKqkdJrb9S5E6Ve31Qz7Wvqlnv48vMLg9Fh3S3LxJHssjd+RIMgWLce/doqVCptvpr3jY6eAv+pmTmnHdDXn2LwU6U8rTJscKh7U99e8IudYtqkY/yzRvaTwElVRWMl68CP557GUe3Cp5FYjGYi3r0o3nN2xLO9D07azxJlH89wA6HnM/9Gm3e8fiPsT5gvx56oYRuOjg0/ZBSWac3I5ViTV32tTJfta2cPX1WCktVtsC8YFCMtKzZQD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLBjfY2oPvan3yMzP4i5sMEedFdBK7RdDs9fze69MGU=;
 b=RW2j2NP+kXKnMV5getDcLmQtHoUsXMYu9oK2MGri1nLrEExxYdvLnkMZLjw5wIoY5iJTXsKsnFygQ8VUi/LESxCabolPIFzi9WqsSlFUcP4r2vfqrfbm42jhhCE1pW/BtMA576nkpBQRxRbX3aHKVV9pSY0f2D+LSBxSi4zeJTE=
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 12:30:53 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::b5c5:3390:35bc:eb9f]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::b5c5:3390:35bc:eb9f%6]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 12:30:53 +0000
From: "Neeli, Ajay" <Ajay.Neeli@amd.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "Simek, Michal"
	<michal.simek@amd.com>
CC: "Goud, Srinivas" <srinivas.goud@amd.com>, "Pandey, Radhey Shyam"
	<radhey.shyam.pandey@amd.com>, "Neeli, Ajay" <Ajay.Neeli@amd.com>, "git
 (AMD-Xilinx)" <git@amd.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3] i2c: cadence: Add shutdown handler
Thread-Topic: [PATCH v3] i2c: cadence: Add shutdown handler
Thread-Index: AQHcAU2ZoL9gJIfogUOBIbrFasmoVbSjxhmg
Date: Thu, 25 Sep 2025 12:30:42 +0000
Deferred-Delivery: Thu, 25 Sep 2025 12:30:00 +0000
Message-ID:
 <LV2PR12MB5869A142217C335B89EA02218B1FA@LV2PR12MB5869.namprd12.prod.outlook.com>
References: <20250730122907.18909-1-ajay.neeli@amd.com>
In-Reply-To: <20250730122907.18909-1-ajay.neeli@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-25T06:20:19.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5869:EE_|MN0PR12MB6101:EE_
x-ms-office365-filtering-correlation-id: 7dee9360-ecb1-4ae5-79c2-08ddfc2f5eab
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MW50IklkJpzRgRxexRnk4rPpaSA2IttuGGQZqDJ4z715UfdCdjD0OwhPgunf?=
 =?us-ascii?Q?IkDKrVCNxNEZkTnxGXFyLE30Jkb3hcGse6gDm7VjZDS6/pZGMMG73HHkDD0Q?=
 =?us-ascii?Q?hswgcdpMUgQhAGf0e3uVtnYwloNeKQk9NnwIvi7EPZqj0jASbpI+Hnr33nkU?=
 =?us-ascii?Q?CN+XPJPJvLUqQJ1mFnwTFwrkAw1VoQSxYeMtGDJwQiExT3zIxM1zB/z6fDC7?=
 =?us-ascii?Q?zqjiCLuTOmrYRsJ2F645LgtqrTkEx9BgIKG+wnw1ugyPrI8wWbBvdQhNK65y?=
 =?us-ascii?Q?xyEkEr/HF1UqPw+MNaCwta8tB0/3NNEJljVNTbc1IFF4kjxIHPiM5AVNF7Fh?=
 =?us-ascii?Q?OLdvhqzOUAksswwNfz0ZYOvdmcm74JMAs9jJ1Ht+eWbiiIvoufm1OnxqsOXc?=
 =?us-ascii?Q?NwPb+J92rtYqysHKvhF/h6vB6iSrDWPhBWrNf1oe0yDbTmNa2DfD3pethqOZ?=
 =?us-ascii?Q?ZG6LibS44f0lhByW+pQzoM3xjAo1n8yTy8JvfpsJCoQnedmLj6Y0dSdboBcg?=
 =?us-ascii?Q?+cNV5PeCU9wbLtkR7jthkDd5IVgVT6dvQwME7hCqJZBjsq83Osp9BsbWXpPK?=
 =?us-ascii?Q?8EHjihfasehZ+UG9Ddb5idceuE1UXg4XJNb9M+iUMNzwH/xjq1ie5fGQa702?=
 =?us-ascii?Q?ynuKGUGwx310cgQUmpID4lUwyjyzgXiANhJkt/5RjK9EvUmE5UhCe5Cvbf+A?=
 =?us-ascii?Q?4Jw62aC8p0VlG1Pb+Ie/jSbu7zaCcTYNxiz5PLAUWeghfZCk4ZGqrKpWPf8K?=
 =?us-ascii?Q?3PIe41K6DS7efeEzeFeDuNpeiGOfJuzUWIQPmsGPl1e+1dXbdKs/SKhkSM+E?=
 =?us-ascii?Q?55pZvL2FtA1dH6RFk2IMjwlXHoFAH+iWrd6aLPf16ar7VnibZCkTOFDpipny?=
 =?us-ascii?Q?h1+7Qx8UbA4Tf1Yiykf6fFQlc/e2gY8kIeP7wy3fVR5YJtfgYnbpDdvXNHla?=
 =?us-ascii?Q?IWLhD9LfKqqRhea+fZZ2nKWjnEAT5LfTWtVComKNTpPJVWBgOKAdvNgGbydu?=
 =?us-ascii?Q?Yrkp0/WzRS4lq2OPIEa95IEmhFoVcJ5WqVoHkeHX9ac5FrqQg82xo8tjHf5O?=
 =?us-ascii?Q?vlaj3XJ1ys4nI8YHv74gD5WwzH/1VX3aZAAEroX8TGMFtSrnQRh2c4q6fPSg?=
 =?us-ascii?Q?f06s9Ozs0S9407g2Dt8Jc8jPaffiVIZZbmJV1UCk+uZCMGszUhwzyTsZ/2BW?=
 =?us-ascii?Q?5QJ4Yw8VFd+ESrE5gZi7T/DX4/xTDXaJ1mHDJDCemFxa2ekkdtqNv2uJYYLF?=
 =?us-ascii?Q?MWI5xrOi18+Ydwl3IBGyXSZUMfEg+pYHHtzRu0Wwl2YEUxt54sUEiX2ur7aW?=
 =?us-ascii?Q?3uz9Sq/TaeyGP+AZDuysz1T/m/u4iz4hhGFjcvBv0Tjw/v/VOh/KNj1bzcHS?=
 =?us-ascii?Q?S1m2f6C6zQjDL/Y2bzudYSddQ6UCSV4X66JTQ1277REK1rRFhdHAJju/LOD3?=
 =?us-ascii?Q?lYCmmQxYmiRDiBCg9h4cO7bvEgi+ESOXNXH4V42nS4fsWJqTHQfus20CDTS/?=
 =?us-ascii?Q?wQ6w6BweV1RmJec=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QgLpM7A9Kfeb1FMw7beeXziICMsdPIrbBqr/vaHW6hKLzmjC/h1YqlI1DKoT?=
 =?us-ascii?Q?99A/EtLd5lytXxDtz/1MNqK4AKXTuoRWLOOvQ4aWHwHHBFG0t6vaWv8UgNWp?=
 =?us-ascii?Q?Z16dkrnOXYP1QFW9Ht1n/L67xE3KevfefIzRkzR2+rrBQ0eONblP4bXvJn7y?=
 =?us-ascii?Q?lJhj/OGWjh5xtxI+0a7zOlDoAGxgXhGoJT849UxL8/AZ2CPRhYhDk1gy45Jp?=
 =?us-ascii?Q?qyNs8NqzFRlVr/K5UK4yPDG1hslTymOk1wGejHbREen7mVg/Ccmhkb01rrJx?=
 =?us-ascii?Q?/OFb7znfBC8cUju47yjtkFIPoEz3XnoED/9iZ9cTS7y3Both1mkFuH1tWZ5L?=
 =?us-ascii?Q?z0JPH/bDN7Bg0Fswb5L4Er7/aUR9D0y/+SwZAcFGbOPUXl8GM3kwnlVnMmMQ?=
 =?us-ascii?Q?1yonqOwDMUw6TDDxsyO2D5gwMKr/+lCP5aQvrUAcdEQPlF5YPhcP1yS2LiwG?=
 =?us-ascii?Q?bEMeheur6qg0te2HBke279A4jXQ2nqQaSoDD9IKZWwne5RidIujwhbOD9W3X?=
 =?us-ascii?Q?2iWv1fd+bkGetGVyIsfmgCKveXZtl2qNn+pw+ZRexCx3wbkbyRYYE7S6Gxx6?=
 =?us-ascii?Q?pnaZ4xuTRrjnSfpTbqeyuzFaaJaZL/RK81BGFUpb5gv2r52sr9b1gajV2bbL?=
 =?us-ascii?Q?Ha9ZQeWCG5FiSHdOZtcLVA7OJDMNu3fMPT7YHCCTQsoVrJRkCMldRIx5sJ3r?=
 =?us-ascii?Q?Vd5poxOWR9y7ufiJPb0F3TcteSqghJJWQ9tXyN+1RinNoJOYBQP1KaQ+qLc1?=
 =?us-ascii?Q?8v2wGIvB7J2gg74D28B4/5mK6HmwTUU07RJEn0PAnkdqFRO+bDmkAg8qbmLu?=
 =?us-ascii?Q?osUf3ZITS3GEtkQw1Bgn0Nn+DbVceevFWG1Smve7mmiQruq/QUzPU8xJzQmd?=
 =?us-ascii?Q?3N73nu0gPPDj72JRficrJ6Q01XxbPugHp9cH2hAsIiL2RZ1pIi9CfUpF9OOM?=
 =?us-ascii?Q?M4XGKRC2AyaNnKr/rIJ84FvTJ5UCnE1DGJp1xkEvH1ceCNiajJUzxoFNvlhr?=
 =?us-ascii?Q?/+Te7fGvKVRF7+i624rMXRbk5H1LFe3Bitz852ChX1nv3Sk0A8BYb+Ji7Eo3?=
 =?us-ascii?Q?l1gnk4d+3/X2CqShKdn08nJmLu0cmxvEnTZsZdZz84SVhH7Ds2klaVnSlNZw?=
 =?us-ascii?Q?E3nLbUm8H9Zg+K/pdlwMqCtxYjgLaqsRD+SCO0QutUZZHjQrmMHA+STbc/0T?=
 =?us-ascii?Q?juS4+tAjJvQ4FN9zVGxkHEWTlNY9if06elTKM08tOAoZ1FFKApwS19E4oxIR?=
 =?us-ascii?Q?ihmzza4PBqsfHp7sGhR+v8GCU151gkKaskZtPlrYMchr5sqzLvl2pXJefCLm?=
 =?us-ascii?Q?KtpKRTpGxW280LmzrkBxHM3QYYbWfgtlxJD/I/5ikXuTwf5EvjuuGBkMke+6?=
 =?us-ascii?Q?QmcnH9Lj5h4lhxaohsJlRE2HOfuD6JUbCxrKz1pGTg0jGcr++c/5xeAqwmkk?=
 =?us-ascii?Q?QJtkDzfqb+iR8jG4KtAYWVQhKSH0UbF4a/18dodlnl3nkeXJyr/guT2M+59G?=
 =?us-ascii?Q?CafrgAQOKJA/7HWW8KMMcdlR4kf8+LCifNzEOsqN+iW6/1eROXQDnsMYxxmC?=
 =?us-ascii?Q?kJ48k1qJE4cd1tpRfLc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dee9360-ecb1-4ae5-79c2-08ddfc2f5eab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 12:30:53.8307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGW3BCCI+avmi2TsKm+qlnzRyfCn4AFMpSk8XFK/kiAVd1k1ieNJKzy+MGUPcVzWIGvWSI5BnfdROj+PhAx+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101

[Public]

Ping!

> -----Original Message-----
> From: Ajay Neeli <ajay.neeli@amd.com>
> Sent: Wednesday, July 30, 2025 5:59 PM
> To: git (AMD-Xilinx) <git@amd.com>; andi.shyti@kernel.org; linux-arm-kern=
el@lists.infradead.org; linux-i2c@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Cc: Simek, Michal <michal.simek@amd.com>; Goud, Srinivas <srinivas.goud@a=
md.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; Neeli, Ajay <Ajay.Neeli@amd.com>
> Subject: [PATCH v3] i2c: cadence: Add shutdown handler
>
> Implement shutdown function for Cadence I2C driver to suspend the bus
> during system "reboot" or "shutdown".
>
> Interrupts are disabled in the handler to avoid spurious events when the
> driver is in slave mode.
>
> Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>
> ---
> Changes v2->v3:
> Corrected a typo that caused a build error in v2
>
> Changes in v1->v2:
> Disable interrupts
> ---
>  drivers/i2c/busses/i2c-cadence.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-ca=
dence.c
> index 8df63aa..4f033a6 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -192,6 +192,7 @@ enum cdns_i2c_slave_state {
>   * @transfer_size:   The maximum number of bytes in one transfer
>   * @atomic:          Mode of transfer
>   * @err_status_atomic:       Error status in atomic mode
> + * @irq:             IRQ Number
>   */
>  struct cdns_i2c {
>       struct device           *dev;
> @@ -224,6 +225,7 @@ struct cdns_i2c {
>       unsigned int transfer_size;
>       bool atomic;
>       int err_status_atomic;
> +     int irq;
>  };
>
>  struct cdns_platform_data {
> @@ -1495,7 +1497,7 @@ static int cdns_i2c_probe(struct platform_device *p=
dev)
>  {
>       struct resource *r_mem;
>       struct cdns_i2c *id;
> -     int ret, irq;
> +     int ret;
>       const struct of_device_id *match;
>
>       id =3D devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
> @@ -1526,9 +1528,9 @@ static int cdns_i2c_probe(struct platform_device *p=
dev)
>       if (IS_ERR(id->membase))
>               return PTR_ERR(id->membase);
>
> -     irq =3D platform_get_irq(pdev, 0);
> -     if (irq < 0)
> -             return irq;
> +     id->irq =3D platform_get_irq(pdev, 0);
> +     if (id->irq < 0)
> +             return id->irq;
>
>       id->adap.owner =3D THIS_MODULE;
>       id->adap.dev.of_node =3D pdev->dev.of_node;
> @@ -1590,10 +1592,10 @@ static int cdns_i2c_probe(struct platform_device =
*pdev)
>               goto err_clk_notifier_unregister;
>       }
>
> -     ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
> +     ret =3D devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
>                                DRIVER_NAME, id);
>       if (ret) {
> -             dev_err(&pdev->dev, "cannot get irq %d\n", irq);
> +             dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
>               goto err_clk_notifier_unregister;
>       }
>       cdns_i2c_init(id);
> @@ -1603,7 +1605,7 @@ static int cdns_i2c_probe(struct platform_device *p=
dev)
>               goto err_clk_notifier_unregister;
>
>       dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
> -              id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
> +              id->i2c_clk / 1000, (unsigned long)r_mem->start, id->irq);
>
>       return 0;
>
> @@ -1636,6 +1638,23 @@ static void cdns_i2c_remove(struct platform_device=
 *pdev)
>       reset_control_assert(id->reset);
>  }
>
> +/**
> + * cdns_i2c_shutdown - Shutdown the i2c device
> + * @pdev:    Handle to the platform device structure
> + *
> + * This function handles shutdown sequence
> + */
> +static void cdns_i2c_shutdown(struct platform_device *pdev)
> +{
> +     struct cdns_i2c *id =3D platform_get_drvdata(pdev);
> +
> +     /* Disable interrupts */
> +     disable_irq(id->irq);
> +
> +     /* Initiate failure of client i2c transfers */
> +     i2c_mark_adapter_suspended(&id->adap);
> +}
> +
>  static struct platform_driver cdns_i2c_drv =3D {
>       .driver =3D {
>               .name  =3D DRIVER_NAME,
> @@ -1644,6 +1663,7 @@ static void cdns_i2c_remove(struct platform_device =
*pdev)
>       },
>       .probe  =3D cdns_i2c_probe,
>       .remove =3D cdns_i2c_remove,
> +     .shutdown =3D cdns_i2c_shutdown,
>  };
>
>  module_platform_driver(cdns_i2c_drv);
> --
> 1.8.3.1


