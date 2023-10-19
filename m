Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFB27CF406
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 11:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235325AbjJSJ0y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 05:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235223AbjJSJ0s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 05:26:48 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2097.outbound.protection.outlook.com [40.107.20.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3AE189;
        Thu, 19 Oct 2023 02:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKoNmg0TdP9MFA7QSRa2NotYrEpNr5JZOCr1NTiMuFk+6lvlpafsvpl9wUxXCkNeOK15m4Vj80HukzqSIvxl3hlyJ4/c8Bm+6IDoSOT5eLpAMZ8Old39lbTo40//pmWX6Jk3pZ4vl1U3EwBhbhKWfVum0Mk6uGSERauiTU/7ecx89HyS6p2xy6/pwOzAGRXYFNDm9GHWSmg9Ey+BFbDIVl19OfTbU9N8EnrFLTFL9UqNn+cDSzTC22m6mo3aJf+iUeRBPGX699vfaT6ym7WRcNA7aLBwyL7vRVy1XkH583MPW7gCcSWqoFrHDcMBMPqRF+wqgSSHon1GKoEdkosFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=184cgJ5PbJDjQNFfhsP/CiNLElnW0cXEJMWljcM7eGc=;
 b=Hd9M6b/XgWDTI54ajVphrYWTaYj4YE1kQS2jkP4BGZSklsr7NEFfSEV1ZecktBTEbtAYEHNXWXcMxOEweLKNaw7/EHrlMMQytGrJ5mrFG5/MbfU0mUpbvdjMwvZDIi+l8/KpvFvYXJEK127HHh0FkC4IWseqf5wtmeIijvwUGdUsXekoo9H+zQoeowOu5RsNfj4rM3DF8/zCzZWZJzagcgFAqHKgsVG+ljEgzkAjLfmsY0M6NAP/xjep1ZnHj5inx4srcUUfeFTVq+7PeXtjC0DzDBgK0cXTlUV3BE9mwtbcQCsRuhoTgSlVZ8zjmUttlOxA4Ca6Mj6fKa8f5Lr2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=184cgJ5PbJDjQNFfhsP/CiNLElnW0cXEJMWljcM7eGc=;
 b=bQquEDpvbxSewwv+rTo88nCeijfTfyuuPsc/R1dPg9uTNzvavZZoPbbT8rRyMMUoGOW6Vr/z7WEeN7UOR3PGNL3EBy5c+YiTtOLdpw2H7kPL3FgV7I1gqgxAURWd/tl7Zp4DdG+F60n3teUYwGhptFtzPsMwu2Fg4BVT5x7VuBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB5854.eurprd02.prod.outlook.com (2603:10a6:803:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 09:26:43 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 09:26:42 +0000
Message-ID: <4b641f48-7673-9d55-0963-35b52189b6ad@axentia.se>
Date:   Thu, 19 Oct 2023 11:26:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] i2c: muxes: i2c-mux-gpmux: Use
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
 <20231019073533.386563-4-herve.codina@bootlin.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231019073533.386563-4-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0076.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::18) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|VI1PR02MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 318fe675-b526-43c3-0b78-08dbd08581af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5pDPcHWamAVO8yBYfM2hpOsm9AIZf/gPp2ox82tbTYHhaV8ph79FKA00+UXRgRWNkXqZT5tJT0VgX3R7zcGjGJ9Y4KwnrqIYzQeLp0czPrSf2yInp2S/pgDCh7qIhNEUDu00+P6CsL3WAjDZmWE4+xXrIJheTajl0gPaQ1D3A9gB4NaSobyFozY/dJrc7PSf+e5tKz5Q5atRxUJQq4Dj9WEiJIcSINrBnf3msANc2gQVZtwLPfuFRkheFufDAbBFxsOWdgU28lFzEOKf5R1iFyNM6jqajc8DrEjdhBkU3jXJ31MrCCqJKcGOdatDJMCH4qCFCQofzO7FczqmM1sAgDrbQ+4hCecJqS3m/UG8g0Pj+sqSK7E5VAUjYQPlHvyxL3Bc2H6BYSjqbYVfiuV1kIQ4rL77NhBcAnwlfRRYv86nFmdugMGo7lTWy7LJ9yIrE4zbXDtVyWM8nDRYDo2cB+ijkzxax5IeSWG9TqKOak63oO/T98za9QcCEEg2sEJeuKdzZR+5ZCeDOEWPuURa4uiKx7MjD9JcAFflS0CnZ22jVMFblXyq9dO4Ikgy/gAjKjTpiMGezxZSnPtmd/20mZmYxCfdADWBODDPAuxJmyzNYPG4DOP4O5nvdybIOwsCTHHiiQmUMtT7kgraJg1BS19dM2BjJlIJsK3Kf3Q3qZAn73czoTRmcUQZq7pY6m9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39830400003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(31686004)(38100700002)(5660300002)(83380400001)(31696002)(2906002)(8936002)(54906003)(8676002)(4326008)(316002)(41300700001)(66946007)(86362001)(66476007)(110136005)(66556008)(4001150100001)(6486002)(6506007)(478600001)(6512007)(2616005)(36756003)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0RSRnBOZkZXcFJyUkZkdy94bHVuRHRpdHN2L1g1M3VjUDFuYk9oa0J4dE1V?=
 =?utf-8?B?NGErZVRGSlcwbURZOXlHblUyOEZaMXlGQk41KzdYZ2dHZmJ2bXpUalFDdHNF?=
 =?utf-8?B?SWRrbEUrcUtGcGtFQkVOQks3YjVzQ2NrUTZYOGVtelBvSUo3QnB4QWNFVVR5?=
 =?utf-8?B?L2Erck5mK29LdzVsNUxNeDhwTDRhYmk2ak4rWGRXQXQrUUdIeEU1MzVsWlBj?=
 =?utf-8?B?MEdINzlCM1ZMSWd0STNqSFVFRHlwZXJLUlUxbjF5bWUzL2VvSHFrQ0lVS0pJ?=
 =?utf-8?B?cW9mcFBaanVrMUJYR04zSmd3VkE4WThXOUpySExmWUxzVjNJNW9TemFKSStk?=
 =?utf-8?B?V0l1TWpWRWJkSlgwd2JucEZyMDNFN1JmZGdodXZQSi9xN0NVS3dxQXhjVzZr?=
 =?utf-8?B?cmxpTmRrOHJzM0szZGFLRDN4eDhkQjkrVURtOG5xVXAycUN0ejdCZ1NteVhm?=
 =?utf-8?B?YVVYTWdBUXRSblQvNUVaNTlaYkF3YkdtZjc2T3VSS0JvaUdLTHhtNjBtSXlo?=
 =?utf-8?B?Z0lxMy95T09xQmJTaWRXTDdRVjc2NVBvZGhBa2hIcVRJUkNoa2llNTRha2pN?=
 =?utf-8?B?MmVvSWNIemtMNWJrKytqa0d1RytFT2NycXBGcVdWZVBuUFh3T3RUMHNHaFlP?=
 =?utf-8?B?SUMrcDh6UEYzbkFFZllFamRISy95NE1HVzVFSThwODJQUXl1VjAzL0RDczlE?=
 =?utf-8?B?ZjVkWFk1cFI2NlcwTGJWczdVSnV0WE0xRWhHeWxaQVAxK05oVVhzWis5cUIz?=
 =?utf-8?B?ekgwSjdncnJ1bFFib21LTUtQazIrZHppZ3Nlcko3YzduZEs2VnUzbVlPNlpU?=
 =?utf-8?B?c1FRbEJXT3k5MWJmclZiR0N1RnY0Kzc5VlpjRjd1WnIydTgwNURsQVdhY1p3?=
 =?utf-8?B?ekl5Z2phYk9GZ3lBKzRwN0o0a2QvRWFPQmZlVWk1eFQ2MXpQWjBMclE1bFdK?=
 =?utf-8?B?eFhEbGVCRmZtNGtOekxaWkgzazM4R1VkLytYc0NURGtsOEhRTmlGdUpDR2tO?=
 =?utf-8?B?QXNLNGN0Ry8yNHBYZ055TFYyQmJkSHQzUmVrcHRkRUsrcXNxc09TRk1Bcnc0?=
 =?utf-8?B?MVNxMUF5WTByTUNNaTFVeTNXNWNLOWJCcGUyRThJeHZTWXhOelZINGJmeHlk?=
 =?utf-8?B?Ny9uUlZ0b2E5bzN2RVgyb2g3ODd5YzdLMDExcG94MTgyN2E2RlMyeUlYOWo0?=
 =?utf-8?B?TE4xTUEvVWVsQk1NZlM0Y3dLQUhTZXYrRWw0VXQ5UGtEYkMrZVVxc3hMOTBQ?=
 =?utf-8?B?anYwSG9YeEw3R3AvWmpHSEdkRDFIdG1lMlRzMmpsNS94ZlhLRFdVV2tkaEZ6?=
 =?utf-8?B?L2R3MHljNVNUVzFzMlhvZGdTU2IrUVhNZkpOdGVpdllXQkdSVTFSWWpZZHRT?=
 =?utf-8?B?WXJXcnFvR1lYNFNhSjMrSGJDRkl5ZHRFTnJvVEhDVGgrU01HMTlzNVQraVp3?=
 =?utf-8?B?YmNSU2xLT1Z0b3U2UUJ0d3Q3M01EbVc3am1VdVU2ZmpzakpwNjh4eHlkZHlN?=
 =?utf-8?B?cklTQVpZWGtRay9nWkFPUkdMNllNZTJoUi9sclgvNktyOEJEdmc4Vk1HVkhG?=
 =?utf-8?B?NlR6K0Y1Y2ZBYzcvWDk4QklTYVo3Tmt0cXZtVzZZSEJQVkRxUUNxNGRjcDdk?=
 =?utf-8?B?QStlWXBwNXpKZjdMM2hCelpKK2xzMHpyakNnOXNzMENpWFFYT3AwNXhZVE1C?=
 =?utf-8?B?SGpZK3hKdktNTjdyNHdFM1NkaURFVStCOVNPMW1DVGl1ZVJidWdTeHVNMHdE?=
 =?utf-8?B?WXdlTkd0dWxmQ0YvZmV6ZWVmT3pLRlV0ZU9pRzNzU1NIbFBhOG5uZXlDLytH?=
 =?utf-8?B?Znlsdmd3YXh1TmV3ZHlHNU1nUHFsLzVZdUZwK3pwQzVKMitMd3BXVlBpdXlq?=
 =?utf-8?B?TzlzU1pMaUhSM3IzM0dQMms3ODhxdm9senV1dVhXc2xka0NUamNBMWg4WThD?=
 =?utf-8?B?YWVBbUdjbGV1T0dSckRFc1haYk5KTkdvbXNsNm5xYU9GWEh0OSsrU3RqUEZ1?=
 =?utf-8?B?dzl1RElSbUNpQUl6RkRaWmppeWZTcjBxc04wenkzc0hBWnQ3Nlg1Uy91cExB?=
 =?utf-8?B?WnpQdlpCMStMTmYwVXliMnNyOUx4M0N3eWpzSmFKVElQZ1VrTk5uUndSMlFH?=
 =?utf-8?Q?+/zDgnsXbrs+QWc1t5e2SdUJu?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 318fe675-b526-43c3-0b78-08dbd08581af
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:26:42.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pDXRLQWnwIH5dUYDWdr8XOb/BeGn1/NR+1whhJ/Ji0s/XKGktQyHzF5ogbozA5N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5854
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-19 at 09:35, Herve Codina wrote:
> i2c-mux-gpmux uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
> 
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> overflow over zero of the parent adapter user counter.

Perhaps "... underflow of the parent module refcount."?

> 
> Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Good find, and sorry about that!

Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
>  drivers/i2c/muxes/i2c-mux-gpmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index baccf4bfaf02..8305661e1253 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -52,7 +52,7 @@ static struct i2c_adapter *mux_parent_adapter(struct device *dev)
>  		dev_err(dev, "Cannot parse i2c-parent\n");
>  		return ERR_PTR(-ENODEV);
>  	}
> -	parent = of_find_i2c_adapter_by_node(parent_np);
> +	parent = of_get_i2c_adapter_by_node(parent_np);
>  	of_node_put(parent_np);
>  	if (!parent)
>  		return ERR_PTR(-EPROBE_DEFER);
