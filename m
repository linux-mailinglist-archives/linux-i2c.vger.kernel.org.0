Return-Path: <linux-i2c+bounces-4097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6751690D9E7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE4F01F265E4
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AC813BC35;
	Tue, 18 Jun 2024 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="WIekAJcr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2120.outbound.protection.outlook.com [40.107.105.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F54CB4B;
	Tue, 18 Jun 2024 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729496; cv=fail; b=ms6fOmrDCUN9vgUXTI4a3PXs0o2IY6xYMAwQ2AshgRSmKazqj+XpWV8mpKWm6NMGX2nngeArTsnDnurRYzOCROK+GdgnIDPT0HyKnZqfIYgOdiarxb1Us/GtaOLdpGyXoHAhTaHXPETUltKNhBhvcQG4fY8wVagfycp9EgLdSG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729496; c=relaxed/simple;
	bh=ctN2MDIo4BRKeAwzh1iTt/Mf/ANoQRhZKHG5nWAkkY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YA0xV8ZEjpM0FQK+7qQHlDU5ALAcLekBpw2G640ef6fhiYBXe11buiYD8VoaKB0/iWhu1mvF/9m+vMimujvdz0JaMg3X8MoA3aHR7qCoZwb8Jodx1zRoaY/A8Y+SNjq/tJ5818vYbaHWNUbderZ5l1OryJaI9+K6lXK6eIkGCLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=WIekAJcr; arc=fail smtp.client-ip=40.107.105.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+kRdqaP5KOkHe7Ti8uP27AWs5TwYGKzIC3FASxylw1xtNr6GaAcQfRBvxs8vFrEkaGbXQRzcQk+DKCjLVjG4d378G3j2QwIRl1NqZFh1OAXgl4fBaINKWppB5Vh3nljCwxLux6o6DYt6cO6dAs5th9e4TygK4sFKoUxcUn90IijOJLDxS6YLUAA3l8+kAsod5GgbBuDwA5SEg2Z4XJH8V9SgC1JKEd5nXKOfMq2dkwBY59bqHjnVzuHlRy0P9mo52Rfusf0fE5xpZbW7WxSiE0bn/mMMX6W9FaPZ/AMgbORK8199Q5/YVGzPa/CU8qVlGyXobdJGHCjQnZFllPS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFRCPWndMqS7WX4RpH6o4dIBQj0c1TQ+raMxI9WsqnM=;
 b=eKXps7K2L35QoC8NfvBKzhKHzTrOdziIOuLib254+j0AgVEB4CcqG1VeyN5X9t4/afuxmGxcF8aNbpyiTht86hIQWSrUfRQB17C5eMvNSTRg3jZyCUmsFosz4W62UgMPR9gOfhMPABoX2ar0Wf8yU+ns5lMyvcMj705tVE8rOfIXdPbnLdjJUqse4Dq/SQsxjhaGkVsWRL9u4bAdZLa+znbqmCQJQ/iy9Kg3HNwoyK/mWDrPhih3ETFpcRdpI7HeyuKVxUQGjFUpCmQa4Y+f4dhWJsvhL4wWXr4X71gZQHEc+LkisHXfiJ+nT/yA3Crm0+8+vFbf9Bjh1Cvvd94jRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFRCPWndMqS7WX4RpH6o4dIBQj0c1TQ+raMxI9WsqnM=;
 b=WIekAJcrOi0BMN6EaFQ/w5Wyp1eGsJUEcwYjDdnfpcdHMLDVz80+iYxlwrjbrA8TcVJRnK6oUUgoGSAE09LBo/zGIq2bnQY8kY8YHdOVijMBjMReu6Uko4ktg/onxDtpRphH+NdQe/+9H32XssZbqTFdXFxI0SNgd2shVkvDkPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Tue, 18 Jun
 2024 16:51:31 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:51:31 +0000
