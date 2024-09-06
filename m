Return-Path: <linux-i2c+bounces-6310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3C96EF57
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 11:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C8A1C22C32
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96AB1C86F2;
	Fri,  6 Sep 2024 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="SPdsZhCw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987D1C7B7E;
	Fri,  6 Sep 2024 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615189; cv=fail; b=C7OEQHsmfwCZ9jVsxiMjylXsAH8zJTBTZ+OZzBtHKIQghnVSeASlToqZ3E290N/Nz7gw3abjaEaz+8fDxVT7tJJnljLr/8OxbBcNIEJcbkd7AQos+rY+s7sxPTkatJsnHdmd9f+MPpf6UBk+5kR2uCf8j6ubvBs8SFboelR+8jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615189; c=relaxed/simple;
	bh=AJGzj38UNjozsYQgR/hawVDBPYgAOvPzSrEnCOsfxog=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KTvKLxCt20joUu9xlkS8VRz2uCaapwPrP6/f2UJgEAqSSq/psRBrpukX5GbTS5avU1eyAkGdoGsHU5fqgV4kHi3WR4IIeT5lhpAHq1Y3SvHsixD2HTnjgFtYNP/qsT7bjlTZTxPW+eBrwrKiyCc+O51VyFSGB5JGJRbp+YnM2cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=SPdsZhCw; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2bV5LD5X3z6a+0vnuDNtIJRn9c4RfDTgJxKrb2LUaLP64oh2d/CP0Oo0lRIx3trd+yy7wO6N1qB6D03DRfbrKL09malQUNLnl56g+77mK6Mi31g4iXbYLJZPTFfSx+JKaP7FlQJyinJsxs+i1Xx3MjIKD543npssfhDjG834UbN6bCMcWllbpi29fLFV0jju2Kf9lKTEO0BpIC19f1JCuhDXq/bDuqtNGrntTXx3wgQ7MebpVbjANR17GCaFxwLsPxDvwVIH7wtDzJvWjg8ujlG2Kqk5fQj/KqvzvrNOwuM4MFHoffKjUxV14yUlDJ8R5yU2/3OnQP9bfkghpvgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryTVV7ZvbcQI0ZOVBojRLUj6xaFgyHyX/Ta25YUKV5c=;
 b=XY6z98xbg+wY8LC4Z0u6wl1MRwJ5tCBJJ9rNH7qtLrJf/Gs55jnOfMBP9P/G3oSdw1cX6nhbgWMFYFFLM1EkP3nz+PGKdWq3b0lv6lST3TVwa6nEHemROKGKxWbMDZ6XelYRB4uhXVXLtE+G0bCChQ7068+k1G6kvN/kVHhgbUTsAEp1jbqiy0Zkay8ZdnQ1pUsJOXiuSoEDcF9d203kNV/MrMzkkZzWgZJnriBQXW/4RCLJxPWyVKOPHSMfiVFSKxPtOJOWryKQM97SZ7PyGkzn0egRALqXUOIZk1RqUyk968xX8I9CRcJPHY2FDIS/gI7hg/+swnMoE+16ZhJKtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryTVV7ZvbcQI0ZOVBojRLUj6xaFgyHyX/Ta25YUKV5c=;
 b=SPdsZhCw3f62A4lTA4rl7aeuxIyvI3JaaPo4sdOgWidJrrgAwn1Qw8vyk62PiZosQOPjImx397R9YR/YRwaJKckcTtIKlEp0xXlUJBYREUiMrfaaVXUT3S3AWRaGy7I56cn+yYTHLRg7tJvgUrt+H/kLIIiP6ZbSBZJL+/TxESc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PA1PR04MB10098.eurprd04.prod.outlook.com (2603:10a6:102:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:33:02 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 09:33:02 +0000
Message-ID: <c49c64f2-3d67-48ca-bb17-becd0d1cc515@cherry.de>
Date: Fri, 6 Sep 2024 11:32:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
To: Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
 <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
 <45c51083-ee63-45e7-b8d4-3822213530f4@cherry.de>
 <4e4d7c65-3c3f-5208-ce08-b63ad39ab425@axentia.se>
 <74anzbicky6zgccg7ao7l446fziwcmqcanycczl264neuts7ym@fyd4sdfyir6e>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <74anzbicky6zgccg7ao7l446fziwcmqcanycczl264neuts7ym@fyd4sdfyir6e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::7) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PA1PR04MB10098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e736f8c-2898-4973-1e26-08dcce56e740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUVsM3IyclNEY3hVTTZXNlBicEF2Ums4U2NBdFh4RVVnNGp5eHRIVmZLellH?=
 =?utf-8?B?UW5GODJlWTIvK1kyRE9DOTRiZE9HeWF6RXZIdlJNRE5JL3dSQVZDdm1iZU45?=
 =?utf-8?B?cTIxTGFlam0vc1FEeStTKzBaN1VwdzFhWStSM1ZRcG1zQ01TRktnWnJDcWNO?=
 =?utf-8?B?a2Z1cU1pMTdpSWV4Z3AvOFNxK0JkM0ZZVU1YcUtwclEwWFV3VEU2Z0x5ejdt?=
 =?utf-8?B?MVlSSTU0bDMxK3JJUlRiQzRVRXYzdU5ZRkp0emlLTjlwdncvSmRDV3FFRzY5?=
 =?utf-8?B?dGZSa2RiMG9TbXdYNExKM1h4UmRkZHRPNXZhODVNcUt6dFlXZVc0bmFOMWpu?=
 =?utf-8?B?OGRqYm5zWTY2MWFWQW1KeWJlZmNBREQyd3NIQjQ1S1kxWWo5dTV0czVwcHd1?=
 =?utf-8?B?eU1vUHZ4N3I2QlRYMFBmcnBCME9ZM3JBLzFDNkVZMjRtRmthL2hWQWd4VWU5?=
 =?utf-8?B?Zm5KVFV3UDZnS2RvOXUvbGdTalFVaDNKRnRLUXFFWTRKNm9ZenFzd1pjZ1ZE?=
 =?utf-8?B?amhUQ0k5T1dQdm45b0wrTng4MkJGRkxJQ1F6R08xZ3ZJcU1hVlloNUdUTlFQ?=
 =?utf-8?B?bmpkUTIwWTRRUzhXRnc2WEM4OEJDS2h1d1ZYZi9XWGRMZUtpT0dZenB1S2g1?=
 =?utf-8?B?a1dvWVIwNmsxWHc3UmZPbFIrd2FER1dUZDhlQXlrU0Rhenl2ZXgrajk0c3Nx?=
 =?utf-8?B?enVWU1JPaU1YNUpBSFM2Z0RaZFRhRmNBZjA4L0tYTDVNcmFpQzZFZlFxV09O?=
 =?utf-8?B?dVFTZ1p5ay91M0NaUzArb2NZZjBFVm5GUml2UitjUzgzVWZwcFJ4aklTK3d4?=
 =?utf-8?B?Z0NpRHUvVEV4OTMwSFU0d2hINitGdHhweUlDUCt2SFZqcjNaZlZ2TS9yZFB6?=
 =?utf-8?B?NjJNSjFkeHFvWEYvVzIyM0dYRVkrVHp0ZU9JY2luenFEdVJpTjFLd284NVhu?=
 =?utf-8?B?L3lPd3pCcTlJNG1QZW9nMjJHUml6elNzUXJoekU3OTFMSFVKUmt1dGNWVVk1?=
 =?utf-8?B?dGVxN281SnZWSG5DblFHQWVKQldNMExUdFFETDFsalcyUGU0dHFSY0ZvSGVt?=
 =?utf-8?B?cDJ0NlBMYTF2NXVHQ05DakVMYklLdStTeU9hK0pTdHc3OUR4MUcxUGRYek9Y?=
 =?utf-8?B?aHNlR3hmdWRybm0vNWVCM2VzRlpzdTl5QkNkNFlCZ3drbWdPWDU5OUlZMFJU?=
 =?utf-8?B?bmNZdWdYTjRPWmtDZkhrczJJSTl3S2NhOElEdjl6YjhlSkpzQnJYWEhqMVVT?=
 =?utf-8?B?c2hhZG9wSUpDRXN1K2lJTnBSeTNuZFNFZHQ1QzVyaG5sZ0Nya1FaVmZOL1dT?=
 =?utf-8?B?dzZTU0k4UjliaTRDN3FxY0lhR1JpZ0kyU1NOZDZkSFlpYmdPcERsWEpEM1VH?=
 =?utf-8?B?SCtNT0xBL0d1N01CdkFndnBCZE1LTDRsYlNNUnFYb2ZsV2hncko1aDFlMWNP?=
 =?utf-8?B?K3owSzErRXFVeEVsZHJOT1F6VDdTTVAvU1F0QVFRWTR2Rno3MEUrZEtTVE5j?=
 =?utf-8?B?bG51VFVyMURobUtpVTJPbTd5aGIzVjJ2WmFBVE5VcjZyNVNWalhPNmJ5UTQr?=
 =?utf-8?B?bWw4cTBIQmFLZGJzWk9pRkEzMHF4L2VsTkJnZm1vK2lReStmL0JJQkJPWWNI?=
 =?utf-8?B?T1p4dGFxTGhSMU5KUTZ3dVcwQkkvVk85T2grMEx1OU1UV24vUG8zRDY4ZzdG?=
 =?utf-8?B?OGNvamN5bWJ4S3Z2bXlmdDE2V2dhejR4SHA2RjVlZUVwT0V3NTNoNFNMSjlr?=
 =?utf-8?B?MHBrUXlIV1BockdudSs1TmI4eFNUQ1lVVytGcVNGeE5paGxpSFltNFBTVWNx?=
 =?utf-8?B?RTE2cjZLQTZDSjBqWDRsQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tnp3Z1VpWFdsdllLSm1RWkpsSkluUVh0VUttOFcrWHc5WHZ2ck0wZWg5ZGla?=
 =?utf-8?B?Q1VvOXZyajZ3ZjF4eXNWRFdFcmk3S1llSWRiak12QWxSblh3NTlxekZTdVN0?=
 =?utf-8?B?TndCVkFtSXdtUGN1VWtIdlpzQmF5UWpUSzRlM09lSWxNSkwreTNEMW83OGxR?=
 =?utf-8?B?TWlWQzdNWk12Q1hvN1liS0xPdXIxUEIyaW05a2RGK3UxSXJEb1hvcFNrRjRs?=
 =?utf-8?B?WkJmWW9malRSVWVoMWt4Tk9NSTl6eUhiVURqMmp5UjN1U0R4SUZEVGY1Sjg5?=
 =?utf-8?B?M1N6QjFuRVVQakU5czlsNEVnbFFhWE1abitMTkVuQmhhOWFIL1BGUXhGY2JP?=
 =?utf-8?B?MUJGYTFFOHZOVnQzN1RsSzZBdEFmL0RVSkJhVWRVY2swS21VUVdGekQ5bDVn?=
 =?utf-8?B?K3Foc2tzSGF1OCtLWTJhd1loZzJYR1loRk03WXJaVW9VOS9SME0yZGFsQXlI?=
 =?utf-8?B?WXh4WGJsRlJvaXRpWDlpRHFJRDhocGhibmNzQ3kwcE92RXhHOWNTSjlMbkJP?=
 =?utf-8?B?cCtvUVpZSU5tTVNMVEEzSUtpOUExcFFrQ2RUV0EvZThMQm5OZHRFQW9nd3ho?=
 =?utf-8?B?cTFJd2xmOVVmYUowQ2xKREhmbFptclk2REsraFRXNTd2SEFDdGZhVjF3U01r?=
 =?utf-8?B?SEdsRytuUEc4Q1F4Mnh1RHVzZFNKbFlJeCt4cmVYc3dmaXZJbWZKZXZmK1kw?=
 =?utf-8?B?NlhVNVVOMm1EUGZLdTU3WUw3RkIwa0RPeExBUmpZU0xJUWcxd241aWExRlM4?=
 =?utf-8?B?cEREYUowaTFpY1hIc1VSaFhFb0FjM1h2ampCSTd2Z3NpejVBa1hZV2ZYblNM?=
 =?utf-8?B?S2lNTmV0NE55R3lOb1FzN01waGtHKytIUVUvMnJsaVU3aVhIUXdaMXVRUHV2?=
 =?utf-8?B?Z1V1MElKS3pRNTIrZGFJam5VZElWNWVaMm5aNXBESmd4c0VYQ2J4bTAyQVI0?=
 =?utf-8?B?Tis4UmVDdE0rQTJWQTgyOGxvak9MaDdkVWZGcHEzbEdSMUl3T21YK2V0VXR2?=
 =?utf-8?B?WjhyM3RDUDM0MnBDM2s0TlNRWElTZFVPam5Cei94aklUSzhkd1hqdkdqWDRY?=
 =?utf-8?B?V3FEN2ZJV0g5QkRFRjh4SEQ1NzZ5dTJ6TG1jeDlDYzl6UFlyVXY3di9qdWY4?=
 =?utf-8?B?bHhPOTg4N3pGR2ZkSFdCa2VjNlUrOHNFK3ErS1ZGbjRLVFVlaTFtUU45amNN?=
 =?utf-8?B?QlpsTnd3Wlh6amxhQXg4WERzSXRKQVhySFRMMkJyT1R4c1RpcjN2eVR2Q1RB?=
 =?utf-8?B?WWs0NEVXd1g3Vm5ScjRYUTgvejFlRkYzSldKcHBrY2gwSzdYcDZYYjhQYlBM?=
 =?utf-8?B?NGs3bXNrcXhOZWoyYVZEUnJuMStqYzlPTW9KR0xPTnhXOGtOTGNIWjd0c2pN?=
 =?utf-8?B?QlVBUDVUWUlyMi9WUG4xTWxiYU9tTGp0MVorU1dibFM5R3VGUjl6L0E0Z0Fs?=
 =?utf-8?B?cnh4QjRieEMyUHlDUGg4VGhBazdBYnBRZ1JtVC8ybFI0TzZhbjdxWGQwanNO?=
 =?utf-8?B?MW5zL1N1K0lVVnRiUUp5UGh6NDNWcmpWOHZ3MFN4OFR0NDhRWHYzbS9PV3kr?=
 =?utf-8?B?OThPT2ltc3FPVXdlcUlxWW45cDJKc2lVQVZiYk1Cc1BkcnFtZC9pUzFJS0Vw?=
 =?utf-8?B?aHNpMDA2bDQzeU9RNTY1czVBWitNWmZUZmJ1cE9hVElqTXQ4RnJqZTk4ZStB?=
 =?utf-8?B?dEJ3ZzlzOENRbzEwbWd2MUJiaVBuNXU3YmtGbUVFSG5qdlpCV3ExQ0xzQkV1?=
 =?utf-8?B?VHlSRCtQcStmTGZ2QnpUOTZDQTNCa0dGeDVyeHlKczA0ZEtjRWNEQndSRnF1?=
 =?utf-8?B?eFlIaGpmMHE0VzYyUTZwU3Y0UHExVWhML0FIcE4zWkVoRkVzSGdDTmFDT1FC?=
 =?utf-8?B?VlMweThPVUFDNUlUNFhJSnRtaVVIb0hISVlMU3FMNmZFaDNpTkdRNjdxaGpW?=
 =?utf-8?B?VzN5MWIwR0t3aFRhUWFmOEpvWU1iNEFTeFBXRDhGckEyQmhWYWE2emY2ZlBF?=
 =?utf-8?B?UUloMmpvTkd0SHRYWGp3RjFtZkk1ZkRxUE5qcFQyK1U5ZWJRSmYrTVJxSlhX?=
 =?utf-8?B?cFVPRFZENFgzUWIvRHFOeVNoeERJR1kyQ3ZUTDhnekwyaERDZDZ6ZTdsMGNZ?=
 =?utf-8?B?K2JLSUlINjB1N0oxU2t5NW5LY1hCcXZDUy9peDJLZ0ZJL2hXQVFEdU1qTFhD?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e736f8c-2898-4973-1e26-08dcce56e740
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:33:02.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5J5hER7f26ySA7yzVBotw/PEEYwehVAZ5rOBTj2lP40ryGF7htlqvNa2jt9QJTEVKbubUdjhX62IzRvTcr7V1kpj2bSbd3V+uLig5Wu61og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10098

