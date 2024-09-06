Return-Path: <linux-i2c+bounces-6325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33E96F8C8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97494282E69
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B90B1D4158;
	Fri,  6 Sep 2024 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="VJbtZtj3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B81D3634;
	Fri,  6 Sep 2024 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638159; cv=fail; b=ERkD1H6XcoMix2+3W8QY09kTqQ3RkhtARS6UauWwKgYJMTg4jQWxfP+kQyrn52H6Ti7RHOg/VUIF/OAlZfwaRv9Kk1bfAFbTacpDsuEbAYMhkQCgP3/EnDYRfO4bDa8uuiMe7iohXd3XXu5Q/6L9bIhfB/s8KIMgk2pmEsGGQJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638159; c=relaxed/simple;
	bh=1vyCn1ZWWjSD8G9/F1mf2hGEqgOz8Sq72Q/WY6p79q0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A8aNA1Modyjv9ZPKwHruJGcR1/1FPgXPfhldz0nkQlng7linrxwWoX/EsBQUfoC/9ggcHDgnGIjrhYVVnR+SlRauBX8rDrkEj9xsBn1G9fah7Sn0VJxEU8Lx0xNZWsdxETVkdf63xHhPWGBN6QU0JFHZ+O8fZIzrDRLJmtB0iFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=VJbtZtj3; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3r+j2OE65EBQw9MC6lzA35S5x99TxcciMoRMs+Mrdk6hfnUX/EnCMVMO17dgq8p1muQJ4cngghmdgV55omcGIc9jst4QUhf/7KT66PPOo6DKPS2F4meHlJuwESl2ni4L8dm9RIMZ2oLbsAU60r5F1/UqSkWee/THk55ULBoxed+raNnTyeGnsuMJfY4VScg0UexPVOKccwUFGi4MjfX9xEN5cf0Gt18u2OfWgy3k9RB4B3z13V/FMO5Y3Cp0hHVem9wkeDKt2bC/F3PaihwBKWWiW/0sE+x6VvTiC2aHvuoHnriCeNXTQT5IL1D3l4bdH6Bl/PkfSYzbfXewhSS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwKvTt4SUaWenCCppLG1RCHzQEVx5W07pcFqI0wnOLY=;
 b=jfKsKUd2EKq9BEa7jaYTerd3V+FeOvS5UdU7unoQn7bw8+JCQ3r2kxR16WHrrzjtjAADE2vKicfY2BRC1nZz2PT1Ew8waPUOff3QiaC2IAv1sZrhibqeBAKIAfjlC93D3Es5j3obRWqxYm+Zi7ScHG1fn4q9DfghG4zJayLZDt2Yrsl6D9Hi/YN0u2i3tOW1CT6c0xOVc87FkudEY+B5XPsXVc4sAZS/XvCR3KLtbFICd7Po7gSv01AbFN5kAqzG2k834Btu6YtnL0mIhcO2xbeczp9cM2W2ml53nKJFqoOFsMegnnrFRbG7PyhQp/08rGNhtzI1GVLtD+m7RsjxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwKvTt4SUaWenCCppLG1RCHzQEVx5W07pcFqI0wnOLY=;
 b=VJbtZtj3i76uc82EZunCMaVlTUKKDdiUBofV15vzPmtajbPnf6fyOuSBMskrH8ll4dC2n0gVxn7UVBz/F5ncVahnS69HV3mxfEBw+84z1w7bJ9OuCUioA1o10kTcP/DoyqoTjVpAx3yuP6xK9hPTAfLLeruDgjLLIcjUwWUETtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:48 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:48 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:13 +0200
