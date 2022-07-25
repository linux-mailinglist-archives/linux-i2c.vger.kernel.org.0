Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C46F5806DF
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Jul 2022 23:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbiGYViw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jul 2022 17:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiGYViv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jul 2022 17:38:51 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60138.outbound.protection.outlook.com [40.107.6.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC69120A4
        for <linux-i2c@vger.kernel.org>; Mon, 25 Jul 2022 14:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=illZOO+3/2kV2z6dmgHNrS3BOXIHHrahpGzs5//Dcy+Nc444NOkHldw8pOifIedk91SDRa+oCnJTvocBUse7wLhAElTkBv/QFyrv7h9gKnshCt+VeMW9j2tOOBvbVDwAUSJnmvFGQ6A4yxUn/CIISTzb/vaEHqfYGTMJ4OILGchGSzFyyBIGDkZccfnpXLVJ5bYa/KfhVayc6VVgKNOhffszZ9c4w8eKa1oggNSQL0yjoovhPoNGIcJhtTwP7cMe+zdI61AIMeBtYBXS298D+5ghwc+q2AQC6Cm5sReWpv3M1jeKAwsm0TiX1X8rvivDOJ7PFuXl4uRV1PUAPHeyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DniTcq83Xp0kWL657X6YKWkisVgz+l8SoabyK/FBNP0=;
 b=buyJGOyMmz6E6t0+0vI9AcicRjqBrVnPnUQMbKv6GUp75RHGmoISVlRPw1vR+txjTCECcgAg81b6gRMokpfNMO9ORaCAxI8D76ijXYBYaKcfrZ0U9HoZlSqV4ZWI/d8xmab19cQW5bpl6bsWsg6OcwD1dvjuIBjqXKJIyt2zX6IvlW+4hGLRpp2NaEqi23/3RDs3uxNS4lu4dSpLf+qqHHU1KFrRlHIsDCG37bYDTmo22+7MjR7BL743ayIrMcQdOGELeDqJ1tYsIlkLtm3J1j1LZh1nM8lkdNPRk9rpdqGI5nKJoUSl3DW9Z3L7oIs1dp9qVbzhzPFsShv+Hhl5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DniTcq83Xp0kWL657X6YKWkisVgz+l8SoabyK/FBNP0=;
 b=KG+poJaC0xzuL6sqJDtlwYu12RzOZS0NL6pfeCgFSYOeI4SkOYFwwkgBsgw0KYcxKViseGflKI1d9xFNH82k+WNVcWtZ9Beu++0ZJQv6LfjaEJlRuIVqOTgZxBaGPjgDAYlltGgrsUVkZrDr7fWmQdfFyCsCsW3YFvvR/Q3/7+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from VI1PR02MB4445.eurprd02.prod.outlook.com (2603:10a6:803:ab::28)
 by AM0PR0202MB3426.eurprd02.prod.outlook.com (2603:10a6:208:5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 21:38:42 +0000
Received: from VI1PR02MB4445.eurprd02.prod.outlook.com
 ([fe80::1ddf:614:f243:c32e]) by VI1PR02MB4445.eurprd02.prod.outlook.com
 ([fe80::1ddf:614:f243:c32e%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 21:38:42 +0000
Message-ID: <d476bd36-6e56-51bb-5c44-b09148592a29@axentia.se>
Date:   Mon, 25 Jul 2022 23:38:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] i2c: i2c-mux-gpmux: Add of_node_put() when breaking
 out of loop
Content-Language: en-US
To:     Liang He <windhl@126.com>, linux-i2c@vger.kernel.org
References: <20220722012401.1303609-1-windhl@126.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220722012401.1303609-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0068.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::35) To VI1PR02MB4445.eurprd02.prod.outlook.com
 (2603:10a6:803:ab::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766382d1-65b0-476c-e7e6-08da6e860b6c
X-MS-TrafficTypeDiagnostic: AM0PR0202MB3426:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBttMGdEfBHiA6/tdsRSZdq4BLz+uXaHoM5OvyKz8e7dnuJXyT81ARROIhS7ClqXjB2vW+J2JlxTrfdw3K+gryL8XXWRixyky6RdeunmAhK/gxA6LxxvSNPpCB+sC2ehoMrpCd8Pa33fFalA0hFi2ens2ObKQ+zPsLNbIqbtuhscP6BECsxoz7RqoRSaUss9B2uSguaP9m74DSKWyPlQTTEIkmMeZ1I8ezcGB/5JZAKlF0yAeUADki6bxsLH+ZC9LccZ6RrySgUo8Q68gboEREbJh9WkthBylhamaviEP0oOwU7naGpzmcJZN2XlFmx5MwUxyH0EskWunDMPxC4xYaVxZQZUUF4nCA36X1sC0zKVEDUFdaiuBz/PCsEQ+4xv+dcnoVB3LAyuwpXexnnuMh4gbgMWEX/pXareQ/z4f22Q5I3LEps0YkaaVGsmE4yi6s9Q+/ocZFrXshwyIoNTdmlhspIz3ie+4LKo/TpGUuYegnup5LtXa/0RK1TRSEL1r1A7cHDEig9BdQXjS5NpmpVEqdyRY/N/I0A7/sv+nktwRBjuiXpW6JuVbvM9qAX2n8qq3bG1kCjhAj6WvfoyhyrDh8fQT0H7tXj1k9/vePRYFESWE+ZB/YYw1nn9ow5TnZUsHQ7FNRYk9IXTB411OFR3IeDB+xUYz/TFsALxiWyVMSkFfQCbYsnlefzTgL/vtmZNzHjBPmfKMeUbQ50psBXpRSfaCQTcMluSmCpf8LN9Iixf+doDynv5tUAjMn8y3sNIIrhPl+30IapLIdxaivdvVB1Cb9oumNNVN8zoGpBtqx0G8Npp6VFLy4vx8B0pWK00s5V9mvHuEJKAwdRjpCyVa1APTrxkBybOcxfXX75kZp0TcBvmFMzfyFph00Ty
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR02MB4445.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39830400003)(376002)(346002)(396003)(6506007)(38100700002)(41300700001)(2906002)(186003)(2616005)(6512007)(26005)(66946007)(31696002)(66556008)(31686004)(66476007)(8676002)(36756003)(86362001)(6486002)(966005)(316002)(5660300002)(478600001)(4744005)(8936002)(525324003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1dSdTlVcEN1NWZONVhVQjlFVEZ4MnN0aVUzaGN2aEhaSzgvbHJtd1VxUmo0?=
 =?utf-8?B?QUUxaFNVaVl4ZmlpSXd5dzRpY2dKR0tSUUxtQ0U2QTRLMGhXdzRnTTU2aHlQ?=
 =?utf-8?B?bDAzYitJRnlBZXY3K0tLNTBwY3NIc25MTis3R2djTkhydEcrb2o0MFZvbnZl?=
 =?utf-8?B?Q2Rxc2FONjRRWFZCME85K2p6SDZLb3c3YWJLQWppQ3V6OEU1dEpHeStGSnRr?=
 =?utf-8?B?OFl6UGdGU29GYlkvWUQ2ZVpac0t5L1IwcEd4TXNJSXBxeDk3Mk15aUVFdWlW?=
 =?utf-8?B?RHc3TU5lZEdIbk5NWCtHeWdRMTA0WmJjeGd4Tzc1MTl6djdWUTBoZ0ZJYzdy?=
 =?utf-8?B?RlVBNzcrNzhFNWdSUnd2Y0JiaHF4Z0ZUcHlSdHZLejBNRXJxT0g0bW0zVURv?=
 =?utf-8?B?dTk0TTVvc2VZVFRlSjJQR000R3dtTEoxL2R5NFEvb09KT1FDV1c4eW5vaUV5?=
 =?utf-8?B?VnlWTTM1ZDNtakxsK0N5TU1DUG1FMitSem1JaTFFUHg4aXVCZllPTVBVckhJ?=
 =?utf-8?B?SmJrRFpERGNiSDE5NEJkTWFIVnB0UGhZc0Fud0MwSDg1K21Tays3bjdyN3Bu?=
 =?utf-8?B?cmpIMVNzVW4wS2FCaXpJQzlqREZySnRSLy90bE9BaWxLeURMbUFNL0duKzZB?=
 =?utf-8?B?UVpOSmsxcjRScm5kRldld3pwT3NtWmhMbFZiVWZ3QUtKNXJpZXloUkFucVRi?=
 =?utf-8?B?V0FmcXluVEFyYzU1WkJpQ2JIS2NCOFgzcnJjclVvdy9kMXMrT2VmODZzT0Q2?=
 =?utf-8?B?bmZSZVBYR0YvZFdrcXhqRGsvL1JoNXF4c1pZQmhLcE1NbGY0ZXRRYU1zOEFu?=
 =?utf-8?B?SFl6TXF6dDRtNDJtVVB5NzQwb0YrY1BnaGpabWhDWHY0bStzRWd6UDVVSWZG?=
 =?utf-8?B?bDd1WWFnOUY3QUJiWElHUGhWMnI4b2VRa2FXVmM1SzVjUTZqVS96WXlsS3E2?=
 =?utf-8?B?N25NTHh4SnNxYmIxQ1NnOWtrdmRYdmZPR2FmV01TSlgrWmJNT2lNNHlPWWZz?=
 =?utf-8?B?YWN6SDA0Q0RRM0VSTUNncG9lUE5hUzF2bnFyeExxc1ZDN1pCSW5jbkVadnlF?=
 =?utf-8?B?aTk4ZUJmcGhZT3NJb01admVPbmYxN1BQN21BL3lXVENyOVExL0IwMVNBcEhr?=
 =?utf-8?B?SDl2c0xma3o4dEpVdExRUjhIb1doUFhkc2ZhSm9UWk9xcEVXeElhVHl4OEsy?=
 =?utf-8?B?RDMvYU41QzFzd2RmbENDeXRuQ1B0Z2xCdTI3ZWh1V3VBYldYTklNZGtmVmFh?=
 =?utf-8?B?SEkzUWh0RG1jWWxPNFdjelpoZ1d6Nk9Tc1BhZlRJdjNNRDk1ekJCcWwvY0Nj?=
 =?utf-8?B?T0NxYzczczRCYmt4OXRuQTNLeFFJeWdiNWpWNWpndVZKN1FUbzBWd2dwR004?=
 =?utf-8?B?czJvNmQ5RUloRG1SUjIxd3drV3FhTmVjQ3A2L3I3Wm1pdHg4Wit5R3NzSWFY?=
 =?utf-8?B?TmlKNVlwOG5PV2YzQ1VlclBFR3U0RWhCbERnb2g5d3VaeHpnUUdmOTB3enZM?=
 =?utf-8?B?WmRncTdKb1hYMDQ3QzVJbmtSV0d0QW1lRGNEN3RaM0h4NnVQQXo2RHJNWldF?=
 =?utf-8?B?RlgrZHk3L1dIR25tOFVjVUd1R01mL3pWalFwS0w4NzVLbXRyTlltdHRadlBW?=
 =?utf-8?B?cXgrekhHMVNJeWhpU1RxeVc2QmNyNkRyS0h5TUJPWk9TWXIxM01vWExySW9h?=
 =?utf-8?B?Zm9mem0wQktRQVZXZHFJNlYrTTgwTzBMcWZWT0tlaUJiWDlSaVk0K01HaVVN?=
 =?utf-8?B?YUxpUHZReC9qQUtoclJXMytiYXRKbnA5bHJGalRlRVhDbHptRW52R2RIdDF5?=
 =?utf-8?B?enNpYm1ReFVBdEJyUm5nYk5kKzZ5VTQ0clM3MlUxdU55ZHo5Sm5XUEZLSVg5?=
 =?utf-8?B?Y2pWNzREV3ZkWTdzNTZFWFpzMVB5bHpKOW5vdi9RMVN3ZTdKQVhyYkM2YSs1?=
 =?utf-8?B?L0tOMmlBRDVYVENxa0xzNE85VE02TmFiK2NaaUg1aE9neldQUXdPUDdyMFdy?=
 =?utf-8?B?VUVFdUVaeUphdzhBYTVCL3RyK0RYYTM3dk1RWFBQY0FlcVYwVWxTaWowQUo1?=
 =?utf-8?B?QjdBWUFjaWxmQ205Z2YxN1dCQnpSQkJEY3dLSnQzWWRVSzE1MytuMnFzVGZI?=
 =?utf-8?Q?JZAjdlutf1xwpfF7nCq0WStlw?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 766382d1-65b0-476c-e7e6-08da6e860b6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB4445.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 21:38:42.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmCc5orEBwe7X52BQyWBMDAaHgXCLYQn5BX62HYQ7Xj2U/LCK+rdUSzmIIeE+8oq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0202MB3426
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-07-22 at 03:24, Liang He wrote:
> In i2c_mux_probe(), we should call of_node_put() when breaking out
> of for_each_child_of_node() which will automatically increase and
> decrease the refcount.
> 
> Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
> Signed-off-by: Liang He <windhl@126.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

> ---
>  changelog:
> 
>  v2: make a correct patch pointed out by Peter 
>  v1: https://lore.kernel.org/all/20220721081202.1300071-1-windhl@126.com/
> 
>  drivers/i2c/muxes/i2c-mux-gpmux.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
> index d3acd8d66c32..33024acaac02 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpmux.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
> @@ -134,6 +134,7 @@ static int i2c_mux_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_children:
> +	of_node_put(child);
>  	i2c_mux_del_adapters(muxc);
>  err_parent:
>  	i2c_put_adapter(parent);
