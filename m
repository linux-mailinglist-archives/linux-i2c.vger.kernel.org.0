Return-Path: <linux-i2c+bounces-3704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1708D3611
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 14:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FC02887B2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 12:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14A5181311;
	Wed, 29 May 2024 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="fCqmzRu6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2130.outbound.protection.outlook.com [40.107.6.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94C180A91;
	Wed, 29 May 2024 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984829; cv=fail; b=FZ/ImfF0BVuMEUV0e2RyuF4CVtuBu9ULHNa8qI8ku5Ed7aZU1e6X9P67NW/fI4N+LFl/CKe0YQaNL11EjhaK48N3nLoRxSPxUbXCawB1lJmWrZh6xsJufdN/P3R+mzaIzpubBzbyic5YoCY1a67iSN7Lyj3/EiPbvk6jF6Jlfi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984829; c=relaxed/simple;
	bh=xz7iLn7qgHGs58gX23WYQL3/jcIsxUWTaUKRKla0/kw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FV5LDh1Z8HySOfrPeHiReM/vkdDAH2lCkkT2OrsanQvoD+hYTEbBfT3tMW0HrnS5r4wciA+f0lNA1cZSSXsiwRLEGUoWQfBMvOCkLv4nv8+XEntx3e1sWEa8KVaZfwU5bxmhgjEkxRi7m/+JnxrB3p47Segs94Wo64XsPGbEq98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=fCqmzRu6; arc=fail smtp.client-ip=40.107.6.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5LeRGQd6GHQfESz/BodhC/HNoLf8i6VheEQEWC4BZoI1yDGA63mCP2gWp1391IthiwfTySGlJ/BhtBRyLoQhU6av2zCK9PXqxL5QjYdnkUJMAY7Gy2+qfvBJUpWhvwW+b7Qxie0kWkzrh0kKce9LracZCT9L0bpAmg68yAgbO6SU7AMXYB2LmYq4SSRUShgD8Rus36IpRQKC0BBpglQAA/xMGKgK3BJreQXvCX2mUG8F5xcIMeDkVQuY+bqmTty7GRO8BpbNGEtTj7T1UeUDY9TRbhP6Pb44cI0ftM8gOVnHT+UdFC7CuL/TTIuJn7TTjJcy2X1Ma2Vk/K1Tny1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ho4KYEzLyZkx3hn7SWU1uCVzIe01KaQ3UZwH1FI5Lls=;
 b=ZaIEU2MFIjuPnc6Qmm20L+u3Huj7PWEbEama8NppYcj/HJ5jhcvH+kxyRRY0NpJcff5PyZErkkUIrU1tRmrCkCbYKVUMIE3/7/sEGqrePfEJRF5xBNJdzMn0atVT9P1iwqjrdDcRPljRbRsKDzE+Ib8RrtGXUuMIxeDmNI5oPwGrPPEVhwBss8PxfbsZxI9efHnURTowZVdEk59V+lqztoYJbZVMGnzUb0X5lH8tLjpJtetr+di0T3Jvf0UqH55mgaX2F+tHfCOXGm41E981taQy31yxXv/7lDf2qzrAQC5VyZzIC5liKZcifH8Ad+2F7WDtFtOFOY9LMJq3E4rJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho4KYEzLyZkx3hn7SWU1uCVzIe01KaQ3UZwH1FI5Lls=;
 b=fCqmzRu6V8ENoFiQwo3TK10FmcOhJmqDJI/xeznJ3eRYLbhYWNTh43N6LVQ/Ts/qDmBqIhkPzni+oiP6zeCAjxrWeJBRptixNsbRRVpQsyvijqWfN9gI3Ohyo1jC7P8eHiain/o8qEMRHVhK7KhJJ+Uv2q6INWLIAYBvlgGdF9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB9PR02MB7116.eurprd02.prod.outlook.com (2603:10a6:10:1fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Wed, 29 May
 2024 12:13:40 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 12:13:40 +0000
Message-ID: <718d86a7-d70a-c38a-089d-5276bcc6e88b@axentia.se>
Date: Wed, 29 May 2024 14:13:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: gpio: Add 'transition-delay-us'
 property
Content-Language: sv-SE
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
 <20240529091739.10808-2-bastien.curutchet@bootlin.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240529091739.10808-2-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0000367B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::397) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB9PR02MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa4422a-1baa-47ad-3f05-08dc7fd8c6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnVNamkwQmRXTGt3bDM0dlF3UmpZeWZOcDAxdC9PTjg2UjArRlNCT3FZZlg1?=
 =?utf-8?B?aHhENVFIOU9rTVJrTmpHVDA0NWpIUDZKclA1WDJ5TkFPUU5aR2xXSVJrWWIr?=
 =?utf-8?B?NTdZUGQrS09yK1ZadUtPemRiVU1LUVphSTdoVDcvd0tod2w3Z2gzeWhheXBk?=
 =?utf-8?B?eHZLUTdzTm1FUUZmaXBjVWpQd1IwZHJHRHFnQjZHZGwzbnJmTFJpRFVOQ0Fm?=
 =?utf-8?B?RVY2c29QU1BJTDJhYVBNOFpKZ3pxQUliaG9UcEc1NWVvWDA2d0YweWluL1Jj?=
 =?utf-8?B?by9KSWl1bU05K01aVXdjd1JHNFhUQlNaTnlFNUY5dUlTekZuMTJ2elZUK3N0?=
 =?utf-8?B?ZXRiNHZFeWtmVUdxR0Z2NTRGSzlJeThKUmxCRVNGdzBHZ1pKU3E1V1hFYWtw?=
 =?utf-8?B?MldSeEJKcmJUMXg3N1ZKT1VHVnZrbUpCcDB6V2oyRlp2cVRIR1h1YkVoV09r?=
 =?utf-8?B?VWJPQWNqdUthSDd2Q2FkTzVjVVV6aHRrT0F2MG5CM1BmOGJMNkFrdDlCYisx?=
 =?utf-8?B?MVlhSitRQkM3b2tvbDEyVXlRUGhFZzhsZUlYRXl1SVlvdDY3T0c3cjhlcTZJ?=
 =?utf-8?B?Wm50czA5aDd5UEFJdFdRUkVaREpMa01BMnZFZkc0dDA0a3hWcVArNGNGS3Br?=
 =?utf-8?B?dmQ0MElVUXFNMDNOYVVFcFZRRUJ2VWExVURaajllUDRrd1hZQ1hFK3QyalhP?=
 =?utf-8?B?cTNGZzBCNVdmUlE1SjFaR1FCVGNQQUdwK2V6ejYwRVNXTnVHRENOMTA2VWVB?=
 =?utf-8?B?NHdQUVhHQzlmbUtFdUNoNUl5bGZacVk0T2pjZGoyUy9MUVJNRUxPNW5UYjc0?=
 =?utf-8?B?K09UYlRRMC9FT3VuaHpEV1BEN2szR1pxSVhSY3N0VDZYUnNoY01qNkh4OEJU?=
 =?utf-8?B?WmxSd1RqYms0cTRaZlBLaWRFd1cvU2pvQm52RnpnbWtkdC9jeTJrYXdBUFlu?=
 =?utf-8?B?NGk1WUl4dGtLVS9YZFFoekd1ZFRWcU5HaHNlYW81Um02T0Q5UFlxcmhmdTdy?=
 =?utf-8?B?VFhCTk1CZ3BkRWlkMjFFdDh1akpvWGdYcS9zUHZ2aUxvMEJvcDUzN0dENjVN?=
 =?utf-8?B?UjNtY2dLcVl2bHlqc2YzeFlWdi9GbVR0dUgyWUFpTTgvclZuZ0h0UXFNQmJx?=
 =?utf-8?B?VmdsQW52VUppMDJpSWdUcnJDK1RoQzFINk9GaGpqc0ZmVDdtWjdlY3M0SGFj?=
 =?utf-8?B?cFd3QjhtcTAycnNnODFsSCtVNXIwMFVIU2wzSzJWWHFsK2dENjdnOThyK0Uy?=
 =?utf-8?B?YVI4Tk9Mbkowb2ZpbUFSRG95ZnB4STZ3QlA1dnhzWFUyY3EvYU92L25TcVFX?=
 =?utf-8?B?L21rRW1IVDJOVmZrZDkzajB6UFcvYVVXRXVLa0JhMko0NlJyenJCV2c4RVhB?=
 =?utf-8?B?MHlxSldwUkpLUjdQY29pWlh6TXdZM1U2RTJtV1lvZHlsMEdPVkEzckh0RUVJ?=
 =?utf-8?B?ZG5EZC9BWlJSUjkwT01YRWphSTE2Mk5VVS9ndElEMHBDRVdSK01UdjRubU5z?=
 =?utf-8?B?N2Zxek9JZEZqcmFRTE1FeFlpRWE5RXlFWGRYSmYvb1NkRkU3bWhOUzgwaEZW?=
 =?utf-8?B?aEhuSEhOMWp6RDFRZE5DWDc4VitQczVSOWlQMXMyVmhpckQ1Z0NZY3QwSENU?=
 =?utf-8?B?c0FFQndFUkludW9KeXNkUTZzNy85VytIbWthMWdvZ2IwQlBGazMxSW5UZWVl?=
 =?utf-8?B?c0g4ckpHTXVVMkNhK3NCbXhKVjBBNlJuTGNxK094YytXY1p4YWZVd2FRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em0yYjhLbUZjRURnVXVtT0RjTXpmT1UzSHZHdnkvU1N1RXdjeXpSUXFWYmg4?=
 =?utf-8?B?ZFp6bFYvSS9QYmEwQ1lnS1Z1V2tNQ0NLbS95STU4NGtaVHppZUxtMHJlcGsx?=
 =?utf-8?B?QkV4ZmRuSytzSHdDZ01LV3lHSit3WU5QdmREQWQxeHdpM2VONnk2WTN3YVYz?=
 =?utf-8?B?K3IzeSthSjhzRStzMXF4eTFtcFVLMXBob09ieG1LSjUrekpTTzNKdElnVXBG?=
 =?utf-8?B?MmFFUDlnNXN4Mi9IWnp5NFk1ckM1amdVZ09JS1V5aFVaME40UlNEbDZPdEZw?=
 =?utf-8?B?aWJDUXV0RFFuL29CUFRRL3IyempsM1J1SlJ0VkdCZWxwL2Y1d2NSaVZaMGNH?=
 =?utf-8?B?UTZYU2JuTnFKUFpYb2dQUHpSNTllU25nRFNEQ1lHRTVXQXVVdHpPUnd2YUg2?=
 =?utf-8?B?ZlpxNEhWa2U1dWo2NW9aMzB5N2d4cENoV2Jwc25oeW44aG5MTTVzTmJ6bi8z?=
 =?utf-8?B?NU9uZHVTUHdEYkplaHIydElsTVBsaW5ZNzRGL2szMGlwbVJBMlZKdU1pYzNy?=
 =?utf-8?B?YTBMMjRtWG1mWStxTU91MzdpNW5HVnRQdzd3TUV0cHVLK3h0L005MlJiQmJB?=
 =?utf-8?B?K2RkVzAvRElXdW1QUzFHVnd5QmduM0pkVnNIZHpQNDQ4WWZtbmd0RmRjMlBG?=
 =?utf-8?B?d3RsWWI3TkFEVzN6aml2aDZBU09VN1llekJ6QWowcnFQT1pLQUxrdCszSFZL?=
 =?utf-8?B?Q0IyQW1IanB2OVViMEdmcEdNZmlGcUcrUjV2Um9rdElhOFVtY1J4eWxRblRM?=
 =?utf-8?B?WnpobnpwWEhTOWtUSGJpeTEyWTJ2aDJ5eXNzdmRYR0I1RVRVQ1JqNmJhL3Vk?=
 =?utf-8?B?eUFyVWJ4V3BkQ3IxKzRIeHdWdDhURTlpdHVsRktFd0NjMExLR0h0UVBYNTVK?=
 =?utf-8?B?WDJWQVB2dGxlWDNDdWtzZVhEQWVMZVZkU0JIUFMrMmN5dUowQlowWXk1MU8y?=
 =?utf-8?B?b1N6SkZBU253Z3M4MStSNDBMZUNuSXdkQ1NpOFJhcUlHMlEwSGRzOWhIZkgv?=
 =?utf-8?B?dTBEelpWSXpSdEhwaGl5NDlMbDY0SmFMbit1WUVJVTF5MUl6RGhyY28yZnlu?=
 =?utf-8?B?amF4TVd5OHVqU1B6amJCZGR6Z2ZFcnA2UWRjcGV2K2NINGFaSDR5OWVxNWs5?=
 =?utf-8?B?MWJqNWdoZFRRQmUwMzhXNDlYUE4yK3JBOUVxbG9ac2pha0NZcUxZSnVvOGxt?=
 =?utf-8?B?cVQ0azErUTFYendFd0RYNWVWQTcvQUNTdVhvU2ptbWR0U3lpK1dOM3hTV0Ux?=
 =?utf-8?B?SVA2bmlkcGhOUHN1NHVRQVV2VlFBTkhaWndyaGx2YjlvM1gwQXZKdlNJS1NO?=
 =?utf-8?B?RE9sY1p2eHFHL3NGWWFYUEpOL1l3TUFWcVN3K0hLR1FuWEtIWFg0bk1XQzlk?=
 =?utf-8?B?TVVqMjQ2LzBwcEd5NUhGT2huTUxvWElWci9xTStuVTJSa3prdW1aOWkwd0lo?=
 =?utf-8?B?eGk0ZHlkSVVaSk95R3Y0dkZJOS9IUXNJZ0hnYXBWN281bWNZdkVZKzllYnFC?=
 =?utf-8?B?bUF4b0FLVVh2aVZpQlZ0VHhoWW1wUlRtN2xUMXhiVVJOb00rUkNnVWVHYUYy?=
 =?utf-8?B?ZnY5aUk5YUVZV1k5eC9NdFJSd2NrTGJQY1liSVN2dFJMQ0NYRjhNSHNFNDhm?=
 =?utf-8?B?dCs5dE15aDZuNk1uYlZGYlRoL1FrSjlYNkNzYWhnYWNMMjV1eDVhUXI3ZVVI?=
 =?utf-8?B?TERzQmUraHBkSU5nZzlsbVVHLzdxM2QyRmY0RG9BYi8zSjVUbzdDQW05L3ZY?=
 =?utf-8?B?TEhaKzdqaHhMT0NLVDJ0S3cyZkI2d2V6VHhWd0R6ZWhMVWRsbXpNRGw0NlRQ?=
 =?utf-8?B?a0VkVzN2VFFSbVpmNnNYZ0JJSExzYjloT2FWZk1JWE1GaVlwdVh2N3RhMnBY?=
 =?utf-8?B?TjhJWFNPM1FuV1JZNE45VHkzRkYrTVdNbmc1Ry82YnlHVmdUaExWbE91ZVN0?=
 =?utf-8?B?VS9CSlA0Mm9ueE9NSGx0cjIwalRURHFEOUNiWkoreENleEdZZUV3bkhNUm1W?=
 =?utf-8?B?SEJtczhOcXdQbXdMb1pmeEI5QVF1MWxGc3I4bVVROEwvYU93VmpQMUtzK3pz?=
 =?utf-8?B?NWY3ZDhKeGFmY05qdWFVWWVidUxHQW4xZ1ZjZ0Q3UzdzdEVTRStsOGt6cmhr?=
 =?utf-8?Q?KwuLyTzyXzrwaKbhSEGbagKVt?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa4422a-1baa-47ad-3f05-08dc7fd8c6a3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 12:13:40.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4wAt98hBG18uJa1oXlJdWnehXUR3IogOiudMOvSXePI5z3vSprsFV5Z6Hra2Dpe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7116

Hi!

2024-05-29 at 11:17, Bastien Curutchet wrote:
> I2C MUXes described by the i2c-gpio-mux sometimes need a significant
> amount of time to switch from a bus to another. When a new bus is
> selected, the first I2C transfer can fail if it occurs too early. There
> is no way to describe this transition delay that has to be waited before
> starting the first I2C transfer.
> 
> Add a 'transition-delay-us' property that indicates the delay to be
> respected before doing the first i2c transfer.

The io-channel-mux has a property with very similar intent named
settle-time-us [1]. I think we should use the same name here.

[1] Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml

Cheers,
Peter

