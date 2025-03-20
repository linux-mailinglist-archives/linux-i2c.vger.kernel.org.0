Return-Path: <linux-i2c+bounces-9949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C49CFA6A70C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 14:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA81189EA01
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C620C01C;
	Thu, 20 Mar 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BUZ8P5Vr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1373B1B87EB;
	Thu, 20 Mar 2025 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742476990; cv=fail; b=DXXBGeATOyR1tiOwYXarLxDAwPFJJGBnayxBRB0InKMmNQ7vVfMZKUp1x6gGmm4IxRl0JueummMNeJe+Tkyv9B69vFHmm8OhLcOr2sZgQ4U21RgDtxlIkvscpg06UGJLXegR/nzlAyYbV0eUi0fViredlzM2kbjii+hOV+HHRcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742476990; c=relaxed/simple;
	bh=VzKOtCRvoP5nlvZhOizha5sX83/vMxpYMLU4LRYvy/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ebZVWVjheRC2ucHhBko6yL2quPrfaAqiVdg5PFi1jexpGuie15Z6heG/mq06OgBXLHTZJlea4pLX6xQMNQUzAcldPsJX8KRGAr+rlRqWC/PnE7B6eGLmKIfWJQDIgErZ5/yb4A6ieUc5kKKkDy5LLKIotOqNMbw4/1VhCCSGtS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BUZ8P5Vr; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCAHnjCeOt916vILOtXbTTKx03ZP0DwXLK4lu1btgyeI30XrPtBbvyh21/aasx9NdLmcbKgwGd+3m+AfVTtE+jhXow6miqqTlxqCNuk3IHFFnYWMO7UOIvSPjeVlTPc/JbaddJ0eQF5lAK6vyoU5hRoa7g2Sreu7/vRL34DCrPy9qLTuHSZAC47uc4HBkSTPFLqsiRy5VXkQfwDE7x6L+OTKLFB8gS7KKjKTtJ0wvHc2W73CLydd1kG0zCuCnk+WspTi4phnn2VIhILkJjcghVi94OSmCAoUev9FbagzzIM7QS5DFwoGnCuOshq22NCB6opp83v31umjuNgXq/xD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzKOtCRvoP5nlvZhOizha5sX83/vMxpYMLU4LRYvy/k=;
 b=BjU+kszY3AHD2nrCKr03rNLy9QGjoq3RMEcR5sbB+vUksJlWYH6Tfg1Bm9F0B4c5c9UfdC+kTkLcG/9Cs10+uZHK56pL9+LqKUCn2Vx4pantwKply6hrv5PJN5rpdlkD794VVmEuct5mTZ5uUwiFekNnMYuTloTPYDlCyD7CQkCkh9zaPrqpBG685EmtfVRwMtngyZPyBYENWE5dF2GO3UbSRF52ubMLDdrGUw3FhgYeSRlLDoTO+jJzoElbr8H9vYnJPqyEaFhsU3wE1Fc350Ha0xmy6jFqDDEHYAPNb47VoLq+im/0YF00q3FE0sTrSzgr02ay43U0RwuuYwHUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzKOtCRvoP5nlvZhOizha5sX83/vMxpYMLU4LRYvy/k=;
 b=BUZ8P5Vr7nxAzUrztaSJQLcs/iC5KWLHI6s1sxgfuj0isE9sz4iYsiv4lBTmaWDOGlJC7FNz0EXZqDGDi4WOuw2+XP3fWgW5VDjX4Ab4DQVk7/mi+/umdQG4ycCsY7Fv15BsCh698aynM4Ad9zNTmldewt/efd7SJgY6phL/QSDwiWMtDKh+LtXQBWCM9atMrlABIGwl+gnBbMXLRn1PSCzJHFytCFXZ46yKAWu98KnaUQu3p52ccPFgHTcEaJ5lmiHKuEQ5+LW8fmbe3X/lRxWmLhRuqM8NIvjwmqN9ec+7dQ4G2BbUfmMEHd3po6DAwFHSUULkChwgkivWWesTpw==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 13:23:05 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:23:05 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, "digetx@gmail.com"
	<digetx@gmail.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter
	<jonathanh@nvidia.com>, "wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: tegra: Return if SMBUS message length is zero
Thread-Topic: [PATCH] i2c: tegra: Return if SMBUS message length is zero
Thread-Index: AQHbmWEINVdBTWcSWUmpAbH4fYNxMbN7nsUAgABESiA=
Date: Thu, 20 Mar 2025 13:23:05 +0000
Message-ID:
 <PH7PR12MB81787B702A7F976113F6DBEAC0D82@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250320062201.54070-1-akhilrajeev@nvidia.com>
 <Z9vCFkt3ycFDBw-i@shikoro>
