Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEA76E23EE
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 14:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjDNM7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 08:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDNM7r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 08:59:47 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A10D5B93
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 05:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5AwibLzsf9+Kd6hm/AKIK9r20xu0BitV8/JG5Hzgyl0UThB3Awm6L8PEhKzjCydkWS+Z4RXZ8X6ed3ToV7sHc3e7RHr+QGkxTb4SsD0uIycF0K2SxPVJdfsoQk+CpeT9h0gVztJAtdz3jiu8vDIAk/v5nB0WZHTGw99JT+f9+4ek55GF+qxMiiouCOlkSlYArB+ClJGAend5ZxojFDt8tlTGRvlt/yrXSL4Ru6V2Ns+JzizcPuGLhkV9YUCIRck+WJIks8iCBNJZ40gfhjy05h7Nz0RvjB4WNOXUdoxkly+DUkqeeX2dpN8TAIt+1L8HC/BLLZ4UUAfkPwTAaWwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcuoyjjOmux3OJWc1z1z/ea1Hlcn8DQIlglJW1+OvPk=;
 b=dY2eEOtA2RPQJuj65LIH1xLwq7r6zkB2A8sxcznRZhp7uogTGfGdpuoKJG4Yf/45GMdlvwJl0qQ4bS70w8Wn2JlcAHenTBrx9JgvUwFlpz+lGH60Z3YOFnQ1mgC2Ez66zdcljabkcWIp9FAPaMWuRqhQouZQsyf5twUFwcOWsDYSIVb/eulJeSG80I6r5JrLkPdiQ04Wu6VNUrhelFDxzmp4Z8WhRIMDh3ulJ4S2HdO95o+rQaW6CQecD/BCG68nJvap6zLfzCz24w4tA4OTzFMH7eEPlPAAeEuSYopX9+5U2dcIYYGSzb1zFQFccRG4mY7RRB29S/BFzzVEtdbpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcuoyjjOmux3OJWc1z1z/ea1Hlcn8DQIlglJW1+OvPk=;
 b=E5qBPzLuT6p3N1gWVc32d0yY3/ucvP43lZOHZ4UKIep1tbQFFDVqFR2aCROE8JeZRSSaS15F/Yf6+24vZJBbZ5moA4ts6Uc/thcRmTp/K6tBgMyCTFzKZZx3FAEd7eCqlSfnb+7k6dUcCPJDG7joQhzP9EPUjWALdk8AHNQYFpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 12:57:44 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 12:57:44 +0000
