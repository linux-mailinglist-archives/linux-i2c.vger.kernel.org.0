Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7F6761D3C
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 17:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjGYPXA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 11:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbjGYPW4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 11:22:56 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B3CE2;
        Tue, 25 Jul 2023 08:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqrZhG+BaMo6Fkq+5WJ/yiIYDPNKLlWfBposIQSQj9yA2ogAx3e+nlPf9PFCE9MCZAU5DN5llOkpRgLlcjFymKYatuap3dSvqmWpTYn7YY18FJJRf8jNJT6WLQJJ8FEjd/j/BVl2KJ/Rm7Xx6A090Pi5OfXUsFZODkeLym7jrPELDC8rN2GTu3ftrmy0KEIys8VbbuiItNtrJDHx16euY5mzXWKBRA2hEXoRMc3EBwX01mtunjsjT3miB7pmIydRybsE21OCrIwanwNwopuBHpnXnr9magqT3KYZmSa2xiuIMwyEkg5scinf1hWglmXmLPNl0nwkJOLUcCsQwVvCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjQAUXMlNbe+gETngUpNQQg1kS5C7gJrqkSDlqxQd2o=;
 b=EFvpLdg/q7VEy0br/YFQXZKiax+yQ5VhmMK/ZwOPp2EzjSPWyRroxAVfh0pUPD6ZBqyiVCM2ihH5bn5FUcBY0WwWVbsMRgy2/oqCcY2t3jdGSG/pLa+nDidndEWJ+SuUFL97rpvO9DlBJNZcim9i0zNL5MBETE+9n+93iIK7Vo/USBehUAXhBaOjfrTp+GgubSGwVCLe9rw7C8k5QKSks+qV9dsLjAF2HwjIJSjIOYGIX9vFn8waOQ4DoLELZAtsGbwBT4ceODTbM937ztwtM/NwGGkAvjVORdpsfLvXQXhmiwJM4gc8O6yXl6OLjKAtke8TQhR96JgBDd3xclI0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjQAUXMlNbe+gETngUpNQQg1kS5C7gJrqkSDlqxQd2o=;
 b=NbmETfXGv7a63xxgFVPms02zZLmCygOvC7ZuwK28OYNRb8ntCzwp9xQabqc2PfUkld1tPXIYIsWDGYBptKnrAH/HP7fXXdB/142DSe6g5vMHlkt5uhIwgBVMyCweqRe3FdsYfkhPbGs31xRQRpDul0wsluQHGRBMg4XjJPhyvlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 15:22:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 15:22:52 +0000
