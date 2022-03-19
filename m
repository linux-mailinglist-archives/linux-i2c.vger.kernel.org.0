Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEB54DE8BF
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Mar 2022 15:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243306AbiCSOns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 10:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbiCSOms (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 10:42:48 -0400
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40094.outbound.protection.outlook.com [40.107.4.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78956180065;
        Sat, 19 Mar 2022 07:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTAnAVy/johK0OKINuPD1mqBt2fnfQhCgem1Qas4vkep59cs9vO9VCQLsZ6VcKKd86l0PSizv8r4xZyXQ6FovxKC5a0S+u/KYOcvyRTUesZpycfIEoEb0cU+8ykU4VV0MQ7BLEkbLHhqaJ7/RXCUT8NnX2lqa255b5lrELDtAmJJQOcVtNr8gevjEpVu5Wnnzb0QtBbFyfDtT+40L5Iaj4x44ez+pF9j9cQpgz96y3Q4VuctYkkMgtkCp8/SRXYIFhd5cfyVYfxHN6InoBLTCdRbSBzHu4LD+v6/iRrRx78bH1gw1rk/UyEoOJKmXMdx3rtuKfQFCcGohmJTc3F8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X0Ibo6ftPdblMuyS86yCZQf10bkOuOUfkANaXvwJnw=;
 b=HZlb5wxrmlDDbq3neJ/umxQGaT1x4A6vIfIUlR8GBHla22XoMdR/A5389Nkf7vCXORDV4yKHq8WsniS1jlv+EPiSb8ZtVYGPTWRVhCF/9HeGhERDf6yjb9dGaPJCw547xbxfqLtoaUeBx9C7RlL6W9/duWeBcb8F//KxgjplyNZ237yb4X6Nd+RJocX7pNxtF5sFBhdX92cUOezRN0U6eedVpFaUfdQEevE5whKMNCTEkN+QnRb3nwp+NtsqIP7EIdX0zs6rKbMkl605yNrcZUJGliNFysCxgHstdmWfV8G9fRSev7AxLjbabndxdtnmrgaoFdvAkJ27kRKDBCLCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X0Ibo6ftPdblMuyS86yCZQf10bkOuOUfkANaXvwJnw=;
 b=S4S3WtbA2KHzvn7AiKrg3uEhxxW3wqd9uX8+gUX4dDIKZHO7MYdJ+jAhNLzUUy4/fzjrISxxMTlSSjhV6VnaQJqi0IfNuXF0CcfdXiH/QpW2twPLQ5mfwmwf1X5CBWDHlxhE9wrKqHjTyDMWSjAW/CVjC3B0dL89Wlz7okSmv/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM0PR02MB3857.eurprd02.prod.outlook.com (2603:10a6:208:4c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Sat, 19 Mar
 2022 14:41:24 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3%3]) with mapi id 15.20.5081.019; Sat, 19 Mar 2022
 14:41:23 +0000
Message-ID: <a0f74cfa-696c-f487-51a5-007963cf1456@axentia.se>
Date:   Sat, 19 Mar 2022 15:41:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v6 3/3] i2c: muxes: pca954x: Add regulator support
Content-Language: sv-SE
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-4-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20220216074613.235725-4-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0052.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::7) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d20a7ca5-6fa8-4ad3-017a-08da09b68a54
X-MS-TrafficTypeDiagnostic: AM0PR02MB3857:EE_
X-Microsoft-Antispam-PRVS: <AM0PR02MB38579B7035B3B68B689A2049BC149@AM0PR02MB3857.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rvZP9V0O+gXhn5uJ746L58W7/9UdDy09h2plBSLfrktg1ck3A32VE6D/tp5FwenQOcyXqFkEJA5/HhxuqH3x7s4kmT1z8PtmKBWwPvDQnniQw6KR9e7ocopLCkTKwFarIzi1MOjeP924mNdPTWOuWw023mgUxGCGxbgkg/Hb/YTHrqmauVcsLwOzJAdxVyyQT3RAs3Xo3PCApd7Wlx11cwFqe95SylpxT3R+Ouet1y96u2sLeV49AL+xbMCGPDTl1Mx9h4Nl5eGpmaCxjLhBpj1gvPp0TLhnjeEYESRVAk0hASf2AGnKRqHUbXwErJK+vH6MaNoPKy9/Jm54d+Do1dLAtmeyNdCIQWuv+n+kVl8+VXbwXtHSUch4nW+g0hTX4vFQ3FKlhU3bglYC0gg7LBxKPCKuidX8YAss1YN1D3nEZBWkuR57IeSiphH/hDDUamoR0mUXwmVraZomy3G+qDnTWdY4Q9imIsfBwCQQHPKNmPlJ6nVgCqdLrFADXgBtoMwCP2ZGPUu+e3QU9NTWwNUKTXTvRBOI8AWwtscLVCvzXZCdI0JUdtJOziUMHp7W8jw9KouVxsR+OEA7IXxjcxVD8iW0/LVGmmMudGZzAbN/izTfPPTJszVjykaJP9P+s8HsmhZycDQr6reMkSxthAR3jf6KdbY+0MMZf4ASeS1RD7+kJFiDTptM9vcie3oCXwOGGKZm4HteuM/uQU0yh+adgGXR3ytOBKkzgdRHSbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(346002)(39830400003)(396003)(376002)(366004)(136003)(83380400001)(2616005)(6486002)(2906002)(53546011)(66946007)(66556008)(66476007)(508600001)(4326008)(8676002)(38100700002)(36916002)(6506007)(31696002)(36756003)(316002)(6512007)(6916009)(31686004)(186003)(86362001)(26005)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG9pVHdYNEhuWm8rQVI2RW01c0dVa21xSHJxRnhOcUZVTFlhQ2ROOEtRZjVz?=
 =?utf-8?B?aFpFRjRIWlh2SHNOaElPYlZHSmxlR0NUM1o4aE8rdzhQZkZDRmhIc00xZXRo?=
 =?utf-8?B?WW5CRkpmQkdGd2E1RENpRXljeXVPVW9mSEdSRHcwa1ptcmFzNWJ1V3JIOGVI?=
 =?utf-8?B?ekVPS2p3Wmg0ZGRxazdSeERYMDVIYWNNbHBTd1JrazQvc3NjVHdyK1FMZ2pH?=
 =?utf-8?B?bFBTVzBnNjR5UzIrTG5SZERLKzJGbjdFSGdrWDYzdjE1SDZWYWhUZkcwMTN3?=
 =?utf-8?B?am5DK0FsR0RYRi9hK1o1M1B5MXhCVnJBVkFVMFNXcEFuYU1GdFhKd20zZmxD?=
 =?utf-8?B?Q0NNaGlMU0lYcXRlOExWY1pSdnpwK1M0bWJqdEFpT3NBc1R3cnpFQVZDTVFS?=
 =?utf-8?B?YnJPWk0wZDVqbUp4ZVB3YXJPR0c3TVJERHRHSStxWXZNY1RjdHJ0akNHalNk?=
 =?utf-8?B?QkgwYXRtN3NuWVMvT0JaTlcvbm5ZSElFaG1pcGh0TlJzQ3FKcGV5Q0l4QXRX?=
 =?utf-8?B?ZWNDN2xScEkwMzY2ak5NNFhsT3A1Z0FLYllVNlMyQkxKYnNOZU1VNzl0MUQw?=
 =?utf-8?B?QU1POGdQZFcwKzdlam4xbUMyMGtzUmtOWm5jU2w2NWd4RnlJM3U2TVYzMEZZ?=
 =?utf-8?B?Yk9iazEwamVNbmpTYVlCM0krL2thR0E3bmxJUXM0SFpPd3VEV1luaTl0RTU0?=
 =?utf-8?B?dzhLOThaWUwvM2NOWXB2ZVpyS2EwSWtDNmtxKzFvRi8reHE4VHBDUyt6VW0v?=
 =?utf-8?B?QldkQU5TS2NNcTdqUkdPL2hGeHRwZDFZOWM3U2JwdUpHWDJUZVFhUzB6d3RK?=
 =?utf-8?B?NXYvWDJDQjRUWk1Lb2NEVGlrajluWEZJU1hETWVWZk5yMEIwalkvYVRNM3pB?=
 =?utf-8?B?Ulh2WFVkUUZWZ2pya1grUmJvVG00OEo0VjMyVTRDN3lnb3pCL0RPay9KUElK?=
 =?utf-8?B?UHVSNkVPbERzalJidm9NSkZGU2RYeHBJakxkenVsSy94dkRzaUZ6anZqeFRW?=
 =?utf-8?B?akh4cmlIa1k5dE05T2VFUU1QVlRVT3ptcXdZbVMvMDRxMWU2Wi9HYkJxUHpr?=
 =?utf-8?B?VzlVVXZKVFlOZ2psazRkVnQ1R1g4SXRLMTJINmVjMnZMMVllNXNVTmxaRTh2?=
 =?utf-8?B?U0FWOUJia3pBRjdHK1hDbjlvNE9IMFFJdU5aZkozV3c5emdyczcyU2c4VXY4?=
 =?utf-8?B?dEk5czFRcXdyWTJHRDhlMTJqaDlIQUU4a0tPWHo4azUyb1lBN1liWWJJTlBM?=
 =?utf-8?B?SzFHckdvQitMYzdhbDI4NFloSDlscGFTMFhOOG5GOTFVTTRXT1FzMGRhYzBF?=
 =?utf-8?B?K0YvSGpoTmZ0UXk4U041R280RDUwU0k1MVFCMUNBNmZBL09WU0QvU3JsZFNh?=
 =?utf-8?B?VlRLdmNsUExhcmU2anBsaHg4d3VYSVZsR0xka2htajdCcGt3VndpazdqeGFT?=
 =?utf-8?B?dDZYL3p4U2RVUEJGQTZWL1BHcktBNENzckp5Rzd2WVZtWExKQWx3ZUNMS0hH?=
 =?utf-8?B?R0twYjQxT3JqZHdpWmdlR0xWbzR2NEoyeTZqSm5Jc0tOOUswcyttTVU2UFVw?=
 =?utf-8?B?MHVuN1daQjZ4TjU2ZVlJRkE2Z0xheVhzNmU4OWErZzN3WlJETGExdkduVHpZ?=
 =?utf-8?B?d05rODZuZGFSRkh4RHJ0c1RNQ1B2ckRuZ1RQblNRUzJmZDFxK0llblJ0VmJP?=
 =?utf-8?B?NWkrVTRSRzJvSnpkblVXc1phc3FpelowUUZJL0lUM1ZhK1NDNGhqczZIZXNR?=
 =?utf-8?B?TmVrdkFUVzhqRkI4Y2pMSml2UjZYQVJ5cWk3VTcrb2xLRSs4b09zS3NmYmxV?=
 =?utf-8?B?RU93WHMwU1ZrOHNJRjZUdVFwekRaQUxzOUM4d0NYUU9FR1RVdmdsajNKL3hk?=
 =?utf-8?B?bW9QTDV6VW0ycUIrT3RKYVh4UVFIdmhjSWdUTGhOcHRsc2JsUldVNzdzcXB4?=
 =?utf-8?Q?LD+F+4hT7JZaREDxoFOHags2E5whqlSy?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d20a7ca5-6fa8-4ad3-017a-08da09b68a54
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2022 14:41:23.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0PaceLqRRY3O28DPDs3krn3Lmh14g/e3ABRFiPST12BYJysyDh7c/O7lfRouJkR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3857
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-02-16 08:46, Patrick Rudolph wrote:
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 34 ++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 33b9a6a1fffa..e25383752616 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -49,6 +49,7 @@
>  #include <linux/module.h>
>  #include <linux/pm.h>
>  #include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <dt-bindings/mux/mux.h>
> @@ -119,6 +120,7 @@ struct pca954x {
>  	struct irq_domain *irq;
>  	unsigned int irq_mask;
>  	raw_spinlock_t lock;
> +	struct regulator *supply;
>  };
>  
>  /* Provide specs for the PCA954x and MAX735x types we know about */
> @@ -459,6 +461,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
>  	struct pca954x *data = i2c_mux_priv(muxc);
>  	int c, irq;
>  
> +	if (!IS_ERR_OR_NULL(data->supply))
> +		regulator_disable(data->supply);
> +
>  	if (data->irq) {
>  		for (c = 0; c < data->chip->nchans; c++) {
>  			irq = irq_find_mapping(data->irq, c);
> @@ -513,15 +518,32 @@ static int pca954x_probe(struct i2c_client *client,
>  			     pca954x_select_chan, pca954x_deselect_mux);
>  	if (!muxc)
>  		return -ENOMEM;
> +
>  	data = i2c_mux_priv(muxc);
>  
>  	i2c_set_clientdata(client, muxc);
>  	data->client = client;
>  
> +	data->supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(data->supply)) {
> +		ret = PTR_ERR(data->supply);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to request regulator: %d\n", ret);
> +		return ret;
> +	}
> +

I think you need enclose the below in "if (data->supply)"

Cheers,
Peter

> +	ret = regulator_enable(data->supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* Reset the mux if a reset GPIO is specified. */
>  	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return PTR_ERR(gpio);
> +	if (IS_ERR(gpio)) {
> +		ret = PTR_ERR(gpio);
> +		goto fail_cleanup;
> +	}
>  	if (gpio) {
>  		udelay(1);
>  		gpiod_set_value_cansleep(gpio, 0);
> @@ -538,7 +560,7 @@ static int pca954x_probe(struct i2c_client *client,
>  
>  		ret = i2c_get_device_id(client, &id);
>  		if (ret && ret != -EOPNOTSUPP)
> -			return ret;
> +			goto fail_cleanup;
>  
>  		if (!ret &&
>  		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
> @@ -546,7 +568,8 @@ static int pca954x_probe(struct i2c_client *client,
>  			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
>  				 id.manufacturer_id, id.part_id,
>  				 id.die_revision);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto fail_cleanup;
>  		}
>  	}
>  
> @@ -565,7 +588,8 @@ static int pca954x_probe(struct i2c_client *client,
>  	ret = pca954x_init(client, data);
>  	if (ret < 0) {
>  		dev_warn(dev, "probe failed\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto fail_cleanup;
>  	}
>  
>  	ret = pca954x_irq_setup(muxc);