Message-ID: <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
Date: Tue, 18 Jun 2024 18:51:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Guenter Roeck <linux@roeck-us.net>,
 Farouk Bouabid <farouk.bouabid@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AS8PR04MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: d309bfd0-2c89-4431-1712-08dc8fb6e78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|7416011|366013|376011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVozWGlSNnVpdWN1VGxncGpvZktMOVRlem1md1dSLzdYS3B3cHZneDVPNFdk?=
 =?utf-8?B?UnQyelF4bXZuRGcrbFZHeW1RRWFrUGd0YjhNSnlmdzU2TE4yZUxMSGxkcUZ1?=
 =?utf-8?B?TTJjTVBVU0VLNlBvUnprclJsVnZxTHo1R3FYODhHRHB2bzJMbnBKMnFNczlo?=
 =?utf-8?B?VlV3anBCTUs5ZXl6L1c3ZDk0TnlwK1c0REVQT3UrU05mWVNlWEl0WEpqUWpI?=
 =?utf-8?B?UHpja0U0aFFNaVRRQ2V3TTVTVU5TdG9PVEF2dkRpTUF6cWJnOCtnSzNlS25Z?=
 =?utf-8?B?aUZkenl1UGIzVVExRjVRMVFLNElyTk9JNVM3RERUc3d4bWNWbkRMZXpTYU45?=
 =?utf-8?B?aW91U24rbVhnVmY2dWVHdDNWY2lDN0xsbjJLYUlwMlBGRTNEUElXa29ObXV1?=
 =?utf-8?B?N0VlTWZEVWFHYStFL0RURmNaSnJOZGUwVFhwS1VkQzFtOFFIbXZ5TXhCZHBZ?=
 =?utf-8?B?Mzl3b2hqbnJUSTNQVzVlcFZNNmFvaFNURDRSKytuS3FtTmdjT3JHSExmc2Ns?=
 =?utf-8?B?Y3ZncEYxazhXQ3VhUjhaMGFMNmxTQmRvN3RSUmN2MUpIMzQwSEZZYm5TNGFm?=
 =?utf-8?B?RVBkV0JadzUrVnJKMDFxYnpUK1dwcWtCdUNDc292YnlSUjRkc2FSQ2c0T3Y1?=
 =?utf-8?B?TTVZQ3BMbzFpV1Ztcmk5cWdrRzV4MnJWekc0Mm1tdWJadEZDeHYwL3pKc2dB?=
 =?utf-8?B?OS84MjJHY3o0ZGJnUjVFZXA1aFQ1ZWZ5VU9HSVRMNmpsT0xiZVpQd0JxbkF2?=
 =?utf-8?B?ODhPUmxFVHhtRHJCT0REOTBZU1pKakFTdlJ1MGVvWEcrMXRRb1B0SWp4aGla?=
 =?utf-8?B?OGtwamo3TncrQmVJc05JRmlvaERadFIwT0ExVGhOSlpMNU44Umd0QWVTRnJW?=
 =?utf-8?B?K3BZTFpHM3FYa2FLNlpRL00yMUVQOXJCdEM5SUFwU3d3RGdkTHVyWWdqb0lW?=
 =?utf-8?B?L01Yc1pleDhLOGsyTi9FNU5GRmUxUW5wUjgyWnI3bkRXYlRyUHZWdUtjbUZC?=
 =?utf-8?B?Vm5tOTUvYjRjYzU5cURmenRjMmFKSFBoUzRMVTdtanUxV2VidDlNN2pLMklR?=
 =?utf-8?B?bjRTcDRVbmRQOHVUd3VmQUhXN1JsRnFqa0NVSHozT0ZUaTJGcHNmUUFzODhK?=
 =?utf-8?B?aG56SlpENHc0ZDZGbEFoWDZtQmdySjdSL2NXalhVTU9BRG04SHB0OXQrcDQ5?=
 =?utf-8?B?L1RpYkxiOC92bWhrU3VnRXFqNlEvY21zSWlUVDdJaVlJeDMvRlRWYUxMR0xZ?=
 =?utf-8?B?NjlKcWhhU2dMbVRMUE8zRjRoRjFBUVJEZ2ZQUmV1M254RGxFRTIzQW14VkU5?=
 =?utf-8?B?Zkt3SjRyYkwxeTRSekZTUkxBb0NTM3Nod3BmVVpKcmdBRXhVc05pdVpHczB3?=
 =?utf-8?B?R29hRTFIZHFzOGlFYjVIQXIwaGh6NTJLUHMrTm1iQWp2aFZ1RU5jaDdZRlJv?=
 =?utf-8?B?a3FzMjluUVNGQmhMMExLVjEwM09EMnVSb25ZdUhwNG1hVVM5NUVrK0R1Zjcx?=
 =?utf-8?B?cSsrYUd4clVVVE5iMjFwWFd3RTlHMmlXZnpScFRiaE4wZ1BqbFpiSlpFbUo4?=
 =?utf-8?B?K3IxbmJwTXYwTCtmZ2pDM3h0YUtGbTVnSU5oTG81V3BxRGhvOHA4Z3Z3M1kr?=
 =?utf-8?B?TjVxQ3VLQmFkcWNnVlRjUGppUE5PRWo4WFJVZWI4d1VRbnBEVjIxalZCdkFC?=
 =?utf-8?B?Zyt2bWJyUzRmZWNmT3ZMMnR2YTRHUGF5aXJuaDZ0eFl1SVlldHV4aUkyeFZG?=
 =?utf-8?B?b253clN4RzZ6M3ZtZkQyUHJGNUxMYitJSnhpbWJEdmlGcENkTWlTQlFWK1pW?=
 =?utf-8?Q?wAyCOv4Yy4EM0c51wxxq0/5Q0+OjmZkC3RAd4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(366013)(376011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukl4MUdFOWVsWHpPVWE2MEQxQ2h1VVM5eEhLRThSblhDYlErOHR5cDBaRlJw?=
 =?utf-8?B?ZEpvY0d2NFhYeVY0b1dEQWpJYzhaSjhtVUhwQlpONWZSOFRaRVJleG9Kd2tP?=
 =?utf-8?B?cXl2TlhzVWVXN25HWVQwSG1sUmUzMGU3WXphZmczSEY4VGhJdC9ybmk2N09G?=
 =?utf-8?B?SWhZaE42K2E3dk1oVHhvM0djUjBVMzZrZHk2MmdDSWJ0S2xZaU9wcXRETzFa?=
 =?utf-8?B?T1E0bEhyRHVzeUxJZXE0dGx3UmlsNnRydHVZSjJxZVBvZ2c3MFI4ajlKY0Jp?=
 =?utf-8?B?bVhLZTRKekNsdy9QRTVnWFVBMTJlR0ZqTWxhRVMzbHZiWlRyVk54eS9rUU9K?=
 =?utf-8?B?WFNIeURLajREbnpUbkhXMXJveVArMHhFd2pvZ1FoYXVxNHdsdWwwLzVXTnh1?=
 =?utf-8?B?Y29JVkFpWVREakVIL0pqNzNZTmVkQ1NRRFV6dy9pVVZxaDdQTm9ETGFHUWZ4?=
 =?utf-8?B?QzlYYTlDRHN6L3NGTUllRVcxRFM4OEJOK2NPL2NaVjd2eFZCbFJ0Qmd3aldW?=
 =?utf-8?B?TnU2Q2tsbmdDWDBPMTBLaExsTitXNE5DaEpMYjlWcUhxb0VtWFQzR3JpSm9B?=
 =?utf-8?B?blBOMjRYWmEyT2hNMXl4czlMamc2amRtbmxBd3hUNjZIQm9TQVlLK29OL1pa?=
 =?utf-8?B?VGMzZDVYQ2ZvZkczUUZNK2ltTm4yaFcrQmV4eUFRN2U0QytRb0V4c3Q0TVlR?=
 =?utf-8?B?VWMxN0pQbWFHTWluUGVySGZjbzZTM0ZaL0FqTythb0dLQnFUMWR4elVnMi85?=
 =?utf-8?B?WUdlMGR2MFlUK2dQOFJOQUNsaDFTUzB0MDBnVGNJeXhxeXNjeXMxbmhpcitM?=
 =?utf-8?B?U0w0UHQzUUZ4VmdQTWQvdU1OMHNFeGtKemRYOTI4TkxZVFBZOG5RbUt5L1B5?=
 =?utf-8?B?YWlGSG1OcXJIZ3d4S01vMVArbWt5L25ZSUZGb04wRVRCazZyMEFKaG1hSCs1?=
 =?utf-8?B?TVZkNVNUV3M0LzduMXBBNTRRZGM1TkFJc1AyWldjMkdWUXQ4SlZ0bjhFVWc0?=
 =?utf-8?B?Z05jc3ErRUtrcWZ0aTF3NlpodDZPVldheDhRVzVZclJRVnptcmowZWtyV1o4?=
 =?utf-8?B?ZzJJNDRSbkU3VjUvS3RjNUNwT3BZUjVyaVJWNVVCbVhWUVRWbXE5eXJCR2E5?=
 =?utf-8?B?K1V0WFJBV2FLQjdQNGp5T0FOK3VyNUFrTWZjZkYwK0RScmhmS2RHT0NyZjdL?=
 =?utf-8?B?TU41aEMzbVQzb3RVTEtVeXR5QmNHMWJBUWwwdkJEdUZHY09DZjBTN2xZSlEx?=
 =?utf-8?B?VVoxSmFBR0VGUzVhZ3RBTm40Q0JQOEd6UGpWaWYweUxPZ3QrVXk3MkxRL0RE?=
 =?utf-8?B?UXUrMlZ2UElqMUloQ002MkpqbkFEOWdNSGhtY3R4aVJwUnRqNWZVZWxqaXJk?=
 =?utf-8?B?UG9mQ0huYnBicmpwSEpIdTFJTnJETnpEL0pob1RhY1puQUZJSTROc2Vvbm1H?=
 =?utf-8?B?V21ac0VvSmpKczlJUDFVNVJMaHJnNHBWY0FlTUJleVNZRHZFZTVYbDhnOUVs?=
 =?utf-8?B?dFlSekhCbHVRZFNOWXR1RjcyNHhJd1RTc1VoK2lqWEw1bHV4RUw2eEdQV3Rv?=
 =?utf-8?B?NEJ3VHRrMkFpMzUzdzBmZUI3UjIzc1dGUEhTbitOdDNZS3VWYVdFWElpQXlv?=
 =?utf-8?B?RmlaT0VvR3JJN0dsTWJ5MDFraGRsVVFlSkJ2NlpLdnY4VkE4dTNXUWRtSlhq?=
 =?utf-8?B?OTc1MFZyNlBZb1Z4ZkVVcUdkRGFhWDBpajVNcElFZjRpQUtDaEdXSnZBTnVK?=
 =?utf-8?B?eDRoby8vR2txQlV1WXZ5Tm9wZW5oRnlpNWJXK3VpcHd3cGthTUZ6MWJZUStZ?=
 =?utf-8?B?ODdrM3RZeHVmWXN5ekZVQnRrSk9BY1BaYXhJMVVrQzVtRHpSdVIxUHc4Q1NN?=
 =?utf-8?B?TlpRS0Q4aHhYek5RbzhnalVBQmdBS0hGQzJ2bzZlQk5sZEl0L1BMZVFPZUFP?=
 =?utf-8?B?OHZuU2cwb2YwK05qSEdmMy85a1JQQ2xkcEFIYW94U1lLdlcvQVNjc0tmZjdX?=
 =?utf-8?B?VWpQWjZRQkxhMXhDZmRyU1BDckEzUVAxelIzSmV3R1J4cllnamFyOUJza2pY?=
 =?utf-8?B?bk1IL0dpMlo0eFVGcjgyM1VsRWk4WFY2SncwS0pQUUtwYk1hTVRyZWIrYW90?=
 =?utf-8?B?eDU3VjBrdUU3dnowZHlES0R0dWMxMWFHQjdVd1NCOGhocURvZ0g0SFhmUkcv?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d309bfd0-2c89-4431-1712-08dc8fb6e78e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:51:31.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhjsRP0piJYglkXoBPj/A84qJnye/xSwx+WpGjZVHDKR8SRihSWWbYJQV99uZuto0Jse5NCg+dnJmm0fTgBPWbHwmWhgnkgeb465jtdO1uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542

Hi Guenter,

On 6/18/24 6:29 PM, Guenter Roeck wrote:
> On 6/18/24 09:06, Farouk Bouabid wrote:
>> Mule is an MCU that emulates a set of I2C devices which are reachable
>> through an I2C-mux.
>>
>> The mux and amc6821 combined make the Mule multi-function device (@0x18)
>>
> 
> I don't think that is appropriate. Those devices should all have separate
> devicetree entries and be modeled as individual i2c devices.
> 

I think there is a misunderstanding around the wording. They all have 
separate devicetree entries and they all are individual i2c devices 
(from the PoV of the kernel, they all are emulated within the same MCU).

- AMC6821 on address 0x18 for registers from 0x00 to 0xfe.
- Mux (paging, however you want to call it) on address 0x18 for register 
0xff.

Note that AMC6821 is **emulated** in the MCU so this is not some HW 
trickery here.

This MCU also emulates ISL1208 on 0x6f, as well as a PWM controller 
(merge request pending) and two small AT24 "protocol" EEPROMs, on that 
same address. Those are behind a paging/muxing mechanism. You access 
ISL1208 through page 0, PWM controller through page 1, etc...

So basically, the point is:
- 0x18 on i2c is now MFD Mule
   - two platform devices behind MFD = AMC6821 (reg 0x00 to 0xfe) + Mux 
(reg 0xff)
- 0x6f for devices "behind" the Mux
   - page 0 for device behind adapter 0
   - page 1 for device behind adapter 1
   - ...

All of the above are part of the same MCU.

Mule MFD is a simple-mfd-i2c device with its own devicetree entry.
Child nodes of the Mule MFD are AMC6821 as a platform device (but 
operates over i2c) and Mule Mux. That's what was meant as "The mux and 
amc6821 combined make the Mule multi-function device (@0x18)".

The Mule Mux then creates N i2c adapters representing the mux/pages, all 
of those being represented in DT. Each of those have one device on 
address 0x6f, all represented in DT as well.

Nothing hidden or hardcoded, everything in DT.

Did I miss something here?

Cheers,
Quentin