In-Reply-To: <Z9vCFkt3ycFDBw-i@shikoro>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|MW4PR12MB7263:EE_
x-ms-office365-filtering-correlation-id: 0360f954-db90-4691-fca2-08dd67b258ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eJbLHZn+tiMq8wSRVJxibvD9ytIY/3h0oYZ5RZBSMwlRereszN08URJS6OO5?=
 =?us-ascii?Q?9tR9NAAxcVjaF5Ard/JKNCa64abJuMuhLkL+ZvXbUwtV5sBOYssBSnyjQmDA?=
 =?us-ascii?Q?TpJxoXFOl6gwtq0/P+MUXs+xWLKyaDzMkeL5HBmyEmBd6yDWrY9tNvVc2zBb?=
 =?us-ascii?Q?qAgZMMAJizz2UabxFHuRVGiu0sBb6uQwMXP+UO7/hmDSKKIay7TRfNgcCnn+?=
 =?us-ascii?Q?KMFwfqWGfBfFkKpj0dBDJH0l6YyNgNFJ89DQcJtoE/SDkR/pRw5GRyZ2mm7+?=
 =?us-ascii?Q?gSr6A70vN7nQT6UidYVIC9Rvt7d5BlDDEdk5PmWh5//uaCCmNm9reS1j9ppO?=
 =?us-ascii?Q?jjq9NfmxjFHbRQob/vOJUXXw0nZbPvK/CNAIVrKrKJllVx8/8yYxwQd/IfIH?=
 =?us-ascii?Q?zRb8GwKEr8Q86HhJ7vi+SFNmjqGc6R2Askvyu9raBnhItQnN9aVopmoYEKvP?=
 =?us-ascii?Q?d0L3tOPvFuE9qoB9CbOikXI0snICjMkVDp/DauKhhgaGsKS00VX6H4OqsDMK?=
 =?us-ascii?Q?0ZA52zh+qk/OzWY/dCPnUgQ1rkZn+6Y5QhQ+rC+5EJgRrulDcro1mkcXVdfp?=
 =?us-ascii?Q?JVzABTXG9SgoLpcvmEXASkPhQa+a3znqaCBeuET2lg7bA4Z3gQRxbKXQo78h?=
 =?us-ascii?Q?hCKp2ozQBBnWK/4pxnFD1hjVrRk+klV+RpyKJBOQaiJYaHU4qMdnhBZHcFLu?=
 =?us-ascii?Q?EE4HhkTRJs7BEljvCGf/ZBTG/HNsjkQoUGgWsiIZv+ExC984OaLm2w4FqA3A?=
 =?us-ascii?Q?kDAiMS5t6Bid9gAE97nxm9ISDqxqKppFsA5aTJTdeax0ATXqVBwRYhugoz6s?=
 =?us-ascii?Q?Qhf68cnbKxBiM+cM34SN7ZGMOCusXhcZq7VE90GYGPdpMirBeO/WiRjqwosg?=
 =?us-ascii?Q?SFfvr33RsQ0kIS4yyPWqtfPUcy1/g7yqiIA39xE+4tGWdNJD/ipopuURz33S?=
 =?us-ascii?Q?uZXqcwdK0tqc1XolZL1EWK1702q9BlaElExfERRtdSobKPydd/ij4qcnlWDM?=
 =?us-ascii?Q?gDusAc8TEY3kuBY90pBar22sMK44/qfn8u3qwQ8YuHNf1rcWv45f5O6dl5qr?=
 =?us-ascii?Q?CNZ4L86HMN0eStrDPY/h6+hf30cVoHNf5jZu/tZwz684xVhY2xwOeEMSIlBf?=
 =?us-ascii?Q?0J+zUIx7ee/JmvQ2QoosgiRYS1xQKzX1N+csthwmz1852bD3C+E08LxUbaKL?=
 =?us-ascii?Q?Tt82Hxnelv1cUAHqOiOlyPs3oCpl3t3ZQf7neK4NhrMz6lDEb24vyG7JOLOr?=
 =?us-ascii?Q?YKJHke5raL7stGORM2N3vSZMs34Y30DfjfNymD4tmkuejqi5lNsFMCxqyZJs?=
 =?us-ascii?Q?dLCDPD7MYVK1pLn+suejZjCfXqv8yKuQ8RWkTiV/fyoFtHefaGnT818X0DQk?=
 =?us-ascii?Q?hQVvGTCpjCElAUBCx1m1Rf9Tl1kR+SA2JddML+JYNHh4QtIFjMVO2C415Akq?=
 =?us-ascii?Q?t+n27RxhTqi4sXU5HfSI8xbxAlErk8zL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?edVwze0zUvV05A3eCCXWPC9iYiA3N+clNIx9lyI/YxCZn9g50VdViVM5Bf40?=
 =?us-ascii?Q?N7zhrAQqMrlRr87KsPQMRTs2ncL6jYKpOChfEHDW13+WOwocxkmrPpHS0aUm?=
 =?us-ascii?Q?KBd4Dzr19/hv7ksYUFwUbiG4G+vGPuI6SC4FYPvxtrcCmst5QhdAvUtZDEHL?=
 =?us-ascii?Q?ebrZJVL5g9yKaxGHJZxI4WQ5UkOY2hvy+WvT7DXD0W7uqrZX/17VNCD5b9YW?=
 =?us-ascii?Q?0CvQuzKHPJsopMDV4MIH8LdiPBr7gq5KuvLKBGK5zrFCh2PR6SoWBYNv0nPU?=
 =?us-ascii?Q?01LHowjBBhi3SorK9w1QpsbtynpwVkHdudUEU3swosxTIVr+7I8fa1L7JJlp?=
 =?us-ascii?Q?WfJcWcIN1DylG3lpvNHC2gNtZpI+SqxzP7YHHTGO2FFSTMlEsSCT3oXZTDdD?=
 =?us-ascii?Q?zz9+Z6sZJ4K+40auFxdHlxmqYlznWnAxhwLIWEKZwp52yj4DKhIkI1EQqCOn?=
 =?us-ascii?Q?mZymTnhtb5IVL/MY0IdflkIxgzL//ezPkUvdE0Pd8tj1dMmUbCNTIh+taMph?=
 =?us-ascii?Q?Z0B/T15IusPx9AiNbOzCiKZiqH5QWgbOOeK9cM9kpf/usk+TEBAzMYAG2JaA?=
 =?us-ascii?Q?ywpbLqJa0gdy/bm7M3xqhL65lm0RzEJLL77O+M7+js6lDJcHaLgaYd2zBz4D?=
 =?us-ascii?Q?kB5PDZer7LmG8YqZln+dPTCwbMsY8U5X4yTVK9c6ncUMAPnaT0dK4XY47m4S?=
 =?us-ascii?Q?FMv2t7s1qQVmvDU4WSi8vwVgosXOvvz+M0vqIEOqrvLa0O7DTG4zPdjeFm/0?=
 =?us-ascii?Q?0hSRh3621aRYId3E7VgG8a1k020Q1v2vIs6uK3wD5jNriq/uK24PFSKMlzSO?=
 =?us-ascii?Q?SjfsYGUqrCmOODbTvqaOFn0qISpfHq7lLOu3Sk4GYcufb+sxuQ2vQ3AsmhS3?=
 =?us-ascii?Q?YIBByUYPotkRteqzhhYp7GHLn1S9tZigmLKY5ZaoiXV2Gp2Va9S40w4lYyJG?=
 =?us-ascii?Q?rEaY6QbI3PrPV2D8RjelRd7xQe8TH/heDnF5fvkzIQVGrn3xZBbAEU/SNEvT?=
 =?us-ascii?Q?9olodl+9qgGVNRtW9XpLIZXkZuXWJquIMCvZ3ZQWVN6rZ0XozwBHOnOe/v5H?=
 =?us-ascii?Q?dpaefyRaRUS/SSAAnBFlsazifTsTfJreuzBcFA2HtspqL580391mgKq3T3sH?=
 =?us-ascii?Q?7P5qGe/ukVimAXvHbyzrpDxphv5tRbeUMqgRK0NOYUkhzm11VV7gFqkVJoX6?=
 =?us-ascii?Q?k47HBVQiaruE+A7gUBBBx6R/XSQzaFiHK+Sr0YI0ovArummTetez1YDHjtSM?=
 =?us-ascii?Q?NEBj2w2OqRDGyT492Qt2lIFJcMtv6s6JR4DA/le+j6GQcwp3nFQ94qZOAtwk?=
 =?us-ascii?Q?9L4E3YqJoTHdNkI2j993yzTZHQU1mAW/4LJTWyNRr8v/AKOO29PwQcfSjf/o?=
 =?us-ascii?Q?jH8RCgrUAdyiCUHWsd/xWg1JleKeREPWXo/H87JNzvBUCa8m6zoeE/kTJGlF?=
 =?us-ascii?Q?H1CvLNpKgGgNRAp3KnwByCf9JrQrgwqmoIX1i1lJ5jTIWCrovRduYm9ebJxi?=
 =?us-ascii?Q?EhEmCWw7/uBukmclcb50G5zaBzPMf0il1pAeD5GUkOnX07L0EFJxmpTgOals?=
 =?us-ascii?Q?H9GopAHTYYQcc/P0jCcperjAH9NT91xIlxcPCfaK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0360f954-db90-4691-fca2-08dd67b258ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 13:23:05.0298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBT6TPvI+vUBn/jxZKPTdCtv8FRAehhc0EdngPKPpXstJkgutaDWUPhGXHvqeq2S9SZN5Wn/Om1cBbATC8nr5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263

> > For SMBUS block read, do not continue to read if the message length
> > passed from the device is '0'.
>=20
> You probably should also check for I2C_SMBUS_BLOCK_MAX while here.

Done. Posted a new version with this additional check.

Thanks,
Akhil

