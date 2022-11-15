Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC519629880
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiKOMRu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238291AbiKOMRd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:17:33 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC1B20181;
        Tue, 15 Nov 2022 04:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+gFeZG9eV7+bAaIn1WDpvQJe+GiDOdGGyTm9t6Lb4Pw5KLhESdAff81Z7jSoi5evFLv5fdJzrwA+g5Bl0tsqrP5MyHFzN5vmBeHoIYglSNAExiMeCA9XRZkMNLoGRWIkKdn/K16EBcQnVLSerwNSE8iFPt71iE+2qXhBy1o5ulcFxWKzXGn04c9ryDFoGdgEelV3UycE8PuAf0BR38TWn3v5KQ8Uw5KrqmICI1uGFr64muHIifLZvuICkwjgbo/SAPGX7VvFLjn0QLIFuLDCwnvAkjJ7+m2m9mRLZOS1mjaC5GPYfkQImCA+xce/rIx1+nk2g21jdQn4A91fd9oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHkxFc5zeps/uBJUh1LeqMi7ZnRq0YeGMUSt6bADlv0=;
 b=T9yhSsymV0Jz2MeCVJwvw8ec1vj+cp+RthPA1xhFuwGV7Xce+6hL4H2H5IMygli/VkEWKZ9yULPlDy+Lmh3Z1vPXF2p++Da5Uyk/cciOE8cgfQlRubLRNCJ1DHmPymdI/enHozEOQYJiAm54OzeuTt2QZuFLZ5Gxy6GTUOMYQWzwyzzo4hjgZrFxeIVujJFObQSZaiOW8edv+17Oytzcbr4i6X54PPWpJXtQgi/2tO1nnHn7nrgSRLcPmHKlnSLd7K3RMBfrBQEBYDB8X4V2jWWcjVO5bfdM5NEzh5g+QjYTu1RAjRuN2d3jw7NEngpyBgIEfvqn9oLyNLLIMvRjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHkxFc5zeps/uBJUh1LeqMi7ZnRq0YeGMUSt6bADlv0=;
 b=JchFXRAZbgj/bGDeiq9UQExj4iAYCS9XLcg35Iqdk3jBGY+Ujj3Pa0mBAjo1jSs6l7dLMypCzYq1XQS9r/0a1ZwdU+dEQuq73ykgfDC/RwQ6uognocw2hkXd7hPS8yp9hh0h7aoFT+RpO7YzqA1JrqlK4wkvS2SRUG5ZrBwHApfIQCHnHDUSuoPgvnYXNrL7LOkCfOeLVxl+oe3QS6iiHDK1OUAAU/XBZigopRlQw+W4DU/r9ofLZx48AJI6k9vd0bKPBq6btUjgnVC2ZImsjkZW+l6tBhxsQPzqwfbb2Vhj2R3TF6LDHWD1tLcWW1r3kg5LnqHduYA3QOvPYPQ1Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5036.namprd12.prod.outlook.com (2603:10b6:408:135::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Tue, 15 Nov 2022 12:17:29 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:17:29 +0000
Message-ID: <44ee7109-71a2-a172-e840-483e2db716b3@nvidia.com>
Date:   Tue, 15 Nov 2022 12:17:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 05/13] usb: typec: ucsi_ccg: Add OF support
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-6-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-6-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce0e439-0b4f-401f-93f9-08dac7035d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmdMbC/S+JxiM/qJkw3eZF0k1LVDNzGDbDsDv/YTPI4OabgoEAaixzQpEeA1A7MwD9pGdtKDojKQlOSkzvmATjc8oZfx1E7Sc8ANUClUdueOzn4sVhRDGAsk2UN0K0e2OEyvtFAlWub4ZJfnQX6rWSrO0utTOJz2zxO6h5AbrB5ko4uQC+WgNQcLX7PqTJcaCdJzVleeLP2IhiUzLKdd/2dASjLVhBdxJkygW/lfe8uNmJCGLTnESION0VyiERgsAbH/b+iLd/v2ACc7TrPfW3FAAkKHdsXnk3cCFp2LucV7eBB00rZW/1Z43zeLxFClqVUCWL9LeGYtNtGahbzoT/JQd65jji97UAC4Sq0fGeH2Iq7SrU+YMRag5LFr64BnYuQ5o6kgIrzSKxf/a9uJMBYpsMQ+KVaUzS9jpeVaAbEL+nicDq1HF4Y6ufZ5pAufnfMzKfp8Q/MHKPQdCl/+TMuyi/WdDEKTGwd7jd+DbRd940usjWDetGCQYCPPhe7FX6TCvbarIABcELv2sQ1AzTcr8ybfWgmCP3eZfHxxjUwREHTvTo+AjzOIECjdBsQvQs6cusBzDzMhgzRmK3fBHXyi5dmeUR4vWFk4JM9Snv4oZL7C+0nzF1p00M7HFXxJmrg8L7aqtBJC0sgd0OoFlZ5vrOJtGc9Ic5jW2pp3tArrLCGdi1Lg8fSQE7QKagZbSQ3nbSCMsTBfR4M/AoaZrgmenEB0f8hUmVd/gqk56QDFLj9y0muWbCBoq8wPPhJFBjFIzdWjMjWAyrXlGVLV4KPQ8Es+/yV8nFYRbVRBmZ2JxYSOx7h5SqX/uhO/FmI8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(6666004)(31686004)(6486002)(478600001)(6636002)(316002)(66946007)(55236004)(66556008)(26005)(53546011)(6512007)(8676002)(66476007)(36756003)(4326008)(41300700001)(2616005)(8936002)(186003)(5660300002)(921005)(38100700002)(7416002)(83380400001)(6506007)(86362001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpScDl5NklQbHRrUzdDWlNIOGlvYVFkQ25FUm4zU2puQ0wxY1FHRlpVM2NK?=
 =?utf-8?B?bVhSYjRJUzFDRU0wcFE5MjhVMVQwUmU5SkJUaC9KN3o0aWhzTVZtbXhWb3Ry?=
 =?utf-8?B?RXk1bXdzekxvOEhzcTdMdnprZ0ltVGhoUXVLT2RPWmZzTEtKODFGS3EzaWJG?=
 =?utf-8?B?aXc2NEIrZjE5aTVGaTBsaDFBQnQvTi9adXpoM1NReW5iNkQ3VUduSmNpY1RP?=
 =?utf-8?B?NjFBWktyUGg5aUtCRFJyOWUxVGovaHRiQTl3WGRqd3dRZHRIdXFsazllWkFv?=
 =?utf-8?B?ZnpYdm0rbDdEYU54ZGhxSS91d01NMHJyUFlMTHlKY1RQakNReFNKMk9tbFcz?=
 =?utf-8?B?TG94Z3M5SVNMU1ZnRS9rd1RBSHg1SkxlL2FMN1g5SFQvZ0R3TU1HcjdpZWpq?=
 =?utf-8?B?MjB5R2hMWVhSengxWXdKR0xXVnZPNnk4OFFFdTFjL1JQL2JNTXZWNlNhOWMz?=
 =?utf-8?B?S3VpLzluT25RcjB6SkRGR1QzTGZKRm9nRnNhM1h6NEVBQnljUkFaZWRxSEhE?=
 =?utf-8?B?VU9ydWdkNU5peElPM1VTQTM0djBVUUlUbnVEaXFYRmk5dDY5NDgyMEkyYjZz?=
 =?utf-8?B?YUQ5eHBYQUZzRjB5cTBvZTZjVVlWTDZ2MUc2Zkkzc0pKbkEvdmdqTUJpZ01Q?=
 =?utf-8?B?dmFsUXY3QjhhSXduVjFFUmZSNUk0TUlGN0dNZmJXMCtZUVVJN2NyWVNVSkEx?=
 =?utf-8?B?aUdCWXpIZy91UjFpQTduYWNkMXM5VitXK3pxQnVlRzZ0M0NCeEZNRXY3QlN1?=
 =?utf-8?B?L0Y5V29GSVRjRU9yTjFnZExPVnE3dDJiV2M2a291WGVGVXpnMHhZNGxwL3ZM?=
 =?utf-8?B?Ti9PM1AwVndvTUlYZFkvbVY3ZGE4QTQ2WVNyb1VRSXpwQXlSdExDMkkvMjdO?=
 =?utf-8?B?bVNoNFdRaWdiMXgrS2JtSFBTdVdKZXpFQ0h2R256cjBKQms2cXI5bktUNGky?=
 =?utf-8?B?UW4xV3FkZGQ4UTRzK3RERnp6c3ZZRFlldXhybUM2UlpEbm1NK2dieVZyUktw?=
 =?utf-8?B?Y3FTRTlXUUdNQ2lFcEtMRGgzSFBZV25WTUJ2Z2I3aHpHUDZIdUpFL3lyUFlo?=
 =?utf-8?B?ZXZxRnZjQzN6VVY4amN3WTJ4ZVE3U1ZxYlB0ZWsrYmhSNzlOSTdOc2c4TDJC?=
 =?utf-8?B?OURHcXZsRjlGOHZhTWQ1S254bmJHM2ZXY0xvckdaTkx1Zno3a2padVFaVW4z?=
 =?utf-8?B?bHlBdUlSazkyUVNlRnp4OHVQRDNVcjRGd2ZBRW1WU1ZHbmp2NjBwakRPZW9F?=
 =?utf-8?B?L1VzQWNUNXU1VmJCMHBOMTRyQmFmVDlVc1EwZkhDQVAxZ3R1cGhVNnhxT3dW?=
 =?utf-8?B?SVVLV2R3cE5qcjRmVjFRZGQ4YVZjdTk4UXlHcjZ1bm9ieGpZamdHd2JWMkZ5?=
 =?utf-8?B?V2lKLytzZzE1QVlwQjNWeWFpeHRXQS9LQ0d5eDN5VDRSZis2SUc5Njk5cWVS?=
 =?utf-8?B?dEU1YWJCK3R5OGZvOXZDdDVaR010SFJEdlJWQ1M1Vm8weDdVQm1QZ3V4bjkr?=
 =?utf-8?B?Q2h1eDJYTDcrNENLTmdRcFNKVlp1bHpPWkxmWkRsQlJmYlFTc01Oak5melNC?=
 =?utf-8?B?Qnk0anUyODdNK3VqOThRejRvQmJkWUVGRW1GL29kbjdZZ1ZUcnhsOEhZQ2dC?=
 =?utf-8?B?UU9ROHZGZ3V5bGpsQmxiM2d6R3VRSzJyeC80L3FRR3NId2RhN3NaVGVtb3Zn?=
 =?utf-8?B?ZmFRcEY3R1NBUTNWRWd1T2EvekpERkZlcWRQMlA3ZTlaQ3RlSWlqQ2pnUTZV?=
 =?utf-8?B?MnNjaTlNKytzMkRlS2FSWUFlVWgrYitMT3RUSjZXU0NkaS92U0dzakdOODJn?=
 =?utf-8?B?ZnpKRmwremZIa1UrTDRLYnZsLzVHUnIrZTVsSEgyUzJTWEEvVTEvbzVyWnY4?=
 =?utf-8?B?aGFDc0pVSnB3UzBMN3N1b2dmMDQ5TU9UTEh3WExqWTlqT3VaRTJOSUFjTVJK?=
 =?utf-8?B?eWZ1MEZSeHdQVGhseEtLcnpwSUZUR2NvVkhNbmp4djM1V1gxM3pnRlBJRnFp?=
 =?utf-8?B?RkdPbys3OGllSFU3WmpsQWlrSkVkQXoxR2VOd2VxUzhoaWZOYjR2QW9uZHlR?=
 =?utf-8?B?ajZIM2tyL3ZHZ09hTUJ6T0s2ZTZNWHJGN1pUbk9PTHljV0xXV2pTNGs0MlVJ?=
 =?utf-8?B?YkgwMDZ0c0J5SlJxWWRjM05tOTBmb1RuRE9JSlUvcVRrQnFxOEZ5c21KY0RX?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce0e439-0b4f-401f-93f9-08dac7035d75
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:17:29.5662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: st+/8e4+vKhc9vkfndnk6Mirgocks1iFKds0amO+fjcGAp/D2dCUnSDyYgyelLg1KMOtzO7zZpfdRJzVngAjLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5036
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 14/11/2022 12:40, Wayne Chang wrote:
> The change enables the device tree infrastructure support.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:nothing has changed
>   drivers/usb/typec/ucsi/ucsi_ccg.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 835f1c4372ba..139707a2f3d6 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
>   {
>   	unsigned long flags = IRQF_ONESHOT;
>   
> -	if (!has_acpi_companion(uc->dev))
> +	if (!dev_fwnode(uc->dev))
>   		flags |= IRQF_TRIGGER_HIGH;
>   
>   	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
> @@ -1427,6 +1427,12 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>   	free_irq(uc->irq, uc);
>   }
>   
> +static const struct of_device_id ucsi_ccg_of_match_table[] = {
> +		{ .compatible = "cypress,cypd4226", },
> +		{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> +
>   static const struct i2c_device_id ucsi_ccg_device_id[] = {
>   	{"ccgx-ucsi", 0},
>   	{}
> @@ -1481,6 +1487,7 @@ static struct i2c_driver ucsi_ccg_driver = {
>   		.pm = &ucsi_ccg_pm,
>   		.dev_groups = ucsi_ccg_groups,
>   		.acpi_match_table = amd_i2c_ucsi_match,
> +		.of_match_table = ucsi_ccg_of_match_table,
>   	},
>   	.probe = ucsi_ccg_probe,
>   	.remove = ucsi_ccg_remove,


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
