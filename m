Return-Path: <linux-i2c+bounces-3374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD58B9AE2
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 14:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712F41C21C84
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733DA3E49D;
	Thu,  2 May 2024 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="AO1UzFme"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2120.outbound.protection.outlook.com [40.107.21.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D31E485;
	Thu,  2 May 2024 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714653076; cv=fail; b=EuYapY/c+20zTlAiT56HxCFjDHfIefi9Ry3dVvo440sljPqc2ILJkyyrCDDx/3qoxKbF4l6xE3DPU3M2S01443E1qZE4uRksC0oOu6XU/X5rcFSU4sklbr07L6AtqECwE6HiEV5lSoQGEO6AXHVEb8FrG74dlhIb9q362C/jnrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714653076; c=relaxed/simple;
	bh=UXN5ro4tOILG8cEaER7B0TXyFucHZg0JkBJ8bqORMOU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pro/C7iIYNPaRKicz/jhjp/iibWup6myyJOHwnbW8Nf2Qeg/HJ+Yl/bn79GWIDPMtwRVKnp/+zt307hbTTN/HegBq0rPmmLXF58VwE2ldiYGz6ELQz//nkK9jAKvJDq/UZFfM3B/iNzBxiNfRuL5gwvjj0Gl0NXHtwHYgDrJNXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=cherry.de; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=AO1UzFme; arc=fail smtp.client-ip=40.107.21.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwzqH6BRmqbD9y35bLQT9LL8u6+Ud0H2a0Sop+aeR0acIq/UV6WV/DGssGze6LjBPyT/QAsEdHEsNXhfNEyV4fOEHP2WZkUYDbkmZOC91FOpxOD0y43JqqMrxJehGeIAgjYSTUlGLY/IZWGYjSI0Imw/vi1MeZoxEp/WC5Veg0UQShSNAULNS6k9cPv2AuswSubf9nUdDg2f0rMerzuIxtFA/BIz5azbJ0Og3i6rgMOsE56ayXXeRmh4e51c9da+jaihue3fv3V2L+rs176uyZM2/C45jCUolgkEL1bit6b1zmJ6YlceQ31uBAsQxCBWTejg/+XjCRu+37w25gC+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5wHRI9a8rcu1Bbl6RXaApRJZAb6Ps12W8zcGtX2hSU=;
 b=eMl7d+AB3cc94ap98bsdTh+IBhrPBN1EBKWIqs/caBi5T92yV0g9sQLToT+3hFO6XEt5IfySudfOVzrunhJulQL8W8jaljvKa2x1hDKlYUPOpvn6ICdRfHclPgSThpcuUcprEQZK+LJ8Pr6kk0y6PN7u9CvOx2vfKufmmTQgyhBaPS6lb38xut5Vui2GdRL1PUYBbeZ3CXriVB/EceuibZNddQSwpW5wYr0m7rIYhU3XphlBXXfVnuKXw+OINBeEgomF+WcmaElf9rVVyja1nMjXRjxHuFCiwMLpRZTKx7Vbazc5IpeL+phGuOsluadPeEGwnlij1utnernniIIUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5wHRI9a8rcu1Bbl6RXaApRJZAb6Ps12W8zcGtX2hSU=;
 b=AO1UzFmehw5Kwk9z8LB9ykqGuSwHStAt6TLCxBc5aR6LfEfV7q9HKozLy1LRgvWIR5egnSHpDM7fMRDYa3/QlDDz1gvEyHbgNZ8OBNZTFIBI2VMXSihF54vlS12RO2e8HTtoshDU3cqEs0IcA92yxdNTnfZpEH/c4zLUndpYk/z7unqk/9hxZdTc82ff4EF6flV+lbn46os41I6tIWQS5+ZR3w6LsySZEqi35zSH7eV6bbdGdY8kQ9oerGgCIcRT8qZkrwJUP6ePYIjxw4q2X53nGv90YvRGST6B14qpE09St/PmyfDCu6KJ5Gs3796nTE3I2aVjR8abAtcv0fMnpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by GVXPR04MB10184.eurprd04.prod.outlook.com (2603:10a6:150:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Thu, 2 May
 2024 12:31:08 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 12:31:08 +0000
Message-ID: <4d45e2e7-1130-4348-991d-cf97a04e6125@theobroma-systems.com>
Date: Thu, 2 May 2024 14:31:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] i2c: muxes: add support for mule i2c multiplexer
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-3-045a482f6ffb@theobroma-systems.com>
 <d074880a-14dd-46e4-852c-0bb068154603@linaro.org>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
In-Reply-To: <d074880a-14dd-46e4-852c-0bb068154603@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|GVXPR04MB10184:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2be678-e7f3-42c5-4bc0-08dc6aa3be02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGJJMGZKTnFjdVo2T3JxOTducU84UTNQRjlnY2ZTblEyenlTZ3Q2YWhxSXlC?=
 =?utf-8?B?aHJVbEloalJmR29HQ1didWc3VXJuS3U3K0ZCWlR0OTh3WE9hTExHb0ZSL214?=
 =?utf-8?B?eFgrTThqc2pCS0lZWGRLWFh0SkxTbWU0ODFlVkFkclhkbjJIQzdPWHRhMGNR?=
 =?utf-8?B?dDU4ZXVJNnJGMHN0dE9VN2R2KzJaVVAyTUp1clV6UUswRjcyaXdyanVFZlJD?=
 =?utf-8?B?dm5yQXhqL0ZCZC9kV0RWVXZOdElySUQxTGJXak8wVjgzWkR4c1NJU1ArVVd1?=
 =?utf-8?B?elNjYm5JZU83Y282elZWN2dKUWg4d3dhS1RrTnpyd09seFk0RXNxZGRiS3dy?=
 =?utf-8?B?SHRiTWo5ajcwdHRWbVJQU2JlWHlUZ1kvc1ZBbUpOUm9HWUZvN3puOEpxMEpk?=
 =?utf-8?B?LzkvVUl6UmRZQUl6Q2RmU2toUmVNQTB5NkFHTUIwVk9nMGRtbDB6Z3BmeFhL?=
 =?utf-8?B?cVhSYXg3ZFI2cjFLVjFTNFlkUzVXRDhqTXo3QWh1R1hUZHZwSWVKeHRHNWpi?=
 =?utf-8?B?UlFTcnVZWFdVRnpWMnhIelVzQjRlb3JLOElPeVRydjFCekcyLzh0ajJsazdQ?=
 =?utf-8?B?ZXJ1Zkt5YWhWdUtmd3JENnJsdnNRUUhIK3BZZ1ZUL0hhaURmRzNaQU1lZnpv?=
 =?utf-8?B?d3AzeUhNbjZGRnhEaGhTaS8wb1UvVHU1Q0tZaUp1LzA0cFA5ZEN5d0hPSGVM?=
 =?utf-8?B?bkNaT2RrQkdERUkwaW40eG5VaVJQNE9sT2FMM1UvU0lidjl3N1hyaEtwR0NU?=
 =?utf-8?B?NGJnR08xUEpvc2s5TndKUklqcUlIWG5LQ2JHa2VORGVlQ25wOEhlMFRUcXFS?=
 =?utf-8?B?SktPV0piM3NkVlVvTFJXajN2ejhhVjhDN0w4WDRBa3pJOGllcHBtbHBML001?=
 =?utf-8?B?MnZDWTllK3dpTHV0Mi8yVXIvcWkzRnZyalI4Z2J3d1pibXhmektFc2FoSTRZ?=
 =?utf-8?B?T2hVTEZoalFUbCtTZkd5TjRYdm55WjFEcWI5UVZxem5QOHdiYVdvNFhFKzBy?=
 =?utf-8?B?TVRCbGhHTFdoSzFIRHRyRHRXbUhDS0ZqajVCOGpFQ3htVmVLaklYdnhVOUdN?=
 =?utf-8?B?TkdqaGRtSnpVQnN3RHNJbEF0dXZ5OWhuZUVaN29WYTFsZ0M0M1kwRGp6bWFT?=
 =?utf-8?B?a3VIYUprZHZzU2diSjNZeWJoNEd3WVI2cThWTndOQS9KSmJmeTJoQkhSdFFy?=
 =?utf-8?B?THYxeVBtbk1lcWVOd0NEMUt1cjFRbzBURCtLVTU4dGRnOVArYTFZQktRK1l1?=
 =?utf-8?B?WUI3dnFrdWprcWNPY05MekFydHdTU1VUUU1pRkxZYW5qKzBFRTRlRHYwaFVZ?=
 =?utf-8?B?bGZSbytUREdnV1l4bThmcEJydWgzUlRTUUN0WlRjYStzYnl5WURjTnZsQ3Vi?=
 =?utf-8?B?M05sSmlzQlVwRjlSQWRsMXBDTk8yRkVJTVFGUUQrTWovV08wVTlIdHNUWU9J?=
 =?utf-8?B?ajRWZjZsQkwvRitMSzRBdVRudlhpUzRhOUZrMng5S1plREZPUlEyb0M1SVVk?=
 =?utf-8?B?MDlscERtTjVTTFgwb2xNZi9wek1BenJhaW1MM3ljYm1IandwbjRtaUdqYnRS?=
 =?utf-8?B?c1FlajBRUEtqdzJFU0QwRHhLZWV4ZWw5T002Yy9MQlhqV1NuVmREdmlNdHJi?=
 =?utf-8?Q?9VUEH/+NPi3Jo9eOebFZDQ2Yx6qORToIAG5WL+Xvm+Us=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TklDeFNRVVRwWk5xYzlKWTYrZzM2ODJaRzdzb0x5L1pHWFh4aE13V2FHMmFO?=
 =?utf-8?B?ajNYK2pDNGt3OU9RQlltTWJPZlJ5WlUyODdLcTZzY1VUVDVSUHZTTmZlMDdw?=
 =?utf-8?B?eUluaklPZndzYXR0Wm5mcE96b3NmYnQ1SlpBZSswQ1cxWEQvTGIxWGdUY1hE?=
 =?utf-8?B?K09YeWV0OGFyRW12SFVwY1BqVDJvMnc3eDhqdng3NVp2Zkgya2FzVmhBcHR3?=
 =?utf-8?B?cmU1a1VpUW0xWHFjRlk1am5pRmZXaDBYbmJDWWl5Tk9obkRCUThDcjRoRlJo?=
 =?utf-8?B?VkFZbXJ6dWU0RWl4alRaL1MxbU1wUm04bUVsbVJDMzhzUzZBdk1ZcUZCUjBY?=
 =?utf-8?B?WEY0TU5tT1l3Sno2K0xXQ1JsSkNnQVB3MzNETkd1cUFZa2pSTmhrY3F1ZHc3?=
 =?utf-8?B?d05FSDhjcUx1aGw3bWdvS2Z0dHlaVVJWaEJPczBjS0MxUU5yVUUyQXVGL2JM?=
 =?utf-8?B?TGpEdFFCUWJsNUVlVkZDMTFZcC9uaFcyeWNSQ3hyeWhWQUV3eHBjcVg1Zng4?=
 =?utf-8?B?eU9RQTFqQ3hFZ2hFNkgvRlRPbVRYZHV1NTZEakZoZnBDcDlZUklzMHVCRDlD?=
 =?utf-8?B?NWRrTTNLMFRGYU1hSHJJUE9HU00vdkVZL252d2hUNWhmMVQwL1pyMjVhcTdN?=
 =?utf-8?B?RlVUWk5XTjZ6aVNwZnBPalJLaVV2Yy9zTUZpMlZXRUFwUzN3YUVDeU5UZ1FR?=
 =?utf-8?B?YnlhZStMUTJIajdCdzhUQVFqdEo3YU9Mb1pxS1V1eEI2UjNVNVhXbDhkUVd3?=
 =?utf-8?B?clBKR210dTBqSDZYOWVFVm5udDhlV2lWWUJWNjZGREN3QzdEWFBnWlZLMFNX?=
 =?utf-8?B?Wkh1ZUJMcnNNVk5EYytPNk5SbzlFVVd3anpOWmlNRHN4VVNBMUZNUS9wdExL?=
 =?utf-8?B?YnpZTTRxVk1ibUVxTFI2Nm5WaWlHNVp4d0ZKRWlNcXVCNTNZaXN4dUExNnFp?=
 =?utf-8?B?U0oyTEdLQVZwRUM3RjZLajRCRytGc01Cc0NuaTU3Wnh2bGVPdDBRc09YRk9v?=
 =?utf-8?B?SHRMOUtIMFJJbWg2bkhvLytIeFhzZ3NxQlltemhvK1BKZTZyNUlqRXBZR29U?=
 =?utf-8?B?TTBtSmxLWjVqeUxUMEdzREYzOVJ3RUdYdW5ZS1VuV1RBVGUxN0xTUVJPaUl4?=
 =?utf-8?B?VGZzZ0s5SCtxbDkySDEwSFl0Q0g4SHk4RWFVM2Q4YjByVFpyOXhNUFVQcTNG?=
 =?utf-8?B?KzFpZDY5WGhlUWJ5OVFsbGVPRHVNcHJrTXc0MURMMFFHRTM3R2I4VE5GUGJJ?=
 =?utf-8?B?ekd5c2FHN2dBVlJiTEdBVTlIeHcyUmprNDd0N0UrZlg3QUVwdTU1UFVDTUJC?=
 =?utf-8?B?SEE0eEllYWNEYmdYNlYySEt6NUIyNzhIaGp4dEZUZWZyR3dRZy9zL1NHNVVD?=
 =?utf-8?B?QU9YbXE4NkxTcEMvN3JvUEtuSWYvUDdwcWtSMzBNWXZLK3BVSTB2RWdVWVo3?=
 =?utf-8?B?TFg3bWtkR0szcFZ6N3VhaHQ4UU9kdzhva2FYR0FFZnJkUUUyNWpaOFVGeEdl?=
 =?utf-8?B?ejUvbU5wMFlNQUJWa2t3WGJSV0dVS2VmaStpM1lOOCtBQ0s5K01uUUlGZWp4?=
 =?utf-8?B?NEQ1OUpMaE5ndWhIWTBiNmFMYkF5Nm55QTlqaU1PNFpUaGxVTGVRbnVHQnoy?=
 =?utf-8?B?NmlmNVpkMEo0WU9XODc4eU83ZXJPZHRRZHJtSkFpUjEvNVhMQ00zaUdnYlpl?=
 =?utf-8?B?dWhwMTNKa05NNnJtclozaTF0Z1FmLzcxUEtrM1BWYUtIWUxzZXh5aE5rUmlX?=
 =?utf-8?B?RkU2bmI5bFMxeGtjWkx1aUpoaVQ4T0J4S2xCR3QvNHl4MmE4cGhvdEQ4RHJ3?=
 =?utf-8?B?QVVEYzBvNjRSTVRwY0JpcERicjZaQWdseXVjRXJLV2ZRQkVrMkdaSGFjeDZN?=
 =?utf-8?B?MWJjZ2sva3diOUltUmRHNHUva3R5QmR4Z2RTMWNvNTc3bTJWVzBOOTFlU2Nl?=
 =?utf-8?B?Z3d5L1phQm0xeXMxYU53cVU4UTN3eXhScGFxNmM0YlN2M3RIYjNNOGgwYnZs?=
 =?utf-8?B?cU1RNmVsOUV2TGJ1L3d0eTRVZzcyQllKRytsQ1JLaThCSEFCZzFUY3FseUhv?=
 =?utf-8?B?N1NEWVlkYkZQL2ExR3ZEU3ZsR2NoeWJXNzNBalcvUlNsQ0NwK2FscGZnWS8y?=
 =?utf-8?B?RGNyMWk5Y0l5anIwUGh6RUY1a2V5TDFXd3hER0xFdEpVNjVSYVpKTldkRzFB?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2be678-e7f3-42c5-4bc0-08dc6aa3be02
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:31:08.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KG4zoblwvRMIK2iM15UXrvaC8fRe4+hXedIb2HwOeXk5NBa6iiootxFdQacWg0yEF14sSRp+NM2oTQmFP2hC743yRjms9ZOsWDrbbYeOVR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10184

Hi Krzysztof,

On 29.04.24 08:33, Krzysztof Kozlowski wrote:
> [You don't often get email from krzysztof.kozlowski@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On 26/04/2024 18:49, Farouk Bouabid wrote:
>> Mule is an mcu that emulates a set of i2c devices which are reacheable
>> through an i2c-mux.
>>
>> The emulated devices share a single i2c address with the mux itself where
>> the requested register is what determines which logic is executed (mux or
>> device):
>>
>> 1- The devices on the mux can be selected (mux function) by writing the
>> appropriate device number to an i2c config register (0xff) that is not
>> used by any device logic.
>>
>> 2- Any access to a register other than the config register will be
>> handled by the previously selected device.
>>
>> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
>> ---
>>   drivers/i2c/muxes/Kconfig        |  11 +++
>>   drivers/i2c/muxes/Makefile       |   1 +
>>   drivers/i2c/muxes/i2c-mux-mule.c | 157 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 169 insertions(+)
>>
>> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
>> index db1b9057612a..593a20a6ac51 100644
>> --- a/drivers/i2c/muxes/Kconfig
>> +++ b/drivers/i2c/muxes/Kconfig
>> @@ -119,4 +119,15 @@ config I2C_MUX_MLXCPLD
>>          This driver can also be built as a module.  If so, the module
>>          will be called i2c-mux-mlxcpld.
>>
>> +config I2C_MUX_MULE
>> +     tristate "Mule I2C device multiplexer"
>> +     depends on OF
>> +     help
>> +       If you say yes to this option, support will be included for a
>> +       Mule I2C device multiplexer. This driver provides access to
>> +       I2C devices connected on the Mule I2C mux.
> Describe what is Mule. Here and in bindings documentation.


Is the description in bindings documentation good enough to be copied 
here ? If not, any suggestions?


[snip]


>> +     if (!muxc)
>> +             return -ENOMEM;
>> +
>> +     muxc->share_addr_with_children = 1;
>> +     priv = i2c_mux_priv(muxc);
>> +
>> +     priv->regmap = devm_regmap_init_i2c(client, &mule_regmap_config);
>> +     if (IS_ERR(priv->regmap))
>> +             return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
>> +                                                      "Failed to allocate i2c register map\n");
>> +
>> +     i2c_set_clientdata(client, muxc);
>> +
>> +     /*
>> +      * Mux 0 is guaranteed to exist on all old and new mule fw.
>> +      * mule fw without mux support will accept write ops to the
>> +      * config register, but readback returns 0xff (register not updated).
>> +      */
>> +     ret = mux_select(muxc, 0);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
>> +     if (ret)
>> +             return ret;
>> +
>> +     old_fw = (readback == 0);
>> +
>> +     ret = devm_add_action_or_reset(&client->dev, mux_remove, muxc);
> This is really odd. Why do you call remove callback as devm action?
>
> I have serious doubts this was really tested.


This was tested in both scenarios where the probe fails and while 
removing the driver. The remove function is added as devm action to the 
unwinding path, which will basically be called when removing the driver 
OR when the probe fails after this call.

https://elixir.bootlin.com/linux/latest/source/drivers/base/devres.c#L734


[snip]


> Anyway, all this looks like i2c-mux-reg. Please provide rationale in
> commit msg WHY you need one more driver.


We are basically using an i2c device (mux) and an i2c register to handle 
the devices behind the mux which is not what the "i2c-mux-reg" offers, 
where the mux is a platform device and the register used is part of the 
io-memory.

Also to check that backward compatibility is valid on older Mule 
versions, we perform some tests in the probe function that are specific 
to Mule.

Did I miss something?


Best regards

Farouk


