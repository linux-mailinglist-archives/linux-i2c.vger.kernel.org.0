Return-Path: <linux-i2c+bounces-3430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 366198BCDCF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94491F25244
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436B31448C8;
	Mon,  6 May 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="csHEwPi/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD74143C65;
	Mon,  6 May 2024 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998270; cv=fail; b=KtJQSaydWwv2+WyDLUaO5kphcSrZnG39RuRDzjKm3lhaqTDoqatEbNshVwV9HC7B2eic+V17ppmm5Ud1ArwcYNBzwnEMOupTFk1QqjI8sB6QiEtU10XNwmHxG3Icik4Z1LItqmDCdtm9dm1lsp6170gGhx8uldlnApfo+t29IYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998270; c=relaxed/simple;
	bh=/3tU5oEp1PyVb/8VTRLzwNflZMx3jKZpa4G30Kf+HZI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sGqg1TmCR1iTLHckZKF4gNS5SBrmIK6YAtCUBAuHy85QOXwpM9SpnBEQgN6nS2DJvSCcTb6alQHUhBXpWBf26nQ9eI8nTgyW5p1pkySSeil4RNPJcERrQo0ejY4DLhKwHufC9TPsPxWBFMoY0jwX3JvETmWhrHBS7piuJt572u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=csHEwPi/; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQGnprD+sykCMq7SQhxo+p0c4XXA4MNeAkZtotJGml3TxRUvVRkPNrzDzHRada4EieaeN+UNxLp4p9cRoaxTnOIpiLTbsrudJcbSc5UDqlmw2PANFGYlcVVvY1/Kbm1+0KDGIvlzhg4jesraql+3WdbymfP7t0RmgUcj7J05KnBpql0x9pW82hSJkkwqLF7XeOZFOEIOSsWrBVwi9kLlDXn9NoB/os069HMC15CzSg7ArCzSbF7CyeIxZ2VKTjym3VZR57yRKP2g5kAuLivJhNvBfyo2Uu3dTdydX4B+sClntXOQXIKfA701l9pIttF9q0K+zFlaO7Ef2/8Hh41/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPMpt+YkB7cnmhpDNTVx484n70RADJC0Zbe8qS+2Dgg=;
 b=VTDSZKj3ZYwM17CoYQXCLfidCfpPI7ZKSfAcbQ+7ISlE6Xm/NXvfA7FwJbjm7HNYVTGftVD18HRzzANQ0SOtDFIp+gdk8pr6OYpovmaOK6YMvu3qFznzw+g94SfKRpGg856Ig7t0q+XejmKe2vldKLHsbVCn4ZHa71Nc9jODFcdFpJPkSrViKgvNg2oP2GScAM7E6vUdgeC3cVsSMqZKiS0sjbpBKtKbsgcYOwe6ORUQFHaa6QqrTEOtaG9nAq85p039Jm+jnVcdHGQa6h7azCOHFzmzih+xFgZfsnODlWMlxe1tslo1ApJtal3fXDc4wMfnoJu3SGd8NVaWHDahAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPMpt+YkB7cnmhpDNTVx484n70RADJC0Zbe8qS+2Dgg=;
 b=csHEwPi/UEvEjAilo67VGPj5RGvUPpm+QitMR1AhCM1WSjieVv3lWCfdy1l8lmyB6tGJfbvn5tCNkFckcJq68qFNpXkI973kkTvdl3DTAHlbFEIo6Sok+fA4Wnw++645gI1oHuyLSU1qZb9kfKO1awlPJr0mfYQeO5/fE8n3i7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:19 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:19 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 06 May 2024 13:37:54 +0200
