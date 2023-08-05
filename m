Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32A7771014
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 16:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjHEONP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 10:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjHEONO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 10:13:14 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2102.outbound.protection.outlook.com [40.107.13.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955973C16;
        Sat,  5 Aug 2023 07:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7fHj+KA+Ah0SjEKNmpu1VnCLXm7vtr6o0YX+bKJjrWxAYsvrt0NzwqzP5Tpgd9AFBX4FdF5h9oZ6oznMMt6j1gjK/xz5eRhTwcvRzx97efWn2rWnGlL+lP6Zsc9QjLro5VfPX79W0tbrKATTc5hCRn5HVQ1YGlv1aRfH8bK1Y46kKJqjOggFVyNMGhSJYE6EunI35jlD6q/SezKB0AtJWu4sPt6TOkb7sZHhsMQxKliEkx7VQOxXZNXFFkaF6QRxFgQPv55zAQ0hn8ilCrZD3WrEWBUTw46BEr32aeEySNU1OMHji+NFDd+mxfz71VGKYyGNvx/VtB6ovGVVQ5vSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki56jSfVkCCbYECaYcmI3c1poIWUjlqr27tfPZoIdOI=;
 b=NGEIMzc3cuSRV+3Ae9UuvVtca3m1RHLcMT08FQShLX351p5Tu/DeTDk9IXjciS3xqTRrG3gcUcPDrnJ6l9hNvzcpe/3JppfQfGNAhmkBKlvEwSrwKogcmpsPVBI4RV1j+V/D2US6YgV+I0hh4R2w/MSn8Ei8KG54RVJylZObZqi7o41OLr4rzJ2/gsgcAhlbln4/9sNszfGEtp/RaOgyUo6qGIAiUcJjqsMwgO+2oRrIizm9ZAinu/87H5CNRtGpZyXnylLrGUPRus+yjSnBfb7RDTmaTMU+2eLiVJYytb/32ExKTQJH/06YjLmcJ4H+P+He1TvlPHGTdhe1swGTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki56jSfVkCCbYECaYcmI3c1poIWUjlqr27tfPZoIdOI=;
 b=goadUtn4xdCcQpIiI9a56520/mldOuLyYKV4mSKVzEmZmicA4gCj11yfbf+Z2/XZCCjqqmvt+vlw4/9+Y4hCczyWJ3IgWYyZWlRu4aseu7D4y2N1iDWu04L6Cyl6utwxJzTWet54VbWEH0bfD1xRytMaAOFiiU+rQUcEt5SRgqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS2PR02MB9860.eurprd02.prod.outlook.com (2603:10a6:20b:608::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Sat, 5 Aug
 2023 14:13:04 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6652.025; Sat, 5 Aug 2023
 14:13:03 +0000
Message-ID: <c557d38f-a899-69a0-8c76-b867f0448a6d@axentia.se>
Date:   Sat, 5 Aug 2023 16:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] i2c: mux: ltc4306: Drop enum ltc_type and split
 chips[]
Content-Language: sv-SE, en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
 <20230717134807.265302-3-biju.das.jz@bp.renesas.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230717134807.265302-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0072.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::7)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS2PR02MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e85eb0-cb9d-4bb8-5d83-08db95be1518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HD7LAq8uNGxn3MhMvLkmBurqz8NdmEt6zZbeBfVNwwUUpOSXKe4tZGlJ9RzL1xtjPJIGgUlgwbEoI60O8o8mfFv6ru69+iVhCc+0dD3jkAZ5C1Z35bvnE/LLPylD85sRftyKVJLDEd0rvHvv1dkl3V2GtJJnmRLzIp98LomPyWNSbllEpoAKKdTD3qdMgf7ZTgmHAm5xhcTHmuWnfqtX4zHZ2WV8L725yZglS4aNRgxSg9b2RoiK1/xy2pWJHEsJhqEYtvFWiN1OUB4PmVET+BMD15FYxsAkF5oK/HA1+KpqKwtElnSTnF8PbvY4sulDyn/CvkccSTDL/CYiOJ9V4u9cMZsVgoZDK5tBhHsnYWWlgzml9Vv5/NFBQ4jiEPqo/a5cPvgZb1TeYvbpSifv84M0WZbOSclzoJYSWAAfXOd4sYyetMVztyA0wmY+Iemz0m5BC2gn4Eidse52OEGQk/jT98Japjbwchu7zAWYRvx+ISS9HfsrmTa9s6vUHjja1BZ/O/FmCPz9d6GaP1G6KZp795/D4r6J3POVDR+BkjVAfvf7gzo47PQ2+mm0hsVDXjLM1zDlA9qM9TiL5Fl08gUvKVuCTGpTj/R49tiATsYyIz5/OuihUye/mF2QE6IEHLE9pMZ1tsh06hyqpoLyvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39830400003)(366004)(376002)(346002)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(6916009)(86362001)(478600001)(54906003)(38100700002)(66946007)(6486002)(66556008)(66476007)(31696002)(6506007)(41300700001)(26005)(66574015)(8936002)(8676002)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVdHZ29yamFlNXJ6bHlSK09PM3RhNS95ZUxNcDVGM0RTSmoxOUdCN2R4bHV2?=
 =?utf-8?B?dk1GV3RmbkFzU3FnZ05ZZEdHVDFLUjZlRk1SZzdvNjY2MWlnZm55cHdneldr?=
 =?utf-8?B?ZWdjaGwrb09ocnZWbXFGVHgyc0NXQXhVcnF1cmVoWC9hWGFHZzBoZG9ZQ21Z?=
 =?utf-8?B?YmZaTGJpY2V1OUQzUHUyRDdoMGxlNFJGbGVmVDVmell2c2NJV2xsMkFGcFN1?=
 =?utf-8?B?UFRUWEVDWm5qYnArdHNPM3JWSVJGcWtXWVdlOWpTQmRvTDVHcFBsYlgxK25R?=
 =?utf-8?B?UXdSNDVkdG5PTnkrb2xFaXgxcmdTSHFTQ2VxNnVDNmtUcVp2RVRqVnB6VWdl?=
 =?utf-8?B?V1hkTEgyTHcxT0hxUVpBcktieTFpSXROQjZobVk5ZVdic0pzSUVmU1FWVitu?=
 =?utf-8?B?V3U4ZEZKQTBnTktQZGlvS3NqRWhKZVJBRUxVSGpBK3RXd2RnNHNKb2xOQ3JQ?=
 =?utf-8?B?ZVdiVHBTbWZMSEVZK0NiaFVKV28zV1ZueWRqOW9yLytnN2xyTmpQVGhHN0Zs?=
 =?utf-8?B?SzB1U0JoZktad0hPWmdkaGkxaC9FbEpKV2tudVc4YkhVYlJ1cVNtdEVWSGY1?=
 =?utf-8?B?aFovVWxSUkUrZmdUajAxSE5WS1RTSTRJeXZCbWVzMW5iTW42cEFIeEt3OVBz?=
 =?utf-8?B?NXpFNFlPbmE2OUpRVko1YVVTTngzUmJJZm5jMFBVSVFKb29BbkEwbi95OGVO?=
 =?utf-8?B?OWFIZjRGT29aUVI5MWJtMi90SHFYQ0NDT1E1WTNtQ2MyN3FESWJCVHRFWlhu?=
 =?utf-8?B?M1pDSW0yT0oxM2JoRFppVWRxRUZ0Y3hFMWtvM1FJaFdVTFRyaWZqZTRGQm11?=
 =?utf-8?B?aFl2VWVFdHl1c0prUmNRcXNJbHV0M29hMmZSQVkzV2k3UmUyWUhxL1dseDJP?=
 =?utf-8?B?WTVIblVucXoyK3FONGtSSFdiQTBTL3NrVGpoTU5ldUs4dTAvaHNxeUN6ZHBO?=
 =?utf-8?B?WnNqNXAvUlUzWnJ0Q0FhUGdPQXFFaUxXUlprbU1PUDVjT2tpYmh5aW5hOXY0?=
 =?utf-8?B?NCtIQnBPMWtyN0pyYXFwUDZ5eE1hZ25naWo4VjRpU2hNZUVNMTJBUXFWcm5s?=
 =?utf-8?B?bkt4UnNIUklJaG4wZndGYit5dGU2cXFqSWxpbHV0RzRpaVEzTGRwVUR0VzdS?=
 =?utf-8?B?ZTZFQjhDam1NREphSjVTWnd4ZGdXazBFdE5pTTBHYzZ1Q2Y5SzFJWUxwTGsx?=
 =?utf-8?B?L0x5YkUrSGtkSlc4dndpVDR0UXJUaXB6WjNOOVJxWHloa1BycTg0WmlsTTBs?=
 =?utf-8?B?bnkyRFByUERLdDFPNEh4TWFFbzM1blEyZk05eExPTjNuSlVqZWRxMzM4OU9R?=
 =?utf-8?B?NzNMNjlGWVM2eVFDOC9ST2UwYUczTHl6QnRQTElkRnVqcEhtM1Z3Q0hxVmw5?=
 =?utf-8?B?c0RyQ1dpeWIya1NaeUZnekpRdmNJaE84S2ZDR3REeHFMbkRvQjJIeXlHbUZU?=
 =?utf-8?B?NFBGbjFnUXJodHFnZFpxdzNYMzdwNHF5Vy9NeWpGSlpVbzVIZkx3c2lTcGEx?=
 =?utf-8?B?MHlIN3ZYbVBVV0xheVFJK085Q1k2cUpVNnkzdWduQkV4eDNvWjgxOER0V0ZK?=
 =?utf-8?B?c3I5MDlYcGtpaUl6Qkw1YkJJVHI3Rkh0M1J1bVpjSkhPd2VOQk8ycU4xamFD?=
 =?utf-8?B?Um4vTXRsd2Nka0E4a2ljck9PM2FTTHJlK1BlSVhuYnlNSUt5Z0JMcmFKRzVk?=
 =?utf-8?B?ZXRuNGFyNndBTy8rQVE5eUdMcTIwWGUxNldMbG9hc2h3QjlqZFIzRVl1T0ho?=
 =?utf-8?B?SUF6Vyt0ejNEZFlnZFptUnZYY2NzZmlvWE5tSzAvQzBybFREQTFkd2FZa1Rp?=
 =?utf-8?B?dFVWRVo1cmR2UmZrRnVUclhkWFI1VGZNMm04RWllOFdkWTUzeWpoVURhSENI?=
 =?utf-8?B?Q3dBQ1hUb1VuRHYwSVl2MU9lQnFQRzNnZVc2QTVCcXdSQStHMUhzWUlRVXVZ?=
 =?utf-8?B?ZUxHU09ZMVo2ZFEwdWtHd2R5N2FIMzdvakVMdzh1RW1JcVRKZk5tRUwvL2xD?=
 =?utf-8?B?N2FrczBya2h6aDljOHVJLzdxUTlKMUIrazNJZmxoaWZhL1Vld3ZEekZvT2xi?=
 =?utf-8?B?R0syM2VraWRJbW9rS3RTVzJCc1VieGJQTTlKU2JsMi9FK3NSdHRHVTEwNGxM?=
 =?utf-8?Q?qRUj1x+HOuX2KVubD8UN0w0+e?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e85eb0-cb9d-4bb8-5d83-08db95be1518
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2023 14:13:03.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PW0CLLMPXN1hx/V5p4+c6fSC3koBn3gw0e0PWJPkVbtOuZvc5qLNai54QarmSe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9860
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,T_SPF_TEMPERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-07-17 at 15:48, Biju Das wrote:
> Drop enum ltc_type and split the array chips[] as individual
> variables, and make lines shorter by referring to e.g. &ltc_4305_chip

