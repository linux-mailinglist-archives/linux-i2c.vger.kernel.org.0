Return-Path: <linux-i2c+bounces-433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1C7F6974
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 00:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 067E91C20A13
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 23:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8933E476;
	Thu, 23 Nov 2023 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="WIrlOu7U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2115.outbound.protection.outlook.com [40.107.20.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0BFD6C;
	Thu, 23 Nov 2023 15:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BX8o3TJQA+gUUBT6FFqIMhkTTHfJgiqoPKHNV3vuDA7710Z+pEdwLRqwlx1pha5CkfHS1QhEtkqM4S9zEAMA+vuBWulIGvzgW4MdZpLq0yQM/+KKinzESiL94Wl8EpLsNwrpvpwsZOZw5dgndHcx99Tqiiiuf6gxgKqmjSxrt4hl7EFGzLP/h0/GafxWHax/+Y1XLpL6FCuFPXleQfusT4fxDHAE7a9hnwx+GKQ6IMewnsHUbk782/xAt+jhTWqs6yJlohAcsiBGkkIERgQm83Txz8VVSgkAeWcXMXIdeNot0M/WiGgyoRl9Ke0sKsGC6PaDWWOkCWKvlpsrapWxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW1hhqk1tmClJo5fANf/z6MV6R42CF8w2lyY181lNG8=;
 b=O3IlgBcEdKfra76Y7OXFvYIGdaGupnUfC/N5dm00QEY88vy0exWCz8YG/e3KNmP9eEBYRyTLl4tPPQxR3RqtmpOgoRmJy0+Dv8WtffxA2d0N5s27crdruIXP517OcCKJdXbNZsd+MZH7IMtxDIV2mKwPL1veFLu4cCc6u3ftyQ2SIoZVq/rrE9V1ZcXVCw5P3BwDveaablBZWIGVOtdtN13K8AC2OTHEgMvLWdolBt16Sl8TAZoaxh704+RAPXMMKKWGgjY9AOSxODbU0SUQqifS2+F+qcf7KZWlPwipuQNFX/zXF5KOYmPaeqdVvouWV17wgHblZrDSp2Tq/3asjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW1hhqk1tmClJo5fANf/z6MV6R42CF8w2lyY181lNG8=;
 b=WIrlOu7UiJaeBfTXO7VGzqof/xjZWFj3mZ4aYt5zf5mHOEv+8FWFeGde5P4lmPDNo0GmJDYK1pBNS/+OHIw2fobiWlwY1ROReV5rH1SH3YFDSlb1NIstcA9yRaE1oaK4p+3D+sgGQMPiaw8L6U1xs070Cp+/Km+q2ISSClLvP+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DU0PR02MB9704.eurprd02.prod.outlook.com (2603:10a6:10:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Thu, 23 Nov
 2023 23:10:55 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::eb7e:2017:35fb:d31b]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::eb7e:2017:35fb:d31b%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 23:10:55 +0000