Subject: [PATCH v2 3/7] i2c: muxes: add support for mule i2c multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-dev-mule-i2c-mux-v2-3-a91c954f65d7@cherry.de>
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0102CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::44) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: b5359552-88a7-432d-281d-08dc6dc77200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L21qZkZoaVJUTG1ISU9qNFl6SW9XdWVTRWl2SEluU2FaZnh5UXZ0RFhlSU5v?=
 =?utf-8?B?TzVXc3dZSnpFQkliMitxTkt5ZU4rWWxRMy8rUFg0c0srUE9SdDlzOXo2MVZJ?=
 =?utf-8?B?QzdMdUJoa0hINnhickhNNE82STFuS3JlZlBFV1FraDNBbFlsdnFjT1JXVFJr?=
 =?utf-8?B?WGxDek9EajhrU1VkUVZBeFJIamlEZFFBTXFkc0Y4YldGZDYxd1hvWEpyeEVX?=
 =?utf-8?B?dFRsZzVGaWc4dTNoaFdrQkdickJQTitWTTA1Z281a1BYb3d1UDJDc2JUb0NH?=
 =?utf-8?B?VEZJQ2VjSDVUVjZUYS93VER4cGFqN21tdUt5R0gzWVlRZnE3em54bGhRc21v?=
 =?utf-8?B?SlNDZEJRTG1jWExjNEl3Rzl5b2RJT3dLWTdUWXcvcE1aV1JaNDFqNXhzUk12?=
 =?utf-8?B?b25odWgyQWdtL2M1VnJxd25GM2FodjRmMGxKOE4wQ2VOaFRXdkFST0pIdDRV?=
 =?utf-8?B?QzUya1ZNRHp0aDFKbE1PQ2duSHo3dVh2dzRQT0JEZyt6bHpKMVAzVEx0LzdL?=
 =?utf-8?B?dFQ0RmJQY0lIVmJRQXo3OHRqVmNhWG5rUkpSVDFmM1YzUmJNN0w4UGhENkV1?=
 =?utf-8?B?UXpFajROdnIwMmlTbkZuby9zalA3SmQyZC9PVTdVUzdERDNQUGY1SkhNTUNp?=
 =?utf-8?B?K1dvWGo3U1A2TUc5UkphSVdKSERHUWhqZU9KQUw1azFJVE9kdmg3dDEvQ2Zq?=
 =?utf-8?B?VkhzVzF6T2EybnBUNTQ5bDQvZU4yaGMydk80cThJc2l4OVIzUkNNSHFqdTVD?=
 =?utf-8?B?SjFucFBza05acFdTQnF4QWJFWFc3RlJGU1pzQm5lTVZjZW10S3QxQUw2alZH?=
 =?utf-8?B?VnF6Rkp3ZG0yQ1FQZVJ6YTFLcG85VFFGNVorR0RFUTZtWXU3M3A0ZWJFMmNi?=
 =?utf-8?B?aFdiSVdXVC9tSlhEOXRMMWFtYlhLWGtYdlhiU2MzSW1CVk0yb2xXMXRNMnNJ?=
 =?utf-8?B?OUdoZnJmSmRoeXVsczJlZXVIVjRpNnJpTTI0SndTMFdVNTYvZDVyNFJWbTk4?=
 =?utf-8?B?eW1hZUNJTCtCb3M1WVZha0haYjJiWkRHNDBObnVRS0k5T2p2dEV0czhSbFFE?=
 =?utf-8?B?ZldPR1BQZmpBcER3Q2hYMGxvTHJYdmpqbXphMHM2ZGtlTCtKcytNbnNCclVP?=
 =?utf-8?B?V0haVDlnNzJVT1A5dTgySkErWkMzL05FYXhueEZSc05KZlBXRU5SVWMzTk9S?=
 =?utf-8?B?M1NiMWhMaFk0WVZxVFZUSVc2T2w1UTluZ1NYZnV5UFpPeGVMSzcvSFdscVh1?=
 =?utf-8?B?ZWk4R3VGTkpjM2lRTUkya2w4a0xZa0YwcDBudmNjRTA1djJMOUFWSG1qQXdK?=
 =?utf-8?B?NU8rKy9BSFd4R1JNdnhaQS9pdjdwcHBrTzRFRUhCMkJMY2UvZHhOS1c0RDFl?=
 =?utf-8?B?V0phemRBMEI3aW8xZWVvZHcrdm5abHZjTS9mOExlNGZZTmN4NTdpanBrSHEy?=
 =?utf-8?B?b1ZoWTlGcWp3WVh2MjRUQkNPTTlyYTYwdVg0UlVwN2JQN2tOZUJDeWJwN1dk?=
 =?utf-8?B?SklHVzBBUm9oWGxCYWlNeC8zOVRJbndwY1ZqcGJqNkkzeUtnN052Y2YvRHBp?=
 =?utf-8?B?aWJIb2FjU1dXK3RvYVRlTlFSYWdHZE1QUDF5TCthWDRyZFpIdnYxbWh4RTVR?=
 =?utf-8?B?RG52VGRHZUNMMmFQTU5MbHlaRThNbDV3Z1BKUTdaM3U3T3hGZ3Y5aTVBZjd6?=
 =?utf-8?B?Tk5hZlRHbURTcEgycExUU29nSjNnZC9Vc1lER09UT3hRWmdONnRXcDkwTWQ2?=
 =?utf-8?B?UGs2UTJGaXhHc3hwclpQd0hTYkhiS2d1YkpseWpYVDRQb1FGSUUzMDZUNUl5?=
 =?utf-8?Q?cp4uU9yl5QX2NppBEktjEpc1wf96UxKdLtlZk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWVvM0h5bEwxS3RqWXNSNER0YXV5ejRyR0VVcHpyTWluTlUvbWtyQWh3NmY0?=
 =?utf-8?B?Nko4WVI5Vm1KZ3RvNDlqcWk4QXBacklLclZ6eWNxTUN4NXlabytkYmxkNEJx?=
 =?utf-8?B?aXdtR2ZYZmJGSGhjYWtpNGhMbjlsMlBVV1VFbWd3ZHpIQ3crWlFFb3hNWU9V?=
 =?utf-8?B?Ty9LVXhDUE9pSitweHpXNDlsRkc2T09kUmxDeDRBY3R0ZHZPQzJ6R1hPM2ps?=
 =?utf-8?B?RlR5YVdqR0dLWnVpekRqTWpaQ3JscDVXMkttMUtjSXRNaEc3MVdXbURXWkdF?=
 =?utf-8?B?ZjZaQVlSSnRISkNUUVVHM1dES25GclV3Sk1RaXJaSjFsOFNIcWZWbHp3RUxM?=
 =?utf-8?B?QkpYNktselV1dlV2dHV2ZTV4OGtRSkF0ekhqd3Nndm1nNHpDVHluZTQzd1A2?=
 =?utf-8?B?UGdYNTlmN2JYdTVNOGJwR25ZUFptQVFtSTNsL2drY1lKQUpBWUtoOTQzWkcw?=
 =?utf-8?B?RUh0U05xRGR5U1VSV1FoZHZKWjQ3SmpyTjN3eExhcjJoVXlkeGZDYm1XZWl3?=
 =?utf-8?B?VUU4S2hTZDdkUDFIaitKN0YrVkwzeU04NmhwTWIxV2tZWFoyM0hyTS9OZzhT?=
 =?utf-8?B?ZElqUmtxaXIreHdPNGJEYkhsZ3E5Nmd6QTNHYUxZMFZCdTFOTDRwbGVKdDJk?=
 =?utf-8?B?ZjVuUHBEdm9XS2IrRHF6b0ROaGtTODJMVzFsSlpnc29tWHdiRVpvL1RUbDRi?=
 =?utf-8?B?QWdvclpVbXMxRC9BeFp3MHkxVDRRYU5qc1ppckI5QUZuUTBiOEFING1MRVVh?=
 =?utf-8?B?SlhsNDU3QnhZT1FKUmJlS3N1L3Vyd3FzdDR1MkV5cVJNZXlYQ0lJQk12RDRo?=
 =?utf-8?B?Unk4UGFYYkNTV25tNllrbVBKTnVMWDArb3I4M1dvVFdiVHROUkF4UHZiZjRk?=
 =?utf-8?B?NXdoOFhWemxtY20yUi95MjMySHJjWElQUm9Za1QrODJ1U29EL0pzWVJrcURm?=
 =?utf-8?B?R2MxS0ljUXArdGw3K2VGUmhEbURWdDA5S3ZzZVYwNnhhTGtESHhldWRZa1VD?=
 =?utf-8?B?SDYyZFJrZS91OXBmWFU2ZjlORG5HTkpkZ0ZjdWI5Mk8xSTU3OVVodWhzMmtl?=
 =?utf-8?B?dmpCT0FXMjdQTGt5dEdXU1lCNm1MdHhwek1xZjAwRDhPWlp6Skp4Q2FSQ1hT?=
 =?utf-8?B?MjRrYytjWWVsUzJ4SnVka3B4aXRHNUF6ZjNyQjMvVWlZeWdxTFhwODFHa3ZK?=
 =?utf-8?B?MDIzNkxiQUpRL1A1TVBzdVppN3l1bm1vZ3FkYk8wSW1aUXhxMy8zMHhKRWd1?=
 =?utf-8?B?TGo1aytGQ2srMkErVnlRbDM4dGJ1clI5QmhaekM5MkU0YjBaakZaWHR4ckFV?=
 =?utf-8?B?TmlHSzBLc1VvRjYrTGdkaUtiMC9qYURieEJVK1d4bUJ2UzFIU3BmbUxzNmla?=
 =?utf-8?B?WExvUnJOdVFQSnlKUDZYMlhkeGV1c016N1QvVGtiQXhxYTRkd0lIV1dWaG40?=
 =?utf-8?B?SzNHb0U2Vk5LM29YQS9FNEI3NFlKWnN6akJuczlvTWg5K1F0bkxKdnpqTlU0?=
 =?utf-8?B?MXhTNURLWVp3MkovZTgvLzdQYk5Fd0NqZm1PcXlQSGdVU1lXTFhMaVpsM0o1?=
 =?utf-8?B?djhLTjFJTEdoYTRxUHhwbk9ZcGZCbHJYeDRneXB0V3UyaUd1N0J6UDFHYnN1?=
 =?utf-8?B?YUlCT3BaY1NhQ1VROFpsalhQOXgyLzJLMSt6dlBrVDFlUVNJc3pLNUM3SFI4?=
 =?utf-8?B?NVFVZ3ZHOER5cHY5bGlSQkd3SlNhMkszS0k0RTliQW9RcXJJemlTQnFsLzNs?=
 =?utf-8?B?c21YSUlwRVgzaDlJRDNpQ3FSRkw2Zmt5aVgxUG1PWmU0VFFKZHB6bHdPNHB5?=
 =?utf-8?B?TDFSYklqSTN3a3BrcmEzS2hjVTJqV1NLRXY0Rm5ldVB3MXcybTVjaVc5V3M4?=
 =?utf-8?B?UXdmeDZoNHNQNUFsQWwrbWVCcTNTQ1czVEZYYUZ1ZFFWTEJlcTgxVWVZNlBj?=
 =?utf-8?B?bFBWcGR5b0t1SjJzVlNOZkpCU0xwL1pqR0M2aWNMd2sydDY5amxqajJmdXlo?=
 =?utf-8?B?NUVXVnh6b3BpL2JzOFMza1VrcEk1cjZxc3BGdGtJTzk2c3lXQnF5aUlHZ09E?=
 =?utf-8?B?b2NaL0lqdThlUGcrYlAyOU05TlNaLzk1VHhCdHZBY0t5Qm1NWTQweFY0TXhy?=
 =?utf-8?B?ZHJLRHg2M21zWjJEUzJJQ2g4TnZUMnI4VkY3UUYwRTZJV0h5V2VaeEcyTVlL?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b5359552-88a7-432d-281d-08dc6dc77200
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:15.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqd67OihrbR7pViEvmpaLbDKREcAH9BLHzvDuUO91LBTGDOCcsEh/utbwzuHF+WQEGqsOpsW8dDfHi7OiggV3UDTAq3kolT54tSvLykrBws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Mule is an MCU that emulates a set of i2c devices which are reachable
through an i2c-mux.

