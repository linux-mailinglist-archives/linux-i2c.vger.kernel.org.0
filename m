Return-Path: <linux-i2c+bounces-3376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B88B9CFE
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 17:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A4531C223DB
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 15:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8376E156241;
	Thu,  2 May 2024 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="eog0R+lW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2090.outbound.protection.outlook.com [40.107.8.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9015531C;
	Thu,  2 May 2024 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714662134; cv=fail; b=K+iM1Ocg38YdueOurECrqsNsLtjTFoM+uZFxd+KMSvUg+YBVgMnm9TsNK54jWfdJEXLRx7duA7R8oL+fS+kaUb266nrHUO34dxXvKf3WKkqiXZy8HdUY/kfuan4gDy9onpJTK9+/y876Hk920ZDD17usHIoHUiZUsmJXhvaiVAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714662134; c=relaxed/simple;
	bh=UYNvtWdL8KVafJ73XDa8QT2pC4fF2EKii190Owb9WiI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Oqyub324HF966Y+wx2gzFgp94uFFTkF2LUuagL527dG9K6aRTLp2JoXOMDBxL6jEk9qr9AgqdY9l13Z772083NiTD688GtnIvzzmey1rSvLZaC0+0nMGIqHzNijtTpK63j2x5nvATiiSkS4me5VEEq8nyLjCJ60FjUtXfMDf87k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=eog0R+lW; arc=fail smtp.client-ip=40.107.8.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aihNV3U7r8xWsrreSsD9L4zU4MtI7drZi0jaSNg6dNkg6dAQvJhj1M2m1dgQzapFVNUJwFVElvNbXAKwQq7Vd06IsVRaFes0/mSDDka5xQUqW/TnwSXh1bMOJ3Fp/NGOdg9Lc5Gog8evjAviFyciHlm57OQpT57l8guvKEIhYkDuBA6z4uHNj0Pyv3KYcS1FXc6V3FVlAU7SVj1SIF3qEeOCxj+Janh6cx1dhnWSJnBl+1lhqRgxBYffMamVUmelIJ+mUFeT9hDty9fdHosuK1nGRwTCIOXg/c5Mt3RM5H2gSr2cbQ/FH/UQNSPknIgWa8xoDbUNvhqMwJYSDHfsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fauADhgcttnQ9uSLfHNGfp45yuUO8/G121FLfZrzCB0=;
 b=N/iGy4rJaeoIUQurQ+FIvhTkPhW6OmjGVUGDe4OHG5GtrEXcvKDmGhKormHf4mf7DpoDVvC/1j5hrJK8bXKWnEXNy9XviMXofmjQIqxtKMgxdclm7G7Zl/sP+3xPe2nsE9XlBWHU3hNCQXgPi6YsOQi3cPisDyiMNv9FCKzlnl25gS5/ttoJ+VnCvefbXuFbFck1gNzr8bdqs0+agmVu6bN4YN1o5DBC83E/XxSIlw9ajDliBdXm9TNN8yr5uZItcy4Xiv38lRCD1ysojSbuTDYXV0962rSL69f6cXdXzhAvBXcRZ3Ro8JGdVIz6puJ/lykB1Gc0mxd73wH2B/D6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fauADhgcttnQ9uSLfHNGfp45yuUO8/G121FLfZrzCB0=;
 b=eog0R+lWzza0c8jTjSFgF2RTN4nMaVmibhJaDTLa5VhkUnYzNhM+3Pni5lQ1sCG9JA5AxTFUZag4HG0RhB22qR30f/WebYgrML5IGtgsAjUKA6ORLUB04Yqq9iPz/glPB+kvhXcbe08OEks+qxB1UJ5kWHtbVUdSWzzo3Mbxhkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by PAXPR04MB9108.eurprd04.prod.outlook.com (2603:10a6:102:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 15:02:01 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 15:02:01 +0000
Message-ID: <318b22c7-4e90-4055-a893-bb995c16e8da@cherry.de>
Date: Thu, 2 May 2024 17:01:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] i2c: mux: add the ability to share mux-address with
 child nodes