Message-ID: <707c74ce-1afe-1b8c-43dc-d9c351a4a697@amd.com>
Date:   Tue, 25 Jul 2023 10:22:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/9] i2c: designware: code consolidation & cleanups
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 19698883-4346-4cae-5509-08db8d230325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iylHuLoR1LwCcpmIcWYYjfXDRT5d+x9ntlFRLiDCHHXvjK4VybdpwZC+gnz14S6FWnIIEFkXSKghqFS9X0hotNOz3bT8VtOoEIQscfC54eQ7ayoHlAvlfSd83pwKfpHRMRa/fv49REWt4Ji85CMlnZ6MNeK6pn19jt3lomqiGRxTpYREgfPbgGY7m7Op/Ji2ylprgyaW+00CXDMSq5E1Tg+QfmmqJOHqA3V1lh/prpSScGcJGyYjrX38ZBYr9rZD2YrzKQrsOWQiukGRraZMA0VV12Kxl3DZKnrzUvl+QpKW2i/GBC4NELmBzS9FNvTjX8CwB7JBlw/J/TQ9BovHSbnwm0aLLF7pf09M3Ohw2OL8HKac7I5Mcstv1IbIEdYjBAE735Ov3EJZaMGE22xSUbHTLdcFTL+C+woc26do/vJmLJiA4YwS9vnD0+wKEOBfg7NYLUpXbR6LjUr6FCWa9sc8wrQgenaaipl1kcJrO6wAyeEx9/O58aOCJCsRL0rVRJJWHzJZu8ZjKm7moViHmvjIhkJzStgGG3hsyl4fMo0SXOpEF0PGoOCKG2OhTbBXZWrXWxSsOZfzWJzIn0SOj3El5ni4n16EjoRk/dpASczfFs9Ir1Ftxa4TOi2stDOsuEIdLDxVjPrP1RF88AKu4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(31686004)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(2906002)(6916009)(54906003)(66556008)(66476007)(66946007)(6486002)(6666004)(26005)(186003)(53546011)(478600001)(6506007)(6512007)(86362001)(31696002)(36756003)(2616005)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1F3TFhQN2xoZGJ6Zno5ZnF4TVRQYW1QdnVKMEVGZERhWkozTDZXczQ5RjBS?=
 =?utf-8?B?WCtreFdjcEhkMytVV0RnTVlYemM3bWVzUWdtQzhyU2p5bk1tR2xpUDBoeWFE?=
 =?utf-8?B?dXFDVDdCeG1QRmVqNENYWVNWcUN6SmFnQUhjWEVDbGEvS0x4R0lxaTlrM1lB?=
 =?utf-8?B?NTZ1L2Jicmo0bkRVTGFobFNvY0wyUENzMWdwSytVNHB5RWRQSDlaYlZXT3V4?=
 =?utf-8?B?WldPcWlZc3BBc3FONlpCOGJMeUdSZ3dVM3FIMzdLSDlkQU1obmJMN2ZOMGJq?=
 =?utf-8?B?Mnp0b2ErSTB3RkNRN0psdDlwaUZKUTBCb3lXSm5uOTRFRXZrUWxIZ0pnSi9N?=
 =?utf-8?B?WjFCT0RqN2VmUjZ1Zkcrd0YvY29qaHpMVXp1WHlZSDJZYU5xUFVuM2h1anYv?=
 =?utf-8?B?WkdpcGtFdUZyRUhscGpBY3pOSGExUy8vMzVNeERMYXRsemJFeU13VmhZelFu?=
 =?utf-8?B?UkMxYkJEM0VkZXhIVEkvZjNlMlRZY3V6UkJwNXluMTYzZWIxTlk3N3l1cVVw?=
 =?utf-8?B?Tk1VTlBYY2xaT0ROOHZDMk1WRkpjSGNQbGhMMXNIYlc4aFQySG4xOU81bFpB?=
 =?utf-8?B?bmI3N2ZlUStsYWUxeGlDOEU2OStkV1RvcDdCcFh6VzVid0lBQjZFUWtGYWE2?=
 =?utf-8?B?dXpxcDRZa0QrOGh0QVhmMHRyWERJUTFaekpMd1hEVkNBSWt1RzF0NmdOYUJP?=
 =?utf-8?B?dlRTektFYVdQaVNlbjliT0FBa3BiTDJqcis3ZFI0czdtc3kvVlN5N3JGeHRj?=
 =?utf-8?B?bTRzVS9zT0wzTXUzRU1HejVpVm5pUTk2OXl4WXVabFFWM1RQVXNZNnNqUHZR?=
 =?utf-8?B?YXhNRHNzU01ISi9kRmw0ZVEvVDdQeHZrclRQQjVuMDNWelRVZ0poOHdoQUwy?=
 =?utf-8?B?dGtlVkp3THBXYUkzNUZGejVWdVdPUFBscS8xb2lLaVJNT3QrOHovd2FTckJ5?=
 =?utf-8?B?MElKdzBzTlVaa1RINWt5eSs0MkkvSTg5VVNQblhPUldkNGxqdUc4RjNRVm53?=
 =?utf-8?B?bXlMTndyVlZJSkpwK2JFQjlocVIwVFUwK2N2RFo4QUlSUno2WFN1NlN1TVp6?=
 =?utf-8?B?WkdnK3g0bVBxUEljaURySmVvcUdDZTZuelE4eUZ3d2RtQ005UHFIOVVEZlZm?=
 =?utf-8?B?QzN3a2NSRDZKb0s1cTVjc2oyTnV6clZIWlFyWUllNWF4dktFcDZzd1FRdUEx?=
 =?utf-8?B?dnhLcVBVMWk5ZWRraFlMMWMvWmp6R0crUkppZGVXQitDMk5zQWM3SVJDYnVH?=
 =?utf-8?B?SmJIcUE4Z2VFZ3kwbEc3Y0Q3aWFOWUdPTHNqSDZZZTRkcm1wc241OUNNdkUv?=
 =?utf-8?B?N2ZGOHRvcTVETFIrWExaZVNkajE5YXUvc2xCdHQ5Q0NLRUcrcksramNraGxK?=
 =?utf-8?B?UVE3c09qamRXVkhHOHdlcFMwTDRtNk5aUFpybG1kaUF2ZlgwZ2pyRmRvWFJo?=
 =?utf-8?B?bHFpckg0YkEzZWNuZGZUNjFRdTNPRFhMV0NBbTZSeUZiYlY4SUNJdEd2eVJv?=
 =?utf-8?B?R0c0d1BrWU1hTDQySTU3T1F3WGp6cGh2M3FvVUJTRFc0dm9FOHBMc0FSckRD?=
 =?utf-8?B?K0ZUdVFXNXZRNlV1d0tXdXNpdzdqaU1oakFNc09TcTNYaC9nU016SUhBejhj?=
 =?utf-8?B?RWF6aWxIV0tXMTFTM05JcEFTd2Z2VFNEcXlVRWtUelhiMFZPZTZiUVdMTEZU?=
 =?utf-8?B?S2I5a0NWWkNiVE1VTzdwZG1rWjZZL1g3MWFJNXY0by9qTVdzdjVDMHZwZXRa?=
 =?utf-8?B?RmwrYlB6NmxCV25aU2pjbTRQMVo5Q3RIaGw3bXRwcTU4ek5LeTBaVWtpNlhj?=
 =?utf-8?B?VTRmYlk4THNmUWRJSGFHV1F6aHVRaE40TnlMVGF1YktPV2dZSWJzVldzRFdN?=
 =?utf-8?B?cVI4L0NaM0FpOGNTOWZXdmN6MTgwNWUrNDhWWnNHdnFuaElEZzRSM2NLYzhu?=
 =?utf-8?B?RlRza3lLM0NkSTYwTjFzcUN6NDBpWFlvanY2MkJQcjE3b0k5THh0T2c5V3Ny?=
 =?utf-8?B?dzhQbmg5d3pyV1FNZmVZcFBxakpETjVkZVVNNE9rVjlGbTRWNmRIeGNXNGgz?=
 =?utf-8?B?V0w4b3ZjOEIvTGVzVlJ3RjltU2RtNlY0QjNXMHJTRGErK1BCOGJiZjExdkU0?=
 =?utf-8?Q?aiMeeS7mdZWAGZO4GrTQ8CXHq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19698883-4346-4cae-5509-08db8d230325
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 15:22:52.1434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc8keAkI+H80Ygp4EuFomsfDHaLJBukLGo6FY+MBd8GtehkRuoPTsWopC2y2aZH+7sHpn9JxbHtRHjd5AHUVMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/25/2023 09:30, Andy Shevchenko wrote:
> Mainly this is about firmware parsing and configuring code
> consolidation. Besides that some cleanups here and there.
> 
> Andy Shevchenko (9):
>    i2c: designware: Move has_acpi_companion() to common code
>    i2c: designware: Change i2c_dw_acpi_configure() prototype
>    i2c: designware: Align dw_i2c_of_configure() with
>      i2c_dw_acpi_configure()
>    i2c: designware: Propagate firmware node
>    i2c: designware: Always provide ID tables
>    i2c: designware: Consolidate firmware parsing and configure code
>    i2c: desingware: Unify firmware type checks
>    i2c: designware: Get rid of redundant 'else'
>    i2c: designware: Fix spelling and other issues in the comments
> 
>   drivers/i2c/busses/i2c-designware-amdpsp.c  |  10 +-
>   drivers/i2c/busses/i2c-designware-common.c  |  84 +++++++++++---
>   drivers/i2c/busses/i2c-designware-core.h    |  25 ++---
>   drivers/i2c/busses/i2c-designware-master.c  |  15 ++-
>   drivers/i2c/busses/i2c-designware-pcidrv.c  |  13 +--
>   drivers/i2c/busses/i2c-designware-platdrv.c | 117 ++++++--------------
>   drivers/i2c/busses/i2c-designware-slave.c   |   6 +-
>   7 files changed, 131 insertions(+), 139 deletions(-)
> 

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
