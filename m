Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904784A618B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 17:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241221AbiBAQq7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 11:46:59 -0500
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com ([40.107.223.58]:29313
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241188AbiBAQq6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Feb 2022 11:46:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9viYNmEcnzKjvWQGgQkY6PhFrIcwNVCAYS+o64NmwDJtoaHn5VVo3koDDbWFUQ59sjJ1VKBNq9AraFUt8hUk96vKwQXUQg0tQ+MlNlzJYL5o2rhqooaDD27AaOSi+kTAO4eNbSs4qf1HvgLf2AWhTj7XGEfJHkcscYaT0gvPPC/4igvmzbgSqZkQQOwC+oAtetytpN+EiliCSNwjsxbJX5yUh+WnSVfnwv0WBfY3JFptle+iJAYv9qW/4JL48aYQ/OaZq4QLasDnD43VKmHCHJab/ANuQFe9d72vSHObl6hvFsBGpfZ8NEiuixFUu9T0nSkvGSooxLm0OAKXOI+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p8yn6zTw6bansx+EFHPoCYeuHafNdKjcXengIBhFEE=;
 b=NeEXfX9zy/YqA22/G5nkHgPAKQeaf+8r0fLHPkCRCjJaldChyy14txDe/CA9AH0WUNoD1L4CYSStomByMAXDkg5V2XfTL2wioEi/J9EhxOHgo5HSFZui2rDKYUSwwf8sYFIR5CspuaYZ9tH3xYTLBxFRBNK3WnAc9QyzzagmDT9WcFg91WdlbGSZqcJjnbJXDeLgHMILxBDduVuM8Eaz1XvFsKZ9anytrp4I41g/3mMulN41+UfHXobIx/9YM0p5GiVlnkbUTZkcTzDtvX6UcJOEkdVH5r7d3iCtz9JGM0L4UtRLgOV5Z6A0HSwjxdu3TMAmA64SSUlgPS0ZBUQzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p8yn6zTw6bansx+EFHPoCYeuHafNdKjcXengIBhFEE=;
 b=g2uO1GT38Fsg0vUShTVKXMa06PdKk0ICpcRHd+Ws+gzIaSSEuxe/lCup3jQTbvdS6Ia9P2AYnQXIB3lAiYtb41tuZn9JDjZkOQYtrgVp+TXoMiTyFiHzMCNh+4QuxwiF1JwhVrQlYcwmdHhhaLpPfw5NsPcGadEdhnElR9WaweQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 16:46:56 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 16:46:56 +0000
Message-ID: <c1d121f7-f482-7913-eced-4fbef962656d@amd.com>
Date:   Tue, 1 Feb 2022 10:46:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Content-Language: en-US
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
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <ecf12beb-a03b-2aec-1dc4-8183a8b6daa6@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:207:3c::31) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2171333-8eca-407d-4abd-08d9e5a2753e
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4868DB6EDB470AE27699458383269@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tV2ehV4mEdqkMJ8BPsh7W7jrMumeW1lUeZQL8J/Lmw/kOTH+/S03slMjxEKrVMp9Necml314LmWa0Ir9HkhxjBcWloczThuMcBrFlwZdx8itnMsQfBtX5SIIqdA8O6MJzN1ZgPTkNqti36a5lLqblsNx8VSf5VYab3OtsG9uEeNZDW982MwhA01kKpkLGqWl7ddpUN99hupMGMk6skF7Y6dnRIugWzkn/knAP5XKEjpQ8tfoMEDVbY9+SrqReg+opfxOy5ClNPEzGA8xBfuwTypOqShQZWhs0TRVeinCBnx3lqWU+XJCKnnnTLlWqu2KEriMhrnOWUYkXHF3/qBgMDGJR4Nti2HCEq0G1kdhBqoAmUsdrL3Sb01kaM3MgXlm3eHLJuKQ4T0bMgMGwud/U6Tv9xlVL/pi8/xhZFQzlBN+TMJxaQSQjttUeezehqjIpruTF0ux2qS11wx8zam3zmE5aAySCKlaIMaCpsvTG4Yyy1QK3JXebS0BQH9t7YPngtbD5jwdOw5EMdqTz9N9uoNHCn7lI46473cbd1YPazSvQAUh+76K3h9VHbOJ9Riy65VXD+KU3z5krvAX9riP25BtfbazMQRLR7sMf79SE8jHDEtRbb0TE9Mi9Zp3ic8OP/2S9zzzvIvtulQP6QeLgnJSevwuOpL3dpnt2CLe88bNdI3CsJWgh1apJTLjpfYePTi+N9hJmxP7agqymnybyp7qnjmjv7DawZM0/c7RWytC6AI6nUltAdQSKsH8LamL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(8676002)(6506007)(66946007)(26005)(8936002)(6512007)(186003)(2616005)(6666004)(53546011)(86362001)(83380400001)(66556008)(66476007)(31696002)(38100700002)(6486002)(316002)(5660300002)(36756003)(4326008)(508600001)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDc2b092MzkyNFdRdWJCeFhoZi82dnk1WVFBeVU0RWpzdUwva1RNL0NCZk5x?=
 =?utf-8?B?VTNpMFg0bU9xTHJvWE9peDNSSGgxeGoycWFlRkZBQUU1ejVDMWxUeWw3c0tp?=
 =?utf-8?B?ajRCaUxYUTdQVVlmY3JYYmFqNnJpQTJ2MHBNRHhsdmtKN2JrdGJYTUZxTHNq?=
 =?utf-8?B?bTc2TFlNc3RuSW9ZQzRQcUMxejU4NGdlRlB2WWNxeTJaNlA0aHdiU0trYkhO?=
 =?utf-8?B?MHRmbU9KNGwxMzlrb0p5R1hzRU11TVZHUHV4S1E5OXZrTjRiaVdSWSt0T2Ji?=
 =?utf-8?B?WXZDb1dLdStRRTgrcnBSNEFJZEhSSW93MHdiNEUzQjBqNVMxVnNvQVRhNC9C?=
 =?utf-8?B?RXU0T3VGNmJnRnpJbC9VRnRPUXVibHhISVNUeDhuaU5wVzhCd25WTjZrTHR4?=
 =?utf-8?B?VDIxczNaZVJhNWhZUWVSNEw2eTFmZytQMnBFcmdCUFlYUXNqTUV4OVdHUUxH?=
 =?utf-8?B?OXpiaURTc0pCT1VOeHhzTXRtb0VCekZFc2ZNZTlIb2phajBXMVhETnhWY2RS?=
 =?utf-8?B?ZzNkRERqVTVkS1l3b2J3czVUbTBPdWpkQ2hrNzRYVGUwZzJ4YzI5QWczMjNp?=
 =?utf-8?B?Um8yUy9WM0xBTjZqRjI4Wit5aDI4ZUtWWVVYZ3VmZ05iem54UTMzS1RWWlNN?=
 =?utf-8?B?bk5Qbjg4Umh5Q2ZvTUN4S2M5MGFRdE53aXJRVjFCZ0NjeWZiWEtJemlQWVZx?=
 =?utf-8?B?U3Btb2xTSlF3WXlNTWppWHhZMW9DM0h2enZBRVpxb2tZdXE1SzJaQ3R1d0pq?=
 =?utf-8?B?ZFFBSHlGMUpTVlRnN2lnL0U3cWVxY3dhNTVWOHkvR2hacUo4SDkxV2NsUDNh?=
 =?utf-8?B?N1ROdEtTanRpRXFJZEs1TzhiLysxcVlFSC9nNGU0VVhZaDJsektodUt4ZWNP?=
 =?utf-8?B?MW5KTjBiLytOWlNpdUZoWTN1ZC91YmZQbWhnOWE2VWpFRFVmZEYyaGtydkVt?=
 =?utf-8?B?RjhrMVNKMGlpWWZXd2V6MXhpZFo4SC9aR1hQd2I5Z2dwR1B4bXpQWHhkT25w?=
 =?utf-8?B?L0xpNUVrdVVSVlZPQ2ljbk1lS1ZzSk1JNTN4aytEMmtML0tXQkhoNEt1VHE3?=
 =?utf-8?B?TUh1MmJ5ODh2N3R2QnMyMmNEMGFBbXB5Z1ZqQko4UW5PWFIvZkg3QTZZSEZT?=
 =?utf-8?B?SDVscks3Vys3VmkxQkZzR1hiTnRwaTA1WXcybEpUOFJZMUc4eE02ZlRxTmpD?=
 =?utf-8?B?aWxyYzJkallrSEJRdVhoWnppdmEyK2U4RDE3NkplWi9hcVExM2JBbmdKdjE3?=
 =?utf-8?B?Z2EzZzJtSmNOMHBIQWtvMnZUbGxVc2dFQUVVOFZ5em1acjhpK2svdFJ4WTFX?=
 =?utf-8?B?VlpEZG9WYnYrVERkbnMyZ2tVQUl2Q1ZWTFNBbnpLblY3eW1sUG5SS3IzQUYr?=
 =?utf-8?B?cERUWi9hSnU3Nlk0Z0t6OU5iTjBCbktsZGdudDJESXd5SkhMdS91QjVsejlw?=
 =?utf-8?B?TCtYSFJnRzRuU3g3YUs3OEFyWWFKODV6Qy9PYS9LV3hPMkUxbk52a0lxV2gx?=
 =?utf-8?B?VnVWZWtwQWNqSTJBWEV4Q0JZQ2tra0tibVRCdEU2L3JqaXJsNGI2SHVKeW50?=
 =?utf-8?B?TmJVRFU5QUZSS0dnOWRmRUZsdUpNNnNjMUo1ZWF6VW44SmJNN0tZODMrb2pW?=
 =?utf-8?B?RlJ6SVJEczYzTnR0ZFVqN0VBb2pWNW5OWTVjcy9DZEtZUHZyc1k3NGVPTTBH?=
 =?utf-8?B?TTlIWVVqS0d3NlpSRXkzaGEwanZmekttR3NQdWFxb1U1Q3g3VDk0SGxPOHd6?=
 =?utf-8?B?NHpVOGZmbG8vSkFxOXUrL1lGRWN3VWNiT3JVREpjZU03VEZnd1pMMThhc2da?=
 =?utf-8?B?Q2ttMzdsNkFVR3hOVTV3YU84SjNMeUxWcEN4RjF4WUV4ay9Kb01HbDREVkhX?=
 =?utf-8?B?S2l1WEVIUzdRYWE5UDNLWHZEZ0crLzFSWnZOVkI4UmEzRW1KVW1HS3ZFZW1L?=
 =?utf-8?B?aHE3K1UxL1JLbDZlc2dCb1h0OWZvUit6NzFqd1dTaGlVdnk4TmxoZld1dUFO?=
 =?utf-8?B?RUp3MUVvRE9tYXp2YS9oeHppK1BabCs3VFpkSnhTcHZMQlJrd0haVC84ZFBN?=
 =?utf-8?B?MVhEdjNqcGdCOENBby9ua25KeHhUTE5FWGNaWE01cDN0K29DMzBnemd2V0hk?=
 =?utf-8?B?eFlUVGZmTDdFT21QTmJNenRxVzYvYjgxWWNweklFR2k0WXE2T3BCb1ZEeGVC?=
 =?utf-8?Q?sG27CnIbUuWirTXaVWFx7as=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2171333-8eca-407d-4abd-08d9e5a2753e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:46:56.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiRpoMR3oySE6+Ebh95piJejc/fLb0sNmYjOyb5R2KTmqiljYl968Pzgu6hRbDPVLPLiLDj2m7Mv6LruFiW2AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/1/22 09:31, Guenter Roeck wrote:
