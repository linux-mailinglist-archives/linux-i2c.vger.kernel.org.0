Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0583F494FAD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 14:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243304AbiATN7w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 08:59:52 -0500
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com ([40.107.236.46]:57376
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243802AbiATN7r (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 08:59:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY/+p1JR6xbFwH4huBZmsdB6GJfCjMp+TFKhAiJ9Af/mC1283CMV5bsgIfXLMqtzLE3kRnGQlsuXp9m1cc1TnD/zaMrIqnmlFUHGI4+RJcOzUrOy2QXIBaRT4xD3WTOU5CeYnZyuq7v8Osi65w4ynD1RO3RrLQ0V67nKeoBzbU/bZppkmj7Uciyu6Zxqn5e4eBDQ+3n/is1QkqDwad8hhA3IbcLcnKHzPAoPXWx8YiiKwgbBMAuq+Gty9/+O829lWYiM3XcyS3d+NJrYbw3v3WjiAusN8Ef3XqWi44U2/6nHA3G3bF4ILBmOvklwS302gqqmcFdSZgOdKBQJGQP7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buWDYora5LlnThy8k74jkZxPmjpFJQw0b2MCd9P6WA4=;
 b=Oz90QHcPgp3IKVfQGEOHMvIwRZ/d1a4j9nA3XWJA7scRR4d10lpnQSOEgzCoYwhcQXmEWmy+sgoh/xI4kSGLvgTY7/m/6yDuR7b8Da1kyP7XK2aV/qLyYcEz3oE9QNoW253fzASLpxhiocSDh/srhMaZFy6WsHPsRLuDOKq1XKBKPz31WMRRswaiwxc3qTbRE8zFOQshizfhMIBq+lrFC+w5xZ1W4HyHU83tRhOHzR7sc6H+AAWWLdqFaCZqfJWvWepc+IuCyM/+/+4kysvsu30c2RGAdAEDN6nBG07SKLyy3J2TJ5F1eunEsGTJY+OWOO0NHCgoOaMyxXDH74o5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buWDYora5LlnThy8k74jkZxPmjpFJQw0b2MCd9P6WA4=;
 b=Th9E3mj0ec4Li91mcZbtSm8xyRJTyzITt4H3yV9xHXG6/ouwxGoBeQ7dtVL4V16JqLICLlehMrvuST0k13PSBLELR6kqamXYHXwCPFSphFiKvLb6rPyUZOAOirj9yGvo6/jI2vYroC7IygK305qUO8dM1YJU9qSvK86qu4/NDBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MW3PR12MB4348.namprd12.prod.outlook.com (2603:10b6:303:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 13:59:42 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 13:59:42 +0000
Subject: Re: [PATCH v3 7/9] i2c: piix4: Add EFCH MMIO support to SMBus base
 address detect
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
 <20220119230626.31560-8-terry.bowman@amd.com>
 <CAHp75VdtnOuBK1ctkjO59vujopCrQ+MQ_LyBB+Mi2HJk4HaJuQ@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <40800069-e04f-795d-41a8-db8cb60bb96f@amd.com>
Date:   Thu, 20 Jan 2022 07:59:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAHp75VdtnOuBK1ctkjO59vujopCrQ+MQ_LyBB+Mi2HJk4HaJuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:610:e6::9) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06de990-098e-4d75-6b6f-08d9dc1d1b8c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4348:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB43481E96E786C0B6C7BEA52D835A9@MW3PR12MB4348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dK+YukSDtiwBcosOaCcEEvd87SsoJyk/AksfvfTKifD65fyja8SYLyua9b0sziWIpHzQZcyB9ii2zzMf60CjDiL5FF96DbNRyveWX/ljubxMZIjIWSMb1kFzvQJrT20hoOo7SBNtfmUvXAWq7BDnCBXju7aDwwym7Yb7o6AHN8hkpILT0suvrBHXiO6+RaMRDXzjC+IGnkeVMCNoS7bn+e8XxYo/5Cy+Irbu9k4OFSUkhAPG0LthXbwwkR06id3KdkGoc7I+v6y6Z4ugMw3eRj5DjGa5aeOkAbjb0obZfWThsyv+NFU9GeQy2uSRp8LnMdVuhU84sjhiUJi97w7avW6+R4LuD598mAD8OVkoxhDDLB9tAVBqbcrR2/7WN25qzcOrdF4MJNYNZPw+NN5CJvfoRi6IKlzsUwgFZ5979AwEttWJ3P46TvXfBbTRhEP3RunAyqWWdgLWnW/t/HUtTU9bVFjuJcqpvkMxxU2Py0S44Ln1hfBPjrjVvg+uVC3rNnfb5zkUIhGXbdwMGbQtWEnEMWlLEu4RsfIrVCcnCOb79wNOJYoRJHa5PowAPP7tuZ7zEHpnn2kdJWkOKBBzfLBO37W13Du9dZR1oCYCiLZfX/AmHFOG8dCCBj/j9sdtPQdRhRw7W1sSzglxhfU6ybmTsGIOff4FweorAheu6uydbmR/ZJgfkpG3KvBtwulc7EMZbYM5RM4cBpYxnbW/Alv9MqCrT14xhjNnLL/jaXNKuJH83jlSNRTW/fVeXQX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(53546011)(6506007)(54906003)(316002)(6512007)(8676002)(508600001)(6916009)(6666004)(31686004)(31696002)(86362001)(6486002)(4326008)(8936002)(83380400001)(186003)(66476007)(66556008)(2616005)(38100700002)(5660300002)(2906002)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHFkalhRSkZjNVRTallxZjlVM2cxSDBwSzhwS3JsVlN4cTBvbW1qMW1Rdjhq?=
 =?utf-8?B?eHRDQjk4TzlraEVYTkZkTVAxd1hXU0FrSFZQSTBWQVA2VlpRMWlZNG54eHMx?=
 =?utf-8?B?OVIxZVI3Q1hYbVBkaVh4d1ZrdEpJWGJqbjVpdERHbjE5S212VTNTTHR2ZzB3?=
 =?utf-8?B?bWZNdmhOVEphNDVuVzFWVUwyejdKM29vNzFyNEtnTitVVjNrUWh5cWxpT1RN?=
 =?utf-8?B?MHA3SEJDRW1UT1pKd3MrVkhaM3YzN0pCRElSMDljcDYvd01tUXk3b1RGZ3RK?=
 =?utf-8?B?N2NoKy9PbnEwbFpZSkh6bHo3M0pNTStGbFZub2lyREVIeWJsWFVlMTIrY2t1?=
 =?utf-8?B?b0ZwQ25LMGppc2NnZVJEYlgrdlZVT3lSaGV2aGw3NWxxK1NLUjNaMHBCSHpB?=
 =?utf-8?B?UmR0eVNSSzZ4SUxuWWkvY2pNdUk0SjdWT2JKU1NVRFhmM1BvbTBNRDRaQ0RR?=
 =?utf-8?B?bFNiL2tsa2xPdTNtcURyUHpIZmgzdGcyaE0xWDJyUzUwWVFWU3ZBYnNCU2V5?=
 =?utf-8?B?eFF5YTl5MWE2VTNURStsOTBXNFdIWmhycEhqNlc2eDd3WW5UbUlIZVd6anll?=
 =?utf-8?B?L2lUS01IM1hZeEVKeHlpMW5LUGtYUEgwd0RFUFpCSmIxMU1nWSt2SkUvTThX?=
 =?utf-8?B?MTdNa1hXbjNFYjF4NytEbHRZQ3FnRXM1RGdobVFvNnl4ZkJsalFNT0RxR1po?=
 =?utf-8?B?TUJGYXc4d0ZhMG1DT2N2WnRqc2o3YjV1SHVIQXVlbWY0c0RMbkx5OUQyc2Rr?=
 =?utf-8?B?bkRnckN2S1dTQ0VYZEgwQjh5c2R3S3RkNmI2VDVHRW9qUDRCOCs3RnB6SlE5?=
 =?utf-8?B?cDNYQzkxenJRcXdoeU1WNUg1YUpBM29tMFVLOU91WXN4UXdkczlRM2Znb1Bv?=
 =?utf-8?B?eERJREcyOTh1WjNacXArY3RaeHl5SzFBRnBoc3NPWEpMajFhTGVUeVN6VHBL?=
 =?utf-8?B?Yk9DOGE3S0V6cXZ0dnBkOEJ1SmwwcHRJSzljcFJiTTBNODl4RVlwMVNlMU04?=
 =?utf-8?B?Z1N5WkRyc1lONG93bnRGVHhyMk83dmlUS25PN3FwVHVNQkI3TCtQZlVvbk5Z?=
 =?utf-8?B?Q1FWeEhHUUwwUWMzUFNsZ3JNWEI5b2hUWVFaaCs3Z2FUYUozYm92cG5aVVNo?=
 =?utf-8?B?Z3BpT2tNQVpDTU5DUnZxREpvbjhBb1ZrcHJZWC9tTWpQeUt1ajIvTkpseFRU?=
 =?utf-8?B?WE5Hdm93d1hPRjMrdFloc1d0UU5QeUNyYnd3d3c2ZFQ3YnRIS2FxOUJKR3Ny?=
 =?utf-8?B?ZG4yUlpkbkFSYW15bHMyQ2s2SGdRUy9OYWlqOWZhZHVRSGQ5WGw0ZUYxdE1N?=
 =?utf-8?B?VUdJRmVncDhOYy9hRG8wNFg3ZVhtV0lIZHJVRzZRQ3ltNnNON3c2Q0FzNm4w?=
 =?utf-8?B?TEZoR0dyR2tDWXpaSzJmUTZGZjhsZmovWGFoNFJ6SnIzZXlzTFdtT0thR2ZF?=
 =?utf-8?B?ZDFvSjRmcmsxVnpyT2tiUUVDcEZIeWhVQWJtZWVITExXa0FxZVZva1NSdWJj?=
 =?utf-8?B?MDJMR1VSRS9JSnhCZmtiV2NqNUU5NFRSR0hSaVoxdm5pMEdkT1dWWkJDSGov?=
 =?utf-8?B?WlBDcHZsV3F5dDNTRjQ3aGxUQllXWC8veGc1RHJySVd1T3BRamNHdVVrbm5S?=
 =?utf-8?B?OTdhR2hHSGJzYTFrUUw1WFF4Vm1yNkFVWFVJcmRVa2Rmc25jeWNBMnNPdm5s?=
 =?utf-8?B?WWY0TkNoNDR4M3RvOFp5L1ljV21CVDJRWnRsbGVqTDQ4NUlDRCtEbCs5aUNm?=
 =?utf-8?B?a0h3eld6SUdJbVljbTdObUgrU3liSi9IaVpkc1FRSHRFbE91bTNmaXZJUnoz?=
 =?utf-8?B?SXJPdmp6UjVCczZzREc5SVJuM2drTmVuQitHcUdKenp6ejhLcGIyazltU3A0?=
 =?utf-8?B?ZW95ZXRVT3hHOWcyWHA4SCthS1Vra3BHQ05wc3grRVpxUmNUeTRWNWIwaWZm?=
 =?utf-8?B?MVpCRFZHUnpLL3BNTW95ZHRBOXZka1dXcmlCMk5KSmJyTTFLTGFPcjZMeHNl?=
 =?utf-8?B?OTI4a0R6VzJ1VXJ4eHhvNjJXckF0Lzg3bGNjV1lScUlCUlMvRDY4U0lXYzR0?=
 =?utf-8?B?Y0JVa1J0dlByU2llK3k1VzkrMEU5VlN1TU5DN0xiT1VhNXJxcXJWVUhTK2pC?=
 =?utf-8?B?WlhRTzB6WDg3em4xNk1ubzFVaDB2ODJqYzNiNWVmN3lOaXQ5N1FVVDFjdGJ1?=
 =?utf-8?Q?627xFJLAFY4OlJCGSQLKes8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06de990-098e-4d75-6b6f-08d9dc1d1b8c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:59:42.5235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Nj3nPW5mfYm5pOITiLwbv8ODFE+sOweleuL4n1PN9GRWNOP2mOs7InZ3WTJxcLUquOwlUk+lzWSmecwrQg2Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4348
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/20/22 5:27 AM, Andy Shevchenko wrote:
> On Thu, Jan 20, 2022 at 1:07 AM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> The EFCH SMBus controller's base address is determined using details in
>> FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[smbusasfioen].
>> This code also writes to FCH::PM::ISACONTROL[mmioen] to enable MMIO
>> decoding. These register fields were accessed using cd6h/cd7h port I/O.
>> cd6h/cd7h port I/O is no longer available in later AMD processors.
>> Change base address detection to use MMIO instead of port I/O cd6h/cd7h.
> 
> ...
> 
>> +       if (mmio_cfg.use_mmio) {
> 
>> +               iowrite32(ioread32(mmio_cfg.addr + 4) | SB800_PIIX4_FCH_PM_DECODEEN_MMIO,
>> +                         mmio_cfg.addr + 4);
> 
> Can you split this to three lines (with the help of a temporary variable)?

Yes.

> 
>> +               smba_en_lo = ioread8(mmio_cfg.addr);
>> +               smba_en_hi = ioread8(mmio_cfg.addr + 1);
> 
> This makes me wonder if we can replace these two by defining
> 
>   u16 smba_en;
> 
> (below also may be easily adjusted for it).
> 

Yes.

Regards,
Terry

>> +       } else {
>> +               outb_p(smb_en, SB800_PIIX4_SMB_IDX);
>> +               smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
>> +               outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
>> +               smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
>> +       }
>>
>>         piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
> 
