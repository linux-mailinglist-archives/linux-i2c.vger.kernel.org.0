Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E774DE937
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Mar 2022 17:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239355AbiCSQNJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 12:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiCSQNI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 12:13:08 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2131.outbound.protection.outlook.com [40.107.22.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17CC3D487;
        Sat, 19 Mar 2022 09:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjbzTcO3F5Yrm6PAC+DlBjqsv98rMDqX5b0XCxeO435a2VEDQvg/qS2IhSq1+aRJnxf5+vzCfkFG5pgMhxOOBB1mjw0qr/hUI59qEndpmdO02BquYXVXVQ1RwcGpg9JpG6kTjRbXQ7IntaADOJdqzJfO5J6j+t6HhEEJviZ5xpCmlrfZwPu5dsLovGFkotmsCjiTy4Vq9bCU82NW+jaFO5RqJflsA2W84QALDfDNzK5ciO0XiZYEcqLjjLUVFUkfqi2O2P0NVcscvAZdRUJ8yj6oXHuIKRmWVrWTsLCuSBUfMP28vHnRLwZYeA6qulDLqW3KMgYn16QPh5zOtoIKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTUmJ1l1DywqpT9ZQDp4disSJg8zCtaeTg2OsFQb/2c=;
 b=ORnpEX2s+sV5CnEmCUPyKkUnrXQjTNKX/wvnwmP2L5I3tZqENaV7ZrA8QbDfBUuCrR7II4jFva+Ej3v45EMQ8yx38Wn6am9LX3KH1eRg7xW8qPfhy/5hjTnDu/Very33o5o7fmBiG8kn5WF12ADwIaTD1jOqke+vFFmyRdE+YJfrXrB6peKdlPnilccibJeG7OXAdlwRDbKzzH9rt/361YyA4QWSXT3SvmBhQbi+vCHgj1sASQzgmtc3xO2zIEY1PV8nGaa3McziYjWmJemwOW6HTsFjDz9u2J4CLJTi4GGed6QZNtY6XLOmGkSxrdHqoI3q0kjgt0y58mUk4if36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTUmJ1l1DywqpT9ZQDp4disSJg8zCtaeTg2OsFQb/2c=;
 b=QcopnUo7IjbLgkGHYiMQhm+SgNx62uM+zA9WwVTsYyZtd+qlTtVWZaxekQqL3Ix9vIxvJgsurKeJejHJO7uRqP0MGE3JwFfBYT31SLq8C003Gzsh3qZYH9okrwhOeYYyeckK6yB/irKoAV76jSyM4LT4xwl/hiAqRv0JxDuR3YM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7384.eurprd02.prod.outlook.com (2603:10a6:20b:3b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Sat, 19 Mar
 2022 16:11:44 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3%3]) with mapi id 15.20.5081.021; Sat, 19 Mar 2022
 16:11:44 +0000
Message-ID: <2e9189da-bb76-799e-c284-e45d2a8787c7@axentia.se>
Date:   Sat, 19 Mar 2022 17:11:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v6 3/3] i2c: muxes: pca954x: Add regulator support
Content-Language: sv-SE
From:   Peter Rosin <peda@axentia.se>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-4-patrick.rudolph@9elements.com>
 <a0f74cfa-696c-f487-51a5-007963cf1456@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <a0f74cfa-696c-f487-51a5-007963cf1456@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0021.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::22) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0294c17c-94fd-4276-b1bf-08da09c328e8