Subject: [PATCH v8 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-2-dbd28a150e41@cherry.de>
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
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
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
X-MS-Office365-Filtering-Correlation-Id: 03200ba2-42b8-462e-de0d-08dcce8c5fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1RhU0NVWlZPNjhicHVabUdpYWJvUjZvVW94c0lXbXhzekF2THYxQ0pOcTRp?=
 =?utf-8?B?QVJaOWdhS3MvRkpvMS8zL2pYSHppQ3lYMEVTei9FVklmY0NnVkdoaHE2ZXc3?=
 =?utf-8?B?RzEvRW9SbkhWWXdKS21HcFBjYmNUemhES2tSWFUzSHRYY2xNa29Hd3pHejhU?=
 =?utf-8?B?aTl3cFBZYzhDejhQWENxZmt5SnFTUFpITTZkbVZTM1dRQUdPanliMFZ6elNN?=
 =?utf-8?B?Qi9KakllMWRJMnkrUGhPZ2I0TE8zdDZWZUJIS1NINVQxaGhHRXZjZ0svTGVK?=
 =?utf-8?B?ZWRPSWlCVmNrVzJuMHJCb0p2QU1zQ1VTNCszNUVrOXhpSW1jbkhyWWhsb0hu?=
 =?utf-8?B?a1FOaFV4c2E3SHN2NzYzaURQMjZPREdhTlp6QXlaWmFpcG56YjhSMmNOdVlH?=
 =?utf-8?B?YlVJakVIZ0pnU3ZoSzhabnlhMzdUMmxNbUhpZjNjbzllQWRERFlwbldCaEI3?=
 =?utf-8?B?SWtsWGdpenYxNE5aclRNSStTMVZSUTROMmtRY3NsQkswTVpXOFpEZEp0RUlH?=
 =?utf-8?B?K3JmcWZ2N1dhdGpFUHJWSThQcWFNQnRScGc5Mm4xZWl1OG1VMUNnbVgraitU?=
 =?utf-8?B?QjRqOWlvSldFN2Jabm54anE0amwyUFhyVkNST21RS0VaaFltZVh0ekdMMDJv?=
 =?utf-8?B?ZGsyUWd0b1FsaWdKeHFjWXZCckZQUWRRZGRpTzlIME1CUzNzeVhETGVsdXd0?=
 =?utf-8?B?bUg2b3F0bGFIaUpmWU9BRDJRSU9WVEVWV0xOZTRJeW0xOTd0YWZLMHNZM1hn?=
 =?utf-8?B?NTRVYU1Rd1hzcDN5UTB4NEZ5M2hIRklHeWpGRWpsTkFsRDYzTk5lZlNOTk5l?=
 =?utf-8?B?dTRzWjQ1bW9pdG1nb29ncW9Ja3VUMVFMeXljekR3RUhkUlhJdGVYWGVudkhK?=
 =?utf-8?B?V2YxK1dEbVBQRnZrbHZNZ09BUG9VVkxhaUhERVFZZnJrR0xGQVNxc0RtUU9J?=
 =?utf-8?B?ZXp4QTZkY3dxblpDTWlqRlVlbkVZLzdKY3BrUzZJbjkwTExFV2I5djlZYnla?=
 =?utf-8?B?K3N5dFdnN2I3L3NBVkdtQjRyZ3NHd3VucndnK2FJZ2tzRXJoVjlpZWFoMkxj?=
 =?utf-8?B?VDdmejJiV0k3SFpxYk1iVWJ4T2lzQVg5TlpwVnVUVFlubjFwbmQ0cFhNR2xs?=
 =?utf-8?B?SkEwOEx6bmlCeTZHS29oTFoyekxNS1oyOXJCQ0xHWmpCY0J3Z1RPUHllZ20x?=
 =?utf-8?B?Qld0ZUhCVVZVNnVDT1JDTVBNQTVrWUlWUXgzL1lPdld5T1pTUUpDaDFRdTdZ?=
 =?utf-8?B?U0V4ODJZN01JVzNwTytWc0J1MS9YVDB3dVB4UUpaenFhbGQxYzlyQnA2UTJJ?=
 =?utf-8?B?SVJJS1l4YkpxTThPQXZIQ3ByazNOa0liUE1pZGNESEUrRzV6SHlkK2pKUlNL?=
 =?utf-8?B?L0xUQUQ5ZGZYb2NrS3lEcUVHdU83dVZ2MDg4RDdvYkwzaDV3TFM1S2l3cVJk?=
 =?utf-8?B?bWpRYjdjTEowdmVtRm5GWUNUamZNbzNiaUVabGhHU3VKY3VkbnU3RWV4NU1n?=
 =?utf-8?B?Y25kdzgrWFRoZjl2bW9JZFpvTEhvdnU2cmV0UWd6YUc4WVpLYnlyQ2xiWGlM?=
 =?utf-8?B?SzF3SWNDczAybjNJUUpyK3JKSjVnNWpDNE5nZDd5Mk1PSnVsbzA4amZlbVJV?=
 =?utf-8?B?QmZJYUpPVkhheStJRW5oMjhYbmZta0R4dUZXNGVHeGlFZ3RleHZJRXhHRkNr?=
 =?utf-8?B?cGJpb2c5Vm8xMGFLSFh3Vk8yNWhWbDcxTk1vNiswL0xPdjhpRVg2eTY5R3Bz?=
 =?utf-8?B?clljbjYySmMzSnFBalNEc0gram00ZFpnbzFMRGd5Y2F0MDZjMjhxM2I3Mmp3?=
 =?utf-8?B?MDk5YmNmNUt6SEtwL3VhaE5jZ0N5NmViTnpwQVl4RFgrVWJWaE1RQW15Q0xw?=
 =?utf-8?B?aVJWTjFsTndWbS9WNmM1UkdWd0JwVnI1NHVIOC9VVmh3RmVvakk3NEM4eGx3?=
 =?utf-8?Q?zmy6ykS5s60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE5QSHhNaVpaQjZTVmYzclhJRWN1dDVaUWJjV1NWa09lbndISXBGR25hOGJK?=
 =?utf-8?B?dkk1Zll0dytZT09NY1pNc05DOWxua3c3K0lwNXB3RitUTUlQZFpmOXRDUUVF?=
 =?utf-8?B?SE0wUk1sMHVFZ2Zvejhab3l1d2U5VHZYY2NZbXRqZFArM1pDVE9VTk03NHVa?=
 =?utf-8?B?cjhVbEJtMlo2WStMaHRuZnVVSDZ2OXdmV0F0QzN5T2hydWlsdkdwci82YTZ2?=
 =?utf-8?B?b1pTRXMrUXRRQVpmUkowc0NocXRxbDMxSFlaY3piaGVrME9FaHJkSi9Yb3hR?=
 =?utf-8?B?NU9Nell4RWVzeGhxOExvbzJnWXRiRDNua1dpK3p3azliTVd3OHRGUGduTjdH?=
 =?utf-8?B?c0xGSWx4UWdoZXo5R3BvRVBKSGdOWHU4cmp3ODRUNlp6ZU54NkQ0MHpaY29s?=
 =?utf-8?B?cndDc2czUmRmdUtMelBjN00yQk8zQnJpVlV4b1BwSEtlWWNqUlNCUXlCR2dJ?=
 =?utf-8?B?K2FzaUNsdHJ3MmdpK0hqd0k5OFlhMDBocXlrUzVmQjZmeG5jSUJBa1k4bXRm?=
 =?utf-8?B?MTIwQzhRQS9JekNCMWU4aVREN3B6aElzWmdsNnZSTTBNellJdTd3aDFFMFQx?=
 =?utf-8?B?dlVzSGNTNGZWREJPeGc5TUd4dGx5RkVDYU5ZZ0dJQ2VLdzZkcEpDckkzb0sz?=
 =?utf-8?B?OGZsNmxnMjlxeUs4VTNwTmxXdWkvcDg2NUZrQktuMXRXNGdJM3BSMkt6bWoz?=
 =?utf-8?B?TlNkQWdiUmNZTzR5OGthaXAxaVI3UU9MdEg2RCs2NUI4aDZ4cEZHeE9oVnUy?=
 =?utf-8?B?Nm15Y0lzalBDYUJRcXN0bDVzY3JBS2UxS2g5RWtub0FuV0gyVENzRlpnZHYx?=
 =?utf-8?B?Z2UrTjhydjlQUE85LzNOc1RXZTZqcVNhemorL1ZGM0xmRmg4aEVOOG16dGxL?=
 =?utf-8?B?d0I5MUNKVWhNRTZXV3p4c0x0M1M2NUZ4Q29kMHpiQitEUG1pVFo2dkJSRE5D?=
 =?utf-8?B?ekptVlZQQVdmNmtrUm1YejdGRUhKRmR3MkgwVllOMENpcnVweUJGTjVhU2xS?=
 =?utf-8?B?UGsycW16MS9FVk10cGNjSjBHZ1RVdExqS25pN1doM0tldEdidUE2QU9VV09L?=
 =?utf-8?B?TWEwWERJa1h5bFREYW8rak9YUHpjSSt6eVFGSktxcHhENUxydHJhY3BraDA4?=
 =?utf-8?B?V1pzWHdzZThGNHVRS1h4dDlVbEdlakh3NzFDNkVBVm9RS21SY1FaRW5CY1hl?=
 =?utf-8?B?bmZ4cURqbkNucDdUTnZENEd0NjR6ekV6V2FsbXlGWVQzajNiNjJBMUFTbzlO?=
 =?utf-8?B?cUR3K2NqQzVpUUF5Vm9UMVlNMmoyQ0JUbFl1VUQwanlSTGRaQXZUU1RzT3la?=
 =?utf-8?B?Qzk0YzN3cjF4L1dtWGZWdUNPLzNBa2w0RGdTL3pjVGJudVkrSWUzQzJxby9x?=
 =?utf-8?B?eG5wcmJmcFBhd0xxUTVTK1FsQjl2UHhUN1M1dlp0WXVJa3h4RmZhODh1Ly9i?=
 =?utf-8?B?eUUyMTRPcTdrWlk4ZzhWV2lYblF2NnZEZWN3M1VoaGNBdjd0T2h0K2pidkZ0?=
 =?utf-8?B?Mlk5NnJxY1poOUh6MG9CVXVHcGMyNUI1UUpyRXFmN1J2S1RzSHpjdC9WbFFP?=
 =?utf-8?B?M2JjNExqWXBhb1ZtQzAzSlJRMkUyMEgvWnpoYlJrcDBVbTh4eHhwd3VJMUF0?=
 =?utf-8?B?aDZYNGtualRrOTNtMDZCajlTbXJWNWR4QTRjemJ2L2ZwbUE1cUNVMUIxVUNr?=
 =?utf-8?B?d3ZWVkpxVllqYVEvVFNwU05rZ0RSWUhiei9jOUFsNzhkQ3h1VG41bk1PdFBD?=
 =?utf-8?B?TmpOaXpIWjVYOWRSSEZyeWhCTFNKb1N2WW5hQ0hITko1QTVGVDl6OEdVS1l2?=
 =?utf-8?B?WmtGdXJRckl5ZjZjMDFPTjljNnBuWlN0RlNFL01kcUFnbU1EZjVXQ2VtQWVI?=
 =?utf-8?B?bERZZVlpU2RmSnpFdEIza2xEMi85ek1iK2toRFFGNnJuY1FsUVE0NzBhQ0Zk?=
 =?utf-8?B?dDBWK3NyeGtQRW1WNStEbFZvbWJPdzFUNmpHMUpDWWJ5TzBNRDljV0tjbnow?=
 =?utf-8?B?N0pybm4yLys5dVZ3Y0RlTDJ2WnZoMndLaG9UNjVNMU9yZkI0cGVMNk53RXRD?=
 =?utf-8?B?a205TmZ1a0lRcFRZV2Q3TjJmcHAyUGg3dU9rbTJCcjNka1lBeEJZWTIvT1lN?=
 =?utf-8?B?TGtHQmZhem9tZ210TysxVG5KSnZKUzNORG0xdk1JblhlTGpBVDhaa21keHlD?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03200ba2-42b8-462e-de0d-08dcce8c5fdb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:47.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLijPfTB4wrJHfq0LA9MduPPLcIvA5ZkmhW5K8bZf0ySzBcvvRlmj78XlGKvLhms8bNyiEnBKq2ix0oD7KlK7vVqUXzPgGJ0iXyVzvTk+xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which an amc6821 and devices that are reachable through an I2C-mux.
The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821 reg 0xff).

