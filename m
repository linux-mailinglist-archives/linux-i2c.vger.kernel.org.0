Return-Path: <linux-i2c+bounces-4762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2592A703
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 503E428999E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A0D149C76;
	Mon,  8 Jul 2024 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="SSANh13J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2114.outbound.protection.outlook.com [40.107.20.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060C1487C6;
	Mon,  8 Jul 2024 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455205; cv=fail; b=G825XRBv1FSWYwa/D4ziuXhsi/qaSz6jio7sDZvSofMcGd6EwibPQCZsMINtzK9cu6EjenomusECGrZL4qHhCzk6+rhdgp3taIggkfVQJUlGvmqWu6oFipZnWm246Jq5Wcz5WA2b1aQ0SqB4C82t7siJWi+LSC2DhIt7+NKo0QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455205; c=relaxed/simple;
	bh=N26xW5ZbC/263wDEtAd6u+B0wIf5K1mGerf90NpudD0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=R3UMj0eWr8ceX2jCeeFRL9zTt1E8bcFjh92O8zzUbS324r7zfmMg/E+8TrojByqXm3jUEOljOtJ7dirz1I+WWEslMiL62L5TgX7h62n/Rt2BxeHJ7oE7JduWXDhqWZD6B9boiCL12DqK2GIQ45bcmId5iaFBuxyWsV2o6eitwOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=SSANh13J; arc=fail smtp.client-ip=40.107.20.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RU+pK7M/VUauv7AQzj8zsHUeAqSa+cZTsZEqw5FtUJ2n4ogO3ZHnRnbczZPpP7Obh5ZfMeZNnbIPP5n21jHxUDJtfFEZkj222iuBoYpu4AM50d4ujb8GJIJHQ3tnRdaAhqOSICbr4+q9zOnrEuJSIQ93lqSRjs9FcCAxpDXFXhhAaP5VkGDbFrBpme4HVzLQnDFKAZQjVW4YJVEiiyA5TtQ0dpk/A7Y+uq3BnXja/T+9+OExnQh6PxAo2eYkuzcEEuHVUjGl5LrI+c/aifFzXbsNhx3+vFBE/YmZg/zEK64DoN0jiiOFuSYBr31METYuv9xIXA/ajWwMdDrQzQpTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iuhp9T1QHEFE9Wfc7m8ueDzm/rOJFzpQw2ytUIQmKMI=;
 b=G+UiW0SQ067odd6SesRnZ1pot/8wthy9ZcRCigwASE0lkzLc4mNJ2HlqkQk0STPPhhpcfyOJ31YvRPQHfsxXTRtTMRL3Z+yr6jz8UHe6qbdN7Mh7cQvibOCM0DD0KlUPamODCK0Qim0VRePgNp9S2N+0KoW7LUq05isfq8Xe6pPfR36WUyDrNu8Ym5i2ZyGVmOH7DNOztdIbmSsysF/qtAF/wOZ+NLCeJWaOy5F87PTqD/BQ3kBP7aScSC3Ejer+l56JYTxQJP/I+ynEUeWwF7xBVzyc2OEvVMhs6BFmJUNXJSJsK16Vc24DufJsha1D4wUzXjWMHs03YW8m1XMb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iuhp9T1QHEFE9Wfc7m8ueDzm/rOJFzpQw2ytUIQmKMI=;
 b=SSANh13Jjnnjf86NnwyXiluAKeoGqSUVT7QHNQHofxIBHjuCRolZ3uxi32C6NJ8c5KFn2vE0Br8JiMTWV9gPBJVyBXFYbnb7eJhyPfZTP9ivByeQ92UGzyxynKGwJrqoD/5pehFw6rM9KTlhVE7ehmHQIrwQys3K4my2fJHwgIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:13 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:13 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:15 +0200