Hi Andi,

On 05.09.24 22:20, Andi Shyti wrote:
> Hi,
>
> On Wed, Sep 04, 2024 at 10:59:47AM GMT, Peter Rosin wrote:
>> 2024-09-04 at 10:35, Farouk Bouabid wrote:
>>> On 03.09.24 17:13, Andi Shyti wrote:
>>>
>>> [...]
>>>
>>>>> +        ret = i2c_mux_add_adapter(muxc, 0, reg);
>>>>> +        if (ret)
>>>>> +            return ret;
>>>> do we need to delete the adapters we added in previous cycles?
>>>>
>>> We calldevm_action_or_reset() before the loop to add adapter-removal to the error path. I think that does the job
>>>
>>> for us or am I missing something ?
>> I missed that too, but it LGTM. It's safe to call i2c_mux_del_adapters() as
>> soon the mux core has been allocated, so there is no risk it is called too
>> early or something.
> Just a question, still: is it the same calling
> i2c_mux_add_adapter() and calling mux_remove()?
>

We are basically wrapping i2c_mux_adapters_del() by mux_remove() 
(implemented in our driver) which is registered it as 
devm_add_action_or_reset and would be called for a non-0 return of the 
probe.  i2c_mux_adapters_del() will then remove added adapters (do 
nothing if none is added).


Thanks,

Farouk