What do you mean "make lines shorter"???

By a few percent or something (2 chars). When your previous patch made
those same lines more than 2.5 times as long! I have to say, going
from 24 to 62 isn't exactly making lines shorter...

Not that I care deeply about line length well below 80, but if one of
the selling points is line length you should present a patch series
that actually make lines shorter instead of longer. However, the need
to sell a patch on shorter line length when the lines are actually
made longer by the series is a sign that something is not right.

So, again, I fail to see the point of patches like this.

Also again, I think it is bad to have a named field for .driver_data
but not for the other member of the struct i2c_device_id inits. Not
that it matters much when the whole exercise is pointless.

Also again, what you need to present to get me on board for patches
like this is to somehow make it *one* table with driver data. Then
it makes sense to force all driver data to have the same value. But
as I see no road map for unifying the tables for driver data there
is simply no point to the churn...

Cheers,
Peter

> instead of &chips[ltc_4305].
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch
> ---
>  drivers/i2c/muxes/i2c-mux-ltc4306.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index c7dfd5eba413..c4f090e8d6db 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -34,11 +34,6 @@
>  #define LTC_GPIO_ALL_INPUT	0xC0
>  #define LTC_SWITCH_MASK		0xF0
>  
> -enum ltc_type {
> -	ltc_4305,
> -	ltc_4306,
> -};
> -
>  struct chip_desc {
>  	u8 nchans;
>  	u8 num_gpios;
> @@ -50,14 +45,13 @@ struct ltc4306 {
>  	const struct chip_desc *chip;
>  };
>  
> -static const struct chip_desc chips[] = {
> -	[ltc_4305] = {
> -		.nchans = LTC4305_MAX_NCHANS,
> -	},
> -	[ltc_4306] = {
> -		.nchans = LTC4306_MAX_NCHANS,
> -		.num_gpios = 2,
> -	},
> +static const struct chip_desc ltc_4305_chip = {
> +	.nchans = LTC4305_MAX_NCHANS
> +};
> +
> +static const struct chip_desc ltc_4306_chip = {
> +	.nchans = LTC4306_MAX_NCHANS,
> +	.num_gpios = 2
>  };
>  
>  static bool ltc4306_is_volatile_reg(struct device *dev, unsigned int reg)
> @@ -192,15 +186,15 @@ static int ltc4306_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
>  }
>  
>  static const struct i2c_device_id ltc4306_id[] = {
> -	{ "ltc4305", .driver_data = (kernel_ulong_t)&chips[ltc_4305] },
> -	{ "ltc4306", .driver_data = (kernel_ulong_t)&chips[ltc_4306] },
> +	{ "ltc4305", .driver_data = (kernel_ulong_t)&ltc_4305_chip },
> +	{ "ltc4306", .driver_data = (kernel_ulong_t)&ltc_4306_chip },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, ltc4306_id);
>  
>  static const struct of_device_id ltc4306_of_match[] = {
> -	{ .compatible = "lltc,ltc4305", .data = &chips[ltc_4305] },
> -	{ .compatible = "lltc,ltc4306", .data = &chips[ltc_4306] },
> +	{ .compatible = "lltc,ltc4305", .data = &ltc_4305_chip },
> +	{ .compatible = "lltc,ltc4306", .data = &ltc_4306_chip },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ltc4306_of_match);
