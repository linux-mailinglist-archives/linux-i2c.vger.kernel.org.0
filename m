Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96EC66DFB5D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 18:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjDLQ2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 12:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjDLQ2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 12:28:51 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C34422F;
        Wed, 12 Apr 2023 09:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKCqQk+MHVP6oHtE6TKWsCYnPyKCp1OUSY3mdKhqddu2EK0rAZtMDtpdEKluLc9Y9yOfB4jeQbJdoMNim+GsUSJAnuQg9ax3G7O3SZ1NiiplXnrydHEYkEb96N+eDbhuqVKEgLSKJAdCLBerhb8eeaRsMu+M8zwXFH6bHIeZijGv5IIbEa2eJqqKTPqROe0mA/vkeXCw7MJlWiApzutrrbB44W+Bp0HyEyMEdvcPknESaMhHNxpHDrQDF2ott//JBDyYx4wPzDzJprgOR0WI5LUklxjX87Is1bB9aef09648YlBK/0QXVlQH1z/CfJ2Wu2CFnPLABxvB7bqA8B1ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSAxoiUuyfryV8V4Cff5qIItOQN7ZzyIMqH3Uoq84BA=;
 b=OLPRh/rK2zjQ3/eIxRC5t5OuyNSjHndT/nJPS4uC8AxXhWGjDaVOZv1DVIegTUf/6kSEYxMyJ35SoVNua+UzTJIEIdW6dOQ44mBqdtu8X0ZqCclFoKtZGIV9PWucCv+IUux5MpfOi7A2G6UC5b8cMrkB9YxnEZ7mjzTIwVF1kVk4Y6GZTLmXCJj5jIEZDzZfFwJbEfCae5Ay/TOPzHUL5/rInfBCIfn5w0pXjYs+4+r2GBIfRgpbp9PqcuLfYp/5bLgiVXb/a5O9NuNJ5OQGytAMAcaD6UVvRwM+WNnB6MuhiwSyarnQGPjpjWQo0/j8E5k7uEphj2eBM/xQM8miJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSAxoiUuyfryV8V4Cff5qIItOQN7ZzyIMqH3Uoq84BA=;
 b=QOE4cg49RlYSEcfvcBFiUsvMBA4Z5a9IaPJFmaaMh7bB5nbyVxg3uHmDZ7H1AK6oIcaI80puI82nsvwGRcmKahGm6sBJ1nXkw/aycdP8sUkLZFywEOSgyh8BN+Fcq2TsjZCTHZ9iSaY1cTwNoz9ajlkvn3cKLvkQK/THHWL93fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 12 Apr
 2023 16:28:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 16:28:47 +0000
