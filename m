Return-Path: <linux-i2c+bounces-2087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4486DE06
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 10:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3452F1F2313D
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 09:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B426A33F;
	Fri,  1 Mar 2024 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bYOddp/f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6E6A333
	for <linux-i2c@vger.kernel.org>; Fri,  1 Mar 2024 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709284752; cv=fail; b=Q0PpRzH2lQ9S93J1vlmiC3zpi/Zeq9Ytbr6B0ORJ0+BiCoiX9KuZ28AAKtDzenRF3mYw/r235mxmUDoRTEtBZpNbE8pD1q8dMoJ2rb1P9GAhcOA51hXFE0Yq335+66S6nxgMvEmjNh80rJdayf+zid8moTSr2FFmoZKRvyUaoHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709284752; c=relaxed/simple;
	bh=R19gnzXEX2f5B1Q4mYXM01COO0bgYFvRsaxy9IgwIUI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=We7Na/SgjFtIvn/mbYbstFGUFWv9v4apJ/BxfAL5d5L/LOqBHW1WKvId/BJ9kL27H1xc4CQ4BROwVqHi4u+NG8BMgSKq5sAPCruB2P8joMbf6Lu9pjJYuKnhkIw9u1Sut90lgGwdNhsbMmjsTymnLXtiiSTPJp6QvKJkDsoMsZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bYOddp/f; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2Yxp0uvEUYUpUGw/+eEDv22M1mUnCg/mdQRDN35GGDEUCbrZDdiOX8o5jEU/zgNzFoAZp4wQ+uNrs2yz1zaKmNKmGGNeaMauTfTrPqcCYvx/WvOgw2YtgHcEryLjUWMn/S+6hq4zhfcu/pGD/am/nJ9SjjQVKtW61EdHXSkKzk9rHPwrL+wZV70ox0HF1Gds2TXSe+ckBxqSroqE79RitvrCcwILEVjrj+BHuBohcpzWGKDUESG4t2l6tcaJCUKqrzjBHJOTtIMBBv2N9Nkx4p53T6emfzYPp2BRa7eqe8HP6G/8jKGj/caJw9iw3IMF5EHGt+vRuogpQWhvFLW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+EehzIEnfxwlDqqMKHpuKWyABzW7K6USjWqTHlyXhA=;
 b=gkkF9g4ocF/3Rxsy2jZGrZOKCY1BvMkXCyaPN8AFG2VQfbY8RE0m+2u328XRBIa5tSuAH3zZbwgYXtdeQkYfjPkZNNIF3wgzxKVTkwJJr5DWB2l0r2j/My4XZgifAApONeGz1Dk6g0zSgbHh4fCvlx77eHhEzO5jNTfV7ReuLeTh7H6XyBDESJwat04b8nyDm2wH8mJCxIWcrafrOobiRPZx/FxDMcelPZrpvEe7cp46lWwqjnd5sUDuJTvQI3lygekNSlTsjX0hq626Roxbxms04BzTK8MK4I9GAeDxuXsnNfHHt3U9oLTjMBegD26qvhjuRV/JQWUe35mfY9acjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+EehzIEnfxwlDqqMKHpuKWyABzW7K6USjWqTHlyXhA=;
 b=bYOddp/ficDz+05z9lVXjjdHat8uyF0E9Bd1zUqpBEkYcraTIpnhPPdm7UNvVG2hCf/0YkYseA/j9AkEhfJqBkhoHOMC41QbTgTYpfBvJ4WJYR3PGHDxid1A5n5yRTCjgYDV/EPJW/+mE8ejNnh6J3jnwAx6V+1QYpW4i2W0knc=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 SA3PR12MB9179.namprd12.prod.outlook.com (2603:10b6:806:3a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Fri, 1 Mar
 2024 09:19:07 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::55f7:70c6:e4d8:cf09]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::55f7:70c6:e4d8:cf09%3]) with mapi id 15.20.7316.037; Fri, 1 Mar 2024
 09:19:07 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: Robert Hancock <robert.hancock@calian.com>, "Simek, Michal"
	<michal.simek@amd.com>, "ben-linux@fluff.org" <ben-linux@fluff.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Topic: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Index: AQJcoxcIn4ZF6I4Ml1lr2IegqWo7hbAeKiJQ
