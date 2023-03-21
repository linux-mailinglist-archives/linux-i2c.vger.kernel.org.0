Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F176C349B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Mar 2023 15:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjCUOoV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 10:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbjCUOoU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 10:44:20 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28ABA3019A;
        Tue, 21 Mar 2023 07:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ny7oOYvjXf7tW3KFe9oYGrfCjFFdVeUa3doq75k2vCw6Ln94A9XwmYWTC5Twivfa8mfh0t3Luwtes8PorZ8JVRBKKbZVu0tCkiDBE12fVt4cxxjb4QQReOd5URs0YAcwpQW2i7J7pt19Zkacbh4R0KE1C4tRuj5kWPYHrmg4JALFijz8jUDRxIEVzzMR+YlRYliFddW3JRmA5ZUK4OeibANIVfLDYgYF/3lRyA5jtgstyKouBIkS5+25RiqWZhmyy+66hxyaIcWPhQHvcGxrx2Lvp69wNmzM0grs2ehYYwHpiRNleZ4tk4lIeE95//Rn6gh4SJgctZEOc3XU4AMtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJS6oOgEBYEDS1qz1mK8mVkthQsvsrYkbVkJorR7+6w=;
 b=TLzwPxABnBjQlt8M4qssbzj5z/Ukayhy/+JEQFoE9VhbpjrI+GA9Y11VDqa2t0BePSxJ3oLoraKsNSmL4tUqDeT1ZECkjpyi18sBB6H3jVA30qWYddNRcLpEq0avsFiFdtG5hhGBi2IXR8b/2qxcYP+ReD0QyUuYxR/4DhHXbR3rHvu88w/qY/JMPHNZkUEf7nbhsNdJKe8kr6sWZSu6ztgs61M0yRX5/WNk7Zg3wEtNuJ/6JIwVe0lXbXeTdjtMjs2iz3fJ32g54laWOS1Zsgt8LI7916+llEoB6EF4brqdtDuj5sttNM4FSAJ6ivOk65vc4VeLMYLgLMsM5CslpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJS6oOgEBYEDS1qz1mK8mVkthQsvsrYkbVkJorR7+6w=;
 b=UuyHNl7ob+Vr3LLGD8fRvKegjBG9jEmxQFAgHI4svSALRvcRuGpeU970I5Zhr7eoIOlmDpmiHqoBCxpR39Idg/n4fDZ+KAhwrL6CH/qtms8f/MHgK1PHoivluzg9rN8jz26CieZ76y+LhcRhiAiYX6Cdsf+SSq2DuPkvgj1mo9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:44:12 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:44:12 +0000