Message-ID: <0cee5543-711d-3d6e-f416-18889badff18@axentia.se>
Date: Fri, 24 Nov 2023 00:10:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/10] drivers/i2c/busses: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Content-Language: sv-SE
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231118180504.1785-1-hkallweit1@gmail.com>
 <20231118180504.1785-6-hkallweit1@gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20231118180504.1785-6-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0104.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::24) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DU0PR02MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f56eba4-05f9-4115-6f95-08dbec79721a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YrXBx9lgpwb8mpc5eG7sn31ZD/1eZJR63AMErTMdWIRuTqQBXsJsJ2eQj+TtNYlgIBzy4UqGreUQlLCxx/DlW9IeHNwM7Kr+CAswjrIsjojLrCwSZhhiAoViEsQ+uPj3Vw2kipyXu93NANsyXZRlrmZMENkWVKDvhgambRlH3gbwcrvCZjBx6fC3IoP5+et0JNyz0/dnMvq87SrpqzTxls+IcoJ48iVXy9uv1U3h6AKKyAcFo6L7qtPdpGM+qZ+gXU+0PVYwxQoFL9wZ9UHk7tVIBs/7NYk0lm24Ck25tnh9Wl49S428KKzpNqihvVyAqO6CjP4HtBBkL/d0K/7KrGS5qa5k2Xw4awPRmOeE4bDHXF8UhQu95urJuc6C9Kujn5A9jvCgSh7zoNVcrwusWTc3LKCW16/3GQGWfNwGpliuoN+zpqg0niU2Em9g8JfBEG9kYHAvWHEaaG5l1WLQXma5/W7RiUnuV4j00uKRK5KKQNngE43dgTbRtOgczFN2Bp08IKmseY6uJWfFAbhnOkvUPRYY4wbV6qG0nC3iLuL0M0LZT0gBBEE5qkzsn2RpjRJDq13ex2bIB41oWgouub3grxo0Ae8QUyNk7oxPyWKhshLlMfGDldVdgAamEYebZgEanv2hLbnTxnfZ2IXJfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39840400004)(366004)(346002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(26005)(6486002)(2616005)(6512007)(6506007)(66899024)(110136005)(2906002)(66946007)(4744005)(8936002)(8676002)(4326008)(86362001)(31696002)(5660300002)(4001150100001)(41300700001)(478600001)(66556008)(316002)(66476007)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTV3S2VTOVZ0cjFEUFlpYi9tLys0dzlUcWEyTXNJdFpjRTFXczF5SzRGRmNL?=
 =?utf-8?B?UjBIbkxYZmt0d1JjVXljTkpwWEw0bG5yZS92ZndPeG1MVUFYcVlUaS81TldU?=
 =?utf-8?B?NlpZMnVHK0dETUhkTjFVSzlLaU44R255SHhqSHAxSW9mZGswK05KVnBnUi91?=
 =?utf-8?B?YUQxOHh2NGxUSWxtR2lhNEFpcUp3VzBFa0gzWTE1ZUZtczhhdldhbzRXRDRt?=
 =?utf-8?B?RjgrK1BqMnl5dDBIcngxcU1TTzBSSkE3eDFSemM1UUY3VElkejNrbXpOMzdl?=
 =?utf-8?B?ZHhsbzlYb1JwTDdzS2R5eHNzRUhGUGpYY2tmSFdhMDE0Yy9FNjhSRVMxUTRT?=
 =?utf-8?B?QlZ0YXZCcWczZ2J0dHNXM3kzYnRnT2JXMHkwREpRbUxSMC9CZXYybURURnBZ?=
 =?utf-8?B?TzhxRTBHQ0hXZjcwd1c2bElyTXBBTERTOUtvbXMvMEtZaFJXM1JkSlBxWUFk?=
 =?utf-8?B?WXI5MXBsaVdzQ09wVWRWcGMvWVoxcitvK0xBUVI3ckFxV2gyYkpmT3poY25T?=
 =?utf-8?B?NXlXMkFhZFdJNzVIci80bko4ZFNKWHlTbHNTVG85bXR1U0NiTFZoQTBISW5h?=
 =?utf-8?B?VHJyaHV3T01YTm5wNlNhQ25zeE1kdUpyNFhXZlZncmNNWXRiMGNMODJkMmxv?=
 =?utf-8?B?RnVjZEFhSG1VT1pIaTNTdDFGcmpQWHhOM25jNldlc2xJMTRQVUFFVytKeFAr?=
 =?utf-8?B?SCtJbHJmMEkxSFlieG01dWF1Tm9kWVk4L0ZCcSt6VUpaOVVuUmhiSGxGbTN0?=
 =?utf-8?B?ckpsd0RZRTNmTVQrTUhKRGhtU0laVVhEK0pZbzVuL0JVbnRBQndBVlRiMzVU?=
 =?utf-8?B?Mm4rQlF0emNFV2tBbllRbk90UzJpK0JoZklkM2JBQk9DaW4xbkZaUTIrSkRZ?=
 =?utf-8?B?dExGRmFncytKd3J5SjV3WWNSMjhnSkM0eWpyM1dCZ045UHpZNEtQOVk1bDFa?=
 =?utf-8?B?bktrejFQRFNmL1puZ29reEFaWDFSVE1NQ0hGcVpJbXM4VjNyQ3VScHFSWkIz?=
 =?utf-8?B?QThlQkFoNEY2bjl1QXZHOE1NWHF6dGtyMzMxNGdMcUdDVjVxZW1kOWF4OFhI?=
 =?utf-8?B?Rlk4cW1paGIwV2ZuN0tCd3hZN2pRSnFWQ0dZZ0JkZHVhZFZ1dVlMa2pKcmwz?=
 =?utf-8?B?THVwZGxwM2ZyZWMzdzFQOFdyZE1FUVBabUZuVURGNU16NTM1OERwY0ViNGFI?=
 =?utf-8?B?bENLU29kZitNV1ZXM1pPTUFCUlpaWnM2dzMxcTIxVWpJS0k1RXB1a3Iwcmhj?=
 =?utf-8?B?dHhocnkwNWkxa0FLVGNxNCt0c0VpMnFpQkdCS2lnTSt2SzJGc0w4U1ZyYjFP?=
 =?utf-8?B?QTN6WTBwVlJpRmRlUkduT1N0TXdvNTdQVGY2VGU3NGlHVkI4bExhMmg3Qk9a?=
 =?utf-8?B?bVZ2WXQ2dllmTzEyTVJ5NS82dEVvQVNOeGs2YThQbTVMQVZuM0hxd2pSOHR4?=
 =?utf-8?B?c2VBSlhTU1dUckorRTNTV1o0Y0dWMzJXN25nUzVvb1dFR2JwK2dGOUpmOVpo?=
 =?utf-8?B?ZkpkNVFHdzdaR2w0NXZ5dmtlT1diT2IyeW85Y2dXaUsybUZQNGZ2VEp5YVlD?=
 =?utf-8?B?M29BTGRQQ2Z1azdiYXluQjY1SWdybjYybmhCdTk5cDEwQ1BDbkJsR29TSjhX?=
 =?utf-8?B?aVFPZlAxTFhyMnNQempjc0JvYXlGdnhaR01IMXVSRkwya0lhQmxNWDlTZlRK?=
 =?utf-8?B?emNkSVhkUXRDS2o4VzVlb1JxQ1hPZ2VIbURnNzhFRWZNUkhmc2V4UUJzaUFr?=
 =?utf-8?B?ZnE0QVdUS3g0NkdPZllrLzlWc2t6ZUF3YjRySncvUXI4ejFEMDQzYXVneTli?=
 =?utf-8?B?aEZVN3N1M24reEltNEJyMHFoKzU3NmZuYUdEbjhCL0VpSEtYVGdvV05pbElR?=
 =?utf-8?B?V2ViTGlqdmhUT1hCUEdkd0dYYXRrbU1KcHJaY21VSldNdzdSeURKejdQNVJH?=
 =?utf-8?B?andSQWZOT0tuLy8vQWdpYkR4WXB2ODJPVXFBaWd1SHpjRnlZL3FnTWNzb1pq?=
 =?utf-8?B?UHdvZWI4Y0h0bVhQTXFZTjlCd2diam50MVFVNzRmLzNaMFMxTkR5Z2Zod0Zp?=
 =?utf-8?B?eGtiSUs4Y1BwUDltaUpFUkhNcU9pUWtMVFE2bktvdndNelgyQTBYRm14ZEpC?=
 =?utf-8?Q?llv/6+L82gcx8cauJEB7vP0xJ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f56eba4-05f9-4115-6f95-08dbec79721a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 23:10:55.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZGs06IbLofBpEv6UGVoa3xI1XTezElwreIggpIx2DS0H6l2fBNzMfhFT4hBGpcW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9704

Hi!

2023-11-18 at 19:04, Heiner Kallweit wrote:
> diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
> index e01d75308..9076ae4d7 100644
> --- a/drivers/i2c/busses/i2c-kempld.c
> +++ b/drivers/i2c/busses/i2c-kempld.c
> @@ -283,8 +283,8 @@ static const struct i2c_algorithm kempld_i2c_algorithm = {
>  static const struct i2c_adapter kempld_i2c_adapter = {
>  	.owner		= THIS_MODULE,
>  	.name		= "i2c-kempld",
> -	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD |
> -			  I2C_CLASS_DEPRECATED,
> +	.class		= I2C_CLASS_HWMON |
> +	I2C_CLASS_DEPRECATED,

The above is less than ideal...

It should obviously be:

-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD |
-			  I2C_CLASS_DEPRECATED,
+	.class		= I2C_CLASS_HWMON | I2C_CLASS_DEPRECATED,

Cheers,
Peter