X-MS-TrafficTypeDiagnostic: AS8PR02MB7384:EE_
X-Microsoft-Antispam-PRVS: <AS8PR02MB7384C789D8882545FD168D38BC149@AS8PR02MB7384.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WClHhmMWU4r61mml1KsVxDyo38YUS5WvClD1KUuIBdwamY9Z42WmN0V47nkRmX2DcEohvtQQ86ythro0Gd9uoXdl7UreLaPAPck0RhQadkdcZ2jotvi8soZlBcNV0ZWHVISv5PmG/i/qXegTctaxyUUf0p/xysdfTtM6yzl1VVuq/4DExgByEqSgzd8qMKaY3DhvQE+7okoRzDHHWSHkPG6jYHDLEWSR60pvMguc8pgHspdjUU2N0j5kG8LS6seWoqRSDXp43/OvvQ16rOHmspHETJrtdoh/FIwhTW0oPd0DkTCA74miaCtfexh5M+Ob8k344m7jYuaSUpFP8GPWVD1fzZbcNtRrKObnkkiHuuCDxwRcnG+vuau27aVxaxR4v1D8vT9vatPPBtnbj5nilpnqQIbjFgs8I4wivQcDtcdkJF4+f8WQm9RleJz4D+Na6mT7fyH+7tklD4JQoCSZl/tSSg4LAWunkHkpIlYVmEIAMSlu9tjayhB68D/mccTerpu27Q2E/2dXh7JFl5gdKrfWVyxwySdCFXqmFc5GP84WZ4O/BeZJShRGSSEMtKfwLJbFZ1QcaSmOc3VbvOopg+kXP2snBQ3/S9UaEilctF0AZMMkVykgioCZzD8K3N/H/LtknRgMIPTZJqniyDl2y8CJfA21trGxjwNMTHTiyRJjqz+6ps0LMBeSGQ7mhshW6Ej0+XftSg87lBQEwtfJabegOlLPisSjbLI9t+uvOmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(366004)(346002)(376002)(39830400003)(396003)(2906002)(316002)(6916009)(83380400001)(6666004)(36756003)(8936002)(31686004)(2616005)(6512007)(6486002)(5660300002)(66476007)(508600001)(66946007)(4326008)(8676002)(66556008)(186003)(31696002)(26005)(36916002)(6506007)(38100700002)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm5CUmp1T2xyN05pa1lrejBuSkNiRi84c3ZZd0VGV3UwMGdiamt2cVNvMU5z?=
 =?utf-8?B?cnFBemlmajRxVWRSTzJLVm50UmllbXpCckQ5YS9ZUXQ2RTVNZVhGVlFhL2tI?=
 =?utf-8?B?OTNjTi9WOGd3RDVrT3pKbHlzSVB1ZXRSUVZTMjJDSlhMOWRqNmJzSWRVbGFl?=
 =?utf-8?B?QTJ0YnhTZEhXNWFaYlRGeHV6YlU0NHlDZkZKSm5EU1RyaDNWOEJZWFhmbEs0?=
 =?utf-8?B?L1ZTY2tFSmJyUFpWa0cxbDdkU2Ivc0srb291RTgzb1ZVTEgzTVRlVnYvQXJK?=
 =?utf-8?B?b3lpcDE3bGd0TDFqQ1BMWjBxWUhNVGY1aU9PQ0I1eDFlQmdUdWZQYzdrK3RR?=
 =?utf-8?B?YUh5RHdNQWNJS28weFFJcmZVSm1GRmErTmRSN3V4WFd5Y1dkREVDY3NjRkw4?=
 =?utf-8?B?cTRvdlNwM2xRbkZPb3QyREFiSEVrekF5WDRJNlBHdWsyRXgyY3dIU09ieDNj?=
 =?utf-8?B?VVBLVENpVWxValZsOWJxd201TmFxQlVVSTFLcGluS1BIOURqSWl3QWJ3ME50?=
 =?utf-8?B?eVdJcHBqOERJQmZXU0xEOFk2YjUxc281YThPaGxvREo3U05kYTh1dG5zWHBz?=
 =?utf-8?B?K2xhMUlwcTVUTitqOFg3aURMME9BYzM1UkdtVEE5UTZqQ2p6eUg4dTJlcGIy?=
 =?utf-8?B?Sml5dDR2a0pFalFicW9uWmZ1aGwvb2xTTkRrNEtpdkZ2cG9ZUnhlNVhtM1hh?=
 =?utf-8?B?RHRmMnRhMFNRTTFrRmFUMkFiWGloWVpKRkpWQkZFQW5hRElwUG1kdjdSazlH?=
 =?utf-8?B?cSswazJQSTg4c0NlYUQ0dkh2QitJL1RLK3crTkk3QVJiclNRMzhnczI2RWtj?=
 =?utf-8?B?d04zNmgyMWJTSFpkQ2tBVW1STTVQdDhjeFFNNDhFWmFuSHdGck5KMWxZVDVE?=
 =?utf-8?B?bFQweHhhcTM2RFlaM3U2TDZtREE5T01SWUZ6d2QxbG1ZY0N5b3loZ0dCVzc1?=
 =?utf-8?B?aTZwc0h3OU54bklra2ljNWZkY3J3bVhoK0c1bm9VM2FnNEVKQVBlakorTVUx?=
 =?utf-8?B?TVNCV08xU0ZIODhzRnVqUjd0OGREK3BKUGhNdndROE1GRFhlRjFyS1ZjZHdQ?=
 =?utf-8?B?UEhjeU9wbXlCUFJZL3FmRkQ4YmJzdlBCYmk1Q1VVeDJjZUtYMm9nczFMMldQ?=
 =?utf-8?B?Q2dsbDlidEJkWFBNYW5rWXZoQlc4NzVNNkR6dDFoVnk1Z3g1bVk0dTN3YmdL?=
 =?utf-8?B?V2NUSm9DT1cyWjJxbzJ4Tk5uc0ljbHZ3NWY0dFRJemNZOFlWaHpvNWNkcUdw?=
 =?utf-8?B?ankxM1hZbUE4OXYvNjZTbFJydWZNa1hDSXgzbUlGTlZ6YkVQaUpVR0dNcDky?=
 =?utf-8?B?eHRkKzRzYjBud2hWV09VTkJkQzJ6czdkS1BZVEVqUzB4dUduSWR6ZkhoUWpn?=
 =?utf-8?B?a29DYU9LWHVuVFpueFlSNXhxQllTTElRNHRvbGRtcUdxZ1BWT1ZaWTlvaiti?=
 =?utf-8?B?TGhmKzJPcjFFbnNjRWQ4UHV4UXF2Vmdteld1MTVIbExsbENtbzh2Y24vR3A2?=
 =?utf-8?B?YkNYbDViRXVRUE9MaFZ2N1FKTHVnenZueXZkb2QwY2IrRUF1U2x5dEErVUVp?=
 =?utf-8?B?N290YmQrTERJVHNtRkQxeEhXMjhzN1dCN3E3ZnFjYkpIdGU5S0pzYUtBRWsv?=
 =?utf-8?B?Wk9nVW5STTA3OTZ1d0JoTlhJb3lSSDcza0NFcy9mNnBjMlExNUFidG5pUGFI?=
 =?utf-8?B?Y2R6KzZuYXVBbHE5NU0wa29zUmxhY1V0WTF0YXhMMmlMVVlPTXI5VG9Kcmp6?=
 =?utf-8?B?Rmd3T2QwbVBPRnlHOFRaVFY0V0d2SW1lVHhPUVJTMFZFdjhiNHZIN1ZnOHBV?=
 =?utf-8?B?T28zanJWNUY3OGdOZjhPbzJEUzJFVXpzQitqUWFEc2lpTUVKQTl1WE9WRFNr?=
 =?utf-8?B?Q2FZc0FXUk92SHF4MXRpc1d1VktxOU00ZnFzcmNpL1Via1VsVU1LNk1WbXhm?=
 =?utf-8?Q?laAoa4jM6HT+O4B8kRZksZRddmSG1U93?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0294c17c-94fd-4276-b1bf-08da09c328e8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2022 16:11:44.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7ep1jua3bPPYjmyq9tSRrH88CMfa3Ve/zh83fVtLGlhS17VYfCuVyQB5ScF59PF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7384
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-03-19 15:41, Peter Rosin wrote:
> On 2022-02-16 08:46, Patrick Rudolph wrote:
>> Add a vdd regulator and enable it for boards that have the
>> mux powered off by default.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> ---
>>  drivers/i2c/muxes/i2c-mux-pca954x.c | 34 ++++++++++++++++++++++++-----
>>  1 file changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
>> index 33b9a6a1fffa..e25383752616 100644
>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
>> @@ -49,6 +49,7 @@
>>  #include <linux/module.h>
>>  #include <linux/pm.h>
>>  #include <linux/property.h>
>> +#include <linux/regulator/consumer.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>>  #include <dt-bindings/mux/mux.h>
>> @@ -119,6 +120,7 @@ struct pca954x {
>>  	struct irq_domain *irq;
>>  	unsigned int irq_mask;
>>  	raw_spinlock_t lock;
>> +	struct regulator *supply;
>>  };
>>  
>>  /* Provide specs for the PCA954x and MAX735x types we know about */
>> @@ -459,6 +461,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
>>  	struct pca954x *data = i2c_mux_priv(muxc);
>>  	int c, irq;
>>  
>> +	if (!IS_ERR_OR_NULL(data->supply))