Message-ID: <befeec9c-60ee-f13e-8bd1-9dd28c56811d@amd.com>
Date:   Tue, 21 Mar 2023 15:43:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next] i2c: xiic: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>, michal.simek@xilinx.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230316054325.108457-1-yang.lee@linux.alibaba.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230316054325.108457-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0501CA0009.eurprd05.prod.outlook.com
 (2603:10a6:800:92::19) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: ceecdfdc-10c9-486c-6af4-08db2a1abc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /U1HKn2ojwlpCnb13yAg2T8TyA2lpO19dkXcDxMlnwziPl3t49/P8DUajzCYR1gyE0uUV3XmHHnPZoVdR13xb1Lz5Nb/cB5G7vttrmV75BWQboCz8IiaChGJZEDwsavsKExIig9HF6zfLqre7UoUx9yID72DnHU55F1sNyDhFcWk+GgFGvWG6i1Mv9Ww7v+p6yXXOhC1c75NHQ+OgBfxRFA+TB6NVjpTi9XCxcx5GHheHH1yY10rgkMiw9Wxd+rAD638yl/P5kIFRKbD+wb6hgLtylThPDNgj4Gy+Q8Z46+hdmzTGRCqd3R7nqAMenTUsaT+BAZT7M7wzSUaDVno1rklQaSVRkrZxRn0se4LBR2buemxdbRhOtl6ho91RZQjNttCGzHfOONwtZwCfssXd/jNbNqYUN4RYhl/Wyl8qzFrE64u0wEJ/JF8ORFjDGA5lqIxsUaW/k1E582jvnont1L0kfZPYBJqWaROx346WnDdXA13PUR8uUXXpUmDHkXsKyL7kAMLpGIFVgMjFVST37b45XK5SS1hI7RPkuBEVAmRR0I834Xw3xfMqdbG8gIJbJNTwLH9GCI86ssaqMNDpk7I/6dpFcaLiPDQ/Fj9R7f8c9M47iOM71PsSfU7I91V0sEJSpBQTCdN0LlE5nGXw0UcHqmeLX847t+7/wdM5ez/VRHTVmrgtNJYL750LFRqwXTEyDPasQnOvo7R8XN0AwiCxk4KFEaANNQZ6mDTVOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(2906002)(31696002)(86362001)(83380400001)(186003)(8936002)(6666004)(38100700002)(5660300002)(2616005)(41300700001)(26005)(6506007)(6512007)(53546011)(316002)(478600001)(36756003)(31686004)(44832011)(6486002)(8676002)(66556008)(66946007)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEk5bytXRnkrQUwxdFdOalNQeW0weWJaekZWdHJvTEROVWR6K3RWY0dhcDBD?=
 =?utf-8?B?ZlBZOU1EcXFsejVmclV4bzZjWlRHeGpDeStwSHN3SGh5QnIvdzA1b2N4WGNO?=
 =?utf-8?B?eXdKOE5FVXNXdGVhODUyZStSNm4yL3FqRWJpYTRnNERsVS83a0pKMWswTHNT?=
 =?utf-8?B?ZUdoVEZNMDZCSGdmcGljRU41QjYwOVpVU2hkOVIxMDNuTXczcUNoNFFJVE1t?=
 =?utf-8?B?SWZUbnJyRVFwRFdBNWtSTEQyZkRuM1dnMGZpbjROWmtkOXBHTWsybFdMVWhU?=
 =?utf-8?B?cWhBYk1hWm1DdXd3a2N3d3lxRVRIT1l6TWM2YUIrYTRrc0liSzhxRWI5Zk5O?=
 =?utf-8?B?aG9raWJIVjJXbGJrWmtQQWZBREM3M3BPV0psWFhwZlJCdzNEUUduRG9rRVI5?=
 =?utf-8?B?Tm1oc0pzeGROYm90OTZ2N3FKbmFtYXZKWmVCODB5MFp1ZUlwVjdxZk1hUkJV?=
 =?utf-8?B?SXorWmZ4OWxWR05pem9adVJnbVROOGc1NnNDMVJFK01LQzhQeUp6MjhpNFBG?=
 =?utf-8?B?YVZoYU5sZkJsMEF0SkVaWmwvZnVUSXg2MHNhT1NVN3gxOGdjeUpoZ0dDOG5p?=
 =?utf-8?B?blF3UTgzcTVJZnUvMVdFUWdkbHBqcURqUlZxRVNsZ3d3UTkyYjZYRkRrRTF2?=
 =?utf-8?B?bWg1aUdsSVRuYms4RFViaFZDWmwxdmxLTnl1Y2hxd1NONExpOWpXK3RiSUor?=
 =?utf-8?B?cUdXdEQ0eWpVLzlELzBpRUtZa2JkQVl3Q0o4VkhkMEt0WEpwRks4anI0Ulpp?=
 =?utf-8?B?SFVRajBHWEl3ekZzR0U2dnZITThPRThScDFBdDE0TEVEZlYxcHhydlBmSThE?=
 =?utf-8?B?R2l3T3Zta3JXL1dsWTV2cmlsbnYzYzAvd2hCVDR0ekMwR1lXY2Y4bVZxYnVw?=
 =?utf-8?B?Q0w3azVOZzM5Q2NhRWlOVWF3c0FxbXJUbXZkRXRjZk5UakNpUlhDUnpaaTFv?=
 =?utf-8?B?WnkvRlNHbmwzNTJoRmtxL0IzaE12cjFHVmJoOTRXUDBhSHprQnQwWGl0M2Nz?=
 =?utf-8?B?UzZFZ2cwai81bVAxR2gydEZDcjQ2a0xZSkFDQVQ3d3N1VnZFM2RzZlNWWHRV?=
 =?utf-8?B?bXZkcE9Cd2F0U2ZudkQwYlZpM052VTlpaVdMaFczWVpWMXpsY0dXWlJCMXVi?=
 =?utf-8?B?Nld0V1NWNWwvRllVZlJBTVNpYUk2OUtERUdwaFpsUElZU0pjRm9NUGVGV091?=
 =?utf-8?B?RjN2N08vZCtQRzRNZ2ZZY21LaS9nSVVHK0ZNcXhZVHhqaGFRZGdub2hwTzVs?=
 =?utf-8?B?MWpLRG8vQzlwNzBKNis2bCtxTVh6LzNxNkxSUjRGMG13cnVrZDVzYTdLMW4r?=
 =?utf-8?B?M0Q2NUtwT05VdWVvWEk3UWFqc29xMEU3Q2d2MWkrQWlVSDBtdjBiZi9RSTJF?=
 =?utf-8?B?cGxJQ0MzVE1WMDArMGx1YWVqRHZEL1RxR28zQkdFWXFMKzV5OTRHNzFKOWJQ?=
 =?utf-8?B?aElPejl6MEFKRk9vcno2dDI5czYzOGVsSi9QMkRRa3B1WnR6MjlFZTB5eWZ3?=
 =?utf-8?B?YUQzMkNITCtVa000cFZ0MGtHUHk0WTNZWk9mRjFPNkZQTlNXelkwQzBBaDNI?=
 =?utf-8?B?a0dVNno4eHMxS21NaHJjMDFiRmJwUDdhNnVSbDhTNG1WejhoOUptWmRpcjAv?=
 =?utf-8?B?c3NlRjAwVDNQeVljUy83YVZCVWV6U0JoL1ZmSjYySUJvSWNEUkZRbmovSm1V?=
 =?utf-8?B?SW01dGphR1FYQTREem5QNTRHK3dGMXc0N0JqdmdCZkFBM202dERhOXAxM1kv?=
 =?utf-8?B?dWd1S2U1VW4zTFYwZUREVDFCS290MGptRFg4VWZrTUlXd2hCZVlmUXdlczF2?=
 =?utf-8?B?WjlhNVhKQzdrVmx4U1JSdE8zeUh5UldRWEFkc1BwN1pOeXEzQVRFa0hwU3h3?=
 =?utf-8?B?Q3lqT1hxQzFFTkg1anhHYS9KUjYxTXlyTjhsRW0zMFZtSTVzWlJScXYvY3J6?=
 =?utf-8?B?Q2FPbExmejNHd0loQ21CTHJIdGtrcmdnbExFL3pKV212S2xHNmdiR1lqbnA4?=
 =?utf-8?B?NFdqQW5jQmI0NmRub25BVlJ3K2hhU3d0TnVKSzdabmRzd0NoRWdTdEtHYmZY?=
 =?utf-8?B?YWczc2xFVFM3cVkrZkhPR0FyR2JzdDhKcTR1MFJhNEJ1Ky9Bd2lCYkxSK0Rk?=
 =?utf-8?Q?0irTLYE02/Akr3123BMkXC+Tp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceecdfdc-10c9-486c-6af4-08db2a1abc2f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:44:12.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKOoVUBZZAU2LpcOBUCM2MP2/6x8drFgE2jdScrr28LCbMX+KhnDCiNzyHK4haGF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/16/23 06:43, Yang Li wrote:
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index dbb792fc197e..0eea00d10545 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1233,8 +1233,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>                  i2c->quirks = data->quirks;
>          }
> 
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +       i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>          if (IS_ERR(i2c->base))
>                  return PTR_ERR(i2c->base);
> 
> --
> 2.20.1.7.g153144c
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
