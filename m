Return-Path: <linux-i2c+bounces-1262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27482A4B0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 00:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA28E1C22434
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 23:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FCE4EB55;
	Wed, 10 Jan 2024 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="WGZoQ8Hu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2090.outbound.protection.outlook.com [40.107.7.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACF4EB41
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGoY+DnzSzKjrdVTMToJXS5QquUS7pbdVuh+8dgBVjYfhHjf/6YdqzS5EMShTBlUwclb4xZAUbmHwzt2bgH9hvg/6Qr4Yrhekl7rzGZY8z9XNJKx+5tIuh/D7pKlzNDNvIdyEqv+3T5cG9xeM5njVC5KMzstKkx+Txjm85YOqnsNLcFvbKiRtmQGWtdsF9gUHddN92Da4bTCn3daMgj03DzgqZab+B6DoMM0yVtOAW1W85bmVgCT+9RGXvBHNlbLT08N9esraL+u1uTD5je0bNVnW5eVhJi3XPj0d6hpszpAxcq6NPvKJIV0rnotUZoTcnaI3greilfexgnvRf36lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXTuAlGh7EGucZAvLZXt61irDlufi7nTyOnePizPSyo=;
 b=m0wMF6gfbe/avHLcYGVg0q1IcbrSiFzEci8/7QD9jEjxHdKWrDISItWsgCauPXQzy+T4sPsa68qlqAJNehVyFgCAsphM+HcpYYYgL48MsMMBfO1denKgjFztvRP6Pq39GV5yByv7To6UMNq9y3TyqvAX8twGKhsqM3+1kdg1aIvGSvKlkqOIzjO1WAE/I/LsTSwMYraB3wp5uq3Ua7e3kumghC0V1PPsgVsE/X5vTIODqmZJKvJyP1GYQeIUs4iALCp/8oQGe6837wJ1UMmUFWYxt7aQ6hlQ/LN9WNIyvZlM0kW6hVihuIKge/0xYcBMNqSIUSQhR43Z1rdYs2RjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXTuAlGh7EGucZAvLZXt61irDlufi7nTyOnePizPSyo=;
 b=WGZoQ8HuH4E3Oeq984FtuBbObZl5XIu/ZnE3Gvra8Tnbceg3CxUe8HhdLeUjQeryGhKUB7Vhw/ty7BCQvZAu/s5ORfS8UozpHZDjqgvtMr288xPDZ+E4Ohi76UJEmeKwB8y6IvEcjYqftXJx+V7V9hslkaVTsNtGkPfAQNqQDeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DU0PR02MB7971.eurprd02.prod.outlook.com (2603:10a6:10:34f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 23:00:11 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba%3]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 23:00:10 +0000
