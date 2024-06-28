Return-Path: <linux-i2c+bounces-4453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8253191BAAD
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 11:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4AED1C23A87
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 09:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698B314F9EB;
	Fri, 28 Jun 2024 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="EPeDjb7N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2091.outbound.protection.outlook.com [40.107.21.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC914A0A7;
	Fri, 28 Jun 2024 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565441; cv=fail; b=WTxcWMmrBunFF8TghJNbA1eJd6caadz2GpdGQaLUlJRkwJuCmbsqmqgdTU1fW+aqTvSvfgf+Wb3QhM4AB+bO1mcTU3PXXg+rvOxHE/WoJdGnf9vknDGhtXF5uvPV9jMDmxlYxeBjk3MPvZ216+d2dfDbT75y0fW8hHl0MLwxK4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565441; c=relaxed/simple;
	bh=aO/KCd52ZdXT+gOZXTeIhWCl+YcI+z6INyXn7clMFkE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=otxmJDIDQwDapMmyf3tevq1dgMJa8lrUriPrZ+lzNEy03BeA6mZDD6sqVkrzj+GV4KwtXLKuQAjU+uX6saY9BpPUjhqVA7RjTm80Ncvqf4F1KfNVeh5a2Yl2NMaiIYtl87jCAaTY1Ow/L7fYs0yBREL3sJeJKg637vC+/SY/OVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=EPeDjb7N; arc=fail smtp.client-ip=40.107.21.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+JzANLJgeAcS3dLjzRoP4rpVlSfJi8XUmzYPfWxWBOv0sd9v/LufaCWUBPkHUn5IA1cFk6/8tcWAUZPSIglHP+rNIq+hA8VLvFQjLKF6oztMqO8Y/Y7yF/O7Dl5OYGQ0iD4xU7dn8sdxC1xGEPFQEILe6lbfQAPt5m5iQjmBnkV9HgSvZs7y9Jx2JTi4Qqh4bHkyOj4LvP8ohORJq+RrQ53o2fHWXhD4P1E66/GHG40uW4i/ZJeJqYXfuiKYscIxGlkqq51l/czWaNCW2QljwI1gBXLy/l5S3pItAFu1rgB3tBv9uTvAssjO3peDFrEu8Lqr5IoC3Hcy4lGnl7m+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCh+mqIonAgjuOZJBuIc0InW2wvkfW+ajHc99EO/soY=;
 b=DlJ+zBEyy/4AGyucPRgONkKghH9OaDonXFc95WO9tHD0Dp+JJJH4u8o1ygqEXAxfa/lFkSm3GF7Db4If+McUBPyVQjnnGEkPHq7d9TMfiTer+HglbAJVHRS0cv6GIqaA2TipKZjWycYucLrtZJBj6X8i0lqMDaPwCH/W+oA0gJMzVJHFNta4ap+d/IH64v3RX+m3Yqc0oR+s/xjnwpBvMXzW3MYCvTWIhoPHW3nGiytdvC0p56WfRMOFRFgkKzxj0b52pybxCsYXJeEqopUBEDUDnSwsUeDDP+eSwoyGWc4W2diwhRdM4/yFCjf1fGbWRxVHSAavoDpkluPHMoDnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCh+mqIonAgjuOZJBuIc0InW2wvkfW+ajHc99EO/soY=;
 b=EPeDjb7NeSGsoJiKvhxpeCH58BctwR0cvVylxmCHXay5sYnxEHwijNCZK/dzuZNMsYQ1wteYTml6NcumthYOe31OaIbvJwV1yGCKYMrVbJZwtFZmh4v5zCv8YY/S3zAmopCAAHEYbRaWr3hWyX6Y6Yep47v1FZ8hXO0bTn93bTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by DU2PR04MB9052.eurprd04.prod.outlook.com (2603:10a6:10:2e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 09:03:53 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 09:03:53 +0000
Message-ID: <20999754-c4c3-40f7-a9fd-88b2d3d10785@cherry.de>
Date: Fri, 28 Jun 2024 11:03:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Guenter Roeck <linux@roeck-us.net>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
 <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
 <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
 <19ee521d-298d-4718-bdc6-f282666de371@cherry.de>
 <2a1ae708-3718-4f70-9837-bcc50b7c8f66@roeck-us.net>
 <85b2061a-9f5b-4998-b9cb-21308ee1965f@cherry.de>
 <dbfa52ab-c6fa-4c11-89bd-87445941bac3@roeck-us.net>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <dbfa52ab-c6fa-4c11-89bd-87445941bac3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|DU2PR04MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: c8db8f14-b018-497c-30f1-08dc97513c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTVDY3JiN054SGtTMlRycHJWQk1vRXJmZGRFTytiSW5Bc1ppMk1PMWJicWxD?=
 =?utf-8?B?TWhXditIQWFISEx6VzlDalRjdjNLRHZiSjk0NUFsWFgrVXhiOE84UjVZR0VZ?=
 =?utf-8?B?cDloMUYxY0dOUy9xOUpWRGxoUmlzVFd3TDhEeVk4YjhoZVJBNHh5RGN6eDNF?=
 =?utf-8?B?ZjIrQUZTYkwwUXlYdDhRSVdZczM0c2NYMWNjajZzL05RWkV2QzVqR3ZmTTNX?=
 =?utf-8?B?NU9TamVjeC9NZDdYdnJLMjFsKytQcXM4Y2Nzd3ZlVlZJK0dpc1J6bzd1R2dn?=
 =?utf-8?B?eFVqNFhmTGtmV1NGWW91eFdWQnltNVlWL0lwOW9kZnJrL0J6WkdqL21Wb0dr?=
 =?utf-8?B?NzE3RVU1Nk9PL3pUQXlZV3ZBaDJHWStSc0pXcFhHSDFRUTdwekpvc2JIUjVo?=
 =?utf-8?B?cnoyRW94S2hodmdQT2VtWjVMajFzZGNvY0pXdEhUM1NHVkdXMGdVQ21Hb0RB?=
 =?utf-8?B?S0JlOWUzRHlEbXI3bmRuN1k4Ry9iS1R1Ym5iYVNOKzV5RHZlWTk2b3NxdHNo?=
 =?utf-8?B?aHZ0VlA2ZFJHeEtHWnNnbjBwZVo1L1c0amJRb0lGOUt6UEJMSlRaWW5VZUM5?=
 =?utf-8?B?WDU2VWhwZnNRSmFqNEtrNldmT0didXJ0NWhjZUtFem8rL0c0bEdKZWJPTk41?=
 =?utf-8?B?TGNHcng0QVI4S3cyc3ZVaFpvWHhPOTdYMmdqcVMyVDJ2MTlVU3E4MHlCNFZG?=
 =?utf-8?B?V044T1hNM1RPbkxnV0xpREhrNVp1bVRoK2Y5UzBGc2d1c3VQM0RwNU91N3Nk?=
 =?utf-8?B?TWZ1c01jL3ZpYWJ0RVBLR05sRUEzaVcwOVRtVFpVMGRsdkhNc2ZuNUpUTU9T?=
 =?utf-8?B?ME05R1FLbHg5RWlFMkFvc3NOM29TeE9EelUzcS9ITkd1SHByN3VISzJpV2dl?=
 =?utf-8?B?clBVa2hkMHpDakZuUUlpNzB4cENyci9jQVJSTEVuamZteVVCb2pmVWJmd0FC?=
 =?utf-8?B?Q1ZMc1hPSmlRZXZvY0lrbFRtMVhLNXdvb0tVUUhad3JBYjJBaDJwdkV6RHFt?=
 =?utf-8?B?YWdpQTYvc1RrYU84MENBZW5pN1ZUbVJEZDc1Nmk4cjlCTC84bnF6RW9qTXlI?=
 =?utf-8?B?dlRGTjcyWDZoWHU2RXB3MTJIdzdYZFFHN0tzRURMaTlSUGFlWnBzajI1LzRp?=
 =?utf-8?B?TTZNd2ZzOTJCL05XSjFrYzNLSDRyOFcySkpLWjVNTGRpZE1jWDE1L0dKbHNj?=
 =?utf-8?B?TTFONlJ5b2NQdXFQQ0ZKSVQzZWF6dHQvSHZObFJEWGllbStGL1VoV2pZdlFu?=
 =?utf-8?B?bGFWaEh0MUpQRHJnaHVSemZ6OGJXY1RuOEt6U2N1aHEyUUdDWDZNOFNMY2V0?=
 =?utf-8?B?RWZvM3kyTWhocGxIeWp2bmhjVVhzNkZ4ZnROa2szbjJDMEhDaWJzTlY1TUZU?=
 =?utf-8?B?RWFLK1FWRTkxZElJaXlmZ1J6dTJhS3FBeFpDYWxjMDVBQlBGVnJlTzJmQUs1?=
 =?utf-8?B?QjJpOFVGaTVUWGMyUUtsYy9ZTlczdFN4Rk95YmhFNk1MaitFc1dlTnd1Mk5k?=
 =?utf-8?B?V3FGK3ZzQTM0K1dmQWJwZW8xOTE3bHlKT2VhZ2JPdFZ0dWlNUTlkUmxwYXNL?=
 =?utf-8?B?QVpmbm5wRDBwUkdKUzhrbDl3SVVpV2hTYk5STmNVeHVjUkF5UFJ3VzBWdFpQ?=
 =?utf-8?B?d3J5OHU4VS8rNENxUTBwajRpcFFkZ3FkZGJqVDhBbkNIZjVRUWZJK1BNQnBY?=
 =?utf-8?B?eXJEbHN1dUtlcGRKWElFMFZuMWJzRGNiWkM0MlVWdndVRHphMWdyUHdZbk5L?=
 =?utf-8?B?TnpCdkRmZ2dPWVhaWDYzQmdrOUF6VHJiRU5vS2RGSHlwdCtkQ25Cc1QxWVdh?=
 =?utf-8?B?dDkrQWt2RUFqeHR3b3ZERitBaWc0ODVkYm5FQ3UrYTNselRGeVhqYnRJSVlh?=
 =?utf-8?Q?/UDrmES/PmU41?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1FOUFRNWFliUXZPUkVZNHJ6MFg4MGRWNjBaUXUrdjU0RWtCbUZ2T1NTVTlZ?=
 =?utf-8?B?akd2dWZqUUhMZ1ppcGw5bkRtTTFDeHFCbXo0VVN3ZlFEVkdEbStyZ3B5U3NO?=
 =?utf-8?B?VWlKUlV1OXhLOTk4RmhWU2ExcUFCUXVHeG9EUFpuOTRkcm1qMk1FUTFtbzZp?=
 =?utf-8?B?aHc1dDhLZFo1Wm9lUHRYRXpCTFlpcEdCSXREbXRHYjl3SDBUNTJQbzZ3ejJW?=
 =?utf-8?B?NWwyTjRFNm9qeC9WTzlEMDU0dEV3OWVGMzloZnUvWURBYTZzNFovMnUwQ1hP?=
 =?utf-8?B?RGlsczAwUnNLZW5KWU1tK1lNY2tuVXdCYmxpNVFpa2EzSnVwVE8wemFEMTds?=
 =?utf-8?B?c25aR0d2T3ZiQWhjRXJDOVFUWGJJRVJnMmloaThjeUhSNjJTYTBEYXpXY2xw?=
 =?utf-8?B?TDMxajFIV28yaUJZRE9qRWI1SVVTNzZBTTM3bUdVQlgyQ01YYzlNNEp1cDZQ?=
 =?utf-8?B?UXBwUy9pVWpuYjZiUk1nUTBUNXpIK1h6Yi93K2hTRU5sMHROQUk5dGFMaXRo?=
 =?utf-8?B?M1RUVTVwb25lQ00xSjNCbWhsbk54aVpQd0FuUElnQjFHdG01bGhnamtkbUtW?=
 =?utf-8?B?UkJOaHlNTGRwTlZ0ZVQ1bDlESTMzK1U2RmRYbmwyc0ZrdnN2ODc2OUkzSXk3?=
 =?utf-8?B?NEVNd0hOeW5yUDI3NHRXcThHaHkyK1NobGJCWHlGVXlMMkhwYmRwT3hMTjR1?=
 =?utf-8?B?N3NpRWFhWTU0ZllFdUcyb2NPdnE4Q1lnQ1B5eXdORmVHZGhJVTVWTnc1RzQ5?=
 =?utf-8?B?L0hHdStQU1JXZm14ZW5jVGM1OVkyeUZnUlBsUkI2aWV2TVZUTGRYYkxENkwz?=
 =?utf-8?B?Vk9tR2pZSUZpcXlEdDh0TllCV29IZUwwOG9LK3RISnJQV2R4elhpV1phQTZB?=
 =?utf-8?B?N3gvTEFUZ3F5a2g5SGdVZW5hNld4cjJTZWQ4WUJicGw1NDh0VFhpbTBRcTFp?=
 =?utf-8?B?QzZSTXRSL2Q4UnRQbHNITGtsaDRvTngwbm1iSXJrNlJaZzJUbTB2STN6SVdJ?=
 =?utf-8?B?aytONjVBZXdNWDhsYmZlV2NVSHYwR2RiVHJyVW9md3oranRrYklCdThaR0tL?=
 =?utf-8?B?RkJMbUE1YnNnYWhiVlVGclNaZEVSajNNSmxsNzFZeHZmQzJOMlVCbEVGMHpY?=
 =?utf-8?B?dVA1WkU5K3Uzd2NCSmNySWsvWi9Ubk5YVWlqVVp4RlhzRzV2ZTRBZEo3eitS?=
 =?utf-8?B?UCtyNVErLzBRblJLYisxTXF3WExDeGNDZGwvdjgwQ0Z0VWRIczh5bG9BVUFE?=
 =?utf-8?B?VUlxRklWMXY4WjJ4bjYzOGNQUjFTSWhLb1VJQzVxYldjSVdoMVB4YTd0OGtS?=
 =?utf-8?B?ekVNZzNBWFJrWXU1SllxblhmMS9SM2pzcjRET3pYa0w5WGJqWTgrc3owa3RB?=
 =?utf-8?B?SWxMNWIxY2I1ekV3SVJWZVptNXRkM3EvZFhqUXh0cU5xK1BEeW5WczVTYlJY?=
 =?utf-8?B?WWdjNlNrbm1kVjlVd01mL0FuUTRIMEZIbU1vQWpWdUhpWVVwRGhEUk1RdUhx?=
 =?utf-8?B?aWJyL0o5a21XbnVoc2JnNEc3MW43U0FlR3RSQTh2N1NSYTlWUENhVnQ2L2p6?=
 =?utf-8?B?cnA3MFJ1R04yanVBL3lOSkF3NktjdXloVWNUMWV4WEdIY2pNczZqVm5xYzBS?=
 =?utf-8?B?SzRuSVVHL3FQSVhMWTlOZ3IvbXNXZTVwMGk1aGJ1Ym81S243TnBraEFBcnNH?=
 =?utf-8?B?VWNMdTRDTm9TREZXSFZBNkZlUktSbzdwcW9rSEVYbWNIS01xYjdNbGIrV1dV?=
 =?utf-8?B?cHZPR2laRU9BQms2dFJES3pmMXZxTnNNdE1zUEdVbXE2STBTS0IxR2dyY3dY?=
 =?utf-8?B?SVFlL3lLYVlHWHI5eWVoT0ROUVE2WWlhKzRxUGpVT2c0SkVFaVlPdzY3L1Nr?=
 =?utf-8?B?eHRoUnZPbGNVRlkyek9hd293Z3N6YmVxaGlNbkJiWC84R3pwbFl5UDZUVDMx?=
 =?utf-8?B?ZitzQmpLbys5YzBuTjN0bldPQ1FsSWdzSXkydjZ1aFZWSDBLNlJJdjFoZVNY?=
 =?utf-8?B?aHZ5aTB1NXJqempxbUFEOXI3Q3Y1a3VlcTQzQURWakFmYm5heWFVU0FrbWJJ?=
 =?utf-8?B?Rnh5aytyTTJrc0VUWUFqM0JSWDNkVVhYQ0ZOK3A2SEtVYzdVTjk5dlZpZ0w0?=
 =?utf-8?B?OUtYQ1IvRDdKQnZ2Ly8zczF1UHlsY1grTHNNWnh2eFVLZHUrV0lDSUdpckcr?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8db8f14-b018-497c-30f1-08dc97513c21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:03:53.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxgeMQiW0NHKS1ShpgPW/dkhAZsB2wNPNZ4ZmYs9DP2xhuwAdCWjWRrxBltZoYG9HfEBbGVwIchFjiToHIeQb1FuWFz/rjyJ910iMrsvL3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9052

Hi Guenter,

On 28.06.24 02:05, Guenter Roeck wrote:
> On 6/24/24 09:13, Farouk Bouabid wrote:
>> Hi Guenter,
>>
>> On 19.06.24 15:31, Guenter Roeck wrote:
>>> On 6/19/24 00:45, Farouk Bouabid wrote:


[...]


>
>> If we cannot proceed with that then we could add a compatible to the 
>> amc6821 driver to add the mux device (Basically the "tsd,mule" 
>> compatible in amc6821 compatible list would be a combo driver with 
>> mux logic + amc6821). Do you think that is more appropriate ?
>>
>
> Implement the mux as part of the amc6821 driver ? No. We could discuss
> instantiating the i2c mux driver from the amc6821 driver.


If I understand correctly we would have the amc6821 for "tsd,mule" 
compatible probe the mule-i2c-mux as platform_device. Possible DT 
representation would be something like:


i2c {
     #address-cells = <1>;
     #size-cells = <0>;

     fan@18 {
         compatible = "tsd,mule", "ti,amc6821";
         reg = <0x18>;

         i2c-mux {
             compatible = "tsd,mule-i2c-mux";
             #address-cells = <1>;
             #size-cells = <0>;

             i2c@0 {
                 reg = <0x0>;
                 #address-cells = <1>;
                 #size-cells = <0>;

                 rtc@6f {
                     compatible = "isil,isl1208";
                     reg = <0x6f>;
                 };

             };
         };
     };
};


Cheers,

Farouk


