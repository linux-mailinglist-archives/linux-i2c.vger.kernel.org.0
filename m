Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EA9530A97
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 10:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiEWHYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 03:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiEWHXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 03:23:36 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70101.outbound.protection.outlook.com [40.107.7.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C720D393FF;
        Mon, 23 May 2022 00:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYpE2YvKzE7+Xl6Z8GFynzdwmNeDggM6AsrWVEZ6+pXhH57qSoabFfb0t2zrm9wSYL+nnZmGVYK8YXObUEC/Ef6GTjJudw6TxsaFgNPOR8vWvQAT7q9x+mlko9P8DbzYc/92n5fte9CGZI5NY/haDkzUisQKWNT88bSKFDEF58ROJLcECbneNj7uTx9IVO4nBo0r4yvN4xtt2ynKvsb9DyjgJdS6E95Ivgn74BGB7P+hLUaga0YfMukDjUzMcFha4U8jlq7pOapv7J3Ruxm6Bg3NepUoT/HB/fYeV5lDeHG0A+HUa8M9LaqeqtLa4R9n9m55TOmWufW+ZNh0L8r1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urO4feBUwst4b5ukr9xRts3XVyQOcfU1k+HvlrUH/1A=;
 b=bsoi7Y+SBfcZBhYVBwbNRZhDezTUihAoPA0C8/o7mDIdd099YBcj1VL1SVnUZ0jxEMHhhRPx99IzEOG43WcaDUe8XwCY7cUcVTYdS8jdS2rv6P+EvQAGDbc8VmXAr+GFUNoKm4VEldmW6VF2Zp+wLJ5fnJrTgPTkNAF13l264A+Nw7ClTx/AtTC9XZmlxtLZoZCoYIfjZGTq7Dq9412B1snKUoGb7CFT4mnB98x3L1uic4NOxomT31Ywy2k3ueBALWWwk3B1yAPT7e1Wd3NbdiMVCW8XeyxiKuKfko7nvXYuKe32iyelw+zBq/jnwN8EFu/hfX1KdbrnylgottG1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urO4feBUwst4b5ukr9xRts3XVyQOcfU1k+HvlrUH/1A=;
 b=ngIYzlwtc038bOg/aumC4UlnElm/yentC3lQsERxy61jX8DyR12WfuzfpELnPmhO7dy9XkFBDggiAqQUy1wRtcXsSVubLf0LzcVwqoxueek9SaT5asjEIeuAol5Q/+yH3+Hnjwir2lRovru/UyZ/h2Iz1UC/pLuMsObvYKiCN9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AS4PR07MB8658.eurprd07.prod.outlook.com (2603:10a6:20b:4cd::12)
 by AM4PR07MB3332.eurprd07.prod.outlook.com (2603:10a6:205:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.12; Mon, 23 May
 2022 07:15:30 +0000
Received: from AS4PR07MB8658.eurprd07.prod.outlook.com
 ([fe80::1d35:9369:bda:b3a0]) by AS4PR07MB8658.eurprd07.prod.outlook.com
 ([fe80::1d35:9369:bda:b3a0%6]) with mapi id 15.20.5293.012; Mon, 23 May 2022
 07:15:30 +0000
Message-ID: <bbb5d2b0-7fbc-0b7d-d58e-355ef1871a1e@nokia.com>
Date:   Mon, 23 May 2022 09:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] i2c: core: Workaround false-positive LOCKDEP in
 delete_device
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220517075518.43613-1-alexander.sverdlin@nokia.com>
 <Yoi17igIZH7y2Hy0@shikoro>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
In-Reply-To: <Yoi17igIZH7y2Hy0@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To AS4PR07MB8658.eurprd07.prod.outlook.com
 (2603:10a6:20b:4cd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 954ba623-ccba-4c43-e0cb-08da3c8c04c7
X-MS-TrafficTypeDiagnostic: AM4PR07MB3332:EE_
X-Microsoft-Antispam-PRVS: <AM4PR07MB3332A6FBD8D2509F6CD97F8F88D49@AM4PR07MB3332.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4M6ljZiw3HqvVwYYDXrHt8w+G/rTYGNBiAzjnbdRUQHOk8rZjKtSDqfLqSWY8xqKOqFiL3o50oiXIMD+E4IAB+mcN902zz3m8VHJAQq+k35Q5MLg2TD1j7wZ+TyHGPmcWrJ4ZF1/vXbuswkq+kmrfomePS11MeoUHEHfHdZaID/YfC4w4lFTcFFRTUlMneV386f+FuqVE0/vOtPN5HQT8WLFLu1OsxPiZk6/8UneAs5NNIfjXvrS7daBwx4s+o5IwRTWGXqeur7JBJS36PrN+T8nVD8Jtzn6MrSz81V7K72D418pCGO91suNpKTtJ1nUbJ4pBfuKlC9IDE6opeBOyoJLftg3llKfSMacSvnu+xbMoV9efbK1XK5UfcR/j05c7WZhcATwtGC/mW+tOY2oM/A64kvBP02VK0EgZtUX5PAaRXtFQkKyiB0/qfWT8mxoClPYiWJAykqZ6sLSJeoEW1o8e9iEqAQmUdb7Qje+pGYX7/ZG0sEJDsuRGEOu6oKJPFgGA5Vb1kdWHCtrdTo+RmEZxb/gNOlHVIfTRG49r3RI9Gx4x0RCaazUuLZOH9Jkn3EF+J4jFnM2jTZ4X5FZiJmM5aUsgYmUKGCE8EeZqdgJHsITm4A52GOhx8uPvkl1w3iUGlS8sKTW2WM/k2b/Sy6hSW0g5iOdBo9H9prJqvSX88weAK1W8x7pdlxr1FwqMix3v17I0+++u0KQokPxjI0II2kWUl0HqMkokFEB+4OqshME3Ibjky4QWxyF0gpKO3es//EpiUts0duiyL/0fmlKH6bUrv52LIEuQZ4yonnCtT3l8r9BMOUWeEvdadGR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR07MB8658.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(52116002)(2616005)(31686004)(82960400001)(83380400001)(66476007)(38100700002)(38350700002)(53546011)(6512007)(8936002)(8676002)(6506007)(5660300002)(66556008)(6486002)(2906002)(26005)(44832011)(508600001)(36756003)(31696002)(86362001)(4744005)(316002)(6666004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGp6ZU93N0laRkJrTkZVSUwvcmwxa015d0RDL3lHcXY1WnQ1ZkJiSXZwY0wv?=
 =?utf-8?B?aEprSDFHQ0pweXJhMnFsc2N4T3htNHhHTDl4ZXRHd1VQa1F2MHpiUkxCbjNv?=
 =?utf-8?B?Z3F5ZGQ4OXN1S1RNZm1Qc3R5NkZ3eW9RbG5NMGE1N3IwZ04wYlloQjVXdzJu?=
 =?utf-8?B?ZlhPUFRMK0g5TjJTRHlRVWg1Tzdhd21RaHhkYmFrLzE0WGVicXhtbGg1b3ZT?=
 =?utf-8?B?V2Fkb0REMXZjZEhTRkJoK2dJT25JZHFTUVRqaEd1UjMrc3VSdmlscncxN0Yv?=
 =?utf-8?B?Q2thUW44RmYwL2QrRnphaHNINXU3UXQvQnRCKzdkbVhhU0lSK0tNUXl6aCtn?=
 =?utf-8?B?clVEMjYveFFPQVUyY1ZLUU9RQlBFQXpyRk92RmxJQkd1aEdubTJYQTNBMGN6?=
 =?utf-8?B?WUtyNDQxcFBkNVNOb05TUzk3eDFOelBQaXUxSlJ4NnloSGh3RkFka21vYUVh?=
 =?utf-8?B?V0pHNWVRdjV2aTI4TGZ6bWNjZmFUUU05aUpwUGlKQU5rczlJS0xVcDZSWW1t?=
 =?utf-8?B?dVNNVml6a2NWcURSRXJZcFM4MnR6Y2tNU3ovNGtDREloaDJQc0s1OWJRN25m?=
 =?utf-8?B?YklqRFRtd0xJbHNtMXQyOGRWalRzZnVvM2szd2lwU0dzL25nZFdFQzEvWEtk?=
 =?utf-8?B?dTdMZy92RUM1NnFOb1M3Nmx2Z0pIMUNuLy9HdkxwdWxhUzRjUm01WENCQnUz?=
 =?utf-8?B?OVo1MXhOajM5eXo5STRteWk3OFh5T2pHZ1NkbWN5N29maUY2cXIxb0JhMW5y?=
 =?utf-8?B?WmlMSUMwN2F4M1krS0ZVMVVsblloUXE3MU1jUFJTSnlvbnRMdFBQY01yUHZY?=
 =?utf-8?B?TnJuVHhHR1dQZEtvVndnQjBUUkl1THBVeDlvMlFFVDdCemlKWHRXTnpMNE1L?=
 =?utf-8?B?a3ZFbUlIZHUxdC9iUWRiWHAxdGsydVVsd2RCTldBMFF2N0p1RS9Sa0MrS1VF?=
 =?utf-8?B?YkVyZnVYRk5waDR2VFh3VERCMy9tSXVtWEdFTUVQdGYrZEJwaGxXZ0lTa2Vo?=
 =?utf-8?B?SG5vV3dhdUtwVnkwNmRlZ0Fkd0FaL2Fzc3lSaGR1R1BZcUlzNXgxYVpGbWw5?=
 =?utf-8?B?WXlIcDU2enpUWVFCU2xpc2VDcnNCQnJuQXRZQU1VVWc4di9uWjBmWm5yaUFG?=
 =?utf-8?B?emJOaHRSaEFySUJMdjZxVGN6emtKNUgxYllqbDlBckZ4Y3ppeDhkd3ZKZERH?=
 =?utf-8?B?SFZOL2d0UEhVc0Y5THNDQVUvelM2Yk5YZDJLdDFUODVkNGRsYUZBUUMzdjVW?=
 =?utf-8?B?aERIL2NzZWNRTFdlQzV2MnAvYWFKS09laEF5NWkxS0ZreFM2bE1hQW45S244?=
 =?utf-8?B?SzhUQ0gxUVRxUTFzdWtZSkFDWDQ4U0d2UjBHdVU3d0NiS1FpZ2NHUlY1dVl5?=
 =?utf-8?B?eW9xTlArOXJwMzJIREFVbWVFSjA1MzZxcUUvTjNtWE1GRWE4YkxSYTZ6cXpp?=
 =?utf-8?B?Z0lWYUNaRWs1ZmpVWVBZZUFtWndlRDR5NGd6aStnakNQR2ROR29CUXJLemdl?=
 =?utf-8?B?eklYOTJIVzZDRUJDaXk5aFowaktjaHY5bU9RSi85NHZXcjVjRjdHMTVKY1l2?=
 =?utf-8?B?TGdPUWFwSTI0ZE9sNGFubGdzRVo3dXo0RWIwU3hTT0RaaDAxN0xHckRSSjFV?=
 =?utf-8?B?UElSbk1LR3RnVVB1N2dFZmN1ZFRLdS82ekgxajJaYS9RbGxZenJOQk9na3Rs?=
 =?utf-8?B?VTdHM1NYbmxyT2pkSkkzaXZabE1Kc3VtdUtycGhYbHZKelEvOUFoK0huQW5Z?=
 =?utf-8?B?b3F4R2FCMFBVMytZc0tvc2NPbzVvcmJQWjRtNkZENnA5MlNnT05uTllwM3lh?=
 =?utf-8?B?Mm9nQXFiVkNNdlNrbFArYkd2VmRsRDgxLzQzWGpOTHBkS3JPOHgyMjM5bVNR?=
 =?utf-8?B?UWNqRmg5anFGaVpHQlVGNm1NUEVDWmt4dHVjYUFjRGgxNDIyUVN1N0M0VG8z?=
 =?utf-8?B?aVVyL1czQk94V3QvOWVqQkZSOXBsMGRSR1V0ZVFDUUlYazNCQml3QytzQkZo?=
 =?utf-8?B?S3l4NW5sdEhhc296OUYyVmFVN0dpSlA1ZFl5d1dDWms4OXlBWC96dWVBa1l0?=
 =?utf-8?B?cUxVWE16Z2UrL1hYQS9hZ0xINEdhSFN2c1VBcGtIUmpndCtEZEkvUXFJeTBY?=
 =?utf-8?B?a0RRRm5ZeElnMTltUDZKcWI3UEJVY29aUHZ1TE1NYitMRnh1dzEwdThiWmcx?=
 =?utf-8?B?enBNUTR6bXAyMmN3Q1pUY3FKTUNQYmllWGdab0xCR3JjTjBHMzNOei9pSW9W?=
 =?utf-8?B?NGlaSU5uaFo1djh0NlhSS20xUWRtSjBpOWxsMGFRZ29IeGtyMTd0bE9wbGpN?=
 =?utf-8?B?cWVwRFh3eXZ2ZnRwWGxlYjVpVmpxWWJ1Y2dhM0ZaeXRyU2t6dWtsOWVkQTVO?=
 =?utf-8?Q?myJQL0StVYalYn08=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954ba623-ccba-4c43-e0cb-08da3c8c04c7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR07MB8658.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 07:15:30.1673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/a0Iewrz1GoeyDQNzFapvYYYVlkuN5of+BVl38Mfj4oZmgilUj7RIMOdn2OBGqccAqr8cgEnj7v6f00SsWGnNmnKw2wuWwN/zqEnOecLJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR07MB3332
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

On 21/05/2022 11:50, Wolfram Sang wrote:
>> +			/*
>> +			 * We drop the mutex here, because device unregister
>> +			 * will take sysfs lock (kn->count) which, as LOCKDEP
>> +			 * would think, depends on this mutex
>> +			 */
> I have to ask: can't lockdep be fixed or the lock somehow be annotated
> to prevent the false positive?

I would be happy to test any other proposal, I personally didn't find other working
approach until now. This particular patch actually has an advantage of reducing the
locked region, which makes sense if only userspace_clients is protected by the mutex.

-- 
Best regards,
Alexander Sverdlin.