Message-ID: <029a9957-0436-3a6d-e0d3-78fe2c2a9954@axentia.se>
Date: Thu, 11 Jan 2024 00:00:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Content-Language: sv-SE, en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
 <74a310ba-bba8-40f8-82d8-fc0963840a36@gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <74a310ba-bba8-40f8-82d8-fc0963840a36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0000FA94.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:4:0:17) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DU0PR02MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 061c045f-35ce-41e9-3025-08dc122fe555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UIkiec5NArwdFa53LnM8rklvvBKo/jljy4bjULbxnJGQn8rHn1L6B1YyS4ksDmS3YlgPhsLK+m6apT2x/eoZACGsMwMx79s7HTd9usGEV6o5ATIxMXYZf6ewOdTogqftymsA/15rqGhSYGfIEkdA/DhtRtyK73ubH2l1SqKXi9tzNlRelw3qnJbKiNUsVlifRTTGy+jky+1agqywdUzuM0cUAlHLdP+snicUIGVHG5fG0JT1mSj3tFz5qTjflyaYslbb5w4YDX+MGVIHpVWuDunUigs3g0pTajlNnqEKAssqdg8rihAZkw+naynkwXubeTDSoMhcWbZMtCchjcgw4D/7F+V6C1duY1vC9WXLuisRVMjfQLXlr+sxhWfIdl4WXYU15jXcVPQPmaP2rZO/vHq4S+UOGHmmg4a+xlyf/3911AkDsxclo9bbwKJZPaDL8FOAZ5b7eDes8JL6mKh7kHHQe7QM0PGHpxP1wbNjdkYqE5E49sSzCpuSfOzr28XnhyDFmnIxpUPpqrod6SjDuWlVpArfKzVO+evSVsGj+vCQH7xtSwJZUJv3Jq4GEK0WDD07MimVfgY32CU9uCc6x3HLFsRLv1PdyJzvJ+tnXiRuzu0HD5D0IEwPOYPa4NDDCa0DT54QBv6UoEOj0VOTXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39830400003)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(83380400001)(31686004)(66476007)(66946007)(66556008)(36756003)(2906002)(110136005)(6512007)(6506007)(2616005)(26005)(38100700002)(31696002)(86362001)(8936002)(316002)(5660300002)(8676002)(6486002)(478600001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWw4T3ZzajBOYjNqNlh5dlNyVkg5YmVQMG9WTk1hcU5wWFNZOUFFWWRDUlk2?=
 =?utf-8?B?Tllsd2EvWkNxV0hsK2JxWXZkMnZkc3ZQeTBrQ2F3d0tpcHgwUCtPL0MrQ0Za?=
 =?utf-8?B?VkxqUEZHb2FYOVA0amhPVUZEWkErM0ZPOGRGcGU0N2w5dGFpa0Q1TFRrVzZI?=
 =?utf-8?B?NG9qVG5YcDBFcXR3TUcrQU5wQ05CSG92Y0l3M1JBaHZ6Zm8yOUF3bDArZ05i?=
 =?utf-8?B?d3FEYjYyemx1ZDRTVkFsdG1WOHZLZGpBQkRtZXpmeGlHZEQxQkVNOVpvVEpM?=
 =?utf-8?B?QVFFZGt6MmR4Z3dvMVpsVzdJS1gybEpVRXYzbWNsVFhPN0FIYU4xUk53UVhI?=
 =?utf-8?B?VHgyRlRXUUZWaEdIcWdvWmVBOHYyK1dtSVFYL0NXbHNKQ2pTcGtPTUZUK3k3?=
 =?utf-8?B?ZTJQVFJIb01hN0U3NlhySXFrUGtjY2FrRW94UkJrSVVKZ2tJeStjc21uOVY1?=
 =?utf-8?B?ZTZlYXZXUW9VRTRsR3IyZDcvQzRhUDZwWXJ4aHIxMWEybE9yOVJUN2w0djVv?=
 =?utf-8?B?YXNiK3VhcmFHN0lLSCt5ZEZKQ3h4WHlPd3VCQ3c4dWtTNDNTTUtWWVpibGtw?=
 =?utf-8?B?Q3dRcXYwSTRueTJjdW1la0cyaFJsakliZWtYOWYvS2gybnJ1bE4ycVFORS9P?=
 =?utf-8?B?MEc3VTdjeHZMa2Z0RnBta1ZWTFRsV1NDZmQ4VHRHS2RqZFpUWlZhVnB4NnA5?=
 =?utf-8?B?UEJBY2ppMVhIQVlVSXIzTUN6UmRyKzUrdlpUQXNERlpRMzN2VFhLcEJHcnJq?=
 =?utf-8?B?VGhwR1lvOEhNcDdIdmtYUVVOMy9RL1NVRlZqejMyVk9PWHNJQWp4T2cxTDl0?=
 =?utf-8?B?cXZyckFqM2gxbm5NNXlEUWpCbDFUUnVxTnlJNDRvTGZCL3UxNHJ3Q2RJQkg0?=
 =?utf-8?B?VEgwK0VCYW5MMkIwRlpNWENNZElQYVNFZjQ1aHZvZnRjN1k0UTUrbnVoMmNj?=
 =?utf-8?B?aVp2b1NZVEJMRDRTQ1M1REFNUytKLzlUc3Q3WTQ4d29HdjUrWGZkbFRmNVNK?=
 =?utf-8?B?aTIzclZqM2NpMktjS3dPVkxyS2dTK2ZEZU5PZFlaQWxpaDFCK1dZWjhrcmFU?=
 =?utf-8?B?dnovRzZHdE9PdzVnWFc0RC9wRzAwTjk2aGV1bzVBbVpWRWc0YjVtbCs3YU1B?=
 =?utf-8?B?cDJjYlF2aDVKOXBrenJLL0JVU2pKUGZsVUhzUjU5eU9UTWY2aHE1M2REbE9N?=
 =?utf-8?B?Vjhqb3RIQWJvNHlCU2llVWlyVlUxLzJkS3gyTmdBQzZ1TEI1Tndad2xUQXJK?=
 =?utf-8?B?ZEtvcnVNUE03bWw0YUlud2RJSDN4ZWgwWWQrbS9iUlExcUNvSkZJWWY3akpM?=
 =?utf-8?B?S09rMTdwQnd2LzVVcFVIQmd3dTF1VTg0cE81Tk9hTDZnaE51K2srSi85aHRq?=
 =?utf-8?B?bXd4UmlvdVlNTjhjS2JyNVlBYVhNbDNjRWlzUktDK055VCtBZ3JZRTdvSEtw?=
 =?utf-8?B?Yy94RjVrQVJiMFFEakQwNjhCVE4zWEN5NCtIMVhSaTQ0dTlmeDhYMmpITWZ0?=
 =?utf-8?B?WFY4NEgvMmlEMmdGNXhjeWF5aURiZE9iZnhpcGdJRE5yeitQZHhiVko0Tmkw?=
 =?utf-8?B?WmZBOTdEaHZhL21zeXBzNG1LK2w5ejN6cktoSTJsbWxoaHV4Z0QvKy9sSGF6?=
 =?utf-8?B?QzhIeHJMT21HQUlVUnlmbHF1bDNVSUordnYydFhobVF1aXFoQ2R6SS9lOE9y?=
 =?utf-8?B?VUtlRklSWGNncHJKSkl3ZmFCVTBRU1hoWHMvVUNDYjA3dzJpQlRUcTIrOGc5?=
 =?utf-8?B?ZTJqc1JTMS9QSHBxYWUySno1ZVFsc3htT3MwVWc5cEU5d0FVVlRJS2ZQZWs2?=
 =?utf-8?B?U3hSSVNUcjhLV1VVZXgyV20xbHJNNlVGVDhVZEZWeHlWZEMxQVByVGFiTXBX?=
 =?utf-8?B?aW1ZK1hTVlAxZjBGN2dNY3lmWnNvQnFtRHdXTDU4TE40MTg0bWpzTE5uRGR3?=
 =?utf-8?B?V0FOT2R0L3BtMWVCRmh4VkQ5SEdCVVNzMDdjcWI4MlBnNE85dTNqdnlkUlFX?=
 =?utf-8?B?bHBNV0VaeEtXRWIwYkpJSGkyMVljd0E5S3hoTUx5Y1BvWVhzRk9MZFFCcklK?=
 =?utf-8?B?a1YwOTQzSC83THBSczRLQmtUR2psaEp5SndWMnd0M2lYSjVoeHo4TGRvM2Zn?=
 =?utf-8?Q?3NYbWzsUFU59Qy5seNJ66Me8v?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 061c045f-35ce-41e9-3025-08dc122fe555
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 23:00:10.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDUqKmw68PWhnQzCpyGZ8duH2SYt6jmEWafuNbu5Rbc9vNpuhBObOdR8AqeP44br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7971

Hi!

2024-01-10 at 21:13, Heiner Kallweit wrote:
> If this is an adapter on a muxed bus segment, assume that each segment
> is connected to a subset of the (> 8) overall memory slots. In this
> case let's probe the maximum of 8 slots, however stop if the number
> of overall populated slots is reached.
> 
> If we're not on a muxed segment and the total number of slots is > 8,
> report an error, because then not all SPD eeproms can be addressed.
> Presumably the bus is muxed, but the mux config is missing.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/i2c-smbus.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 74807c6db..e94714d5a 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -351,13 +351,18 @@ void i2c_register_spd(struct i2c_adapter *adap)
>  	if (!dimm_count)
>  		return;
>  
> -	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
> -		 dimm_count, slot_count);
> -
> -	if (slot_count > 8) {
> -		dev_warn(&adap->dev,
> -			 "Systems with more than 8 memory slots not supported yet, not instantiating SPD\n");
> -		return;
> +	/* Check whether we're a child adapter on a muxed segment */
> +	if (i2c_parent_is_i2c_adapter(adap)) {
> +		if (slot_count > 8)
> +			slot_count = 8;'

The comment "Only works on systems with 1 to 8 memory slots" above
i2c_register_spd() is now incorrect and needs adjusting.

> +	} else {
> +		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
> +			 dimm_count, slot_count);
> +		if (slot_count > 8) {
> +			dev_err(&adap->dev,
> +				"More than 8 memory slots on a single bus, mux config missing?\n");
> +			return;
> +		}
>  	}
>  
>  	/*

The loop below this hunk is limited by dimm_count, but it is checked
separately for each muxed segment. It is therefore now possible to
instantiate a total number of slots larger than the dimm_count.
That was not possible before. I don't know if that's a problem, but
the check have been (silently) relaxed.

Cheers,
Peter

