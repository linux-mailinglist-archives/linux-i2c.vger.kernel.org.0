Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000B36D96A3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 14:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238141AbjDFMBS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 08:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237037AbjDFMA4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 08:00:56 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4700730EF;
        Thu,  6 Apr 2023 04:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etM1VaSMcd9c/kF1Mpr1af2KKB72pPGWCrznfbtCQ5w6LMMXZfCsUhFcUhKZk2GeIsZhigP5PUbaOuRk4iIABfx2wJmd3CTgcD467JE+ezshbF+yXqPNjeQxxLrGh12kHrtShrZpt013g6Ovc8JwwS71PCsN46rhFWt9dIn4Jfdz2V9GSI05DSQPERK1sUZE7A/mlQLxQ0x1Y3PmxfFKLKxB4kSFKPxu0rtmKSDwuJucweK3Y2/oXjI76Z1lAxxDEKxJZkfGmYMy4PxoNJXJbbw9lS9lAIfpT2uoo1POQB/6rXBYStWtPZo/mmCbRGzX7LJ20EZQNDOR8CHiGvVrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqak1H2p+tugo1LnD/kEFbQNckuMGN0JsYskDPjN/E4=;
 b=TK0xcyJ8d1W7JiH8gJywwDJCigD3NGd/R2mSoQVXP2itwdLrn3ITks6yFcJpwddgNur39zYC8uyxX4Ccof6VVu8mgix/IFjPR42uxpAEASDXhTerbWk+RqBXtWrDagkOnVO6WkOEwBYwqAoRDjRjB/ve+BtlhtZ2bcfP2Q2wMGUotqSJAuT7vyD6v4pkS08H53UqHEOi8xQy3WVW7JjrS9GunZZwem5wmMO46k6M8+NjAdEO749EBaerhEpHb+l8hpdALgg230CdR/LMpRvIu69sFK0VTeDvrqeXxJOHzQhR5wVEwbfzCIEi0PtwmXzZY31Y0jyENfiqKXqWHLty1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqak1H2p+tugo1LnD/kEFbQNckuMGN0JsYskDPjN/E4=;
 b=DCL10yBec8fLTk8T3qa5lEAZ9KOSAe0955Ff4fTZbaA/3BYBjxms2eZ8wosw5o7rV3Ez7nG0yVuphQfQEjEXuvlhkUa9JYxMboUCiGDcrE2jjvZejoIrFfRkzB0jy0eMZ4E76qqn0oiazJtETMaCv+4rslOQv//LPbH+19Rr1xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5417.namprd12.prod.outlook.com (2603:10b6:510:e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 11:58:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 11:58:10 +0000