Message-ID: <3d651214-bc23-ae31-0e0c-a8abdc518c35@amd.com>
Date:   Fri, 14 Apr 2023 14:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] i2c: xiic: xiic_xfer(): Fix runtime PM leak on error
 path
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230414021022.505291-1-lars@metafoo.de>
 <20230414021022.505291-2-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230414021022.505291-2-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0125.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::27) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 924d3868-2b5b-4d34-3fd2-08db3ce7d707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjCEs4AoIA28j79bY8s9lEnazgl5knU7HzisQTPLrJJAhnRf0PxJRxy8UCYA6BiZZicMtk6ezuEcFLF8entegNPz1fqVabQPInKZBt4S1dt3oq2sPvWuP2xORQHmsX+Q2PmHeAq7GEVvm8i4benQ12K4s99/WwS7ANxmVIJbuUtIf0KMmYIhMF1Gx2bdCHBsDCCftmzcvqjDGEVrpTlchZ0LUIcYNGEi2HNC4RSsJDvq/2puLOC5vCAzwfo4lyXvMRqrGtbKauYA2OhE4hmTz/AddPLYCgEK7G7Xsx/NZo2kx+BaVzetSA44tzktURvdlRtBrLQuFgnat7BBUe1LzFJM/VOtm2YrOcZg7UYab1Sd+yo/Pfzzm+wWOVlD0lvIydxMRNUobcZ0IylLZqUpJXqJzt/xNqVVu9NuPQrsN2L0CxMQPhhO8tLBjIAZkrXS1jxGOqF50mNm5iLHwY1sLz7iUmmJ1O1/B9QqfYTbMhOvrO+kiJepScpEPQO0CcudDp8ZjHX36xknrjgi5xPH7uc0YAX7rF5PlG/4HPrqXD56CHN0HNHb8XcgFbTRh1hmnkpIFx6uZChRf168yXkSnw2CQuFCWf7iOy+9TWfAydTVeUst6LDeASKRqwVOZrXKaF+Zb9JFuKIAhmfnluSrTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(53546011)(26005)(31686004)(6506007)(6512007)(186003)(83380400001)(2616005)(110136005)(6486002)(6666004)(5660300002)(41300700001)(316002)(8936002)(8676002)(86362001)(38100700002)(478600001)(31696002)(66946007)(36756003)(4326008)(66476007)(66556008)(2906002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VC96cUUyS2U5b0YzaDgyT28rbXhRWmR2amhBRG9Tay91VnBwQm1OYkVqZkdq?=
 =?utf-8?B?ZHRlMnlJbUxjWWljRkt5YmNwbDN2NThaUFdLWDNFYTMxeGJ2MHd4akRsRXBz?=
 =?utf-8?B?V3NGOGJ1UUJVWHBidGlHcXh3ZnVUMEE2WTREdHZyVXlRTWErOCtSS0FLbGk4?=
 =?utf-8?B?a2s1b0NJUm5QN21sTzIyTlNibFdING9zUkVwRHhvb3AxRnVlaXdMTjlvMkY5?=
 =?utf-8?B?NVpNMmVlN0tpTTB0QnVOSElvREVBRktHRkVQaDU0dW81M29OWXVQZ3h6MHR0?=
 =?utf-8?B?VWg2Y3R4RXZKNmpKRFdFeU1mMXFZSkJ6RWEzUlViQU5VWkhiY05XQjNDOFlo?=
 =?utf-8?B?bDZPZFAyYmYwKzBidzlxSVV2RGZ3U0I5S2VvdlRFcnZBYUQrbUpQaGx1Vk4y?=
 =?utf-8?B?QVpUWVZNMU1RcDBKeDlMVEVTRUkxem01RDZmVHFzbU4yclEzUXFnUDVYQmlD?=
 =?utf-8?B?bmttSFlhY0ZTYU8zaWlVeFdIZ29wVXFobndkZmlGdjd5NzBzUk14M2duSlBk?=
 =?utf-8?B?SWtQSFljd0h3OGZKTjZENnZyaHJ5MUlIZzQvOFBuczJOSzQ2R25NaXpFZmRZ?=
 =?utf-8?B?QVQrbkk0TFpNTTJhdUk0YTNJaGJ2d2ZxOElSang1WWVDUklhdUpFWit2K0xM?=
 =?utf-8?B?K1Zsa21VeDUyZUdHMHhDUnZyMVdXNm1TRHlXMkJjTjJ1cjZSSDViREg1b1ZP?=
 =?utf-8?B?bUdEWllrMTVWLzZEcUkzM3AwZlFveTZ6RTZYRTdVRExETUxqdC9HWTVYem5y?=
 =?utf-8?B?cEhUaDk3MjhhQnJlbktwTjI0amtaYXU4c0hKWHp0ZGI4T3ljbUxiR01Sb2NY?=
 =?utf-8?B?dmhpSmIzWWs5T3RXbHRPa05NOWRJbHlQbFRyd3dnMEEyNCtROVN4VUdKclVz?=
 =?utf-8?B?ME13a2tMM2h1eUNWQVpjWkFwR0o1UHdvMjBBRkp3dHVJMmVwL3ZnZHZITWxK?=
 =?utf-8?B?bFF5SFZLeXdpT1RvaUFvRThHTWdMQ0lHUFNzWENBUlh3dXFjQ1ZmbUEvMnZr?=
 =?utf-8?B?K091WTFNdDFvWW5oZG91bWtjMWJFZkdFMXJ3aENyZzBEekRBcXpsOTBvam9a?=
 =?utf-8?B?OFlieGtLcEtQdDcxbEgvcFJlU0N2ZnN6bFNILzUxenY4TGVKU0ZEQlRiOWpk?=
 =?utf-8?B?dlN6ZVdLcU9QNjVOSnZ6NEMxVkdlcmNzM3J6UHZNaDg0ZzJuNEd6ZUxrenNQ?=
 =?utf-8?B?ZGgyQWQvejhLNktYUFFscGR4NndROUpzK0ptbCt2MEY4bUJySENZVnJPNVQ1?=
 =?utf-8?B?azl5cFI0cGFTT3ZPM2dPVkxWR0xBOUlQYnV3dkp0aDdsU0MwUGVNUGorK25Y?=
 =?utf-8?B?b3dDeFpwSjdMUS81S2RQOUtjTVhsdU9LS0g2ZFp3YjJ4UnpSVzN3YkJpVVlW?=
 =?utf-8?B?aVFLZ1g4VVZ0ZjNLS3RxYlBQcGZ3bEMwWStZOXJJektMLzFOSzI2eWNaWGRw?=
 =?utf-8?B?YmtWTitaTnJ6ZnFRNmFBNkpCczZjQ0pXdjZWcnRNWEFyQTFkV1FjT0pYSHB6?=
 =?utf-8?B?OVBwTHE1Zm82OTdUdU1sSlN0Tzg2UWg4dWlvd3ljZzJVRlllbVZDdTJrdzNa?=
 =?utf-8?B?Mkc0VkJ2OGFsLzA2L1VNTnNUOFZQdmt2cDNvZjZMWE43RE9IU1JuRnZ0RUhz?=
 =?utf-8?B?T3hRa2hnbXhIditRRDJQZkQ1KzcvZEYyZVZuRS80SUtVYkJsNmRJUjNxUUQ5?=
 =?utf-8?B?dVcxUkI2eThCL0hLSDRLR0VxbERoSHNqbDZ4NWVZcDloWHhXUWtuMHNPU0ZB?=
 =?utf-8?B?bUt6WVJUSXVkRU91Qi9ueXdnMEYxaWREQkNLWFhTN0hTaHNLWFNvTGdjRU00?=
 =?utf-8?B?MWJhYno0bXIwYXRuaDBkWjRxOUFpU3hEbFJpKzd5WVFZdzlXd3Q4bkxERGlB?=
 =?utf-8?B?WGxEbUQ1L0hvUnJLSGtXMmY4R0xTU2hRTWNUdXMxWG5FaWxpbUsySDNxQzBQ?=
 =?utf-8?B?UWI4RWZTZllwK0dXZ1ZSSWhSbzBKQUhJT3g2V0Zzb3hZcXZjdVZBQ3JhNTdi?=
 =?utf-8?B?ZmVHNVdjMWJhNUFJbGI3WnhNcXZLcTA4OUN0RytZUnJVZ1BjSFA4ZzY4NE5v?=
 =?utf-8?B?MnRGeVNqYXR0NlcrTThGd2hzMkRIbnpWYzhveHlpd3F3Y2xIOGVub0ZMSFVa?=
 =?utf-8?Q?pK9zXY4qj8hZbfKNRGG01pnS2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924d3868-2b5b-4d34-3fd2-08db3ce7d707
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 12:57:44.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvgfPayqkhS+AGCef3zF+t+PfB2FL67z2qzvjjBeQVEQkn4ca/Rwy+24iQgHzQk2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/14/23 04:10, Lars-Peter Clausen wrote:
> The xiic_xfer() function gets a runtime PM reference when the function is
> entered. This reference is released when the function is exited. There is
> currently one error path where the function exits directly, which leads to
> a leak of the runtime PM reference.
> 
> Make sure that this error path also releases the runtime PM reference.
> 
> Fixes: fdacc3c7405d ("i2c: xiic: Switch from waitqueue to completion")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index e7d37eb20f2b..8a3d9817cb41 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1164,7 +1164,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>   	err = xiic_start_xfer(i2c, msgs, num);
>   	if (err < 0) {
>   		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
> -		return err;
> +		goto out;
>   	}
>   
>   	err = wait_for_completion_timeout(&i2c->completion, XIIC_XFER_TIMEOUT);
> @@ -1178,6 +1178,8 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>   		err = (i2c->state == STATE_DONE) ? num : -EIO;
>   	}
>   	mutex_unlock(&i2c->lock);
> +
> +out:
>   	pm_runtime_mark_last_busy(i2c->dev);
>   	pm_runtime_put_autosuspend(i2c->dev);
>   	return err;

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