Subject: [PATCH v5 4/8] hwmon: (amc6821) add support for tsd,mule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-4-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 847aaefb-ef19-4dfa-bec2-08dc9f68de1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTNHZnJOdkhidUVCeGhKaG5FaU5Wc2pyaEkza1NwUC80RXlRaURqZkdPTFZt?=
 =?utf-8?B?YWRHZDBDUmZ5Z2ZTdXZ5R3NaZy9TWnArcy90eGhySllkTEdwUEJvTXhXQTZW?=
 =?utf-8?B?SXR0RHhJUWhTUlBhbWV4YTJXdGFXQ1NxOFAxeEl5UkFwcEt0NkZucGtvaUNj?=
 =?utf-8?B?bHpWWUduZmpzMHV0MjFXak5WQTUrK3g0b3E5VHpnQnI0ZzBpczRYNGhLckVN?=
 =?utf-8?B?enpXcEpzYTNsdGkwS2M5RVZnYWU3R3FTNjBxTWRIWHpWbFNBY2I0eCtOY3Iw?=
 =?utf-8?B?TzgvVGVYTUROcGpCaVFKZmxTbUppam5VQll2dy9oZm1ZK1VBN3N3ODNGanJT?=
 =?utf-8?B?c2c4QWNONlVyQmh1bTZEamZNdXFycDAvcDgwU1pzaUdUQXN3enlsVzU2UEg0?=
 =?utf-8?B?RGdCakNwZWJzNmEzZGpVckFlWER6bG0rYXpMYXJoNEJxVk9yUXFtS0RtTnNa?=
 =?utf-8?B?amt1MlcxUDRFakttRHVhNTVuNjJ5RTFKOFIyd2NYbzlzTkN3WFJ5MEtOQnZD?=
 =?utf-8?B?ajY4TEhZVHZqdEU4VmtNM095VnFJMkxVZEEwNWdxN0o5L0d5NUNNdlkvS3Rl?=
 =?utf-8?B?Rkk3Y083dm9iemVvbXdSdUZXY1VUZTdkODlkc2U0WHJYcUtMZzA3ZEVZWWto?=
 =?utf-8?B?dlhPRUNJTUVxTHovWDdSb0dEdm05M0JCc2dNWENRYnR2MUJlSVlTV2ZacG1S?=
 =?utf-8?B?M2lzMjhQejVsWGVVeUdCcFdadEUxZndUbzZIbW1kSENiTXErWWpGdnlDcS82?=
 =?utf-8?B?RVdUeUNXOEVPRzdMSVNZYkNOUDNlMll6YXVJL2Jnb3JNQ1BsRS9IWk00VmRm?=
 =?utf-8?B?M0FSNDJGeGpsdVNlenVVNlBUb1ZLdUxxL1pwZFI1Qy9qN1p2bi9SMGx4OEM1?=
 =?utf-8?B?cWJvbFZvOTlSTWI2aXl4RmNxRmgxbWFFM1QrTVNmQkc3bktDU1dRRVhxSGVr?=
 =?utf-8?B?UHFwNWl3NE9iZjJxRHUxbTVEWXExekFTYUxUcXZpRlFPdmVrRVJHdDNQVlQ4?=
 =?utf-8?B?NlJuekNJQ2JCQWhtK05DdU9tQkVtam9BWUlLcnZUZnVlSzdLSnJ0RzdQUGZK?=
 =?utf-8?B?cFRCWUZsQXRWRVBCb1AvcEZjVlZXT0ZCMkF6Z1VtMG9PR3dvRkplMUluNEh3?=
 =?utf-8?B?a25ic2lMdWU5cWQ3WnIxdk5KT0ZDdFpObklOQkdiRU9EY3FjQllDaEh2WHJy?=
 =?utf-8?B?MExBRyt6clpYK1lrNlgwblZsZi9RS3Q4bkdsVlRSUSsxNkZDSXJZZk5Gd1Ez?=
 =?utf-8?B?V2wwcjE0bEZIbkcybTAyNTM5Z0xMaVY4aGZxNll2VUIrZ3NFRVZ0a0xoWXJT?=
 =?utf-8?B?cU0vQ0lDelVjNWNJNmNiNndlUFJTNkNDQ0l5WlR3eDhzclNUR01WQUdDTzV1?=
 =?utf-8?B?UTRJM2VmdGVxU2pWc29vZlpDZXgwWVRKOGdRaFZtcnJETUlibVNhdG9TYm1Q?=
 =?utf-8?B?ZjNjU3NJRnoxQkppRVBXelBVQ0NJUGl4YlBQUS9WU21CRWRtMVU1djAxYXIx?=
 =?utf-8?B?bVplRWg1M3dLNUkrUXdnNWJtTGNDU01kYjhQMVp3SHkyaysvV2F4MUxlWnIw?=
 =?utf-8?B?bW12ZVltYm1NY0Irek54YjVueE9NdHdla2RRd0tNbTNROU9FVGQvU2MxTjFl?=
 =?utf-8?B?NWtobSs5L09rZUd3eUxpMXlOZlAzaE41MFlPM1c3WjA3cUpGNHprRTBraXk3?=
 =?utf-8?B?bDNDUmxCSEQ1blFaQk8vZkFvVitQa3Y1VW5nQlZtZnAyQW5veWMzV0J1VWNi?=
 =?utf-8?B?M2FVNnhkU0tSdzc0NWx1cERNRForTGkzU3ZUQTdjbmVXSUcyOHpuVzc0RUgy?=
 =?utf-8?B?TW1ab0xQY3FhMUkycnhJWXZQSGxjVjh6K1BwRElrQ0JxbHY2Y0VLc1J4dU81?=
 =?utf-8?B?NmhLQ0g5VHRISW1lWmZYanl5WGp5ZlZNa3d3d0tVVStQVGErY0RoOFc4SlJq?=
 =?utf-8?Q?h8f74x4MTjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlBNDZTK0ZVdUNhS0pIZTRoSFJoaW8wZnlydHlPeUQxTktJdTVIc2JwUC9J?=
 =?utf-8?B?U3NCSlpuVGFZVjliejRxMVFVUkxIWWZEN2tyN1gxcjBFNlVQZ0E3S2FpQTFC?=
 =?utf-8?B?ZEwyN2dTK1ErSys0dnJmL0dpU0pZV0k3NzVKbkROMUZUeTkvcVlzZC9EUStw?=
 =?utf-8?B?NEpYOElyTzFjN3RyQnc3cFAvSmxqNDZvcktzdmQ1M2V1dG5GVG51YXhYaGUz?=
 =?utf-8?B?cjhSQVIzNXBYR1VWcGEzbTBrNGpLc2pvaDBDbXZ3OG0vMngxTHpDS1dvTGs3?=
 =?utf-8?B?cVFNZjdMZHptRXcrb2NSblhvdDVpb2JoN1VGZmlGOWtaY3ZSZXc4Qm9FN1BW?=
 =?utf-8?B?d0Q3NVBDb0NXU09wU3NMTFMyTVUyOFZLU0Y2OE9OUGdZZXlYUkZOSTRFYzlV?=
 =?utf-8?B?SXVENzJQOGtUU25HMlZjQkY0bVpBcTFMZExHMmtVNlc3emJFS1MrazdEUUJT?=
 =?utf-8?B?dHNlRW5PNU92WTg1Q2Fib0ludUdoVDRBaUZDK3NTazcwREErTGE1SE9zNFdP?=
 =?utf-8?B?SnpVM2ZKTjRFMU5uUUtpeUpUaFdicHgyK2ZaMnk3MnlOV3hsb2p1K29UN3Bk?=
 =?utf-8?B?d1B6WjZsUHhodkVxdk9kSDFadzczTmJUNjd1YlZKMUIwbTg4WWpJMGNUcThi?=
 =?utf-8?B?TzlWN1BEVnZtR2UzL2krUW5ldkdKZlJiRjdvTStmQ3AvTnFTYlpZL1lBWjJS?=
 =?utf-8?B?OTN2Uy8zMjFJcDVhS1BUbTM0Yll2dHhyaENYOUt3TVlxVW5PTnQrQmcrMjlF?=
 =?utf-8?B?N2Z6cUFJclF1bmtrL2UvMmFCUFVYTGg2YjQ0bkFXVTFjN3BwNW41RXd4YWJp?=
 =?utf-8?B?UW8rY2pXRmYrSkV3SkwvcTRYaXNGc0RoakNhdzIzVncwbEFuM0dTN0hFSnRU?=
 =?utf-8?B?Y2JXOXl5OFFlZi9OekFRbmFhSHEwMVBkTUJkdVZ2MlAwcDFwbkp2eVlUVjZv?=
 =?utf-8?B?UU11OUFKcENPMG9MZ1lWNHBteXFLNVpVRGhTeUR3bXVQMGhvY1hzT04zZWIz?=
 =?utf-8?B?dWdJYUk1QllVSUw3amhlUy80T1JxTWJBb3pSUkxaTitBM25IZGV1b0Z0R1Fs?=
 =?utf-8?B?Rzdvc1hVVnBURlB3Z3padHpTRzJWZDFmdnB6VmlId1JZdUpjY2dySVV1d2o2?=
 =?utf-8?B?UUhnYmNIVXIwR0MyWUpLQW1mZ3hpTnIydEoyNmpEcTZKWUJZUTdFNWc4MGZp?=
 =?utf-8?B?VDBiTDdsY1pvaXJjRUNOZDdXR1g4dkdMTGhyci9JdzZ4R0tyUEtncVF0MC9W?=
 =?utf-8?B?blJpQ3RXRCtHWW5jQWt2RUVucXNZaUNYdGQ4WUhsdWZ5Z3FKMUVRVGtXRHVt?=
 =?utf-8?B?dDZSWXkvb1lHdzRzN0ZwTDRJMXFMQXdJNExIL1pBdjZBNTlRZkxQdjNIdDYz?=
 =?utf-8?B?TTZKUnNtcDNjZ0J0NFVSUjVNUUpRRXFaU1JqNVNvYXNkWCtMekpScnpLU2Rz?=
 =?utf-8?B?bm5UNkVFcUUxOUN2YzdZYXJjWEhIZnM0Z0NFL3JoQkt4a0FvUnczaUg0MmF1?=
 =?utf-8?B?djRiUTY5MFh1VTZRVjQvdGNJMTltRmttbnZoV2FNK3RiMG5aa0l1aWNvYkVG?=
 =?utf-8?B?UFFyaWZOYmpHenphVDZla0pORWFaU3Juems0NHFsc0oxbXdHRzBrMTFjRk5G?=
 =?utf-8?B?SVgyZS83bzdRRXR4NXVmRUxlSDVTZVpia3kvNk9UVEZjVmJpVytnNVUwRXQx?=
 =?utf-8?B?eWpVQ05MaFhNR1VUcTRUblk0aE9nUHdMNHB0QzV6eDNOdUw2bkVWT3pBNmtl?=
 =?utf-8?B?aU8rNU50ak02eGVlUzVsMEErTWlmc01Xa2xJc1UvZHlPUC9ORmRGeS9iZmpP?=
 =?utf-8?B?QlNub2VlWkMxNGRoQnplMHliSmVxQXV3L3kwL01FeHlrcFc5ZHoySXVNSmVj?=
 =?utf-8?B?OUI0WkhOUzVPV2lXN0VQTmw3SkVpbFFBWVIvWTZpeVVzQjJyUngrVFNnMk01?=
 =?utf-8?B?RVhhMHUzbFNTR1JJSzMrTjd6TnBRc1lldE1wMk85N1RLZGlHZEVNL2ZTQmRN?=
 =?utf-8?B?TUljSUlzYWhRQWdoWnRxUmlFbGJVRi9ZZjMrZTJBS3gwN29qeTM1MjRMVGF1?=
 =?utf-8?B?d1htZ0hWVGdubFVacEJDRTdZODFublFXOVl2YldSdXM4T1RBL2Z2YzNTRWJm?=
 =?utf-8?B?MjV3V3Frcmh0eGVQYjFRSWg3UFNxM3BzVGhBZ3phUTQ3b0xyUk9QMG5NS25C?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 847aaefb-ef19-4dfa-bec2-08dc9f68de1d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:13.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qrU/ktXOr4qYFP2FQCA6iTQxLhxRwVLU1u64Tyln4r1xMRCLK838tFwbek9ePImZxajHBaT13R/EkIT7L7Wf9sd04Iuo5r+4J8E14wGY0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which is an amc6821 and other devices that are reachable through