Hmm, this is a bit confusing, but I guess it's fine since the
cleanup function is then ok even if it at some point in the future
is called before data->supply has been filled in. But this is
what confused me into the below comment...

>> +		regulator_disable(data->supply);
>> +
>>  	if (data->irq) {
>>  		for (c = 0; c < data->chip->nchans; c++) {
>>  			irq = irq_find_mapping(data->irq, c);
>> @@ -513,15 +518,32 @@ static int pca954x_probe(struct i2c_client *client,
>>  			     pca954x_select_chan, pca954x_deselect_mux);
>>  	if (!muxc)
>>  		return -ENOMEM;
>> +
>>  	data = i2c_mux_priv(muxc);
>>  
>>  	i2c_set_clientdata(client, muxc);
>>  	data->client = client;
>>  
>> +	data->supply = devm_regulator_get(dev, "vdd");
>> +	if (IS_ERR(data->supply)) {
>> +		ret = PTR_ERR(data->supply);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "Failed to request regulator: %d\n", ret);
>> +		return ret;
>> +	}
>> +
> 
> I think you need enclose the below in "if (data->supply)"

I just realized that no, you don't, because it falls back to the
dummy regulator. But then, data->supply cannot be NULL, but see
above for why it's a good thing to check for it either way when
cleaning up.

All is fine as-is.

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

>> +	ret = regulator_enable(data->supply);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>  	/* Reset the mux if a reset GPIO is specified. */
>>  	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> -	if (IS_ERR(gpio))
>> -		return PTR_ERR(gpio);
>> +	if (IS_ERR(gpio)) {
>> +		ret = PTR_ERR(gpio);
>> +		goto fail_cleanup;
>> +	}
>>  	if (gpio) {
>>  		udelay(1);
>>  		gpiod_set_value_cansleep(gpio, 0);
>> @@ -538,7 +560,7 @@ static int pca954x_probe(struct i2c_client *client,
>>  
>>  		ret = i2c_get_device_id(client, &id);
>>  		if (ret && ret != -EOPNOTSUPP)
>> -			return ret;
>> +			goto fail_cleanup;
>>  
>>  		if (!ret &&
>>  		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
>> @@ -546,7 +568,8 @@ static int pca954x_probe(struct i2c_client *client,
>>  			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
>>  				 id.manufacturer_id, id.part_id,
>>  				 id.die_revision);
>> -			return -ENODEV;
>> +			ret = -ENODEV;
>> +			goto fail_cleanup;
>>  		}
>>  	}
>>  
>> @@ -565,7 +588,8 @@ static int pca954x_probe(struct i2c_client *client,
>>  	ret = pca954x_init(client, data);
>>  	if (ret < 0) {
>>  		dev_warn(dev, "probe failed\n");
>> -		return -ENODEV;
>> +		ret = -ENODEV;
>> +		goto fail_cleanup;
>>  	}
>>  
>>  	ret = pca954x_irq_setup(muxc);
