Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED87D6E23EA
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 14:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjDNM6j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 08:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjDNM6g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 08:58:36 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::626])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959358A51
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 05:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB7ZdUHE9HhGh/GBLSlz1JkA0MtAcF9r8mu5UyyYK+5P45Eu5dVT8Uaoz/wtkPqxwvBXnwL84TkiywM1J2vmC4iXlfUMbqZz6uVfDJWQs6YcJp8bvGPr4z/sD2WS2nLdT198ihb8GXWhXIDa6QbLWq9Si2vjcNfcREZE4xEq/QMkFezzxiHo1a1UMR2xeWq6jR5eUQ7NoCwyBsw8QHttURrQoTtcou5/PFMYvpJLEhYbi6I6YLxkmXUlDXZYG5ws74Ki8u0hUrBWVZTrfMHc7cocA/yu2vgCxzzGBxAvZckhwxAX2hbIDPd+PTwJpw9C2Ysbh1nepFu2SsC3YsXI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvUmyUzSzT4F9G7ph0K5uJfKQFpmrOxz+H5E2DLAnWs=;
 b=BD5jWqeA9POk8G0rci7bce9DaZPDnRFfVGAV8NJBk+7H16Vhq3z3cr46lTGv94jAku0vQUb/loyUDdwy6t6sNFLdkN0lV90rNMZgZeHB7dy6yLCvSirR50KCteAF2rA6rjBo8eYD66SIZJUiC2gE8CL2LWoWYNwh/UWa9LD4uQ0Ux1s0NVpckIIVpwugTL6KilLXvs6zGqKwZc6wlk7A5kyKz3aaH2ZbPvfxIKOPeKM7VsZi1FPg0vKsbuTVN0TWw2WPjCOQfSmyMR5EFSO7D4q8okieHUt3kYA5FU72tOdPbAZHuEg4mjWnX2CmKMLltyIfUntGbb+FwlrVu0Lyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvUmyUzSzT4F9G7ph0K5uJfKQFpmrOxz+H5E2DLAnWs=;
 b=bAIbnVSe56oBoVfRuFcx1jQRli1tfOIHt6Zm1VNa4PgzIyDFxP0Iu2abus46kn+XM7A0h/IPaNxzgxq6tLDOG0uUKhsLqN03PKSSuNR1M7MpvPwim0yZYIReL+g+mxNwXakfkvnaqSOWIthYXGwVwzD75/WmyBbifeFTUnclmdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 12:57:51 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 12:57:51 +0000
