Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E6E4A65B3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 21:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbiBAUcw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 15:32:52 -0500
Received: from mail-bn8nam11on2042.outbound.protection.outlook.com ([40.107.236.42]:62273
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234508AbiBAUcw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Feb 2022 15:32:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxaRTrb7iarbZKJMtd8WBZZJEvxvq4OC+7E9uIu0zx0/tBtxh0BBInlq6WOrHv0jTOhZuMd5A7G9XDCFofB+0znZy5+7Fiw2ixqRGmLT+ezXu02+WHGnYWoqaipCjXtkHyVBjemnExuBBTxcezdqQMh5TsY/OtEoHqVhnIdcpkQ/AmBUTKO/azc/oAiT2g+knm4y2ep78cBmp6ZCuO10kJ0qOeHr+Nqm7B4BOsliQwMUdhNOYs3CVnet6A3A0Uu4u3U2d/3uD1Vvxc7etoHdxdcQizF1U7AstlfjAkto881lrIhzeP+EYOd72B7s87EFhc9sMJ+n6kG+4a/54cAJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAr0PN9Mdu12VvreB6PGXi/rwQnRVUB9deSb4DERmNQ=;
 b=c04Y6zQhHizIDQilRHB+6XDalxphBk+2AhQilDj9Kg0jcSYVd/THwUnMHrhppDApVbBJLgaM+bJcAainbuHXeTREk2Wdk2fGTHZWViC5hKd6Md9NidiHec+a6EDCpI3JEjdCsoomw71+qqenmpzJtyx//LSjLu0m3TNTOcXpk0CcfDodsznbd6y81q/gEEz4Y79iuOqq4x1z4b2NE7o43Bm727e6U2djHDt+XfW6GMsu+KRQ7NlupSaqfc9XjAT9SzV7aslJ++8OBJMUwOFJbiGH7fhL4aHR/Odfy2p6I5/Kal3YXwND7lYRolanyNDgza+IQplwNWL5a1IPpv+i1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAr0PN9Mdu12VvreB6PGXi/rwQnRVUB9deSb4DERmNQ=;
 b=ThC4lIcouk9w2AJOc597tYxxUvbZlkZhsynItqjGNz+C8Ro/ecrxd3MOTBuwCusb5a/P8kG8GdXZ6YgAA5EzdReNmyN2iBMg8h2D05fPszJVJO3cfixYcTb9o6w33PqAFGYy77YymxQhKo+dp4TekYCCvF1xtA1WGdlVr7Fsb3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by DM4PR12MB5358.namprd12.prod.outlook.com (2603:10b6:5:39c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 20:32:50 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 20:32:48 +0000
Message-ID: <e7112674-05e2-93cd-b8f9-3e31f173238d@amd.com>
Date:   Tue, 1 Feb 2022 14:32:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Content-Language: en-US
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        jdelvare@suse.com, linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130191225.303115-1-terry.bowman@amd.com>
 <20220130191225.303115-3-terry.bowman@amd.com>
 <ecf12beb-a03b-2aec-1dc4-8183a8b6daa6@roeck-us.net>
 <c1d121f7-f482-7913-eced-4fbef962656d@amd.com>
In-Reply-To: <c1d121f7-f482-7913-eced-4fbef962656d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:32b::35) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa2c3955-6490-44f0-9e0c-08d9e5c202a4
X-MS-TrafficTypeDiagnostic: DM4PR12MB5358:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5358E4F55AD16AD7FDD4A56D83269@DM4PR12MB5358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wfD983KnGGwJIhUBeP3x7eXGpKdL2c0Yep4YT9+L3Pg0r3hYC8MGJRUZfq/4NCrsRa4ElxtQbviQjBwEzJraU7fTDGrU8xd1NugeQS/fh/gvgwkN3ckjaM6zzfPfShv1cRpFv/Ev+pHKCiKTY1sF6sWob7TYYXiIKqpTvT7vuWlxXzWGMITXNvE5StLvZYZ0ykShGiNuHVeqZHUAYokHalKb6B6ZuAVGH/OVVhNBeW5xgxNJKuiNrFDbP+xnvIrRPoUyvXpz9nZqAmXkfP2Gbqg4xIC77cgiLqKbBB7PJFuoFLA9Fyx4N3N6JW6sw270+LpgdVYVnZqmG+KNYy88toDu9F2lt9pNv7yLryltaFJBsSQ2S3Da/QTkes4csiQMwqF4AqiLfxUe86Btzo2GAp3pbL1L/srQex0vk29oU+7YA708d1FxrWBTGnOkY9JzjxDbuza2elTJZnXYCEm/be4bHNH2kLOQRMzaXHVufiYv/qv81RyBbApZFRC8PhLZCLNDnLp3i3Hk53P/nPowCuV6H7UHp27I1urWZLz6ti/dwIGVyY/bQ/qfcNzGIazTcKXFkqoPyy3P1TWl7UPiTWpWPrz6/Ce5FttjlbYz8Wk4bebIzHEmchzqUjNcZnR1EgbHxDGFsiEh+ONwLHXkQEfLWHhWK6sllf7ofwNdSSHPy2FwoRWNQ4HEN6eZmy2NQoh17Ev26MTP8vlDBbbr0SvSEI12/fENg0QMjAGZyRIQ31ZC+I045vCcrY+LFce
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(66476007)(66556008)(186003)(8676002)(31696002)(6666004)(508600001)(6486002)(38100700002)(26005)(8936002)(4326008)(86362001)(66946007)(36756003)(53546011)(6512007)(83380400001)(6506007)(2906002)(5660300002)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVhRCt1aGxIOFphR2ZUcWlwSTVQa1plWkROYkNPUGxOVGh1SU1aM2hhaWpG?=
 =?utf-8?B?N0VzeXdsK0tMSjIvcGwwL01oSW0relczNmM0SW80OTJJazhQNEtNdUhIQm9Q?=
 =?utf-8?B?cUc3MHI2cFMwZkszWWdUMUVCNlYzbXF5ZzNra2hRMllQd1puWEdkY0F6eTVz?=
 =?utf-8?B?Q0dzbmcya1pRQmlVZFdIREZvdGEvVFMyZ3ZuT3pxakFlL2RQNm44RnVkZjk2?=
 =?utf-8?B?MTJyUEpaQ3RwTzJkRTZ0am9JS24wQjNWdGl2TVJhQklqeVhtYmxOQmI3K2Vs?=
 =?utf-8?B?VjFZNXpUVjdVMXNsc3ZIelgxQ25YcG1Pay9kcDV1YjlxNERRYXJHQVR2SEEy?=
 =?utf-8?B?UlBNa1JaRmVwemVCTGpnenZxTi92cmUrbFM0d01mUzBTckt0emVEem0vWkRQ?=
 =?utf-8?B?dVNsb1NXYW50aUZISjYvRjBONmRvc3dQbklwQW9DQVFtdndESzI3UjkvVkRn?=
 =?utf-8?B?WElyKzhKam01eHY3aE52aWx0R05LaTE0Skh2c0VEU1dtZXVQclJxclRsczBa?=
 =?utf-8?B?cEFVU0ZJeU0xYm1KYlJONkl0bUE5ZVh0eFpmM0d1WmpZRkVxeVovRnBaR2JI?=
 =?utf-8?B?SHo4VitwbTRZaCs4MWswSW00TnBXdC9RYXJaRUF0eitKM2p1NFMyenVXQ0Fs?=
 =?utf-8?B?eW1KSE5aTVZ4VmVKRWw0REh0ZDhORG1DTXhiUzlXWEUzTzg5N01lRlc1RjJE?=
 =?utf-8?B?TUU2QUpuN0ZYNElUZytCN210S0VwR2VXaUJDRjdHbGhyTmFrWEUrdENRWTQx?=
 =?utf-8?B?OWo5MG12U2l0VEhCdGs4TG5FSThzNUhmUXVocmF6WXUxRDB3K3RUVWh5dmNV?=
 =?utf-8?B?azhyTlZFbUc2NnBxcm8xK2hjU1JnaUFDVHk2ZDlKeUxnQk8vWkdta09sdWU4?=
 =?utf-8?B?NWQwdTE3bVRQK3dLRnY2TFpLRkFZclVmdUpRaFBEMHp1bW15UE5wcnBDektG?=
 =?utf-8?B?K2ZJUWpabXk0bDVaMVg0VE83cGlIdGd3Zmlid2RkU1lhaDV2YjNLRXp1a0ti?=
 =?utf-8?B?UXN5a2ExQitkMkJ1Qkd3VkFYd0J3LzBLR1pRQlhmZFFBc0lwU3BUSVpYWDRz?=
 =?utf-8?B?ek00a21IUHkzVlVhUDZxVUdtQ3FhL09Eb1hiTnhUczc1Q1V5dmZvWFp3Mk9Z?=
 =?utf-8?B?U3BERC84dE5WQWVEOUFYOXgzWFd4SWR4L2JhODUxVnE4ZksxOStVSytrYTlv?=
 =?utf-8?B?YkJhd290OEIrWnZuTFJMMlpEa0lxcGxjZlFVSkozeENYTWNtTlZoaCtIV1F2?=
 =?utf-8?B?WW5iMmRsWWVZWGVaRGVBbU1pYmxxRnJVbmNvNDcrNDA5M3RZbDh3bzlDbUJK?=
 =?utf-8?B?Q2dhaGN5WS80UlV6SGx3VGdiUmdIbzREcUpBY1lFNHB0RGtISzloSW9uaWwz?=
 =?utf-8?B?Yi84R0hyOWN6QUhEaWVNZnduY2ZZZkNCS1JpMGVoQkJtYUlrdEkrTWxISm9U?=
 =?utf-8?B?bWRtOENXNlVjbEtuRW40VFl3VHM4M2ozeW01V1NXK09kR2o1VDRiMXBGNkdW?=
 =?utf-8?B?TGswSXQxZWdQRkhxYTVrV0tPMERhSTNBS05PSUZVTlF1Q29Dd0RsaGs0bThQ?=
 =?utf-8?B?VDFveFpINlVxMXZ5THVVbFdDRFUreFpOTWgzSHJFUktLaFEzYXFTazQyM1lh?=
 =?utf-8?B?TVJRSENWSWxnVEdhYXFQbEZuZlNCaU4yZWFwdml6WmxwZVQ1ZlVaUlZOK3ZG?=
 =?utf-8?B?c1NPam9Ra0VDVXlVMkFUd3BBaWtjM0VqWWJpdzM0ZlR6TW1JdndzbC9ZNnBw?=
 =?utf-8?B?dnRvSUxZNmlwOVU3MDVsbkl1SE5pbUIrd1FmL09leTBuNlhXL1dnMUFLbFVx?=
 =?utf-8?B?RXh6cEY3L1NXdTJMMm12MU96dnJpaTg4eWtwdVlBVnhnaERBcUdPWVBRaHA3?=
 =?utf-8?B?ZzdBUmNhVFpSMzl3S0NOMnJBSWY2STluVHRvQzQxT3dhcEZoVGh0dTA3bG9J?=
 =?utf-8?B?YXU0YUJBNS9kSWNrT20zenJnOE96Y093RDNMNnRyWG5MUU1EWldjeWV6TWV5?=
 =?utf-8?B?WlpvVFhjVTllem8xNXdvVDFxRlRpZ3I1OUJmYU05SC8rL0h0dU1DeHZlU0tm?=
 =?utf-8?B?U3pEdEIreHQyTHFsUHdWbnRieS9yOEl2YUFQc1k3dGd6cnNjclNNQ0E3NHZy?=
 =?utf-8?B?UXNERzNHU29keG5KT201MytrN0JYM2UyWTFXaDZLbVNPd2V0cHNHSU9HamN6?=
 =?utf-8?Q?pAUzIy2q8dk7XapDRPrdr0k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2c3955-6490-44f0-9e0c-08d9e5c202a4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 20:32:48.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aS7FqP7tdVMMJo+2qMGzAk/dLiPVTp+qqmU7amyPTFCx8EtBDPgW9OQEvrhUnnCk5hHa8r841mZrPS9gBYp16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5358
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/1/22 10:46, Terry Bowman wrote:
> 
> 
> On 2/1/22 09:31, Guenter Roeck wrote:
>> On 1/30/22 11:12, Terry Bowman wrote:
>>> Combine MMIO base address and alternate base address detection. Combine
>>> based on layout type. This will simplify the function by eliminating
>>> a switch case.
>>>
>>> Move existing request/release code into functions. This currently only
>>> supports port I/O request/release. The move into a separate function
>>> will make it ready for adding MMIO region support.
>>>
>>> Co-developed-by: Robert Richter <rrichter@amd.com>
>>> Signed-off-by: Robert Richter <rrichter@amd.com>
>>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>>> Tested-by: Jean Delvare <jdelvare@suse.de>
>>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>> ---
>>>   drivers/watchdog/sp5100_tco.c | 155 ++++++++++++++++++----------------
>>>   drivers/watchdog/sp5100_tco.h |   1 +
>>>   2 files changed, 82 insertions(+), 74 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>>> index b365bbc9ac36..16e122d5045e 100644
>>> --- a/drivers/watchdog/sp5100_tco.c
>>> +++ b/drivers/watchdog/sp5100_tco.c
>>> @@ -223,6 +223,55 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
>>>       return val;
>>>   }
>>>   +static u32 sp5100_tco_request_region(struct device *dev,
>>> +                     u32 mmio_addr,
>>> +                     const char *dev_name)
>>> +{
>>> +    if (!devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
>>> +                     dev_name)) {
>>> +        dev_dbg(dev, "MMIO address 0x%08x already in use\n", mmio_addr);
>>> +        return 0;
>>> +    }
>>> +
>>> +    return mmio_addr;
>>> +}
>>> +
>>> +static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
>>> +                   u32 mmio_addr,
>>> +                   u32 alt_mmio_addr,
>>> +                   const char *dev_name)
>>> +{
>>> +    struct device *dev = tco->wdd.parent;
>>> +
>>> +    dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
>>> +
>>> +    if (!mmio_addr && !alt_mmio_addr)
>>> +        return -ENODEV;
>>> +
>>> +    /* Check for MMIO address and alternate MMIO address conflicts */
>>> +    if (mmio_addr)
>>> +        mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
>>> +
>>> +    if (!mmio_addr && alt_mmio_addr)
>>> +        mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
>>> +
>>> +    if (!mmio_addr) {
>>> +        dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
>>> +        return -EBUSY;
>>> +    }
>>> +
>>> +    tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
>>> +    if (!tco->tcobase) {
>>> +        dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
>>> +        devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
>>> +
>>
>> I know this is the same as the old code, but I think it would make sense to change
>> this as suggested by 0-day and use %px instead.
>>
>> Thanks,
>> Guenter
> 
> 
Hi Guenter,

This line was changed in v4 and should be reverted. It should be using the mmio_addr
physical address with '0x%08x' formatting instead of tco->tcobase. This would be:

dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);

The dmesg then provides:

[    5.972921] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    5.978238] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    5.978252] sp5100-tco sp5100-tco: Watchdog hardware is disabled

Do your agree?

Regards,
Terry
