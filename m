Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89206C4FC7
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 16:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjCVP4X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 11:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjCVP4W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 11:56:22 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103625CC25;
        Wed, 22 Mar 2023 08:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoidxicFx8jFLVFwL+G8RooLIs6L2v/7w5lpK4ZdQTFs7cB/1y+P6re6oT3+XtZIe6xFVpLhzraOwp0mC9G4G+8w/1/5vz7wMovudP4lHo7EkWIdWvSv5TGDbEJpmuxm7uRGeiVT3T5bhT9/J/voma5efjvOO5FFJLRzIGeNG+t23gMkyOsCptjAHJDzBmuLyQvauGCYOAVxHSXID4VBNABqfBZBuBFBHwWXCAet05bXpYOiKWD59DobnLZ9JQe8ISImtIVOurce/v5YwLzAwlwkuufhcnfeAqeGOLg/tr9tvQrFWdYWpzsGZLS6gihEQdFt7IQmlGR0fAPtgiJZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLBRd6O5VgsV8D900ubWe16YtRKepJQguIrr2EoKTkA=;
 b=I7PFgFDrEDGItj3A9iK1gryb4ptDSMS1KaOqNYbePigIFkhYmEWYe+TKU7Iw+d+prWt8zCVevs5QForGvWDFaihmiwXQ66uuf1jkTwoHLx4gx11v/BeEno1iMVUWUKQyYSkaimyjWdCdK4LGbMNEsstuInBiiFrUiBoEE0TTz2TW4XmwPZTCXVXbACwdcNsf9XVWva9ZwHqqvuzvsUzmzo/CIndIVtnIAguYx/PQmWsZ+A5OaEaNWUgQ8+2ZQEznDqEQ5PLkCTISBcy6jxQXfhlmbs1OI8c9cSBM6mtLWEcO3vFqZxUWM5YijL8srPjFGtcGjPqPQFkP3vDS6VsYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLBRd6O5VgsV8D900ubWe16YtRKepJQguIrr2EoKTkA=;
 b=RVGpQ5tP3HH4511afJPekJEf/MxV0wScCbdw15Adqb0AD+loQ76hzsiM+lNFk+6Qd+yBEl7MnMcm08T01TaOGSGGDUiWMM9pna4SjpjPflPMtkdbrX29wfEowA0gZM2dXE1EjQpHVOHcSJooOwWsIraCJeN4kPoQmgnOFbE9eHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5487.namprd12.prod.outlook.com (2603:10b6:a03:301::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:56:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:56:17 +0000
Message-ID: <42613e89-569e-5ad3-fb8f-0b3a8bcaf04c@amd.com>
Date:   Wed, 22 Mar 2023 10:56:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/3] i2c: designware: Use PCI PSP driver for
 communication
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Cc:     Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, oe-kbuild-all@lists.linux.dev,
        Held Felix <Felix.Held@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230321212822.5714-3-mario.limonciello@amd.com>
 <202303221157.58L3rUhr-lkp@intel.com> <ZBrOTu1DqKr608UD@smile.fi.intel.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZBrOTu1DqKr608UD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:408:e5::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc99d62-1cb6-4de6-8936-08db2aedf8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJYoHP7koxMcHiFeg9hRU4o18dgwV4gKONBoVDCrTfATdm9XlB1RR6BqEW1M+Nut3MIvUknFe3CiO0q0fH+pJ5AatJ4l3CtjgFrW1J4++w4Hao5tY1gLe1UGASNMeV1C4iiBoYJxDg+Tf5Cr9oKliW7MDLLM3Q8STCkhqBR2Y0tVToRHXwuKPoUdgRcNzz9+Bcn5ETLSopa+AbZA32HD2hN4fjSBst2Kzkn10DJcW8bKVh+eXjcNCYPTCgmjJMV8WsKAlXPQuNmMTutxEIZ/wpaQFz+sSbo2FdHcwZtHfC/xVU7kvBZdUcDBUGsUJnYXX6MqXIqcyjY3zM4FqYlNSctUI5GCo66ducWbJ3QNF2TvqOvC5oYUfSYVWQvVGBy5/xsixI+QLe53CHoI/gTN8XgPDFfNOFvIm1XqHyfO9Ly6Dx3Bfco7O4MMfi72hVb/RJ13PZa0loRCJNlkzz03DWGiesmiwA7pDRCgoO5WrwxqXt5umbuXDvT5gZkKgBlp47tnI9nKdweMTodh8Z+qBJXQlvg1v+lmABGnkWgRT+u4kxXFr7rAnCOpkDnHwuuE72gTHxpW9f+yKFPaEoPtjTg5mGI7NUH1Tt05+2feBMqG3XnCHmREnDbEwGYaU5NflkpigWX0wYmpUM8PDObJSVCOATcjHeKico82FJgmYER/faZcTwSN1r/QPeHWnZUuJUa3pypOVHW6sl2NaxtrZIyZZJHBKOidmx1PcoBn2Io=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199018)(186003)(2616005)(38100700002)(2906002)(44832011)(6506007)(53546011)(6512007)(31686004)(5660300002)(6666004)(7416002)(4744005)(8936002)(36756003)(86362001)(6486002)(41300700001)(66946007)(31696002)(66476007)(478600001)(4326008)(8676002)(66556008)(54906003)(110136005)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUszWDdOU0VBUG9PVWVhcHZFek5DOWs2YXdqZnNwQ1g5OGVmTituN2Y4VCt6?=
 =?utf-8?B?Vy9UTytxdTg1cTRwN2J5ZkNGNTdzekhiWVEvL0tPVDdQR01yaFJjUG4rNkha?=
 =?utf-8?B?QVBVcTBxa29KU0tYMXJOb3JOOE16K2tqWS9HQUFpdThsK25ySWFGNEtsbklS?=
 =?utf-8?B?c3J2QjlaM2hxUER1WHlDdEVod2V2NG5haDZSejIwM2NhZTRqc3NwODAwTzVp?=
 =?utf-8?B?NDhxTnBWdGl0KzRrMEtvc3lEMkxuV2R3aXEwaFBuZ1ErdXJHd0JzZElON01x?=
 =?utf-8?B?TDRLWDhrRW1xaW8vR2FCdUVBRlFRSXJkZ2dHR0dHaFA1MDRhME4yanRBQUNz?=
 =?utf-8?B?cXJ2YW9LZllKdFRzcjFxRjlQY1c1cWVxQ2VHZTNpQzlDV0dWUUROMERPWDlD?=
 =?utf-8?B?SkRCZWljS21WRllDNWNjaEgweEpBVHUzcUR3N0w0K2ZjNnQwbW9Ic04xNXlo?=
 =?utf-8?B?YWMyTjJsUDQxYklSUTB3L3BzWVlpVncyc0dlWjc3OC92MFBad0NwNzZIcTFX?=
 =?utf-8?B?S3cvN1Vqcm9kbTR3NTNtRGVqVkVFb083dHppY3B1d1N4d2FFclBFUWN5bSsz?=
 =?utf-8?B?VGpUSjYvb2lCYU1LRmhxTHBST09Xd2VYZ1J4SHlHMVByczhKRjA4U1puanZk?=
 =?utf-8?B?WFRhT09nWCtQaHdCRlZlWE82b0taT0l2eWNmT1lWc0RKd2ZiZC9jOEtYNFV1?=
 =?utf-8?B?ak1jMlZ4MGcxSlRLRS9Ca25UblJxZzl1djkxMEw0dERKTVZUYVVtcXRaemhC?=
 =?utf-8?B?dytpVUdVUWxwd21OYjdNdjd3azN5aXNLMkMyZnd6UEFsQWpHVXdXL1lYRHRN?=
 =?utf-8?B?eGJ4eFVMYTNRTDZzQ0gydnFxNUdXT3RNL2FCSVYyV3JlTkxxeGxrZnAwbXlr?=
 =?utf-8?B?bkNiRkFUQTdwSk8rMTV3QVFWUExicEUvTE1DdXpqb29nZVE2OGpRdTdRK1JV?=
 =?utf-8?B?ejVFckZjYitLNTRyVjYyQ0U2VVk4WmtPSjdzSWo5Mk5JcFBZNDAzUlRFSkpq?=
 =?utf-8?B?Y201K3k3V3phRDAvMzVyb0VFd01aNFdBOXR6eHpMcVlrbGNpSFVtekNKMzVy?=
 =?utf-8?B?b0I1RFRDY3Z3b3JZZ1VhU2hLbzRaaXFKS0M5Z2U3TE5ONVF5c0JTK3VITmgz?=
 =?utf-8?B?OHlHaE1zOWtPMUlWTllNUWJHaVFGdTNIUWJJeXJiSWViTElTZUwvem9QUDdD?=
 =?utf-8?B?d3BkTTlEQ0pIcTdmL0RiTFY2WTQ2bmx4UENNNEJZVWNwTXNoUS81aGJINktG?=
 =?utf-8?B?U1owQVh5ODZkRzR1c1JRMnUwTXlLeDM4ZTFJSitLQk1RaWFybXQvTVYrVlRq?=
 =?utf-8?B?QnhhWm52Vk9YeHJEUDhvUmM1U0g1TGdLeFRWMkMxZ1pkN0t3NGhENHc2Wmww?=
 =?utf-8?B?QUgrL3J4TkFscFZvSXFFOWVGd1FsSzRuMlRtcnBJeUdQb2pKcDFkS2hLbUFY?=
 =?utf-8?B?R2lQVmJWd1Bobms1L1ZpNVRIRmkzbExkUkZvT3JHKzM5eVRMVitMUXYydWdy?=
 =?utf-8?B?cUEwOEZTQmt2S1dhN3NqMCtMQUZaVGFUZmhxem1uMnBlSnNHUkZnME9WaFl5?=
 =?utf-8?B?Y3BDbHU4WnEyUFNaU3JaRHBiczYrUzRpaWs3NTBUdnRVRVJmbXBCemVtN0Zx?=
 =?utf-8?B?SXJ4Q2NVQUUwNzVvOXdFZW8rUDQ4TG9JZEVTUnlscjlJNXErMTBWVytDNXZW?=
 =?utf-8?B?QWhlU294VHNvRWR4dU5EV2lzUHdaVmMwaVJYejNEZU1GbmpUekZRV0Y3R3hO?=
 =?utf-8?B?OUJjV2dqcUZBYTBPS1dycHh0NEpQRld2ZHViVGlKVnlFcGplQkJycy9mOW11?=
 =?utf-8?B?dFFFenZIWmEyZzJSNFlsSldLZmZDMFh5cVB3RnBFTGJadTR6akhaWkEvVDdo?=
 =?utf-8?B?QUpTU2RWek1uZHNLemRUa3VYcFZtdE1za25GSkltUElQWG1pWmZ0VmJ2cTNo?=
 =?utf-8?B?Uis3blpSTFdDZlVXeXhOZTQwZno1TnR6VWVrSS8xQXd5WmZiV2hsZk9oUERM?=
 =?utf-8?B?cHFwcy9mRjYxT2h2NkNJRlhoUVlKUUVCeXE3WlpVZk55UXMxS3loai9SVzJU?=
 =?utf-8?B?eHRDZXYyKyttcUlnVlp3MldlcTBtNE5JcXEwM0hsQno4U0M3UHlPc3dSVTFT?=
 =?utf-8?B?N2loc1J0czNDTXJhNC9MNWJORjE5VTRKRFhtZzNJSDBtckptc0srWlJycmFY?=
 =?utf-8?Q?QQ+r6DYzMjNVtb+u9ipGAbEUvMaZOOOyAXLe4CFYz979?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc99d62-1cb6-4de6-8936-08db2aedf8ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:56:17.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lht+mndoWWikOddImYP2mGoVKaPHnic7OolUfULzXDPZ2NkFh125OJ2LWN+s4xX5zTLgpGiW4eKyfNPpq1YZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5487
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 3/22/23 04:45, Andy Shevchenko wrote:
> On Wed, Mar 22, 2023 at 11:26:01AM +0800, kernel test robot wrote:
>
> ...
>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/i2c/busses/i2c-designware-amdpsp.c:8:10: fatal error: asm/msr.h: No such file or directory
>>         8 | #include <asm/msr.h>
>>           |          ^~~~~~~~~~~
>>     compilation terminated.
> Should be under "#ifdef CONFIG_X86" (IIRC).
>
Actually the header isn't needed anymore with these changes.

I'll drop it in the next version of the series once I have some updated 
results from Grzegorz and Jan.