To: Peter Rosin <peda@axentia.se>,
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-1-045a482f6ffb@theobroma-systems.com>
 <f7ddc503-21c6-10b8-3326-398de65bd6a8@axentia.se>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <f7ddc503-21c6-10b8-3326-398de65bd6a8@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|PAXPR04MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d2ee80-f2c6-402f-fc67-08dc6ab8d18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckRVNFNFWXJ1K3RPUTRRNzF6MVpiSUg4NVgzeFVBSUROUjRZNTFOMmlKendi?=
 =?utf-8?B?OUFSZXBMVllwZElYVmxRWkd1SVQwMHZGN1BWUWtLdjBiTG5RRHRVUnVtRjIw?=
 =?utf-8?B?WldTY0h6QTcvRW9UV3dZMVI4L2tJQzRNY1U1NXZUQ1RyRGZLeEtvTkowTmZq?=
 =?utf-8?B?bHlxaGRSTllnY2w0aUhDMjl3VUdkRzA4OTIrSXJ5UXlCUXo1Tk5XZG5VSC9m?=
 =?utf-8?B?dk9JcnFHYUVNMWd5UWprUHFOWi92cXNRRk5Kd2UwNm1iTG5ZaDVSTVljbmRV?=
 =?utf-8?B?TGZ0ajBEaWtLdTF5NEVrOVNuUi81UzNKRFlWUVRYVmJsRkhhTkhQS0tYYTRr?=
 =?utf-8?B?ZTJUSnhIWmh2aEg5UlB5aStYTjNDS24xVnREMGVqWmZFUVBJSTQ3QmRHSnJX?=
 =?utf-8?B?NDQ3c0pnWUZyV3RsdWJLY1ZTVnZ5Wi9tVThRaDc2RXRKVTRvWGhPYzIzbkNP?=
 =?utf-8?B?V2x4cUtnQU1MK1BLY0MxK2R5Y0d4bUZlUnQ4TXJUUW5KNEZGQU1NUjRHUWJH?=
 =?utf-8?B?Zk9wZTB0d3BUbXlPUWlFbzRiZFhMWUNyVHcvRmhsditqQ0ZnS3dOaXV3NWpt?=
 =?utf-8?B?eWFVMmhNY3VRdzZOcks0QnZvakxDTDJZRERaQ1hLTmFKU1VUd1MraDB3QXZH?=
 =?utf-8?B?WG9wZVhkK2VVS3c3VzB5cDdycWVzdTNSOGl6d3JJTldUR2lKWTd4OEZ2MG5J?=
 =?utf-8?B?ck9ZeUpCVGRwdGxVVEk3V2xNb3prMk4wR2tBbFFTVE9hSDVPNHRXMEo1bFdm?=
 =?utf-8?B?Ni81RDMwK1IzdEFnQjArWFRYZ3hJRU1tLytKeDdXK05MeEpraFZqRkpGV2pP?=
 =?utf-8?B?YzlaSndaU0tFeUR3V0c1d3B6MjhKUG84NFFQVVcxb0tzUUtjdWJCQ0d6cG1i?=
 =?utf-8?B?WlU4VTJaSmY0ODN4TnJjSGpGV2V6NmVCVEtsSTYwS2VwZ3dBcE50ejNuOGwz?=
 =?utf-8?B?TEpBdEx5VzJPcXJmMHFVVTY5WHlDRUQ5VlVUTHBNbWdRa0dhQVpIcXlJeXhI?=
 =?utf-8?B?WnFIWGUxOE45VWR6aFJPWG5KakQyc1FaL3lCWjM3bGIxRDV2K1lBY3BWK1Fo?=
 =?utf-8?B?MUorY1hiVGpIb1VJYVVQajJqZDJBT0JOQXdiUzVBVjhURjV1UlBXVXFKNk55?=
 =?utf-8?B?akExendrbCs5MGN6a1NFem40VU53NytuTmxQTlkzUGgyTDc1bDNQcGViNzVt?=
 =?utf-8?B?eXl0c3F4RHlzOXFsbXRMWXNoMTB3NmhBSnBRVVBMT3kwcHk5OGtZWkJFb2ZK?=
 =?utf-8?B?M3hmOTdTbXZPenFpa3EyTmZFaXc3d25YUkZRUExkM0U4QS95emN3eDJhZGpB?=
 =?utf-8?B?NG5MZ0ZGTC9LQTJnNGV4QTVzbXpDL2ZJcFArM1ZLY3ZJYzVmR1FudjNTeWJq?=
 =?utf-8?B?azJ1ejRJQTF5blZmNmdVVmtFUVVuWXVBbWVhVmR0S0t6cWVrZWh3ckpPUXds?=
 =?utf-8?B?U1dKamd5Wk9tNHdSMmJJbjczQ3UrcjZRWlhRRVJWeENrTVBac09GWm1VMkNi?=
 =?utf-8?B?LzhtVzRNdTFFSG9xb3ZGZXVmVkt3SitMVXdqZHFGOHpMQS9aRFhPUnFQbU9l?=
 =?utf-8?B?Y3psTEZxZGlRRElTS2lUMUw1QmhtODFlcnMrUi9IWUd6dkhVRWxGMlE4dVJH?=
 =?utf-8?B?bjQzQkNCL0Z3OUxIek42TGVWZ1JzeEhaMExUNzNWaERLT0N3bzFmUXVDYjJt?=
 =?utf-8?B?ZGRNUU5RQ1RkVGpUSEJmdDc1Zk5SN2FaWEtUOTBQLzV5T1k2N0ZGZE1nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmcvK1lLNURWT2JZSURFVmpQeHk3bzkyT3FkTWxxdVVBaGZkSUs4eVRvN09s?=
 =?utf-8?B?b3BQdmY2MTAzL3IwUk9jUDh4Q3FBZXhVRElvNEc0YjZ2Zmpxd280N1VvNzFV?=
 =?utf-8?B?RnljN08xVXJsYVpvcGFZNWJjUnIrQjY0dnc3d2xLTk92SHduRkRaMlNGNSsy?=
 =?utf-8?B?bnZ0bkF1K3JKN0MxekRsYnRZQ2JrMkp5NEpxbkttWXdndCtGMnVDU2NibXpr?=
 =?utf-8?B?MG1FMHhRZm4vb3VkWlBYdmNwc1c1Z0F0dzZHNmRxck5BQ1lVemlDSWVsNFUx?=
 =?utf-8?B?SGhaeFpydWJzZ0JFblU1bG9NUTdvQkRuNUNCd3lKOUdLZStyRUJlUDBsTmhD?=
 =?utf-8?B?UWdCZlh1RWxEY3dkYTA0Q0lnWWFUNzBQZUpZL0FYQURta3lCTHNJeUVNWERS?=
 =?utf-8?B?Qk5WN0pId1pqcVB2aExid25XNzFSTGQrWEZuRkRlMXJBM3daRGxxSFFxUlFk?=
 =?utf-8?B?dWVGZ3pMN01WT2hTNXpOWFEwMXdwL0dzcmlVSUZ4R3NpczNMWkxXbjZueWhD?=
 =?utf-8?B?QVJUTVI5NFZlY1hHYmJ3c2hHbnJPRWJ6K3hkWWEzck5Ocldra1JrRzJnT1Yz?=
 =?utf-8?B?dUNvTFVyZlJYOXc3Z1RIVFFQdmhTaHRBV1VZV2hkSm9NZ2ZiSVJ1bm53NmZw?=
 =?utf-8?B?ZFZJNXZsaG82Q2pEcysrZHZZcmlhTVpLdDRHS1NZemZvNlFxS0VXQWlLUnlk?=
 =?utf-8?B?SWRxWVdBYTdML0dLYjk5dWdzb3U2Qkw1KzdLQjdqbEQvaTlETHhOS3Y1aUdx?=
 =?utf-8?B?dldicTZ6dVNuVXVoU1I1UnlhQTZXUm53L0JIWDlvTTNOQlJhNVQyZGRKbm0w?=
 =?utf-8?B?dmNOdENDcGdHTlh2L29ZeTBBTGw2Smx6QjZ0ODEwWlp1K3N3QWNSRDZWL2Zy?=
 =?utf-8?B?ZjNzU29VdnVtcVg1SkNkdzJpd3VEcDR6YmFvWjVHS1JjNy9TWEJWNXozV096?=
 =?utf-8?B?ZW4zSVpMbmM3UzhEK3NQUG1CbDYvZjdQOUoxS2ZWWTMzdXdCeEVzc1phaGk0?=
 =?utf-8?B?aWdhYkpiZFpGRDFUL2U0NnFTYng3M1RvUmI3RHRRSXdhYTVhZWg3SytERlJ6?=
 =?utf-8?B?UDZDOW9JRTNKL2Rma2JJVldIT3JPRUFTcHUxT2VMZXpOMlhJalFJNVRMcjVH?=
 =?utf-8?B?Rzhpa3ZsOFhvWTZWeFVxelgzNFVRMXpVcHVINjkzSGpPc2VHaWhUMERpV2pN?=
 =?utf-8?B?c29XYjZyZnVhYkNqQXkyZVVOaDJFTDBWeWlLb3VZVjZUbndMMXQraXUwckhR?=
 =?utf-8?B?Wk1JNE5WeHpJc2p4S25Eem01MkU3WE9mSy9iK3R6bzR0V1Z0ZEtxbGZkemFF?=
 =?utf-8?B?WmROQU8zNWpNNUx4VWt6REN0SmZJazRPR2dpYm1lWjNJQVpvMHZWdmFzU1Ey?=
 =?utf-8?B?R0lDUjAvbFdLWG5CZHpDdFE2K29vbCtiVnBGaFFreGFHV2JaVmtURXlGdFNH?=
 =?utf-8?B?RWJjdW5iaHBQeUUvajNxVGJXRjZINjJTcE9uTFR3VkRiMTI5cWFMWmNFOWkr?=
 =?utf-8?B?R0FKZW5BU2VWVHBjV3hCUWd0OVp0TGJWaUhESlh4bTl4ZGQzTXFOQXhMdTdo?=
 =?utf-8?B?czhiVGQwd2ZiaTFveXgzU0NpL1VDRjRXeCtxek9PWm1oM1lXVC8vcnMvckJY?=
 =?utf-8?B?aStOa0NQdis2TGxBYjZURCtUdXNrWWczWUxxRnVnV3lGS2FCdm1wcGFTYmtj?=
 =?utf-8?B?WmtTWUJwRUtvM3lOajRjNC8vMHI5MTJKSTdHTVRPUTFYdXI0RHZWcW54WHc4?=
 =?utf-8?B?b0ozS0h1UDJ5am1mMDllSkl3QmZkblFsamltNnJMNVlRSU0vM28zY1d1YWdO?=
 =?utf-8?B?cEFZV1lQZXVIdnZ5OVl0V1BRenB2UlJzVGZ3Q2RtaHErOUFpNWpQNVFZQ3hF?=
 =?utf-8?B?Ty9oWUVtZ241VlpvNk9KVmhiTFRscnNmRndvQ2ppZXFYMEJxYnQxaWFmMmUw?=
 =?utf-8?B?Z0piSmpZTW1SdnhHMFNZdCsxdU81V0g0Q3NuUVdaamd5YW4yeU5OMkhxdzZs?=
 =?utf-8?B?ZUE2SXVBSFBiN2dNQm9uMmFEcGh3RWoxcGtGVFFnS2hFWm9jVnNJUlBxT3ZF?=
 =?utf-8?B?aXZtaTdadk4wT1FLMnQramhTWk1mNXRtdmd2RDVIVE9MZDZDQWM4UUhHTjB6?=
 =?utf-8?B?YzF3WVVnZTdXZGsrdWk0b1l5NTBFMzA5Y2pDZGpIUG9LdWxiYW1Ed3N0TU8x?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d2ee80-f2c6-402f-fc67-08dc6ab8d18f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 15:02:00.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pWXLgbWX2KPIe7aLhZXi71/cRTZ7iXoFCO9QlRVuR21VF3lqvHFsqjhjLohbJqP4aqc1Vg/2HVj7UulLX0brmmL1uwpetS4WpBwEZolWXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9108