This driver is expected to be probed as a platform device with amc6821
as its parent i2c device.

Add support for the mule-i2c-mux platform driver. The amc6821 driver
support for the mux will be added in a later commit.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  16 +++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 148 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..6d2f66810cdc 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,20 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Theobroma Systems Mule I2C device multiplexer"
+	depends on OF && SENSORS_AMC6821
+	help
+	  Mule is an MCU that emulates a set of I2C devices, among which
+	  devices that are reachable through an I2C-mux. The devices on the mux
+	  can be selected by writing the appropriate device number to an I2C
+	  configuration register.
+
+	  If you say yes to this option, support will be included for a
+	  Theobroma Systems Mule I2C multiplexer. This driver provides access to
+	  I2C devices connected on this mux.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mule.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..4b24f49515a7 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
 obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
+obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
new file mode 100644
index 000000000000..8e942470b35f
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Theobroma Systems Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MULE_I2C_MUX_CONFIG_REG  0xff
+#define MULE_I2C_MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static int mule_i2c_mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return regmap_write(mux->regmap, MULE_I2C_MUX_CONFIG_REG, dev);
+}
+
+static int mule_i2c_mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mule_i2c_mux_select(muxc, MULE_I2C_MUX_DEFAULT_DEV);
+}
+
+static void mule_i2c_mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mule_i2c_mux_deselect(muxc, MULE_I2C_MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct platform_device *pdev)
+{
+	struct device *mux_dev = &pdev->dev;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_client *client;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	int ndev, ret;
+	bool old_fw;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(mux_dev->of_node);
+	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
+
+	client = to_i2c_client(mux_dev->parent);
+
+	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED, mule_i2c_mux_select, mule_i2c_mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
+				     "No parent i2c register map\n");
+
+	platform_set_drvdata(pdev, muxc);
+
+	/*
+	 * MULE_I2C_MUX_DEFAULT_DEV is guaranteed to exist on all old and new
+	 * mule fw. Mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mule_i2c_mux_select(muxc, MULE_I2C_MUX_DEFAULT_DEV);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to write config register\n");
+
+	ret = regmap_read(priv->regmap, MULE_I2C_MUX_CONFIG_REG, &readback);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to read config register\n");
+
+	old_fw = (readback != MULE_I2C_MUX_DEFAULT_DEV);
+
+	ret = devm_add_action_or_reset(mux_dev, mule_i2c_mux_remove, muxc);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to register mux remove\n");
+
+	/* Create device adapters */
+	for_each_child_of_node(mux_dev->of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "No reg property found for %s\n",
+					     of_node_full_name(dev));
+
+		if (old_fw && reg != 0) {
+			dev_warn(mux_dev,
+				 "Mux is not supported, please update Mule FW\n");
+			continue;
+		}
+
+		ret = mule_i2c_mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(mux_dev,
+				 "Device %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg);
+		if (ret)
+			return ret;
+	}
+
+	mule_i2c_mux_deselect(muxc, MULE_I2C_MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{ .compatible = "tsd,mule-i2c-mux", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct platform_driver mule_i2c_mux_driver = {
+	.driver = {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_platform_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