Message-ID: <f96daeca-538a-dd8f-4c10-41d9def8de09@amd.com>
Date:   Fri, 14 Apr 2023 14:57:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] i2c: cadence: cdns_i2c_master_xfer(): Fix runtime PM
 leak on error path
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230414021022.505291-1-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230414021022.505291-1-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0113.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::15) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: abdcf2f2-c375-49c4-d833-08db3ce7dadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vjlij7OaFgoHXc/fDUcgkylxqZ4QXvQP90b4fpjZLMqYtA50SrQznvERjTwukm6zpOWDc/pGaGsafX9ex3WEwMhY+bQe+xTeY7xahCdjU1v7Yuz4Kel7STP7CVL1a/3E+D4iHNo9g0uU5VM8nVc9DVmsnPR8Ypgy1NYD/Fd6dCI6gwz5yiKjkyl9wa3wGGY3zObT/ExinjqJF5fX5vhr47kjO6msRK9muzcL420fj5Ih3mEgpsUVQrrYxKpbfjfWp7FITdAeuTTyfPpw7RhPzAXF6vdQ0yiTchvsOFiDOsryLK6hZaRMRpQxjyekT1EVzP25ehzWcdswcWmAmYmcY6b9Clojr6rGFfVajwlnYyjvMvrZLZFaY6yXCjTn+Yvl6+YhW2ic8ZIzP+dlt7WCOc5IaLjqfsSukaZH73co2ImVELAd0IS+tXrobj1Kif9fHXlW9+VAKOFT992fHub92Oj3I+nDXo3j+upOvNrpXUopTIR3bPCeSDE2BRNs7dPWAKFaMoWqI4MQ/aH+q1NvTOudzbGE98wBZvXqf18pwXhwJsQ3ctkbmD4tmN2jblUiEvqTbCGUpeZFQDiryj65SOW8s0n8Wm3WsaO1GuvkqojFBrF8qQus57wjcpOSfomCfiFRSes7vXq9lwEhg1O7shibz7usuVzsK8bvZYVfe5DReyRtAQ3D/VeQ+v2esmxr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(53546011)(26005)(31686004)(6506007)(6512007)(186003)(83380400001)(2616005)(110136005)(6486002)(6666004)(5660300002)(41300700001)(316002)(8936002)(8676002)(86362001)(38100700002)(478600001)(31696002)(66946007)(36756003)(4326008)(66476007)(66556008)(2906002)(44832011)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JHUnBFdlVnZ0dlVGZEckh5NUpvd1hkQWxTenNxVkZ4dS9vN1IwM2lQcTl1?=
 =?utf-8?B?UEtlWU9UUFFUT3hicCtiZm8ySVBBZ2FFbS9rTk80eXF5RS92eDR2STRWK0N5?=
 =?utf-8?B?TUVDR205U3c4ZVJ0cW5LdTFaR1QrVytiS0hFcDlCY3UxNytBcDZNb1JRUHdP?=
 =?utf-8?B?c1ZKUWZTMGxpSVJWMkFJektTa2pCdjd0dkxTWGJzeCtrcEtDdThVb0FuNW14?=
 =?utf-8?B?T0trYnlLNDZkdCtBdW92ZEEyTUJpR2JvVjZRVkhTaTU2S0FaL3NjWkJrLzBC?=
 =?utf-8?B?UXU0dlQwN1ZLZWdYb3JreUI0dXMrOU1IVWoxM2ZSSGxFc1h0OEV0dC9ocVg3?=
 =?utf-8?B?MnFFblM1WkF1Si96V3ZJZWFrQzZxQTVmV085eDVDTUp3NFh5OG4zWnIzbnFD?=
 =?utf-8?B?dFVNRVg1ZVZ3NmlOSlN3d0tGbjhvMHBBMlBaZjAzZ2NySnZPcVZLcGp6QTZN?=
 =?utf-8?B?VVJSVE1lS1NBTjUrcVZ4Q3M2UEwrNWdxdFhBbHdRWm1lSlhKQlpQWDdNTHJo?=
 =?utf-8?B?eUZ5bTRHMTI1SXAzRHdsRkFCMk9vQWsyYU9lMHpHcGpRNUxnUE1iL3ljSysz?=
 =?utf-8?B?djRlS0tWOGdOb0pHYXkvamdIM0N5dXhHUkpWVFkvUUFoM1FtbTJRUGlqK3Rq?=
 =?utf-8?B?TWcxdkgxRTBscERoSHRCclo1VnpXL3J2a2RIN0NjMkRTVlJWZk0xclp4WDZr?=
 =?utf-8?B?QkhkRjd6VXI3endyZURIK1RQYmRoLzVxZUh5Syt3c3FyMHBrSEg1N1N4QXcr?=
 =?utf-8?B?ck1hcHQzTHNkZEVYRi8rRXFaa0E0YUVQZnprL25vY3dRUkl5cG11T2NmSmZJ?=
 =?utf-8?B?WHpROVhNV05rZUJ2VjR6dis4VlhYRW1jK2FESXdLTVhBdll5S2U1dnQ2WWdu?=
 =?utf-8?B?Y1Jhb0JZaVR5N2ZoeDZrTU9ydE1tM0RvL3Y3WG9HNFVpbmNqYTlXMi8ycU1M?=
 =?utf-8?B?WGVBbWU5WjkyWlpBZkdIUW5URERONE00bTdTSmlFQnBPTWI5ckpQMFJpMldv?=
 =?utf-8?B?TVhFSUZHZEF5eVB1eEVPZkVHVXJmVEozTW5RVTVqTHN6YmQ5ZWJVRFo5bzNi?=
 =?utf-8?B?V3ZEd256a3cvV2ovaXFVRWEwTFZUU0ZwcmFxSnBic3Z3VkpWbmZveGUzb01L?=
 =?utf-8?B?WmFKUm5rZ0dPbTFlRHZMQ2tXWHduUVQ4OUlGZVdQNUJyaDhYcmhQRHZCMFBV?=
 =?utf-8?B?dy9sZFVHYnRJYldGMzlWc01Fc3lqZFRLUUpjQUtIRDR4TlVkQ0lzNHZON2pm?=
 =?utf-8?B?RWFZMzVKNVFZVW92MVJJcDdtalk4eTZRMFJZYVBlUHptNDkzVUFETytiNHZt?=
 =?utf-8?B?T2R4OE5QNFpIdW8zdC9wYklDVmRpZi9hdUN3anh3Q0M3elMzdndkY01PVFIx?=
 =?utf-8?B?Q3daeEJqczJJL3ozaHlTckx6aURhK1pVYnZKcXBSV3d3VlFKM25UZ1NsYXdo?=
 =?utf-8?B?aGo5Yms5eXVxUUE5VldWaVBIcFlNem9WdlpiRG1hV1hhUjhqaFlJTkdua0JB?=
 =?utf-8?B?VnVFcnU2cUMvcHphUmw1Q2R2WTgydkRNK2J5dVEvVHFFZkExNmtmM3R2YTJG?=
 =?utf-8?B?VE5lU2ZoZFRjeUNZQzRWaWU5UDEwcmZJMTFsd3loZGhzRndoekNkanU5aTdy?=
 =?utf-8?B?NkR1OHFOR1MzaXVhVnVYKzBYclBhUVlqZDNwSFIrY0M4ZGJVeFRUV01pVGlS?=
 =?utf-8?B?cktKcVBPYTZITmIvTWdvOXI3bWhrTEpRNzBwNW5BY3B3TTFrd1ZXVXlORGdy?=
 =?utf-8?B?NnBnTXdCc09DNEl6OGRkQlVaaGxFK1VKUmZJbVpvTGxxQStHQVUrQTMvVWdM?=
 =?utf-8?B?bVl1V2dWVXV5WEUxTm1Md2o2RGUxeGltU2Z5azhDbng3L21nVTBqckdMRVd1?=
 =?utf-8?B?Mm1VK1l6cENkdjdtQXV4WnZZTnZBUEFVUmFQam5KNWdudzJHMkQ5ZW9mdnFi?=
 =?utf-8?B?bE5tN0pPSkYrWFR5TE9yT1g0NldzTm11djBTUmpDaXBldFQvZDlXc01lM3Vp?=
 =?utf-8?B?dEZtREhIMDJDWWtqdzJpVlk5Yjl0eG9KUE83VTdiQ2txekxmS0J5cXB3QWZJ?=
 =?utf-8?B?UkNWSzllaVBuL2NKSzVaVUlrODdyVEFDb3AzZnRvRlp2alNnNmJGeTZMNllJ?=
 =?utf-8?Q?dnq16SfY3Sw8MMlGOSS80+rny?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdcf2f2-c375-49c4-d833-08db3ce7dadf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 12:57:51.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvMjOlIINZ8QfAQbTJCSC15//9i+D7oOOYJTP+7jNZYNt2GutWTmnYRy0XdSuVkq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/14/23 04:10, Lars-Peter Clausen wrote:
> The cdns_i2c_master_xfer() function gets a runtime PM reference when the
> function is entered. This reference is released when the function is
> exited. There is currently one error path where the function exits
> directly, which leads to a leak of the runtime PM reference.
> 
> Make sure that this error path also releases the runtime PM reference.
> 
> Fixes: 1a351b10b967 ("i2c: cadence: Added slave support")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index f1a67c410ad3..3a4edf7e75f9 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -834,8 +834,10 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>   	/* Check i2c operating mode and switch if possible */
>   	if (id->dev_mode == CDNS_I2C_MODE_SLAVE) {
> -		if (id->slave_state != CDNS_I2C_SLAVE_STATE_IDLE)
> -			return -EAGAIN;
> +		if (id->slave_state != CDNS_I2C_SLAVE_STATE_IDLE) {
> +			ret = -EAGAIN;
> +			goto out;
> +		}
>   
>   		/* Set mode to master */
>   		cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