Hi Peter,

On 29.04.24 17:46, Peter Rosin wrote:
> Hi!
>
> 2024-04-26 at 18:49, Farouk Bouabid wrote:
>> Allow the mux to have the same address as a child device. This is useful
>> when the mux can only use an i2c-address that is used by a child device
>> because no other addresses are free to use. eg. the mux can only use
>> address 0x18 which is used by amc6821 connected to the mux.
>>
>> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
>> ---
>>   drivers/i2c/i2c-mux.c   | 10 +++++++++-
>>   include/linux/i2c-mux.h |  1 +
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>> index 57ff09f18c37..f5357dff8cc5 100644
>> --- a/drivers/i2c/i2c-mux.c
>> +++ b/drivers/i2c/i2c-mux.c
>> @@ -331,7 +331,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>   	priv->adap.owner = THIS_MODULE;
>>   	priv->adap.algo = &priv->algo;
>>   	priv->adap.algo_data = priv;
>> -	priv->adap.dev.parent = &parent->dev;
>>   	priv->adap.retries = parent->retries;
>>   	priv->adap.timeout = parent->timeout;
>>   	priv->adap.quirks = parent->quirks;
>> @@ -348,6 +347,15 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>   	else
>>   		priv->adap.class = class;
>>   
>> +	/*
>> +	 * When creating the adapter, the node devices are checked for i2c address
>> +	 * match with other devices on the parent adapter, among which is the mux itself.
>> +	 * If a match is found the node device is not probed successfully.
>> +	 * Allow the mux to have the same address as a child device by skipping this check.
>> +	 */
>> +	if (!(muxc->share_addr_with_children))
>> +		priv->adap.dev.parent = &parent->dev;
> This is a dirty hack that will not generally do the right thing.
>
> The adapter device parent is not there solely for the purpose of
> detecting address clashes, so the above has other implications
> that are not desirable.
>
> Therefore, NACK on this approach. It simply needs to be more involved.
> Sorry.
>
> Cheers,
> Peter
>

