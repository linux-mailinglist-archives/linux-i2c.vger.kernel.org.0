Return-Path: <linux-i2c+bounces-14155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79951C6CDA5
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 07:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41F654EE10A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 06:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA3031329D;
	Wed, 19 Nov 2025 06:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RgwC3K+K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A255E3128BF;
	Wed, 19 Nov 2025 06:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532173; cv=fail; b=gVSk25A8yqcxYD3d33vJkrued2pb7ncpmm6ltufCXpfYW+pqX4gzzmNhGdMIAYLS3U8dm5hSLX6mUjuiss92wgrUSG/i6+qbK1rTct0sW87AY4+6aHIws2dtyqE0juN6HQ7aFxH6c8laKDc/JLQXqfOPVJ/vcc7uWmtr1UIWOwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532173; c=relaxed/simple;
	bh=DXJuLhM9DOVIN0L8tGbVnhbl+Zd/RuDvgbOtx2it3YU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=idQ5fiFvT4depgPIEQVDn7bj9QJnXiyFthYMSq/d09UObE89ZkLCb92q1/ZOMqmaQKWOdSI7fPJJ3T8pC7ssXYVMcSxgLfndHZDZ+XtPKpH1JZeCly4aNyPb8r/xzRVLpnmxKctYyfpxNZSRRAU5wCpkHFZe66Q0jYREQ9gR0/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RgwC3K+K; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFBOxVdJp/zjf94NL5cOKxIdb0OMAMg0sy3HoKvNYEKlRFpOVoC8GxAlVbIflsKwR+3ZORhfwPxPlQk8PXW6WKtu0Sv5NIKFq6qu7kvp9ki8tM/0K+clzZX1oC+vBokq7mzbyRX34UTEA9UEprc7GcKcMRpLnNeywRhWdR1CBITSh2woHE69hN812509LYsi9JogiQO5XdH2Oan/LGaMJvNjjlXXk/gAM327XTnvJTlTQ8LgscDrts4inOC3qkQJjaaq6xXjvCz0DqEkNfsWj+0mE1Iqbc+lxSXDhtqbvL+8MdnKGqO/NzTu977lhEmVdGGNjm5/eGNeHONFf1BxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXJuLhM9DOVIN0L8tGbVnhbl+Zd/RuDvgbOtx2it3YU=;
 b=Ts++vRgz6mBrlvtZDV0uwi2E8vgLFq7EH7MB/mkAlxD9uemF6BEjkEcFmMjPry08W/usPzDRBWOnU6rl5fmJS4jftsllbJo29Wh9PPz1KgHov/LmDAxDSiJ0zRuGDE7MvADMOY1HcfCkuaDEmxq+eajw3YCbwd23AC9sT1+BO6qf6Gw2jX+hkD3e02RkDnjtzxAhbte9fUJZRegfgk5f7gyi+oWTkrJs0LbEt6LwkXbNZIxRU7UXYVLZk507bs0qay5PNY/qZpW967pD6+D3KkZpJF+yeq5vQFcZcPfHtXRmK3M7OZ3IeQoPCyuJTa1KfFdEuENyjqk+agD+xygY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXJuLhM9DOVIN0L8tGbVnhbl+Zd/RuDvgbOtx2it3YU=;
 b=RgwC3K+KcyDF+0Cqn+Sm7k06hTELt9STjxQv2G2JO2CF8nHsFiX4s8wibKunvpnKT7qoCJZ5Soy3twZ2WfKdyWlj88/8D1DCB3PyZ5YBNs8rhx+lW4ReYhAjfC47GHNoJzJ4hBspH9Q5Dpakej4ZfE3TjsoAPOL7t5ljETWPK91vBZ30/OaDIn7wm57i0qn+7l6rP9L/F9cA1ebPOl2fAhTxPXcIk1kPvOPy9VF+C8xQPU0wJlPtiF0WHgaSbETRFKi5L/KnDaDEyCCS1GCevTzFSiF8g3xdzCMqe4VC98GtoQ0cYxL2Xiy+Wz8i1jcZMGh+NPhfvntB5w6VAc9BPw==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DUZPR04MB9918.eurprd04.prod.outlook.com
 (2603:10a6:10:4db::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:02:46 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:02:46 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Thread-Topic: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Thread-Index: AQHcWFujTDvepCQDEkyt7wSo+0A7HrT4l4iAgAC7qCA=
Date: Wed, 19 Nov 2025 06:02:45 +0000
Message-ID:
 <VI2PR04MB11147CEB59F804078F2136107E8D7A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251118071837.1419558-1-carlos.song@nxp.com>
 <aRyXjUF+x5BdK+uS@lizhi-Precision-Tower-5810>
In-Reply-To: <aRyXjUF+x5BdK+uS@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|DUZPR04MB9918:EE_
x-ms-office365-filtering-correlation-id: a6756c91-8352-45f8-60fc-08de273142c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODhNNXduMDI3ZEk5ZUZjMDZkK3dua0MrSWJ2aFY1YnZ2N2owbDh3d2UrQjRx?=
 =?utf-8?B?bmEwakxjNjB6UUEwM0I2VWk4SEhhNk1JTHRPUktLRXo0VkZIZUdqQlEreDkz?=
 =?utf-8?B?d09kN25IRVpiZXc2QXV0dkVnNW5ESFgzYm9yTWhJa3JPb081VGgxSUVlUkY2?=
 =?utf-8?B?NVh3UXQvTnJ0bXFZOTd5aUdidG1VUXZJQ1VtREhLQzFIVGZrbHFLcDRWbVI3?=
 =?utf-8?B?a2FVc1piRnpDQlNvMmN2c3RoWE9BS1g3bnhDOStGdFE2RFZadTZMaXdXZFhn?=
 =?utf-8?B?V0hMSkpKRU9JeXozU3BCR1NaWkdrMWx0NWgydTJCL3YxSnFVeUdnTjJES20r?=
 =?utf-8?B?SzRmYU5wdk9KQXA0ZUxIMVZnUGZTYUJ6b1ZSclFWUXE3NnZ6MFgya21IK3hV?=
 =?utf-8?B?T010SmNKK09Eb3J4ditIKzZ1bjFHamw0bTFoQXRoeWRCYjN3elQ5cWtxaE9Y?=
 =?utf-8?B?MUw2c1E1Ry9yRHN0V0lSdHYwb3RhRjVTK0RnUkJqUHM3VjA1RUhiYUltMC9N?=
 =?utf-8?B?UW9jMXAvTHo5WEMxdFZIellUc1dMQ3dPcDZ6Q2t1WGo2MVk2OTZOMC82enRp?=
 =?utf-8?B?bUtRZG5acExCSG9IQjBUcGZnSE56SXVBMnJTcHVSNjZ1M2FQNUFGVUlNRGlu?=
 =?utf-8?B?QTdHdDREaUxBWU5pd1BYSG5oNjBxMnF0SzgwNTk2QUxody9hc09NdEhUNll2?=
 =?utf-8?B?MzNSTTV6VGk5MWJmREhDRUVlQUJBNTVsMTVlaUVVYjRhNFl4ZW13ZG96S2or?=
 =?utf-8?B?bE1CK00zdnErYUJFSnYrbG8wOWtOZ2FKVWV1RjJKQkhyLzhacnpRWnlPUmJY?=
 =?utf-8?B?SjdXYU0xQW90eWtJcldMd0dBMTVCN1kyelZ1Y1UyeGQ2NEpqYWE2WlZIY3Ex?=
 =?utf-8?B?N3diMllRNlpPNHYvZVFyNDhzVHBYMFlWdzFyaTVsQTJtNDU4bmljalViekZM?=
 =?utf-8?B?dE5QUzJoQm9KNlNiYlhsVFR6SFRrNFB4QTBTLy92eENidHpXZzRvU3JBYVF6?=
 =?utf-8?B?K0dvL2FVUjBFYlZQenM1VlpobGxhVlVNWUU3ajMxNWYrOU1IVkE0R3B1VUk0?=
 =?utf-8?B?ZlZ4YVJWTzhBV0J1a3h0dlpLblIzalRBcHg5Z2QxNUpRNE15dU9xdWVYTXFt?=
 =?utf-8?B?V2kwVkpQNWptdFpKR2t3Zk1mQk94SXNnME5mcTZsNlFuRjFubU5TK25MUGVa?=
 =?utf-8?B?aFVtR0FCTG9uUVpvaDhOMXNQVUdpWFVGKzBqYjc2TDBxTy9xMXAydTU2SnJu?=
 =?utf-8?B?S0hkL1hzbGdTZHpBaG0zdTJadjUwVGtmQnJZeHIrR0JuTTZsRVVQNkljekt0?=
 =?utf-8?B?cGlSenpMUVNvY2VFQWs2S2tkVHdRd1hNVFhhVTZGNGNzZk0yaHNSeDJlS2FD?=
 =?utf-8?B?NnVoRGhDdWF1c0xJN3YxRU96RlpNZFRRajhQQ0hnbDIweEZORFVmNGwzMEM2?=
 =?utf-8?B?Vmhqb3ZXQ3hXdHNnRVpVRjdjOVhHSHViRHpnT0gzZnpHUkZ0aGF6N1ZFNEw4?=
 =?utf-8?B?WURYamtYNWQyWTBtUGJSUklNbHduVE1aVWZ3Zmk5aUhxN3hZYzVuTnR1MHpv?=
 =?utf-8?B?K25FdTBUZCtIdEJXK1RkcVFBaVEyZ29ObW52N01TSWRkVFh4aTlrd2FhTnor?=
 =?utf-8?B?cDNBNUdyRjkwam5rVmF5Wm1kalk5Y1U5U2N4Q2EwaldVZFpNSEFqRVQ5MDZp?=
 =?utf-8?B?eW4xanBjTmRhczl6dXJPT2ZMb2pFNENUbWhTa0w2ODFDNXpEZFZKbHV4dEY2?=
 =?utf-8?B?b2o0eG1iOVNSeVJSS1R0RHRndjNQQTlGVXo0RXZPbXAybFdnMFNrajdobjJl?=
 =?utf-8?B?TTBiUmR5YnJ0Qjd0RkE1QWN4VnFETW5nR3JnREcxYTVrUzJWTmVXZzU0K25T?=
 =?utf-8?B?aDBkRXhrUnNNSlRsUFlXRm5Ka0t3Z01JZG5SekQrVXc2OEk2MmNzTHp1NW5a?=
 =?utf-8?B?OXV1MjAwakd6Q2U5ME1xSDlNekM1QzQvM3RmcEZ4eGdSdHdhTlJiQ3BwOE5F?=
 =?utf-8?B?bU9NbU5MT1JIcjkwS2RHNk9OckoxUnczYitERnhyZldXdG1RdFNiRk9sbkw5?=
 =?utf-8?Q?AgYrA0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWhyR2IrZ0xxQTduMEEwM2lobGErM1B5Y1JCQlV4RVR2cVMyYkVJZVJaR1dC?=
 =?utf-8?B?YjQ1blhDajg2bG9WNHRLd296KzExbGt3UUFkMWJTSGYwZHZQcHpnTTlncFVD?=
 =?utf-8?B?YU5vMXl4QnpSdnVKSnY3K0pSYS9GVUhYL2txK2pZQlBtdEZic2RPZ1ZwVmJn?=
 =?utf-8?B?K0cvYUNGaE9QNDhKZThxRGwwcGFtU0xyUUJVV1pWYmdBTGVyUDVPN3RYSDhw?=
 =?utf-8?B?TkJVd2JibDc5NEVmYVJGbUVSaVorM1RBN2FtSUlKTTViUUVmNzduUjdPOC9P?=
 =?utf-8?B?Yko1c2VCeU5Dd2dTWlpKUElHditldjAwYVhiZ2ZlZFNQbngrMkNOalJOS0t2?=
 =?utf-8?B?dUQwSDA1cmRuWnkzY3pwVWJPZG15VmVMTVVVQWx5YzhZNTBEQVN4L3cvYlV6?=
 =?utf-8?B?cnpIOW1QNWFyV2hWcjJuVHV6djR3Tk1XVnVkWlhGTHVJM3JoRFN1dmhTYWll?=
 =?utf-8?B?Z2JoUWJYS04raWNPSlRSWUtSM1Q0RnZMUThXOWk4cWRVR2xNK2ZWaXBHY3cr?=
 =?utf-8?B?aDN1bWJ3ZmZHelA3a256aGQrZTFxak12VlQyOUNjN2FZdEcyYURmL1V3SjBL?=
 =?utf-8?B?aWJVd3V1Z0tjZHNsekRwRHl3MHV5MjVDUGRiai9haDMyQVVXOEtCSXUvU1Fw?=
 =?utf-8?B?c2NiTk10OUZnanRETFZOYzA5bUVtRTRrd0dsYUtGWEpiZkMyb2pNd1hUdndE?=
 =?utf-8?B?bWQ5VFVUT1VTaXVpVVpKUUJhRWRDUmJOUXFoYmNXV1ZDbUY4M0xHWWU2Z2hH?=
 =?utf-8?B?V0Zzc21XM1RObjJwVk5mdmc1QksxVnpSdFRzbG5YV2NKV1VKRE1qdTMyV3Np?=
 =?utf-8?B?M2ZPSE9ZVHdYb1lpVDcvSGYwOEhtcVBETFFhNnYySzN6QURwNS9DaktRNDJJ?=
 =?utf-8?B?UlJkYWVzZUo2djVEb2lEcGJWejZibGdvRFp3VXZleC9OdDc5eXZRakdYM0Ju?=
 =?utf-8?B?a2JQUVJuSmJ2blpDdDRvVG10b1JiU0xDRnp5MTVUMjcvUU1NVi9vQXFDeHhp?=
 =?utf-8?B?ZVdXaGQ1MmRxN25GT3VKdm1mL2FkVmNNYlhJd3ZPN1M2R1E4dkVCemkzaFpt?=
 =?utf-8?B?ZzNMbmJsSFVSelcrOWtValRZYlVwQzYwS3JDdFVHRk01OGtaTlVHWEc5YWdU?=
 =?utf-8?B?ZXhiMHI4cGRJSmNtNk11TTMvUjFKZHZ2TlRUV20zeFkwK2NXLzN5djRtcVZZ?=
 =?utf-8?B?aUdaK0poc1YzbGxtVk1sUUVIZ1NwSStPMXFCcHI5UDlxNUJJd2xqVTBDNG0w?=
 =?utf-8?B?eUZiVXN6Q0pSUWdWWHdGbytDTUs0VXhQU2ZLcGNtOTBjeUVOWUFPRlB6RHBx?=
 =?utf-8?B?QU54Y0s5YnppOS9KMnhNUk9aRGdWR0JZanpNMzJWRDFBZnNzVXJPMTZUZm5l?=
 =?utf-8?B?REIwVU9qdzB5ZStucFJMR2N4eVdQeUF1dlFXWmlsQmVWekJqaUd2blMrVy8y?=
 =?utf-8?B?NU5EZHNVWFJQTENRcFNYMnk3WEdFWlBPd1VucmduRi84S1BVWXZZNzMwdlla?=
 =?utf-8?B?d0tWQU41YWRoMlJWLzRtUTczbEFqNGRURTVzUm4wUE5TcFlKVTgvQ3hMV3Z0?=
 =?utf-8?B?WTJhSzY0WEVHcm1WelE4enR5S1VOWTBXYnN2d2hnMVpGeFNHdEV2V3hXUUZ2?=
 =?utf-8?B?djl4Y2xSZEw4NDh4TEtuam9HaTNLV1l4aWJ0WVBwYzIxTVdxVHk0SW1vWXN2?=
 =?utf-8?B?R2xCekJWaTlzb3oySXh2WFBHR2t3Q21xUjJvSnJNYVFkR3pabzFvdCt6WWlI?=
 =?utf-8?B?Nk9FTDd0UGJEZGJGUHFLWElYLy9oSTl4UDNkUUtYVFZocWJ1emlYZHV2ZGNQ?=
 =?utf-8?B?MXRvK0M2YWFQbERIbEVWeEhYNkN1WVU2WHlYZWRIV2VGMlZGWi8yNlREdTlu?=
 =?utf-8?B?cGNJYUkxNkRCWFRUZGN0K2FLb0hicWwxTkdLVTZSd2lucHpGZFNTaFZvSGlZ?=
 =?utf-8?B?QTl4ZWxmSlg4ZzlQckpqR0J6N2dKdkFMWnZOWEMxc3dRUWJhc01wcUhVRzBT?=
 =?utf-8?B?RnpRVjB0VlFmRjZJc252Ym5GL0JCTkdnQTdzaXNGYStKZDNyODZDTENIUFoz?=
 =?utf-8?B?Y2VPRlE4dXlkTHl6bVIxNGd0WUtZRG9SUTlYYVZqbjA4YXUxdnRKVlByM3lR?=
 =?utf-8?Q?H5pF2fYlbh1RfBJaWOcNSWh+f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6756c91-8352-45f8-60fc-08de273142c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 06:02:45.9759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kIMQQDITIg+EujcXBBMlz7IMiDlo28Fqk2D2AoCevTYC7FxRitXfwV1lXyShwZfVOjL5pTjKzLS5Ojjp68Xjyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9918

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsgTGkgPGZyYW5r
LmxpQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE4LCAyMDI1IDExOjU4IFBN
DQo+IFRvOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4gQ2M6IEFpc2hlbmcg
RG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBhbmRpLnNoeXRpQGtlcm5lbC5vcmc7DQo+IHNo
YXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBwZW5ndXRy
b25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3Jn
OyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gaTJjOiBpbXgtbHBpMmM6IGNoYW5nZSB0byBQSU8gbW9kZSBpbiBzeXN0ZW0td2lkZQ0KPiBz
dXNwZW5kL3Jlc3VtZSBwcm9ncmVzcw0KPiANCj4gT24gVHVlLCBOb3YgMTgsIDIwMjUgYXQgMDM6
MTg6MzdQTSArMDgwMCwgQ2FybG9zIFNvbmcgd3JvdGU6DQo+ID4gSWYgYSBzeXN0ZW0td2lkZSBz
dXNwZW5kIG9yIHJlc3VtZSB0cmFuc2l0aW9uIGlzIGluIHByb2dyZXNzLiBMUEkyQw0KPiA+IHNo
b3VsZCB1c2UgUElPIHRvIHRyYW5zZmVyIGRhdGEgbm90IERNQSB0byBhdm9pZCBpc3N1ZSBjYXVz
ZWQgYnkgbm90DQo+ID4gcmVhZHkgRE1BIEhXIHJlc291cmNlLg0KPiANCj4gQ3VycmVudGx5IHRo
ZXJlIGlzIG5vIGRldmljZSBsaW5rIGJldHdlZW4gdGhlIERNQSBlbmdpbmUgYW5kIGl0cyBETUEN
Cj4gY29uc3VtZXIsIHdoaWNoIGFsbG93cyB0aGUgRE1BIGVuZ2luZSB0byBzdXNwZW5kIGJlZm9y
ZSB0aGUgY29uc3VtZXIuDQo+IA0KPiBUbyBhdm9pZCB0aGlzLCBzd2l0Y2ggdG8gUElPIG1vZGUg
aW5zdGVhZCBvZiBETUEgZHVyaW5nIHN1c3BlbmQvcmVzdW1lIHNvIHRoZQ0KPiB0cmFuc2ZlciBk
b2VzIG5vdCByZWx5IG9uIHRoZSBETUEgZW5naW5l4oCZcyBzdGF0ZS4NCj4gDQo+IE5vdGVzOiBJ
IHN1cHBvc2UgRE1BIGVuZ2luZSBzdXNwZW5kIGJlZm9yZSBMUEkyQy4gRG8geW91IG1lZXQgdGhp
cyBvciBvdGhlcg0KPiByZWFzb24gY2F1c2UgRE1BIEhXIHJlc291cmNlIHJlYWR5Lg0KPiANCj4g
Tm90IHN1cmUgaWYgYmVsb3cNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZG1hZW5naW5lLzIw
MjUwOTEyLXY2LTE2LXRvcGljLWRtYS1kZXZsaW5rLXYxLTAtNGRlDQo+IGJjMmZiZjkwMUBwZW5n
dXRyb25peC5kZS8NCj4gY2FuIGZpeCB5b3VyIHByb2JsZW0uDQo+IA0KPiBBbnl3YXksIEkgdGhp
bmsgaXQgaXMgZmluZSB0byB1c2UgUElPIGF0IHN1c3BlbmQgdG8gcmVkdWNlIGRlcGVuZGVuY2Uu
IEJ1dCB3ZQ0KPiBuZWVkIGtub3cgd2h5IERNQSBIVyBpcyBub3QgcmVhZHkuDQo+IA0KPiBGcmFu
aw0KPiANCkhpLCBGcmFuaw0KDQpFRE1BIHJlc3VtZSBpcyBpbiBlYXJseSBzdGFnZSBhbmQgc3Vz
cGVuZCBpcyBpbiBsYXRlIHN0YWdlLCBidXQgTFBJMkMgcmVzdW1lIGFuZCBzdXNwZW5kIGFyZSBp
biBOT0lSUSBzdGFnZS4NClNvIExQSTJDIHJlc291cmNlIGJlY29tZSByZWFkeSBlYXJsaWVyIHRo
YW4gRURNQS4gV2hlbiBJUlEgZW5hYmxlZCwgaW1tZWRpYXRlbHkgc2xhdmUgd2lsbCB0cmlnZ2Vy
IEkyQyB0byByZWFkIGRhdGEgYW5kDQp0aGUgbGVuZ3RoIG1lZXRzIHRoZSByZXF1aXJlbWVudHMg
Zm9yIERNQSB1c2FnZSwgdGhlIERNQSB3aWxsIGJlIG5lZWRlZCBhdCB0aGlzIHRpbWUuIFdpdGhp
biBhIHZlcnkgc21hbGwgdGltZSB3aW5kb3csDQpFRE1BIGlzIHN0aWxsIG5vdCByZXN1bWVkLiBU
aGUgcm9vdCBjYXVzZSBpcyBmcm9tIGhlcmUuDQoNCmRldiBsaW5rIG1heWJlIHVzZWZ1bCBpbiB0
aGUgc2FtZSBQTSBzdGFnZS4gQnV0IGluIGRpZmZlcmVudCBzdGFnZSwgSSBkb27igJl0IGtub3cg
aWYgaXQgY2FuIGhlbHAgc29tZS4NCk1heWJlIGl0IGlzIGJldHRlciB0aGF0IERNQSBtb3ZlIFBN
IHN0YWdlIHRvIE5PSVJRLCBidXQgbm93IHRoZXJlIGlzIG5vIGRldiBsaW5rIGZvciBFRE1BLCB0
aGUgcmVzdW1lL3N1c3BlbmQgc2VxdWVuY2UgYmV0d2VlbiBMUEkyQyBhbmQgRURNQSBpbiBOT0lS
UQ0Kc3RpbGwgY2Fubm90IGJlIGNvbXBsZXRlbHkgZ3VhcmFudGVlZC4NCg0KSSB0b3RhbGx5IGFn
cmVlIHlvdXIgcG9pbnQ6IHVzZSBQSU8gdG8gcmVkdWNlIGRlcGVuZGVuY2UuDQoNCklmIHNvbWVk
YXkgRURNQSBzdXBwb3J0IGRldiBsaW5rIGFuZCBtb3ZlIFBNIGNhbGxiYWNrIHRvIE5PSVJRIHN0
YWdlIGJvdGgsIHRoaXMgcGF0Y2ggY2FuIGJlIHJldmVydGVkIEkgdGhpbmsuDQoNCkNhcmxvcw0K
PiA+DQo+ID4gRml4ZXM6IGEwOWM4YjNmOTA0NyAoImkyYzogaW14LWxwaTJjOiBhZGQgZURNQSBt
b2RlIHN1cHBvcnQgZm9yDQo+ID4gTFBJMkMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBT
b25nIDxjYXJsb3Muc29uZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWlteC1scGkyYy5jIHwgNyArKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWlteC1scGkyYy5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+
ID4gaW5kZXggMmEwOTYyYTBiNDQxLi41MDUwZTE0YTk5MTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gPiBAQCAtNTkyLDYgKzU5MiwxMyBAQCBzdGF0aWMgYm9v
bCBpc191c2VfZG1hKHN0cnVjdCBscGkyY19pbXhfc3RydWN0DQo+ICpscGkyY19pbXgsIHN0cnVj
dCBpMmNfbXNnICptc2cpDQo+ID4gIAlpZiAoIWxwaTJjX2lteC0+Y2FuX3VzZV9kbWEpDQo+ID4g
IAkJcmV0dXJuIGZhbHNlOw0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICogV2hlbiBzeXN0ZW0gaXMg
aW4gc3VzcGVuZCBwcm9jZXNzLiBMUEkyQyBzaG91bGQgdXNlIFBJTyB0byB0cmFuc2Zlcg0KPiBk
YXRhIHRvDQo+ID4gKwkgKiBhdm9pZCBpc3N1ZSBjYXVzZWQgYnkgbm90IHJlYWR5IERNQSBIVyBy
ZXNvdXJjZS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKHBtX3N1c3BlbmRfaW5fcHJvZ3Jlc3MoKSkN
Cj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKw0KPiA+ICAJLyoNCj4gPiAgCSAqIFdoZW4gdGhl
IGxlbmd0aCBvZiBkYXRhIGlzIGxlc3MgdGhhbiBJMkNfRE1BX1RIUkVTSE9MRCwNCj4gPiAgCSAq
IGNwdSBtb2RlIGlzIHVzZWQgZGlyZWN0bHkgdG8gYXZvaWQgbG93IHBlcmZvcm1hbmNlLg0KPiA+
IC0tDQo+ID4gMi4zNC4xDQo+ID4NCg==

