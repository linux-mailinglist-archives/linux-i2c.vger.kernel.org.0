Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6176445BC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 15:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbiLFOeR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 09:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbiLFOeQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 09:34:16 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2117.outbound.protection.outlook.com [40.107.8.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B392655D;
        Tue,  6 Dec 2022 06:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYGJwSynSvC7x8qTVKPQUcTXzwy1RmqAJIN/RGPSa7IXySc2nXBGYPbwBzK7BhHljNMpzO2r/+KNoiIzeBNCt4QNwQXm8JNrXSFzKE/01pg76bToF73ATn0LtsLCt4o0cysBIbPwcawGg75XuQnJuXXsRBLRVJVXf+uxUc6swvbkajawklQqoi/u2JEEN4KDYYquHs3hB4Q8h7RubqPMRoDWFY8AcCsR7rPxc1LJlWSKRh6Iz5n9VyZW9FgEbbFlyS8J/MPMBNk7vFJCYkTXtx3xrUE9s76leFSWQ6Pf3kgS8C/Xf1Tod5hQP+YSAiOQW96DXVCajEq3IP6JUHlbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpIIfeJO50/HzMBMMQhVEcfT1mGxMVCUMzwLmGTOt0M=;
 b=gjgVnqP1QIG/5g5ayrC819v8zMrv+QD22NcqlL0Kca7/0cYgNNLg9b8ZpdeSodgD7M/Xqui/5WTQ0N/iRLkELYEB9C6WpBwBsIgwTsmUwY0QIrfaHTvakw424FFXMUt71XUSVzHGTirkkCB41tx1/SWLW9NmeMX9a87CAA3Dwn7Ee4b+911q6H1C/e2i9kQTKLALtcdgWb84b1e2N87nznufozMExwOBYo8zqh9OTMXrx1gCQFSN+mEE9FnZ4CrwzPSC1OKYJvPNPSo1r6n6qJz2KI16o8VMqPWihjLgo8tQPZHGrORp1lUumYA4iLBC5ep2RWFL1R2KpkYnOuUQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpIIfeJO50/HzMBMMQhVEcfT1mGxMVCUMzwLmGTOt0M=;
 b=LWxrsMfjlAJPb43OoAJZpWCvBXeYBEobmJqD6GXQ2ckHZlQLKzsbaB0OCZmF01/2cMdVfsv7PIAMcDwKKBpDzxhacMXSN9syNgMbLnjuKC6d4Du26H7O4MfznLuxGjsul3lDtDBFvsm7fCBGRw6kd3Nurv4MSjEYKHGsJf57S28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from VI1PR02MB4445.eurprd02.prod.outlook.com (2603:10a6:803:ab::28)
 by AM0PR02MB5891.eurprd02.prod.outlook.com (2603:10a6:208:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 14:34:11 +0000
Received: from VI1PR02MB4445.eurprd02.prod.outlook.com
 ([fe80::622:521d:7f53:7c4f]) by VI1PR02MB4445.eurprd02.prod.outlook.com
 ([fe80::622:521d:7f53:7c4f%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:34:11 +0000
Message-ID: <029fd171-18c6-7588-453b-ed8c4f12ab38@axentia.se>
Date:   Tue, 6 Dec 2022 15:34:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] i2c: mux: Convert to use sysfs_emit_at() API
Content-Language: en-US
To:     ye.xingchen@zte.com.cn, wsa+renesas@sang-engineering.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <202212061936401320262@zte.com.cn>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <202212061936401320262@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::10) To VI1PR02MB4445.eurprd02.prod.outlook.com
 (2603:10a6:803:ab::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR02MB4445:EE_|AM0PR02MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a82a285-d9ab-4a17-1014-08dad796f0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XC7YlIgtuTwHBBUNAn9tMtUOdqNkbTmmTAwGZllRX1ztB0Iwg920zH2zmVNSfW+cyUN+eea2nmilZksHbchwU1A7//nb/tETRxyEs68JfoW4rXGPt7Njtdl55+T8QQpOwOP9iUs+y5xlF1opd9sSbbIwbVkUgJKm2hVPX/M9CykPWbQHaUFksCebSc61/jIb9epnztCPaZWimBB4QRr4oTiDrrXmQlcDpc057z+6lJKwv8p5fEKHDDb72aaWG1WWTIDvCXQLung9T5B6Z6bFswU82dusVBW7LxIwdbYdIFVKK9qsk0FkCTE1TMITa5oGs09DOeuZYsRmRs7rbdHwPEDk74um6oxnOTVXMb4suUcLpr3hxjPIXTJDlyBP7h9fkHTpK2FSurLH4EDYYQNN+LRRKqWG5i8QbgRStmkixhe6PjASjcX4tOuzmzpErx22zPX00WjD+2TWgOAjMcrQxDZMThDS5Yg1izEaASPMxgh+Uu92mlB/TRhLc9jrSlR1Wka1Iy75oikYdV6i6FD6/O+sUi0w2cuM2hwglufClVeD9ym6LkZdwNzYANQyZ6DkU4ajMbsEu46lIiZObpd4EsW9way6D6kLKFWhLNsX4/aaw2VqwapFamF7y+zgyihlf81m4XEY+HjCMJCnzvsUY80CwN57Bu4FeUQ4k+c5xu7/aRMs46LPKx0SttY1PbnFNF7oZNbhO0agzYIF9TrW3pbEx6w6vWdFC6goSC83flk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR02MB4445.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(346002)(366004)(376002)(396003)(136003)(451199015)(316002)(2616005)(6512007)(186003)(26005)(31686004)(83380400001)(478600001)(41300700001)(6506007)(8676002)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(38100700002)(6486002)(8936002)(5660300002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW5OQUx2dTJoU0NwR0ZBNlE5Qks4TzZqcmRjUDZVYzlCbHJUZXR1SWlTaTR4?=
 =?utf-8?B?RWticnhsYTdnN3c4NE0vaWpia2hrbTRaVTN1MnJ4dVAvMVNvaVdvR3hQa2ZR?=
 =?utf-8?B?VTV2aUtkeTlUdUhaVnBiYzRKYVdSdUh1b3R6amcya2JmN0t5NXdmdFcwTi9s?=
 =?utf-8?B?dUJ2L1BaQjRzYk9mS2FheXpscWV5cHc1b1h5Zi9NWkZuUU5pbGhvQmVYc0Vi?=
 =?utf-8?B?VFNjZHI5UzY2YUxtUTZJSE52WkdQK0p6NS96aVlDY3QrL3BOaE1iSm5Zb2Q4?=
 =?utf-8?B?SXR5am01c0I1RXpjeSsvU2N5Q3RFdVo4YTEzVHRPOGNnZW5wZGkzMXJLaWdz?=
 =?utf-8?B?SWNocHJ3OFFkenoyT1A1WlJLRW5yQ3l6VFhxdTZLbi9WZ2VtN2ozNmE4UHZY?=
 =?utf-8?B?ZjVuM2F6ZkRFRGFuRlg0TFNlUjcyaG4rSTd1OG9FWFZicXM5UDZwL0NWa3RD?=
 =?utf-8?B?Q0F3bWRLb29lNTQwVXBwMG02K3hCaXBFckhteWRQbzZWZGttdHBXOHlZd2F6?=
 =?utf-8?B?MlNScFV6N2NtdEVad1FpN2tQTEtOZ3VtYUFYTklhUXJLUUlodWJHVkJwUVdC?=
 =?utf-8?B?NE9ocFF3U21EMk9tS2I1Vy83OWEvMDFrZno1ZXFzdUdQNTcxWWx2TkZSZGxu?=
 =?utf-8?B?Zkk4VVA1NWt6QVp1bERSbjlmYlEwWUl4SnR1N1J1d2lkaE1JTjdENjMzOE5F?=
 =?utf-8?B?OFJ3L1FiUnE0YzQxV3A2NjRGWVdUUUxBRStCcmszeHgxSVpPbUsvcVBJYmZk?=
 =?utf-8?B?QUdRdG11WDJCVkxySTZaUXdkRk1wZkhHQmIxOG45a2dMbDNmTjlzaloxTzdu?=
 =?utf-8?B?eURvdHN4ajJwU290d01DVjN6TURpYWN1VVMxZkFFYVJCeFZQeVh0WGdzdjFW?=
 =?utf-8?B?Qkl4YzdzaE02WEgrWkRKRUgyc2xBTGNDY2EvY28vYm8rSWNnNW1oWDVJMFpi?=
 =?utf-8?B?OW85SjZ3ckMzMEFjWUtKZmZFaUswWVd1SUYvYXlFR2N6MG9LQVN2Um5qZlVj?=
 =?utf-8?B?UTRzdElNZndpTmdyVldJMENwR3BDODUySXRCSDMveXp0NUtpM2d4V0dMaytr?=
 =?utf-8?B?Skh1MExFWUZHNVJjWXV5VnRHdUxHTW80am1mVVVLY1hpTlJTcG5meEFnejdk?=
 =?utf-8?B?QVRpOHhZcmQzVjk1WmZBbXRwc1dxSy9mTEJicnIzUjdTaWFnNFkrT1hXWThB?=
 =?utf-8?B?WlJlQzlZOXNad1dkbWJ3bUd1eWpxa2tqMEZwenlwR2tBakNvdGF2bWpvZ1hD?=
 =?utf-8?B?UTh4ZXllSm1zM2daNXFWQzRHVXVpQUxhWGlRM0VlcnlkdzA2TnUza2d2MjlQ?=
 =?utf-8?B?WlVqTVdHMDQyd1RRZFUydFF5WGl0eWh1VnJIS3ZwN0xKY2l2UnJFeW95bjJ2?=
 =?utf-8?B?cXFVNWJYMjZlN05Jd2xKS3hGbmliZnV1cXFUQ09kSVlpcVNSSE52eDRkYVpt?=
 =?utf-8?B?VXJFQ0hNWGMwRTcvTHFQVE5saE5ZT0xWanRnMm4zRG5qaWkwbVRyNVJ1Skht?=
 =?utf-8?B?M2Q0dk9xY2tCeFZWKzIySWxOcElhZmtDUFVxTTcreU1pM2RXOHo1cG5kdng5?=
 =?utf-8?B?bklBYTN0YmI3VG4vTFNJZ3lIR1VKcWJFQ2wrSkF6YUloaHdSUy9SUjRBcFBJ?=
 =?utf-8?B?OW1ZaWRyek5JZlliUmo5amIyTDNnSHVhaWhwU0xxRnVpTEExK2RKanFzZy96?=
 =?utf-8?B?Ni9UR3M2dVg1VW00VDBQREowRHoxRjhmcDJieWpRdVRYSFpBU0JSM3cwMmE5?=
 =?utf-8?B?ZXdwK3l4QmRCdHFiNjFMNS8wbW5uYjVsWWNIUHkxUTB5TVBnQXhKZU5ZQ1pS?=
 =?utf-8?B?V2hneEh6d1pTMWpZRlpIeGhiT0gwTWt2VWNqVndlRVUzM2xBYTR6a3dpOHI1?=
 =?utf-8?B?bWpKZ2RnSVZvSUhPT1pHOWd3RVNBZEdsajNqODZjc2RXZXcrNlI4V0llY0Jz?=
 =?utf-8?B?UTNTbXd6LzUyL2luUWZ2K3kyMEF4ckN5d2ljMTl2cEFURmlMYXVGWUJ5M1hp?=
 =?utf-8?B?WGdpL1F2ZkJGSnVScFNKbmdHbWZyUzBXbjh2WTRYR1VQUE41L2FlNGZGUE8w?=
 =?utf-8?B?UStIQk96UmNMRm1xQ1hyQ2c0NEUxQXpnSnpBRWZmdjIxaXZYK05QL1Q1U1Fq?=
 =?utf-8?Q?0EVv6DYuqujAbz8p80ZODIddF?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a82a285-d9ab-4a17-1014-08dad796f0fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB4445.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:34:11.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMQfxkQObX9FneGqsnCWP4Vj7fzVADjhZxykWiWn1fKfHtaeTt2AwWye31YCjg3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5891
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-12-06 at 12:36, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index f7a7405d4350..6dc23aedcaed 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -167,7 +167,7 @@ static ssize_t available_masters_show(struct device *dev,
>  	int count = 0, i;
> 
>  	for (i = 0; i < priv->num_chan && count < PAGE_SIZE; i++)
> -		count += scnprintf(buf + count, PAGE_SIZE - count, "%d:%pOF%c",
> +		count += sysfs_emit_at(buf, count, "%d:%pOF%c",
>  				   i, priv->chan[i].parent_np,
>  				   i == priv->num_chan - 1 ? '\n' : ' ');
> 

You need to adjust the indentation of the two follow-up lines.

Cheers,
Peter
