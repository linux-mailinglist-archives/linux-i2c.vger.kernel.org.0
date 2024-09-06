Return-Path: <linux-i2c+bounces-6331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D80AD96F8E0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8121F216C1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A501D3623;
	Fri,  6 Sep 2024 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="l5A4FmrI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0EC1D47D6;
	Fri,  6 Sep 2024 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638165; cv=fail; b=k035z9wKnIaB23Ujw39eN1g48TvitGe/TIF1R+tWaFxcsyAokyls9pguD0vEthnB4jmp2vkr25MDEsOPz/D4bUM7LWuPIiAgfEbISvQ5BwnVfEJtln8dknQvn5DkXpr2VyY8LARSlEuEIBerjNGZDoNvRcLH3NEf6T1r68wrH3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638165; c=relaxed/simple;
	bh=S5gfqC7sX+8XZxAdQxPuq5dXYPddWbTQ4lHWPmSun3M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rtnc37eEaVRaGMZz1TXasIizEnbSoy3j9ou6omiDih84K42FGWXmvn79xT8RKxaw6YtZa1yWMC4OAsyQ1ThMOJ5agXEM96OSVt+6eOAXQeGP2FsZOVmuqTMsiI+ND5EzAKJWU8TYRzKmcxFvGF0qgGtghloV0395MAuxYKa38Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=l5A4FmrI; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYLJVB27Dez73Ct1HKeg0Lq9cPP06Nr+9TwdVaJkVADsoe5edcf9icU/SG4VuSqG0qyUG3Miy/+zm5C9WytgLLGIs4Iw/d31ZNvcrAf2ZeuNbPQlSbCr7duvDVzln9ImzrqHAMz3Wtkm1MecD8vHVYQxEWxi4gVVaMl1w6x+l8q/Nb8QlBQM+HcQR4+ytlp8knfsgqDMnVoZLJ8E7fin7WaIJLL6NbH06yHFGOHZLml1XapxLAAu65PK8/BWGbBYW1LE8oz4ebZlL1si+dm31SLcsV16cs84kkt58BYMKys4r/MUUdMhcHN6N/3KPjhOV/6IkjhCZ3uB6JZMd0+zPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1fn9iDRBSjSdXhY0cbjh9VmUKMYVtZKCtUPqs0YcAM=;
 b=K6va0orL+/S6Sm6FDtSG5avnSKelAIU56rqCeORbXTlwIk1cqmus/NKZu9oBIF1wpDZQdQnkynb9fQ4vUZF/6niKsKgNMq+lTkPaB9LQW8SlJGCSNDm7DB7PpKaQR4tgdP0QRzu96XUjsjMEAItWHfqhyuSxOK43zUYj10nGUMO18GgeSP9baOYX8aqmm+hYO/debmfPe8NA/0ykKsKB+odnPvvJT2OXQ+nOxMeTMrYq9OpbOXE7hkYeZzaxOh7rw6dip9g1kw6ncxo1JeOVAdKWbZTasEzAF81lIiFSCgOh6icIHF8kVdipiF/v9+z40HzJXAQQPBEwDGdSc5Y1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1fn9iDRBSjSdXhY0cbjh9VmUKMYVtZKCtUPqs0YcAM=;
 b=l5A4FmrIVyorySOh2fm9bvIgVsUxfhTXrcaV98dUcX+mmKq1+XukzZqZwGgn9Bmgskthud/aU42/cmzHH4tDkAL8UvesqIiNXr52TXAdXZ3BsA3DNeOFLx/M8fR/R3xLvHLXQRs60elq+8qVeoHGADGnoytXk+o8jNhZQEf2N5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:53 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:53 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:19 +0200
