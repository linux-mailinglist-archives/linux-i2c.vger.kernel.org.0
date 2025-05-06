Return-Path: <linux-i2c+bounces-10817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B34AAC0CF
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41FE4E3B4C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E16D2701BD;
	Tue,  6 May 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZTPk7Lwt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EB26989A;
	Tue,  6 May 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525884; cv=fail; b=GHAbphLkJreRqQMUkjcr4b1FU9piZXaVvkzUbMzUbvs1YRZxF0PtQbF3r1dtPNXO0sS9SSjWV35kJl3NDyDy/AwQYqqHrhKbMjYkZOzfx0n51P3LLuOJjKlSLypU/2XtLlF+Uetk1uMCDx5TSmD7H3y6gfP4Q3Og39Zq0fPZX+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525884; c=relaxed/simple;
	bh=ti0vX408SBQnRAoSWaDYh3f1e3WdTuAnll3/UfK3AY8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FjlEF+N1NsUsy81hkWT5phX+suL2sEars5TS36KuLWiK1rGlLyD1f4ErYGSdFrmNKNCt5RMPGzyWOYICaUwuzpB3op6a9MvwSZ0WuwnDCLpbjsdCrTmLa9KcqQcpwIDoycYcbE0YEoT9ZZ9UQH8mEpbFt8jyjD7B24lGOJ/aKTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZTPk7Lwt; arc=fail smtp.client-ip=40.107.212.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZcLC3wEpPRtpFaN6xt6ePE/PbAlbv68Hlzo2leQ6CHH40ovhkswA0Tn+N7NcDsOMx4aDN0SqwnMvaGIWQXr7jHIQlFarHmGsbHTupUYMxUsmoM/SKZa8IzMxMc2SuvF2wG5H86X3rarELy8GTSQvLQ83LHlt6S8ym7I4Vq3Z0FlfDZGAe28q80fSbEEqo4SVPXKoq7AzqGlRnniP1JvA4Ss8oyqE6KMD0+sHth2duWKqr7enNYENInuDxet2nnwKaoEVkgN6GeY+gmhAHzUf5rCZiZe2zx72E1f+OEVvfqbygNLPhZ+7IFdAbuW9M60q8HRRSRdwOi0epXsa+gI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ti0vX408SBQnRAoSWaDYh3f1e3WdTuAnll3/UfK3AY8=;
 b=QHr2smBRtKqsEnNEtB7XhQPOzUhRlsjRaW4HmU2nt57hCp/l4PSaNFJiq5kiJnzuSTW290z8W5EDfF/j5XsaRZPCzbcwstL7IGn6C1d3pAB8O8qiTNKX74N9SIxZ8nYYcWkCO9Y88UHcXc4iJXgamRV/JA1gmZErE3avbUARk4kBlbfW7xndren7MJZU7nMtYmjJ/F5JG4Co6MEX9Vf6rfkE3KX79yTXiHJAwYf/LiK2mvujiW3oJPNil9F/QQYPwaGbkGZBk9hYWJ8SP7ekYDeELbQI2+PWJNLROV7+bsy0aWutsDIMJ0cruX9A3dHJfV56/nG9+VjEhmDhc+c/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ti0vX408SBQnRAoSWaDYh3f1e3WdTuAnll3/UfK3AY8=;
 b=ZTPk7Lwt+wbrqAVk/Pi5oijLqDGf4c4Gk444Bgt3fzW9KmtxPF3OkQrfICIzt8qF09UjMLnnFFcb5Q5yy6C1WVi44p9W9/lL5k13i0NgCoY2K/aPxBAuwRgyC/dGmB/lsASxpg9p9YlINvdgLI9CeyCOnvgViZX8eSfR2yc9Px79LMFJFP3PfQtOb3BV1x/tV2I8qc674hZQu3cvpIZXZ3gs///nar6PO5A7kYEJkkeDu2VZL7sUgFbh2pliICgEVXiJLg+HBC4t/xk3lme7DF2ddES17JzEc1ijeE0TcIpc/kUIyQRHHpqhe+Ci8XUFqveElJ+MUy3rOvhwfipS3A==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 6 May
 2025 10:04:37 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 10:04:37 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"onor+dt@kernel.org" <onor+dt@kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Laxman
 Dewangan <ldewangan@nvidia.com>, "digetx@gmail.com" <digetx@gmail.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH 3/4] i2c: tegra: Remove dma_sync_*() calls
Thread-Topic: [PATCH 3/4] i2c: tegra: Remove dma_sync_*() calls
Thread-Index: AQHbvm24mP7RSKcQake5irmOErg+AbPFX1uQ
Date: Tue, 6 May 2025 10:04:37 +0000
Message-ID:
 <PH7PR12MB8178E78B8A1EA432F9127890C0892@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
 <20250506095936.10687-3-akhilrajeev@nvidia.com>