Message-ID: <82ef9505-f8ae-36d0-fdeb-9bfc92aec557@amd.com>
Date:   Thu, 6 Apr 2023 06:58:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 0/6] Use CCP driver to handle PSP I2C arbitration
To:     Wolfram Sang <wsa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org, Held Felix <Felix.Held@amd.com>,
        linux-kernel@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
 <ZC5pxORLN+SF/91S@sai>
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZC5pxORLN+SF/91S@sai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:806:a7::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1cae42-665f-4ef8-57f2-08db36963140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1UDZJJGnMMBAmvl7/bNWv9WbHs52IruC9LHwiLYLrGJT8G5p1vKIMvvWXz1Bjf3RybDGr37V7k+tay1qfxQ8CRkrC6Y5oBrRwHxKX3ghfM2wqgKbqWvfWwt/80lrt/1pgPGQ6g4K7JzwCD561IWrhq2bqzR6NiW2p+ZMDVb9XT8fQESZEsrgvw0e/cSxwJBfcuHouiawR9NzjSitkjVQk3WL4J8neGytHhOM5gvZ8aYPJbgIT8cl6QmEEztrlJdr4lPylRTDSGq340aXFV83sh148ARaND7leXatzA1faj/Dy2XcRsmWsqdAet10X6dHuK2JKEw9oFfCkK7JtqJfd+xVpMCWfKQw/XHji+Pb3mG/DtXAmWhVmkPETcvmEEf0O//3OAeRWGzrvzx2d3eZQuVkFmPyeqlDx4VMaf7OJzsFEllOvVPMuSiUg98ZUN4viUf5lj/jxFdL40kY2e9b/FIZ5/Dy9PqgsQQjjuoUHTjNQS475/NM8LJz4TR8UJTUxdAbqarMf31fQJQpT6gn9c87GBcTI3OyKUr90i8iXhtshlJHBXiyPc9UL83bT7huJcS9o+2j14R6d89Eg6Att8z4E/MVlJ07O5o9+RegWKzawpT2TnNyV9/Os13sFz5wXk47Wmlj1XpQXlY0e07WeyqmyWNDXYh/8c+IBJibZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(44832011)(2906002)(4744005)(2616005)(41300700001)(921005)(5660300002)(7416002)(31686004)(53546011)(6506007)(6512007)(31696002)(38100700002)(8676002)(66946007)(66476007)(36756003)(110136005)(316002)(86362001)(66556008)(6486002)(6666004)(8936002)(186003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTdJSVV1cUNwM1pUOUtyRHJLNTZwT0hsNHBVNjlBVzJaQmxwQ3JheUhWUmVK?=
 =?utf-8?B?OGtNQW10RWRDVEpnczBleWc2VlgyRGhUdFBHUUFFa0pKMy9tTzgzUWd1dm1Q?=
 =?utf-8?B?eHdaSTl1WXhQdmoxM1FkNkd4M0paSXBwbWI5SnFsUmFqMzZXMjcyczBSMXVI?=
 =?utf-8?B?N2M2WWM3QUVkOHJxbzNscXJCSnNLMW5RTkpaMFVkQ000OHNtTGNvZm5zZ04w?=
 =?utf-8?B?RGM0WGh3SjBKbUc1RzNXdktmRkp0YzRIMGFuOXQvczM0aEg0NmRwL1VYdjBU?=
 =?utf-8?B?WlFzRkx6WFdCNWpIbk9PY0F2SFJ5TDJ0N0YvRTBpSy9mYlEzVTA4RDJCVmM5?=
 =?utf-8?B?cnJkeGM2eVU0UWhjMXg5NWJRd3N0Mm9OQ0FJNlhoQ1Qwdm05KzZSRmFJWWtl?=
 =?utf-8?B?WEJqb2g3b1VWNjd0bjhaeTRsZThwazl5YlFPLy9USmtqdlpSRm5rOTlGWHlz?=
 =?utf-8?B?Y0t0N1ZjL1YvRG1TMlp5MllINjFmL1RYUHdYbHNWdE9IbUdFbXBJN1psTEJS?=
 =?utf-8?B?M25JUUE2WjZ6TURadW9kMFNDWU5UZ3ZwY3EyNStjZUVndEZSZURRWkNubGNV?=
 =?utf-8?B?WUtqd2s5ajhuUG1qY3dWSUNNY3p5UHlzOXJzRkpmZjdQWXF1RmRBZGt2eUFD?=
 =?utf-8?B?RWc2Y2JncEVUalNDYTZ0Y0VVV2twK0ZRWDJhUUxvUm5VZVM2MnVTL0R5c3pX?=
 =?utf-8?B?WjN6bmwzUjF4Q1JLNUJsS05CV25lQnZsblFHRmJCVmJKSnBmSmlPaGI2VEhk?=
 =?utf-8?B?NTQzVjJCSXpWZzRSSHV5N3BiSFN4QkN1UWxWQS8rMHhka0p1Z0J3bGhjVWQ2?=
 =?utf-8?B?amg0ZXpLaGlDdE9tRjN4RU5VcFJITURRbkl2TXpLUmtlRkdFZ3ZDSkN3L00v?=
 =?utf-8?B?VDVyRUx6VmJkZVE4WFAraHN2RkF1aDMzR0tOR0hWVlRIaysyTFZwSmFFTm5j?=
 =?utf-8?B?TU1pQnd5WkYrSGpVQk1GZVA2ZEdURXMrcFU0YVFHZ3RnNFNORldTVWRReGFQ?=
 =?utf-8?B?ODltYU95dmFDb1p6U1RYUXpkSE9RWVVLdjlUUE9Pb1k5WjVpN0FUcDZJVlln?=
 =?utf-8?B?WUtsZXBXU090UTRXWDBzSEZsc0lVOVhjWG5FTHVWMWE3Nk9DZFBuT1QzWnhq?=
 =?utf-8?B?SGlDQ1VXRkJJVndrcW8yVnd5SFZudExQbzZCcEhsWXlSK2JWSE5oanIyQS9O?=
 =?utf-8?B?aTJ5QklTcHByZ1ZCaXVUazVRTkR6VGVzOCtoajc5K0oyU1RKeXdHUFVJcU1h?=
 =?utf-8?B?dzlRd2RHanRaRGZMMjg0R0dvcE9SVlFTaGRnN0w3azNsenFoUFJldW0vSE05?=
 =?utf-8?B?REZVeWZ2Nis0bFd3dnJyallGRkR5NGxLS21NZ1pCeVcwbXFla2lkNEgvZVE5?=
 =?utf-8?B?TWFNVW1ncFFRSGNuSU5mNDQxaHhhYlV4eURmanJlSXpuanNBcEZ1RDF0clc4?=
 =?utf-8?B?dzBpVHFsVEUweUlSOWNrK29yS3Z0VWs4aENvVnY4L3Y3MnFuMHpPSThCUHhV?=
 =?utf-8?B?YUg4V0hkOVA4Q0tLK0NPMkVtMVN6TEF3UzNlWE9vNGFValdTQWRwcXdrcXNG?=
 =?utf-8?B?WUNieHhWQ2kzUWM1Qm9Db1dpWkxaSC95MUNqMFpvcHdVTXM5UDFHYlhrTVlE?=
 =?utf-8?B?SUM2L1hYdEZZR0JxeU1UMlZCNnl5N3dSRXV6TXdlaDB1c3o3R3BqZ0ZwbzV0?=
 =?utf-8?B?VTNzbnFBU0ZJSGNiRjd3ckUxZjF4ai8zTjlRY0RwZ2RtdGNLSnJEVk5ybUdQ?=
 =?utf-8?B?bytTQVFxU3dkaVhUN05tOHBhWG44L1ovOGVCMmh5K0Voa0ZxZ3Bhei9SUnhY?=
 =?utf-8?B?empSZXBtbE9TcWJ2S3VXZzVjRm45a2wxc2w2Nm5sZ3h0Z1lsb1RhQ2NLUVZt?=
 =?utf-8?B?MndBcnRZNk5RSVBRTVdKQ2J0RUcvaHY5bUJpWkRabEsyZlVvRGNoeExSbzZP?=
 =?utf-8?B?dkdFZ1lwVG9JRllTbWR6S2ttWDRYdWd2MHFOalRtcWl0Mi8yZWdDU3hPK29J?=
 =?utf-8?B?ZkhZMHErU3ExS3V5Q2lDZ09XWXZQOWMxd1I3SHc5RUgvdDJoSEgrcE85VnBP?=
 =?utf-8?B?bEh1elYwbGhNRVg5NUtQSkw2ODZXcVJGTkw4WmsxUk44TnpEQklROUoxUDVo?=
 =?utf-8?B?QVgvZTMwRUwvRGRZMWVyMWJyT0VxVDNSWit5c3dFejJ3NHRTMTlpVFlDdlUv?=
 =?utf-8?Q?yczkhHjwUQkeamduWMb+s6JYJdrKhIDiK19eybaneW9F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1cae42-665f-4ef8-57f2-08db36963140
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 11:58:10.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/WMUI26Vmt82KdIUjfvZXYZIxFGrJvYOJioy/IhlBtcMLw6puF9YSbfShjlpeVIu/1nU0t4IZe7iDw45LwJiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5417
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 4/6/23 01:42, Wolfram Sang wrote:
> On Mon, Apr 03, 2023 at 01:32:09PM -0500, Mario Limonciello wrote:
>> The CCP driver now has symbols that can be used by i2c-designware-amdpsp
>> to handle the communication regarding i2c arbitration with the PSP for
>> both Cezanne and Mendocino based designs.
> How should this go upstream, i.e. are there dependencies? Shall I pick
> the I2C patches or is it better if all goes via the crypto tree?
>
IMO it's better to go through the crypto tree.  There are dependencies
in the crypto part from the earlier series that was merged.