Date: Fri, 1 Mar 2024 09:19:07 +0000
Message-ID:
 <DM4PR12MB61092C8804E50438DB36609B8C5E2@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|SA3PR12MB9179:EE_
x-ms-office365-filtering-correlation-id: ea607855-cad0-41b7-b8f4-08dc39d0a585
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UJ9NQg28H8Hfys0YafECMlOf4gRP746UPnK68iOQfK/gq1sd/SIU1JEP7lxvWeJTzO7521wVwAsjaYFBsNXh3gusbBnsJiix3GArRrThrLbbXO4Wq5MWgSfi4mNk/HH32bF5kSg+1ebQymiPXTfjZ4HayyOJh+Xt6QO8wtxaeePF7G6OMErL+MdfSigL9P76xI+LNBpwMql0Et+4QGnK5+Vk3qalAeKCqEqTu7G3R6Kl9wqWMJ4uTuaA5juZkTTqVyo68fHjUczTHI876VCZzVGULYAFDJcNbBiyuB5sif7eMf+mgh0OCybQsYCYHCvH0CqVIA0SI0VWX3+4/O40xtJg5kIWNjbdE2mZJCjQ6kd176GjdWcD2hkIQd/x7xc4i+jtLnZYpNnkZFVoHDMo2zG9Dfva9siMmyCVMPS1T2x68X3L8po0U5JEpCYS1MJJY5jkEtJndcuWKwXvV5XEPV4FHiBTFKitFmWbouHNkJF7bWuwSnvuQjHwPZGaq8+If722GlqptNiHeTrkNPuO2Tq7vqh9cfODeg9dXm48bNjA+OHFiKSbujPFgfSS26+/1Eug83elwY+UHPVan8z9FJAGV+B0ow3rSetWy95BiCK+VqhBlauIOTnWJZAmg0iZQjEwkJRxmcajZfaHrFQZtavun3CSYOouYxr4ITFmgldWY6qnOOuBB5AniiTS7kpjdehy+WdQH/zht0liB0OvoNWz580eSQD3wWENv+N2xr4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dFLOGyLml+juNuJhr3m5SO31/BIBhWV5UlMiWv9ZtaOJqxFNwd24HmlAiJ+z?=
 =?us-ascii?Q?4hfcIkkRV/jOHYFWaFbVQVyYOwDpkg8H7k6uGhxM2aUi5E2F7sdnUvusMNdT?=
 =?us-ascii?Q?m7jVqLq286g4qPUM0zu5gGAIjiLFJGMadtSYXpfBIle+3OOzUZjaTmE9OMRk?=
 =?us-ascii?Q?j4ckZKrbP2zpOjt2NpEuXXqTNqBvf46KleQHFCaYfuS00nq4s8SDFjPvkYuY?=
 =?us-ascii?Q?G37CRckoqAW9HrjqCVEKEq1rBM5WrCll/NMRJzzNiQsocaqGlsYaiz/r5ER3?=
 =?us-ascii?Q?Nscir4VXPIADPTEkBqoeqbb1/7coOBPafEUZQc7lyLqq3/uXtyAsPU3SgHXm?=
 =?us-ascii?Q?d0EaEiYywVxaJKp0mH878IbvULRAxYiwzL+mY2sGJ5vcVt8IHVG58bKANAK6?=
 =?us-ascii?Q?9bcPFIYDBli6dy+9YpN+YruhWXfpE0fhfKh6xj3C+u3mocWpcaPNhrK25ucw?=
 =?us-ascii?Q?vfOqMWDIOds87STH7H5ueJixk4ssZ/wN+vi6LUAvAJc75N3BVtf5OnMQzOSb?=
 =?us-ascii?Q?OjQ/evF1XObn+sQo73dly9jS4kxuEuz4AZxbgarOXGCAHuyx+y5WBV3uNRxO?=
 =?us-ascii?Q?VkpgWkLLUP9ZCtmt+f24mJ7ius3I9ox5IT+jEeX5mfA47xksSPztQizV4kU9?=
 =?us-ascii?Q?jMRFLoVinCK7IKWPC47qf9UJND+6hD4DF4apWBcrR15SzyCy/Zto9eV52jeF?=
 =?us-ascii?Q?eca1kowFg1F6QvUhUchaYA5IfejxAEr4Eu42PWSTSQ52n/BbhSs0/EZeAe+t?=
 =?us-ascii?Q?IVGkA+f7UfFLB2zIAce3bw9JlcTd81sK7aWuUiLxqvd8IJ7bg4WvuKEHpnrJ?=
 =?us-ascii?Q?4a5p4WKpUN9ftsQNtt45FJosnTPjZjKYlgDlUTFk/nCdFmOv8BhMn/DvsKK7?=
 =?us-ascii?Q?ygBbxq8wR+LxyNmTu1tU+TVKTQTiAV4o0bLSDp1NCgbmkP5vhdPALG0LU6J3?=
 =?us-ascii?Q?UYHgkIUPlUcdtEnhi/mOBBCvlEkNt9CGbuYvVMfXh/V+fQPf4Cqs/WCitahX?=
 =?us-ascii?Q?32eVsj0DapjeWTi1ms5wLsbN3RGlQOiKN+/uvRUQDLbZeMfVXYPuMsRhPXDK?=
 =?us-ascii?Q?MisEs2xulsUIXW4VTzsgrwmiuzAVIQ/mTJrurx3vrfX85TiaHZdXDvJC0ocO?=
 =?us-ascii?Q?wn/O6loVsogsL3Ntjhx1h4cW6mXLSFwlf6RpaIz5PeebChfzp4DQEEafyu1o?=
 =?us-ascii?Q?YzGK2DuQ6laYn16uUbYb3zkVRbeleSgBHE8bib3CSGIV68amIZFLDiBa+R1n?=
 =?us-ascii?Q?Wtk5Arq+8n9eNW/LwnmqNIJOpgrfv8Ef172hdpU7U6rVTwN78u+CPyldsZ4T?=
 =?us-ascii?Q?GpZM5WXkc642WSBNROooB0u2ULHcDFb59eq9y95kdEys8ifVUsR7ueh6yCma?=
 =?us-ascii?Q?BJBPnLtgPCZoQqiebcGMCsrioUqvOn/EfYftb5u8oz5z4mK8y38fvtxaGyiN?=
 =?us-ascii?Q?GrSZOdGWXwVEiS8DZv6OwSQEQ5EwWtPaImYs0SPKcBnzEK90qx5EKChyiZkW?=
 =?us-ascii?Q?WAq0QwaK7dAsD+7InxUI1dA/mb3G371bOlo+dPeiV1LAg9+QLiJFTIc0oAqv?=
 =?us-ascii?Q?dr2gn4KchWlF6Toyf/w=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea607855-cad0-41b7-b8f4-08dc39d0a585
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 09:19:07.2127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5EMwQ+v4KRYJWlNDSRxSdBfGsS5BU6vU8fnBCcTUAHhM1nVXqRkW8AjUECYobuCoYtjAreQruH6UPyRJ4TREFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9179


> -----Original Message-----
> From: Robert Hancock <robert.hancock@calian.com>
> Sent: Tuesday, November 21, 2023 11:41 PM
> To: michal.simek@amd.com; ben-linux@fluff.org; andi.shyti@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-i2c@vger.kernel.org; Robe=
rt
> Hancock <robert.hancock@calian.com>
> Subject: [PATCH v2 0/2] Xilinx I2C driver fixes
>=20
> A couple of fixes for the Xilinx I2C driver.
>=20
> Changed since v1:
> -Fixed an issue in first patch where an additional message could still ha=
ve
> been written to the TX FIFO without waiting for it to empty.
>=20
> Robert Hancock (2):
>   i2c: xiic: Wait for TX empty to avoid missed TX NAKs
>   i2c: xiic: Try re-initialization on bus busy timeout
>=20
>  drivers/i2c/busses/i2c-xiic.c | 61 +++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
>=20
> --
> 2.42.0
>=20
Reviewed-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

Thanks,
Manikanta.