an I2C-mux.

The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821: reg 0xff)

Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
when probing the amc6821.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/hwmon/amc6821.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 0661cc6a6f8e..93c3b79b5f13 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -22,6 +22,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_platform.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -895,8 +896,17 @@ static const struct regmap_config amc6821_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_config amc6821_mule_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+	.volatile_reg = amc6821_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int amc6821_probe(struct i2c_client *client)
 {
+	const struct regmap_config *config;
 	struct device *dev = &client->dev;
 	struct amc6821_data *data;
 	struct device *hwmon_dev;
@@ -907,7 +917,10 @@ static int amc6821_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	regmap = devm_regmap_init_i2c(client, &amc6821_regmap_config);
+	config = of_device_is_compatible(dev->of_node, "tsd,mule") ?
+		&amc6821_mule_regmap_config : &amc6821_regmap_config;
+
+	regmap = devm_regmap_init_i2c(client, config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "Failed to initialize regmap\n");
@@ -917,6 +930,13 @@ static int amc6821_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (of_device_is_compatible(dev->of_node, "tsd,mule")) {
+		err = devm_of_platform_populate(dev);
+		if (err)
+			return dev_err_probe(dev, err,
+				     "Failed to create sub-devices\n");
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
 							 data, &amc6821_chip_info,
 							 amc6821_groups);
@@ -934,6 +954,9 @@ static const struct of_device_id __maybe_unused amc6821_of_match[] = {
 	{
 		.compatible = "ti,amc6821",
 	},
+	{
+		.compatible = "tsd,mule",
+	},
 	{ }
 };
 

-- 
2.34.1