Another way to approach this is by implementing this flag as a quirk for 
the added adapter:

(tested but not cleaned up)

"""

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ff5c486a1dbb..6a0237f750db 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -821,9 +821,21 @@ static int i2c_check_mux_children(struct device 
*dev, void *addrp)
  static int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
  {
         struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
+       bool skip_check = false;
         int result = 0;

-       if (parent)
+       if (adapter->quirks) {
+                if (adapter->quirks->flags & I2C_AQ_SHARE_ADDR) {
+                       struct i2c_client *client = 
of_find_i2c_device_by_node(adapter->dev.of_node->parent);
+
+                       if (client) {
+                               skip_check = client->addr == addr;
+                               put_device(&client->dev);
+                       }
+                }
+       }
+
+       if (parent && !skip_check)
                 result = i2c_check_mux_parents(parent, addr);

         if (!result)
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 57ff09f18c37..e87cb0e43725 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -334,7 +334,26 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         priv->adap.dev.parent = &parent->dev;
         priv->adap.retries = parent->retries;
         priv->adap.timeout = parent->timeout;
-       priv->adap.quirks = parent->quirks;
+       /*
+        * When creating the adapter, the node devices are checked for 
i2c address
+        * match with other devices on the parent adapter, among which 
is the mux itself.
+        * If a match is found the node device is not probed successfully.
+        * Allow the mux to have the same address as a child device by 
skipping this check.
+        */
+       if (!muxc->share_addr_with_children)
+               priv->adap.quirks = parent->quirks;
+       else {
+               struct i2c_adapter_quirks *quirks = 
kzalloc(sizeof(*quirks), GFP_KERNEL);
+               if (!quirks)
+                       return -ENOMEM;
+
+               if (parent->quirks)
+                       *quirks = *(parent->quirks); // @fixme memcpy
+
+               quirks->flags |= I2C_AQ_SHARE_ADDR;
+               priv->adap.quirks = quirks;
+       }
+
         if (muxc->mux_locked)
                 priv->adap.lock_ops = &i2c_mux_lock_ops;
         else
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 98ef73b7c8fd..17ac68bf1703 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -21,6 +21,7 @@ struct i2c_mux_core {
         unsigned int mux_locked:1;
         unsigned int arbitrator:1;
         unsigned int gate:1;
+       unsigned int share_addr_with_children:1;

         void *priv;

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5e6cd43a6dbd..2ebac9e672ef 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -711,6 +711,8 @@ struct i2c_adapter_quirks {
  #define I2C_AQ_NO_ZERO_LEN             (I2C_AQ_NO_ZERO_LEN_READ | 
I2C_AQ_NO_ZERO_LEN_WRITE)
  /* adapter cannot do repeated START */
  #define I2C_AQ_NO_REP_START            BIT(7)
+/* @fixme document and find proper name */
+#define I2C_AQ_SHARE_ADDR              BIT(8)

  /*
   * i2c_adapter is the structure used to identify a physical i2c bus along

"""

This works, however this only supports device-tree because of 
of_find_i2c_device_by_node. If we want to support acpi then we can either:


1. Get the Mule i2c device address from fwnode_get_next_parent_dev but 
this is static since v6.9-rcx.

2. Pass the Mule i2c device address as a new member of  struct 
i2c_adapter_quirks.


I would go for 2. Do you suggest something else?

Best regards

Farouk


