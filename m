Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63EA17CF400
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 11:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345046AbjJSJ01 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 05:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345060AbjJSJ0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 05:26:22 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2098.outbound.protection.outlook.com [40.107.20.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE46910F;
        Thu, 19 Oct 2023 02:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSZ+E2nuhb2+o1h4CNQlsTspheDUNrHw1mE7Cv6FBDD8Lbqv/kZcNA3Y/iJnsMG9dIZUVEagtaGLLKgxZmwv2oHRXnE+CcPqIYS3YUmsDgAQqbZtrDt5674CdANQOtEp1aSB7AqQzfiXs9UxE4+nG1dsIfzLZQ4vDthQN8cr7X8KCQKEFrLfJMVazsX440wheH1/Tkh7NsxIsUPOTRqm8xst/DUSy1m9UuZ/SrVnJgaF6mTlxL7FunXGn2WEIyRpbijmq9PhQ/O9xQQv0qSUsi8DNYG5iXQWqDWjg0wjlzRm+eOunSNEnQOfGDmE/vkuLAKb3fUXRgkvpusud7quCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz1XbXRtj/i5rMJbVrd4tZuxUDRMP29g469fbC/GBkA=;
 b=nPg6rr71ncnXzyxloosfaRVpLAsoxfL4OyL8FTao80fbqqQZkXygtxncoPoOTJzwmtd17epn+Y24VAIlkIAFcExWHs1GU0Ag51WOETCvfRs/+YQn+YPJMooIkyzjg0K7ZDbxsb/wg4v9U4mgySMTZ17PzeXrFvYYKg6kF54x7OO3n6kgjcTCRFc0KgF93l6yzUTflrK+NYBCDZtAD4Sl3VAOjtr2fsTJTWU7NI1VmXgatokofRlt3xqj00S3n9P5h0Qv5X4Y4Z9gMkYrTEKkx8UfNCUsqjeMmsvY1ue4ZWjRUyfMqE0nkduvOUwxdsQtsOUaYoWZcax3a2ouOec1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz1XbXRtj/i5rMJbVrd4tZuxUDRMP29g469fbC/GBkA=;
 b=A2ZgQwCwGv/CY5tRD/wjhufNDDhAzokRwz5xCTrQZenDxiKRS7mxJJhsYEzt9uQmhCKXYH4S7M7BK6X098jBWfDl+/KzsXSp7F0enwz9x6l73cOyvjH/G74A5K0KbFy9BUnHWbjH1ubqaNbZY4U+i1z/glT/PCOrG5TY8Q7M23g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB5854.eurprd02.prod.outlook.com (2603:10a6:803:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 09:26:16 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 09:26:16 +0000
Message-ID: <3f702187-8abe-b877-80d0-db95a6ec55da@axentia.se>
Date:   Thu, 19 Oct 2023 11:26:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] i2c: muxes: i2c-demux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Content-Language: sv-SE
To:     Herve Codina <herve.codina@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231019073533.386563-1-herve.codina@bootlin.com>
 <20231019073533.386563-3-herve.codina@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231019073533.386563-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0088.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::15) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|VI1PR02MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 669b1634-8a49-4f6c-6b2d-08dbd08571c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ou1wiB9TpOpM5Lj6ulwRtzJ6Ufmktp4kwbEEKANY5aGms+VgYveYM4592ScL6eJ9d5kZ5YkQ9wzwhrvTaqH7hH/eSQU3/3M+nVRnWRjJYItNzqUz1C15PJ1ii5LLfXN+QLNJ9vnCi4XCbeKc9Ajze6xCulp4Zw6Ae4E/d3ZeBrt76tL6A1yxcAr3yWRczt5BFNAEAdsYJbOCGfOS7sAvXwPeQ1KaT2lkDUs4O0zWKPbBfv577pAoqV5WnvpHfB+9/0IT0218gm2DPHisNKqm8g+AvpTzwebAicfrHJGCPkc8r/v0eD1p4vIQWbaJaxEDN7MbmT96Fk0arGM09+UBsIcIm4qDBU7VzcKnCUNl1nh7pHkHYjQoeZuELri+mYoT5YmWqfTaA/vO8FvZpq3gGIohKEWq7LQXZirsuaW0XNmFs7GHEbkZHfSb4IQZfiF7T0HmGONVCEYzIuaW1sESpPZkbcH9+hBBtLsgZLUbKTGP7C6CiF8atvxVzbbne2Im1K8kTYVuFkU0sZrH9qFWmRpZdjcGfyosjgrRwbo7H7djH4l/ypYA3tPPpywTs09luH9XJjQl26ZYdgva0Op2Y6Hyh3xa86Kd+ERzJZ32D8aVyl1G2HrnnLEi7VgwoHJsAFRAflK3iyWUMDclmx5aRBurje7aR88sPzeGyZnq4qT4eKbswAuMBg2hMt6XmjFH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39830400003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(31686004)(38100700002)(5660300002)(83380400001)(31696002)(2906002)(8936002)(54906003)(8676002)(4326008)(316002)(41300700001)(66946007)(86362001)(66476007)(110136005)(66556008)(4001150100001)(6486002)(6506007)(478600001)(6512007)(2616005)(36756003)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUU0a0ljaDZNTjZVZmFsRmxNaEdScjk4OWpOM0JzSjB3UjRaSUp0NDBIeis4?=
 =?utf-8?B?QXZHZ28rTHg4U1BtekUzeS83QTNUZC8xOVIyN1d6ZXVaMXNydGhlM1NQQ09E?=
 =?utf-8?B?eWVrV1QvTU01WnVJd1hmZkYzS0VMKzlqTWFlSFV6UEs4YmdRQjRMdk5qeWMx?=
 =?utf-8?B?MGQvaDFSYm5Vbm40WVdqdEZLeGJTTzBMZ3BzV0wvNE8wWElFbFZYMFNUVldt?=
 =?utf-8?B?ZEttRUZPNEVkLzFUaGhCY3M4NkczSExhUm4vNDlLb1VmWElCdE1iMVBnY1BV?=
 =?utf-8?B?WEVXYythK2dMaEllSkprMGs5Y3ovT0llQUpRNEVuQ09QVDU0SENmOUV0bWJ3?=
 =?utf-8?B?YnY4WWZrMzlSemJ4bVFoUDV0a09xTGVvRXVJcTNZM000V1FncGdpKytlbElu?=
 =?utf-8?B?a3JsSW1VRHNYcHdtTVdpR25BM2JhWkZCUlQ5WHQ0L1pKbE9jSGxCOG01QlNW?=
 =?utf-8?B?WWlsTHptdEg0VnNwai81QnRmYUJ0VVRCck1sL0NIL2xxQTdnd3hHN2RDTXJo?=
 =?utf-8?B?SlFzODkvVXJOYVNEeHZLR2lLYzlWTHJjNTNpZmxiMCtXb2ljbzYxdHNkMmNL?=
 =?utf-8?B?OVF6QkdXNEs0djcyNUNIcXZ1bTg5di9UNHBSREpCbFpsc1FKTFNCVlVyQk10?=
 =?utf-8?B?dG5wbUQ3QjgwR3g2MjhxNklGTVoxZWZRSzdBdDhDWmtjQjhzdzFUM1V5Rmc0?=
 =?utf-8?B?Ui9XREhxMXJzQ280djZPQVJUS1E5UE5xV0pJZzhEOHNzTEhXaFF5dUI0OGxP?=
 =?utf-8?B?YTZrdVpGOVIybjJ5OElsbktsMzd0SHREREtIbk4wUnNneUxRUEI5V0V3ZHpj?=
 =?utf-8?B?UWhlYkRaSkxjeFg3RXBwVG5JQmMwbDZyQWllY2tyTzZkaUx6RXJzRk1vbVZY?=
 =?utf-8?B?U0RseGdiQWowelg2YzBTc2p2OFhlYlUxRzJYODh4UHFyaDB5V01uUEpoRDM1?=
 =?utf-8?B?T3pyQWF2WTlkSkFvbjh1SmZlSHpFaXp5eVMrSm4wWnQxUDRYN1JxT0tab0My?=
 =?utf-8?B?aUZrMlNXNENlb0tIV0dwb3pnUkd1aUxESVJwNnJVTm16MENkZURmTDNkUGpG?=
 =?utf-8?B?WkN4V2Zzc2VudHN2Q3l3bXF3bkRjaW9UZ1dINVRReFBjbG11MHBQd09xNUhp?=
 =?utf-8?B?S2JzbllCY3FOSUFyQW9TYTBsQ200aDZaOGhFb1I5S1dkSG5yT1NvMGZXR0pB?=
 =?utf-8?B?QW82T3hKT1lreTdHRWticXdPY2cyVTF1Rlhqc0lSYkphSkJxT2Nsejk4VHJI?=
 =?utf-8?B?b2ZGNnRFUU5BbHVpakFxNk9pREVueE05V3RQN3ZlRFVSUFZJR0U3Nno5bVA5?=
 =?utf-8?B?UXNJdnJEK3FBWWRpRGxHUjcxWm5YNTBLYWRRM0g1NDhINTRBR0lURDZjRVdD?=
 =?utf-8?B?K2ppcXlNZmV2WTF2bjJDOTBGWVREYVFhTFBWVUgxTFNEU283T3A5ZzBEY1Jw?=
 =?utf-8?B?aTl0T3J0TUpnWmZPb3ZUVFhjalRHOU1aK283VXo3ZmUxYVpSYXd5SVRFbHVQ?=
 =?utf-8?B?d213dzM1SUJvdU0wQlI2NTBqQ2QvcURjRTY5R3lvZ3hvcGJpQ09UaWY3N1hR?=
 =?utf-8?B?RHBmUU0yK0lRWEtaUFBQTTNVUmhER1p1NER6cmZ2b3VvZUJKOTdqd0pSbTRU?=
 =?utf-8?B?d25UVXl3OXM1YjF5UERSVVN1NGlxNnpmVTNjKzZEYmtjU1Fya1UzdzdvUU1E?=
 =?utf-8?B?SGZ4UlhSTzllMjVXSGd1RlpwNG1RQUJpYjdMdDEwb1F5MC9yM1VLd1pOS0Zv?=
 =?utf-8?B?NlRyVm42TENRYXR6S3VNNDNZVVJLYWxoaktZTVZ0VU1obHpXbXE1RXlQdHZ0?=
 =?utf-8?B?L2ZrMlZrdjViMTNOZm95VENHSDVPaHNjQlhLM0NtMDlaVTBaKytycytSQm9C?=
 =?utf-8?B?L3lCQkFUZG45cnBselNPZkxoYVlWR2krN0FjcWtUNFMwUXhzMllSZ0NVQWtv?=
 =?utf-8?B?L0tJZ2JTRUc4TVdZc0xIRU5MZFVUTW9LbFZsRzZ4UDc5MzhGZDJnSG5TczBi?=
 =?utf-8?B?SThVRVdmUUNWMTcrbGxleG92Q0xmS0ZpS3NkUmZXZVFuNm03U09PMVZsMTY2?=
 =?utf-8?B?U1BGK1owQnpieTR0Tk9MZ1Q1ZFltcy85QzlKbm5HYjFqNGJ6akJlc1FWcito?=
 =?utf-8?Q?ViHVMUMkg/K+4wP/gNbO+BkQF?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 669b1634-8a49-4f6c-6b2d-08dbd08571c4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:26:16.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZRWZnZvXlCgJC362ob6AMPewTeEPnmlugJh9IonBbR9Fqv+1ZSu4C/JDM20gSNW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5854
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-19 at 09:35, Herve Codina wrote:
> i2c-demux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
> 
> Indeed,	i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> overflow over zero of the parent adapter user counter.

Perhaps "... underflow of the parent module refcount."?

> 
> Use the	dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Good find!

Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
>  drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index 22f2280eab7f..9f2e4aa28159 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -61,7 +61,7 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
>  	if (ret)
>  		goto err;
>  
> -	adap = of_find_i2c_adapter_by_node(priv->chan[new_chan].parent_np);
> +	adap = of_get_i2c_adapter_by_node(priv->chan[new_chan].parent_np);
>  	if (!adap) {
>  		ret = -ENODEV;
>  		goto err_with_revert;