Subject: [PATCH v8 8/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-8-dbd28a150e41@cherry.de>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15-dev-77eae
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PAXPR04MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: e07982fe-44a9-46a4-c44a-08dcce8c62e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nmk5eHowK0FaMHYzTGNLZTlMdEV1VzY2Q2t6VU5mTnpVYWZlUW5Fd2lGRTFk?=
 =?utf-8?B?ZWZpRmN2SGZVY2E4MFVxUlRRVnc2UEx3Vk9Ia1lmcUFjOFpnc0U3OFVhUGty?=
 =?utf-8?B?UkJXb2VGTW8vREdVVEkxNjUyRWpBdGU2Z0NUbUxaMEFGUm1tUTJWVVYrcmlt?=
 =?utf-8?B?cHh4L3k1TXVhdndKL3U2M2YxRXptNW1VaTFwMlUrVUloVmU1eVg4ZHlmUnB1?=
 =?utf-8?B?ZjU3Rm9MVlV1VStvNWRGRFhEMUYvSUFuemc5ZFdLc0NNZy8xcDRLL0lHQ0Nn?=
 =?utf-8?B?cWg5OFkwSTNGZDBqb1FMdzE3OXpiRk9TTnJDeUpubHU2a3FBOXMzZGdGYzJu?=
 =?utf-8?B?SVFndlI5RzRhQ1lDUGU1QmR1QkJ1TU85Wm9kMi9hVUVydTBUREgwYUVJMUx2?=
 =?utf-8?B?dldHVlpJVHNja1ZEeDdWaWJxRXZkcGN3cFkwVU5GdFBNSEVGL2VHYzA5U01v?=
 =?utf-8?B?bm9wSExQQkpJRUhGUlV3dms5SFB4UlV5Y0tBR051SVFqUlk1RHRqa3FwUVZF?=
 =?utf-8?B?UmJ6c0dYdGNsRDh2b1lFT1o5T0VjSCtUQlVmYXRTdG5uaFl6cHcvNVhQNW5R?=
 =?utf-8?B?Z0NseXpHQU45bjZXa0J3VEFUZTdHbUJUS2NJeDFKUk9nRUJaMFFadFdkbWdH?=
 =?utf-8?B?WnZyNzJLbzRRd3FIRUVxcjBHbTRQU016TG8rNjI1OXdVdk1mNHpIZWZqd09R?=
 =?utf-8?B?WlI1QzFLTDUvRGp2eTdhWnFLQ1dkMnhHRi80WU5idW83dXluTEhhUFpBMkU1?=
 =?utf-8?B?UnlKazgrZ0FKaVliUjJPRVowYldQUnFnQm50bENEc1FBeTA0eHJhVE9MWS9Z?=
 =?utf-8?B?NFhEZ2NlQ1Fha2F0RDhXbm1tRkMvNmNFMUNnazVvRnJWTHhxZDhSbVRMZTVh?=
 =?utf-8?B?V28vclRNaERDNmJsaFZ1Zk8yNElTamp5YUYvOGpOSi9aWWRYTFk3V2RIODZq?=
 =?utf-8?B?TnZGYk4yYzVCS2hONW0xbERyMUh1UHlNQ1lYSTA5MExLaVdKNDh3TnFWcDVR?=
 =?utf-8?B?OUQzNVY2V1RmN2g4UXVPODlQNlRCTGVGeXF1b0pPTi91SlRBTC9VTkhWVm04?=
 =?utf-8?B?TVRKTURyQTV6RitBS2E0L2szcWpXMThwUEFNV2NLS0JpN1lzT01zc25KT3Vs?=
 =?utf-8?B?aXNwcmVGTzZUK0lMYTZIU0VDLzNPWmxiZWZ2NDdlMm5zSVBNSlVjeVdaeW5M?=
 =?utf-8?B?NmxKNU1ZMDFzMDlRMFBFTmxmOWVVVDhuaEZSb2pOcUhCb3lGK3QzTkIvb2sz?=
 =?utf-8?B?TEZNMHdSN3RkdCt2RzFlZnFJSVNGVHFuekhHS2JqeEJ0NDdIWTgwVm5Lbno5?=
 =?utf-8?B?MjhCWmN2OGpuZ1hId1VUZEhWL3kzdzZrR3lyR2NwY05md045QjMzRHlJM1dv?=
 =?utf-8?B?UFl4RW16TE5xVU9IbXU0RUh5MzRsMXcwdHkyUVhtclB2UnlDck5PUngwejYx?=
 =?utf-8?B?RUlNT3ZhcjBtUnBqTjJZTDB2VjZtZlRYaGJJeXVYNkIwQ3grTmEyb251ZUxB?=
 =?utf-8?B?ZmliNmR2ZllkRGovYXhpRnU1RTZFQm1kdmd6RC9XTzFCU2RJOXVXZitmS0Yx?=
 =?utf-8?B?SkE2R28vY1d2ZXNBaXdzaDl6RUlpU0dsdDUzOUs1bDQ0RGYzWGQxQ1h3bkFN?=
 =?utf-8?B?am5ZQzRlUytqelkzOFZKZEF1QWtOc0NZdkZsSVorMEM2TlZWU1VBWG9qYjZj?=
 =?utf-8?B?VlVuVXU1K1pjb3NrbTRNZmZpMThhdkxhU1FyLzhrUzA0QVpHMnl5VjNHb080?=
 =?utf-8?B?cUpjamlaMzJHTXpONG9aZ01LV2dKeExNR1JsaEs2ak5pQzdsOEg3VE5uMi9i?=
 =?utf-8?B?SUpGRG83emVnR2prdnRMTm9FU3hXa1hzeHhKQUY4VTE3RUZ5K0tuZmwvcXdt?=
 =?utf-8?B?aTk0M08yRE1RMVRoSXFIeVhFUmFsVTA3VGswMks2Q3lpL0lJeFhKQTByYUhU?=
 =?utf-8?Q?0eAxvA/R5Ag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDNBZjBMUFpIWFVkbzJnaVpLd0lJUHBmUzZJT2NJdldRdjE0ckgrU2JiNUNr?=
 =?utf-8?B?Ym8xbUFFNUs3blhPRFNhL2RQbVdtQ1RVVEc5dWRGelkvQXBod01yTkF6REUy?=
 =?utf-8?B?anhocS8zWEltVk5tbFYveDh4SDRLWUNiWEY3eDdkT0xrM2hzbS9NV29xU0lw?=
 =?utf-8?B?ZVNMdE5sdFlmNWJtaFRFVlV0aWN6UE83UUdaaHVIVDgyc2ZHSVZwRFJHOG4v?=
 =?utf-8?B?Z29uZzdidVRFb08veXN5ZGlUL3Njc0tGRm5BMHZQdTh6N2JXTHNGdms4VzlX?=
 =?utf-8?B?a253a0xQbXlWYU52NGhFK1owQ0JpQ25FZmw3UEM3SVRscHBDUGZXRXhSRHNr?=
 =?utf-8?B?eG9IdFJzWlJpVGdpT0YyYUhyRWFqWGFHZ3g3YVQ4dU5Mb3I1dC8xRWNzMzVz?=
 =?utf-8?B?STVzMlVnVm5pQ05GaW5LRldTQU93ZXJONklid1FkcEVFVjAzcFE3MFA0R3BC?=
 =?utf-8?B?YXRtbGFxSFJ3aUdxTjd6blYweHljRFlsQVgrQVJHS0grU0t3TzZ1ZEhJWEw2?=
 =?utf-8?B?Zkt0WGNINm9hdXFxNGdyTkkyRkptbk84eDZOZklDemV5SytxbUg0dVQvZDdC?=
 =?utf-8?B?Sy9vdlBDaWFnbU93Y1BXVmxzTnJYaGdEV1ZLaTM4M29pN2tYbW9FWHNHc1lj?=
 =?utf-8?B?TUVtY3diVFkwMVdLQjJuY0NxSzQzcTEzdnpQU29NZ3MrVmtWMXJLOU1Md0ZQ?=
 =?utf-8?B?ZXZraUZxVDJlZ2t2eVdlVDlLZmF5NnQxVGpwcGRkcTQ3Ykh4OWRabXdSYlp1?=
 =?utf-8?B?a0FxRkRFTDBjMXFtUmhRSWJyU0xPR05OejJrUDg3NzRacHdTTXBqL0lGaXNW?=
 =?utf-8?B?bE5iRSt6d2gxNjh3TEFXanNoOGJ3STBXYTR2RXBFYkM2UUpaVHRkc2VpKy9I?=
 =?utf-8?B?Q211akJuYjJ3K0tTV0kyNjl3dWlZQm9qMHJ5aWZNWHpFQUxiRTA1clVKU3lJ?=
 =?utf-8?B?cnJpMEdVV3g1RFB2MzV6MXd2NnZSRms1MjF5endNTlZuYXRDUlc3elJGcEJw?=
 =?utf-8?B?MXREelZmdm0yQ0VxWGpZamo2NDRYaWN6VUhCNHAzT1dNd1F0SmNYYzNOVDhV?=
 =?utf-8?B?TnNML08zOE5CY1B4VzBDUkFtcWhOTzYyYWtoWTdDMUZYWDlxdDUrbGY3UzN5?=
 =?utf-8?B?cktsYVRMQUdWME1XUlEwYjBvU25Edmlqemg2R0ErVEdRdS9NMEJtYnkreUMv?=
 =?utf-8?B?MXJoVVVnblJXSFpwSG4zRXlhdVFFTEgvQWdlUkNuVTVrV21yNyt5bGJRSDZr?=
 =?utf-8?B?bWhUeEMwQ01vZzc5eWJQNnRiNVVZYmJMaXdpRlFnSTFyTDhjaTFlc2VFdElk?=
 =?utf-8?B?eUJKc0RyZzNNUEdkNUk5OHQ4UGtOZ0grMENPVkJ1YWZJbzJXRlNKT2VvN3du?=
 =?utf-8?B?UHpIc3FDVXFZN3ZOTFBPa1NVdXl6aEthSHJGYi94cGcvaVMyNjRLVWlYS051?=
 =?utf-8?B?SE10bmdOV2tGRWxGTDlIOGFBTmVyWDBDWUVwMXpHZi9iVmxZeHJHYnE2bW4v?=
 =?utf-8?B?K2ZXM1RCVk5uZEMrUjB0NURPV2RBUG1wYThzcjNmL1ROL0ZsYUhGV1BSVjRj?=
 =?utf-8?B?dUZZUmdkaitaN1kzeXV4UFdVSjRmOWszQXpsOHdoak5oTlFvclVibnRJb2dh?=
 =?utf-8?B?V2VyQ0g4VE5oeEhQYnhNNTUvck5iYkVZRnIydzBXT0xnWWFhVVdVRVBvTEIy?=
 =?utf-8?B?YzBDbHFrZFRIS3ZYdTVFQzJaTXc2a0x4eFRiNzBLUlk0T2RUSzRKV2RJdWw2?=
 =?utf-8?B?UUx3WlhHcVRRQWhyM0FGMXdJdDNDWkZXUmY5ZmNFUG1WUVpKU2hpeDVkQUNF?=
 =?utf-8?B?TW9TMGk0THgrTUxQTmtrUmdFbFdtaDBwK2l6RnFVSERRY2xKd3ZiRy9RM1lz?=
 =?utf-8?B?NGZwLzhFMDBWOHExMGhxbmU2NGNuTHM5UGFZTUhIUC96TGVmb052ZjZ4VFVv?=
 =?utf-8?B?ampnVWxib3REVGhqV2pCVFFyZEpFT3JiTkxxUGxRejUyZkQwMEhqbW11ODlV?=
 =?utf-8?B?QU9TK0NORlZwbk5rV0MrdE1JMG0rYzdMR1VYWGJ3VDE0Um4zeHQ4and4STM4?=
 =?utf-8?B?SXVCTVprVEJKMXhISjZJNTN1VERybm9WUjJpR2p6TWN6dGcxTUZ1ME9CTWs1?=
 =?utf-8?B?L0hiUC84eERNL3hvemRrNHZaVWxGbVpkS0Nvb1EvQ3ZmbXdpZ3RCQ3REQ0Jo?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e07982fe-44a9-46a4-c44a-08dcce8c62e5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:53.0505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3Vps5GHWs7Y64NjK1OqU95uVd7iqxTWYgIPpwKwy3z1DOl3cI9jr6ccf/ZcN//v4FTEsjhDF9FYbGAUejzPyuBOlRWDFiXCuhngDh6sef8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patches 1,2,3,4

 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..a683ed3e2fce 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -292,14 +293,25 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	fan: fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