The emulated devices share a single i2c address with the mux core itself
where the requested register is what determines which logic is executed
(mux logic or device logic):

1- The devices on the mux can be selected (mux function) by writing the
appropriate device number to an i2c config register (0xff) that is not
used by any device logic.

2- Any access to a register other than the config register will be
handled by the previously selected device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  18 +++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 157 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..45d3c5997a4f 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,22 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Mule I2C device multiplexer"
+	depends on OF
+	help
+	  Mule is an MCU that emulates a set of i2c devices which are reachable
+	  through an i2c-mux.
+
+	  The emulated devices share a single i2c address with the mux core itself
+	  where the requested register is what determines which logic is executed
+	  (mux logic or device logic).
+
+	  If you say yes to this option, support will be included for a
+	  Mule I2C device multiplexer. This driver provides access to
+	  I2C devices connected on the Mule I2C mux.
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
index 000000000000..781c978276cd
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG  0xff
+#define MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static const struct regmap_config mule_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static inline int __mux_select(struct regmap *regmap, u32 dev)
+{
+	return regmap_write(regmap, MUX_CONFIG_REG, dev);
+}
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return __mux_select(mux->regmap, dev);
+}
+
+static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mux_select(muxc, MUX_DEFAULT_DEV);
+}
+
+static void mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct i2c_client *client)
+{
+	struct i2c_adapter *adap = client->adapter;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	bool old_fw;
+	int ndev, ret;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(client->dev.of_node);
+	dev_dbg(&client->dev, "%u devices on the mux\n", ndev);
+
+	muxc = i2c_mux_alloc(adap, &client->dev,
+			     ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED,
+			     mux_select, mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	muxc->share_addr_with_children = 1;
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = devm_regmap_init_i2c(client, &mule_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
+				     "Failed to allocate i2c register map\n");
+
+	i2c_set_clientdata(client, muxc);
+
+	/*
+	 * Mux 0 is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return ret;
+
+	old_fw = (readback == 0);
+
+	ret = devm_add_action_or_reset(&client->dev, mux_remove, muxc);
+	if (ret)
+		return ret;
+
+	/* Create device adapters */
+	for_each_child_of_node(client->dev.of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret) {
+			dev_err(&client->dev, "No reg property found for %s: %d\n",
+				of_node_full_name(dev), ret);
+			return ret;
+		}
+
+		if (!old_fw && reg != 0) {
+			dev_warn(&client->dev,
+				 "Mux %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(&client->dev,
+				 "Mux %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg, 0);
+		if (ret) {
+			dev_err(&client->dev, "Failed to add i2c mux adapter %d: %d\n", reg, ret);
+			return ret;
+		}
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct i2c_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_i2c_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