Message-ID: <e53a03cf-71ce-1864-5700-b48e8beb17a6@amd.com>
Date:   Wed, 12 Apr 2023 11:28:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 0/6] Use CCP driver to handle PSP I2C arbitration
Content-Language: en-US
To:     Herbert Xu <herbert@gondor.apana.org.au>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
 <ZC5pxORLN+SF/91S@sai> <82ef9505-f8ae-36d0-fdeb-9bfc92aec557@amd.com>
 <ZC+1ufdj8WYixQsM@sai>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <ZC+1ufdj8WYixQsM@sai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: a981588b-62f8-4611-8d3f-08db3b72fd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUcyYZwhcIxm3vIIGD9OWRpDDRRB7/a/ONCBFO35GCs43lfAx68GpAgnRqYdsrXHMHDm3ZL1JlIfRIQUXQ/8o/ZCDrKbXLfnkcaQbUx+JEOhEhxF1yZel0egrJH4Ozmutk6VKH/J3ZbB6yV6mxXx41IPmJb/7hZH9szEy8yCxLKaTAIQ7Lo8PSgoWR8IDzKsmfI2Kt3XY2OROqbF719DooOcdxzlnB9GH0jelKw2zXgYPTStnbaH29wN+TylDc7xa/O+A5dcjUuiBlQRyFN+k5JIoRwKVUpIaiHEYoLvEEpxEFbDIjmoH/zUFKfGwMue2U2y7ozYLbIPmx3KFWn5y/pR8xYWHV6X2TDCjGN/Jsb/SDvyO7GNALvU7O/IbU7xBMZs2ryoNWyjYTuIyaM5cs64Dgez8rNdcinOjbFGhPQXO3ECeTTGALuJfPco6iycncX+BUJuhKdv7g5B0fflO2zAM2Dq/BPxg2E48IMcWL8cc8UbrjjgtThjcaqrOT6JK0va3+RLZHDe1u05TA0oNIXq5cT1GHJdxm93K/W4g4OombYu7o/gz1Z3qPnAjc3E2OOqZqJFYYVYFM+E8I5T4lFuQuyr6vwCvC2EXmy4qZbjaCofQJkfjc/1sWHFyd1ypsZxiJNCYgxQceHjtMCqOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(6916009)(38100700002)(66556008)(5660300002)(6512007)(316002)(2616005)(26005)(6486002)(6506007)(53546011)(6666004)(4744005)(2906002)(7416002)(186003)(36756003)(54906003)(86362001)(478600001)(66946007)(41300700001)(4326008)(66476007)(8676002)(8936002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0JPN25MTnc2TjUwRXk4eUtlT0Y4OVFNREJtVnk1VDJPMGh5V0t2VFA5K3ow?=
 =?utf-8?B?T09adVJ4OTJ2OG5FdXMzbk4ydkY2Y0ZKSTFMS0RzNldiaGozOTNlRDI2cGRQ?=
 =?utf-8?B?MW55dmp0SzJKQm1vQmU2Q0M2eU5ZdVVubFNIYzVQckdCZTJBZzFLY3JYbUV0?=
 =?utf-8?B?MGJ5d0VWcnhKbUc4cjh6NWcyeWxOaEtuQjdDeHJVVHZlMTFNRjJMdHV2V1A1?=
 =?utf-8?B?aTFqUVdlOE44YW5CT1c2dUE1OFFxblVQOXM5Qyt6dzBIaXBxaVp6V05ORTFN?=
 =?utf-8?B?c3dtbzMyR213N2hQT2xjYURLMW5ZZFFPeUhDZGlZMjc4WVkrMEpHSGQ4NzBO?=
 =?utf-8?B?MkIwVVJNR2x5cGZCQnRmbjNMVjJCdFU5eVMwb084VWFyZjhXbnBqNk9YUlAv?=
 =?utf-8?B?eDdWZ2R0aHBlL0ZEd0ZaeFhIVlIxN1FjdHRTK1ltQkNKZFYzY2IvYnZnN1hm?=
 =?utf-8?B?ZGRiTFArcWlmcmpZelBoWm42WWsvaStBRWRGQmI0WHI5Y3R3Y3pkSjhTZC8v?=
 =?utf-8?B?L1BSNjdMWVRSRHIrMDM0UE8zZzNxaSs2U0tZN0p3SkhCb21sUHdrcVVzMjls?=
 =?utf-8?B?blBZU0liWXFMc1BwZmUvNjZFZmlVcmxwbVNZUFhML3BLNW5tb3RvN0dMTjVH?=
 =?utf-8?B?OCtYZFRvV1BDd25hR2EwY3JHRzRJdnRXU0FubmJ3MU9NMWNQOVR3RVNoMTdV?=
 =?utf-8?B?ZFJzWTdod0ZJR3BJdWdSV1NkWHcrenhuMElGZkJ5QVdpNUUxek9IME5rMjY4?=
 =?utf-8?B?a05wRHRQNjl1dkZRbEVyN1drbm5jbzI1YkpWOStVVTQ2bmNSVllaUUx2Tno5?=
 =?utf-8?B?dTBCZlp6cnlaVTlCODdla2hlTURBdVVTSFFpVElWS0xiZko2bEsrNGl2VEU3?=
 =?utf-8?B?L3FQa3k2WWZIN2M2cEFTVC9jU2RveWlOa05kTEM4aGo3Z1RpV3dWWko4QWVM?=
 =?utf-8?B?SjlsTVBEbDZnaFVocXhwbDRlUEJwVTlROUNDejNHK3dteW56TlNtNEE3Y0VQ?=
 =?utf-8?B?U1FqN3ltNk9sNENtdVBST2ZJTDVWUlhJOEo0Vkt4S0trMUZJeW1lMUhvM0xu?=
 =?utf-8?B?WnhqQUFHT0djYmZreWgwaktxOHUxR2xDamYyOG93U241MU1XOFJKOVJwZXhx?=
 =?utf-8?B?M2YxZUJ4VC93WVFLT2NTeVdTSDAvamczbi9Ec1pMdm9VcjJIczdzZXlvWFQw?=
 =?utf-8?B?SVZtMElOS1lvL1dUT1RCUytjMTdCOXJlS05FOEcydm5CUVpCL08yakUxeVht?=
 =?utf-8?B?NGp3aDNTcGZ4dFdoTFdTL0srcmdVV2ZJMDZXS2s2TDUzWHZuSXovdUFsRlFx?=
 =?utf-8?B?UzMxUHFEVmJRMzNBVGt4RW94aE5ZOCs0ak41OEFGUFZJYmFnU2hEZDIyeUVU?=
 =?utf-8?B?cjhhKzdINlBOdXRFeGVEVnEwTmhoZmZOb2JnVkxPbkFHamlBMTE5U0piZW4x?=
 =?utf-8?B?K1VCeU5yOGx3R1VTNUdubjR0QS9tc0NGcnpNaHB2STBsd0tJQkpSckk4SXJE?=
 =?utf-8?B?TGVOSjJsOVd5TmlEcFA4TEFYdVlRRklJbmxJQmZwR1UyNHJqZWZuV3IwODJN?=
 =?utf-8?B?NTNPall2Nkc0NVJWVHFJQk8ydm1laUpUNk41b1ZGbjJ1UHlTMzdwT3c4bWUz?=
 =?utf-8?B?eGd2MEJHTzdpS0ZiNkxQc2VzYXhGVkdrcjBKT01CWCtoSzd4NGVlNWkrZmVK?=
 =?utf-8?B?UjFLUnRlbzY0QWtXMkVOcTJQQzdNRUtqNDFFNStnSEUzR3hjT1FJcVFubVF6?=
 =?utf-8?B?NnJKRzZtVmo2aWVyR2lqekpreUpKVHZvdTRmOGtzdEVGS2JJSjNGRUY1dTBK?=
 =?utf-8?B?OXFTUngxc3o3c0ZJa2VWcm9NenJtdE54T2RQTFFGazBhazdTNlREMmxBVnhl?=
 =?utf-8?B?eis1VnJBanA3RzJ4Z3FZbFpYTlhWSVNleFhodFF2KzRIdmwvQlZMY0Vod3Y1?=
 =?utf-8?B?TVhMVEFuUE9vVWcvMHlVYkRNQ1duVWFCTkNPZk0zSDBEMVRjNkN6VjVkNndj?=
 =?utf-8?B?T2RJSDN5NXE0WGNoOHR6MDF6TnRSaCt6SlpNb05EWndoUXVBdmt3Rnd4MXNr?=
 =?utf-8?B?OEpWNllyWkgrMTB4Q1JHWkViZ3BMUTRsVlNlekV2MmlMWkhPa0pNYVNyMUho?=
 =?utf-8?Q?lAoSAN07n6bFOyl95Tu0gH/45?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a981588b-62f8-4611-8d3f-08db3b72fd96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 16:28:47.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0ytBS75t3qz4Qed7C6q8yyLQJ0kiCsSVJVOoDTj6RF4uGqWKaNgBm7HLyuHGDO0BuFK+N+Ms1yqyvxcSK7i3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/7/2023 01:18, Wolfram Sang wrote:
> 
>>> How should this go upstream, i.e. are there dependencies? Shall I pick
>>> the I2C patches or is it better if all goes via the crypto tree?
>>>
>> IMO it's better to go through the crypto tree.  There are dependencies
>> in the crypto part from the earlier series that was merged.
> 
> Ok, fine with me. I acked the I2C patches. Thanks for the heads up.
> 

Herbert,

Would you mind to queue these up for -next?  I do have some other 
separate work I will be submitting that is going to layer on top of 
them, so I'd like to base it off your branch with these landed.