In-Reply-To: <20250506095936.10687-3-akhilrajeev@nvidia.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|BL3PR12MB6428:EE_
x-ms-office365-filtering-correlation-id: 4cb80e35-48b1-47e6-e66f-08dd8c8568e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7ehHYWZF0ZANLvyi6v+4IJg0257lV++KugrYhK3iMyrRZqeGv3G7PZK9i9Wi?=
 =?us-ascii?Q?B3Dhisj8jIVuJuObegaJf9oSD/5vxsEQu2QubN5VfQbFaUH60rU5UYlKs9V7?=
 =?us-ascii?Q?zRvjbF5KM/bkz5DU0fUxPKAmG+abeX34lquZfI756+62ml2sTYfMvnqZeMOI?=
 =?us-ascii?Q?PCZWBL6AYAL3S05HsEyxJlGVDhPG4sbsl/hJWclFQLNbvNDBGNzlMdgZzYUi?=
 =?us-ascii?Q?u24O+6eXjD1MWs6jsEkHwQDQxyXJDZJmAPcsC7okOohGJgx3TdnhlKAFP+fI?=
 =?us-ascii?Q?RDBFKSQ/GH/Q//Q8sZgYl4DIcSfVDvCf5nVBHkHC5N4wrgMfwlLJmu2sF+Bh?=
 =?us-ascii?Q?US1jExvfpMIxGCkbKFeSKw04Yxxgbr9hL+b4TAIw9nxzVQb52629YvBs6cL3?=
 =?us-ascii?Q?TXu5fbSEZnViFbXrSXjM8GyRVH+uIsmRz2B+fcMeogchh57EmU8ySr8RYq/Q?=
 =?us-ascii?Q?/sQrP4sfBISqAWWJ6wJF+ncF7ZXaNiJCQ3Hbq8WatPBtTpf4XQ9dIOKhfykL?=
 =?us-ascii?Q?Exq3tWLlVufDzbJI/HYqysDsgko3kWBx5J4mmDosbsCzg8bTr5caeFrouTC7?=
 =?us-ascii?Q?5BlR0swULqKxWs8uWH+4L3ayaJIrzkmUZVglsmSbT3F+50iM6JsMeEQaQtZe?=
 =?us-ascii?Q?lRy8WRNq3gWXDdS99qgg+U8IT7wt+gDbQuPf7WhJVS1bBRwuXzT9yhCfrpCK?=
 =?us-ascii?Q?rwVJsK+Gb0GCAtIlPgZDfiMGlaZK9/Dv9AS/0mCQRfps0DabcSD5+I5YwrM1?=
 =?us-ascii?Q?i5y14ma35za5C0W+HEI3Zf9xWSbtmwF6h8cM7OvgXFFSze+eG7wraHY9kz3Z?=
 =?us-ascii?Q?mMvevxmijFTHodTcJ03JTsjDI6XBc0opslFRMforyrt/buFUnKm90wI+KfK+?=
 =?us-ascii?Q?9pt7LeztCNnZV68gFPkhHCCAxPjPF9iY+65NUPHE0Yd7UY4R6Po4jo8B5DES?=
 =?us-ascii?Q?O19iuEGR1yafRvc+9GO++GWFJUksD126oNXk0Tb1FW/4MgZ6VapgZjHR4i78?=
 =?us-ascii?Q?4UWQx3zNYBnjiw2Yb0zMrZ08qB+F2LlG2ZFmh/nNOBp9j9AWhoSLiJcJ+JlO?=
 =?us-ascii?Q?T5lCK39bIPaoM5qsRjXT9q4TtLKFAOa855GbFBDEP14LOZ42gR+j5VmyNZpC?=
 =?us-ascii?Q?pe35KIiycYUej7RIjvVPeMq3IOvTpXjpi96ttzgumJLx33wxegJKKCrNj4jN?=
 =?us-ascii?Q?ypIb8i1RGKFaY0Dmfvao2El7lsnpax/dxqbbuEpbjbWif9zQXVwgWPiNvCCk?=
 =?us-ascii?Q?Lbo+5w+HiMSaX5TeRcTc/IqWPI3FT6Y0DEK0agmNuY4KVQ0K/n3VEgMbSC11?=
 =?us-ascii?Q?pyRLtxh8v1t0YzD0w04Xk+tj4/q91+gRq2EL/Xl/1z75bClnG/j+c283NX4y?=
 =?us-ascii?Q?al9g88gO893GmtCjuEw31RPUdaO59KItFr0/yV7ZSdanA1VEtuUseCvaakTT?=
 =?us-ascii?Q?TFCEFRmum9YajifDV/R9NHVfXkIDxvcSxo+c9VbBdNbk9849AY04Cc01Zf37?=
 =?us-ascii?Q?vpqDIXIDtemP31BlFMeKBusK5Zrw5Ym4QKY0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cJwpOlWGGUrhyBQkwot2txrtCPi3TF7nHZhA8BaUz/lL+w8HjdR+cvkm3omB?=
 =?us-ascii?Q?q+HHFTwjVvYIgUQU7Dgwr6VPnHvrU7nE9hknyfD9qtO3+tXLxz7e/W3L19oI?=
 =?us-ascii?Q?zY+K1o/J5xK6P00q9zxE/KyolL1Hf1ALyPC86BiSaEwk/dmGNMtzHDZq8vbI?=
 =?us-ascii?Q?fP53KhSMVoISuGTd8UAt5SLkW/Ri9QumIDQoZBu6yrJfUK52uT+kQg7RVO/N?=
 =?us-ascii?Q?pnB0DpNa94Xv5xV1PCytUTopwjjEWhE+OMYnpSSDk0r93Zks3W8iIKdLqidq?=
 =?us-ascii?Q?em7gn3cnx9mGGxAIVMQP4SOdkzCKIlV5qN3mZivnAKqxpLMDotxgWO5sYvhV?=
 =?us-ascii?Q?M1naaLGADsXiCmOuXAhCgYuDVVr4QKDaD0WH8g4MtPbpWM/ky1/jsf8LYUEc?=
 =?us-ascii?Q?TTMhEKRmiu+5HSaY9i812DE3oxzn1vV7NH+hY6o/CqzBC5/EjKitK7PTI5M1?=
 =?us-ascii?Q?VGJZQbXnrLH+8T+Bh7hi1fxR7mc0hfu/PQDxqTmKxw5rWG02ot8wTt1O8bIq?=
 =?us-ascii?Q?9Z6MgJ/xSOnMIim8VtN3AVUjdW7yfPIdjwDAxamh0Jg8xlopViokP5dOo38b?=
 =?us-ascii?Q?E3DTGu3ugqZ8G5RPYYxFY/abkvJAag19xrwiyaG9Ju0Ylgbkx/H2w+MHphQW?=
 =?us-ascii?Q?THudXYqAt2BWWL2OoangaJx5USJpBrhIKyu9PvqXT8QbkzOpA2hfrJ11ikyH?=
 =?us-ascii?Q?HudNfwUW0Gn0G7ywG5WELR/obJFtcv1r1ltQmefgwB70r1PukC5MueN3F1wv?=
 =?us-ascii?Q?tKY4eL0LyV+Z0irigo6CWcxJEYTq2vbPeDf9OrNEhUEy4/6llAcAYHg8zACn?=
 =?us-ascii?Q?ia6XkGrGA0eI7L6kux8HlzhWtXp349Jcb0LlH485pMO3wQypyDiPhJSTfzN8?=
 =?us-ascii?Q?+MVwEu6TuO1KNxCmsjCSAgGVvl4BhvbIILF/GGhaYR40lRMF+deJQqaf70EM?=
 =?us-ascii?Q?pEFtOeErI73W+hwGgUfstI+KyGOHMrYOMxtkG7pgkWSFUm58HTOEv3Z1cUDN?=
 =?us-ascii?Q?gzBtVh8mWkcn75zQKAH7Pp8ZqkTqX0crjFEAN347MC3wU6I/UKYYYIBJEx4T?=
 =?us-ascii?Q?sD8z38pheQ2sQ0h26GJ6zUsODaz0+8FrrMTPYzqoZWjslMRz9sIC6b0cbfl0?=
 =?us-ascii?Q?6gcVLjC84HLEVyEj/THRQ5+VrByj7lbANQPVwHU0avSikPyK7X5RvFFb0CYQ?=
 =?us-ascii?Q?KggMdGUjK8PmBq5ICifCPTea3ihNIzOMW+2ZMYsGWdjvV2niCooPvSiMc2sz?=
 =?us-ascii?Q?RGURypNL14ONAv4B+7Mi6IRB/JCBUwh8gNFIC9uRvbJf0D2fFZfFh/FXqm9w?=
 =?us-ascii?Q?jYgKvxAzz9HBR6AslCteDyrOmajfEyHf+pmX93ro2pQYeeUwQdnJAQbNqWIx?=
 =?us-ascii?Q?ReoeoLLEx5UATnGdMbg4Z7FAkWjBxNT9y3EzSUdNgNySiHfrcl7w6lcBYyP2?=
 =?us-ascii?Q?nf+iMVXz9fxKkWN/gYrb4TndPFKhBN9cb6kMi4fAptd9AcMaX21nwsBMEwTd?=
 =?us-ascii?Q?wr7vwFLe+ZjLp9lhbkKaiDa+HkGXXF1DYR5ncyZakcbm2qDYfdSRpJD2ZLlL?=
 =?us-ascii?Q?9wfT22ILB01R3ZuijQD6ond8vnqUa1homAXERhy6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb80e35-48b1-47e6-e66f-08dd8c8568e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 10:04:37.4363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/+61vHn2hb7jouO3HKQSDZrNZdx+uvfidpDODSlAbJiFU3mEuodAsHUmPE4yurLoFCE4Md728JpC3UMz5yuxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428

> Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
> The driver should not be doing its own bounce-buffering if the buffer is
> allocated through dma_alloc_coherent()
>=20
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Related thread - https://lore.kernel.org/all/acdbf49c-1a73-a0b9-a10d-42d544=
be3117@arm.com/

Regards,
Akhil