> On 1/30/22 11:12, Terry Bowman wrote:
>> Combine MMIO base address and alternate base address detection. Combine
>> based on layout type. This will simplify the function by eliminating
>> a switch case.
>>
>> Move existing request/release code into functions. This currently only
>> supports port I/O request/release. The move into a separate function
>> will make it ready for adding MMIO region support.
>>
>> Co-developed-by: Robert Richter <rrichter@amd.com>
>> Signed-off-by: Robert Richter <rrichter@amd.com>
>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>> Tested-by: Jean Delvare <jdelvare@suse.de>
>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>> ---
>>   drivers/watchdog/sp5100_tco.c | 155 ++++++++++++++++++----------------
>>   drivers/watchdog/sp5100_tco.h |   1 +
>>   2 files changed, 82 insertions(+), 74 deletions(-)
>>
>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>> index b365bbc9ac36..16e122d5045e 100644
>> --- a/drivers/watchdog/sp5100_tco.c
>> +++ b/drivers/watchdog/sp5100_tco.c
>> @@ -223,6 +223,55 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
>>       return val;
>>   }
>>   +static u32 sp5100_tco_request_region(struct device *dev,
>> +                     u32 mmio_addr,
>> +                     const char *dev_name)
>> +{
>> +    if (!devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
>> +                     dev_name)) {
>> +        dev_dbg(dev, "MMIO address 0x%08x already in use\n", mmio_addr);
>> +        return 0;
>> +    }
>> +
>> +    return mmio_addr;
>> +}
>> +
>> +static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
>> +                   u32 mmio_addr,
>> +                   u32 alt_mmio_addr,
>> +                   const char *dev_name)
>> +{
>> +    struct device *dev = tco->wdd.parent;
>> +
>> +    dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
>> +
>> +    if (!mmio_addr && !alt_mmio_addr)
>> +        return -ENODEV;
>> +
>> +    /* Check for MMIO address and alternate MMIO address conflicts */
>> +    if (mmio_addr)
>> +        mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
>> +
>> +    if (!mmio_addr && alt_mmio_addr)
>> +        mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
>> +
>> +    if (!mmio_addr) {
>> +        dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
>> +        return -EBUSY;
>> +    }
>> +
>> +    tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
>> +    if (!tco->tcobase) {
>> +        dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
>> +        devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
>> +
> 
> I know this is the same as the old code, but I think it would make sense to change
> this as suggested by 0-day and use %px instead.
> 
> Thanks,
> Guenter

Hi Guenter,

I'll add the change to v5.

Regards,
Terry

