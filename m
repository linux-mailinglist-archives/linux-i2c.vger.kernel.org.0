Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E514C4AE529
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 00:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233696AbiBHXDT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 18:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbiBHXDS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 18:03:18 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6071C06173B;
        Tue,  8 Feb 2022 15:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/E303F6/GqEtSlNmWp5wikchmavRloD+QUDlqTvAPO7GidWfLL+loCECl5CoCPCbAei4jYhC3lrekdAAaWWTLgfem20Yz9dN/TejQqxfBHQ8XGZH5h2lmZnO2ogSJ9Zer7gz/cn4YdCVQMkd5nMICbt7yiTanKhCInyMSmy5F+x4Oii/5iwZnCKNf3ux5xC8Earuwn192V5SAbp4mqLV/pO0jhwFVm1tMKAxnUVSamMMnkWdm58OUzJsxVJl7W+VeVaE9dRAo0KM601ANuVZmsIaTlnT6IXIbCwF1qDBdQ6E/IHt4acqSlmbYH7YffCoYqWLdaY/DerJgMtg+h/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liVejmuKxOP+NAjvvNTrB/oRF7wsLfiHP9mKu/GRXXM=;
 b=E2R5klmXc6o8rgd4mNwMH9YnfKVvixaeQifr9QQo6kNsVP9lSYYnuUK4ek5IBeccj1EFjl2OO7+luOwR3hTDvbGEDXGpuW9vqCTIrb635hfTvu/HCjfhjcE4eDt65yydJgMY8TML1hItFQS9xUu/vG6pENKChR5WQ8zHXsomJKmzcKGnmzBgsjFCssE71ouOEJ3oK91ah+HvjZCGGHcBpeVHwGVNnMvJMjxA2BqQlNWJe3iC+9KNdD8R6C3WLZ+Xbm/uFj07ab+sQ2M8FRXnxR+tuza508cvF5QvCsh7eS8LEJ3JEMbF9KAPX/E7bt63YDU5tqtCV8s5/NdS9JmvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liVejmuKxOP+NAjvvNTrB/oRF7wsLfiHP9mKu/GRXXM=;
 b=1k5Brx3inPnpvU4fu3UZEB2D+k39iVIZZhFmt4mKO9ErIqJl5Jcnoq7ERY6xKVhJEDR+iC568l/9Sb0jH1LXInFWV5MvzXahdpfFYiNlTsG36i7PUwGo/poBKuVslvwcyq6Ee5TEhnHQeOPrLaUl812JzlCsl4uwVbfoqqNeSm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 23:03:13 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%5]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 23:03:13 +0000
Message-ID: <27e60021-30cb-3b1c-f429-2618bf891e5e@amd.com>
Date:   Tue, 8 Feb 2022 17:03:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130184130.176646-1-terry.bowman@amd.com>
 <20220208181114.180a99ba@endymion.delvare>
 <4ae57999-0f23-7578-008d-2009bc36d46b@amd.com>
 <20220208224653.6a62ba22@endymion.delvare>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20220208224653.6a62ba22@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:610:4c::35) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12501d0-dfbc-4857-370a-08d9eb572e65
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB52842AD4D94D12E12FC84F3D832D9@CH0PR12MB5284.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BxfiI16L+SlZjz2Ds3xjjMipaKPyzuE9GdjxK1TlcbKSCGt6lnmA7Z6ky5bjW1cNyUk+TbQBR2wie14OUp5PI8X2Z1BThcFnkWHJvkpSoJfI6RzYg13MbleGqnVCcCfkWhd4AJJNepfBW78rDLckUZADEPwZhyvMDQytn/+aq/Md7aELdKcjdGV8IY5ZNxzK/6VoQnv1LFAtSxS6ZARphn3jr1cJfcCKMkwDsDgElgK+VbCsS1yQloGnEV2DN8pjKzLeWApf+OxqX+pJt0Uu645TFxoUFxp3lu4H9RCsCiAMrFgsAPjDjcdEXtJZcuSyk/fPqxMB0oJOpzwOZ962EJ/4iZim3a/zVmaCZ3XRRj5clE/JKPW3f94vokLbLFJzt6F7u6GQ2n2le1zjzXsvbF2Lq694RaUI0O4xGTKFvPw/EU4L4Do8bamL0nIU5OuaA2tm6y+Jb8p9PG6wYqnHil323J98eT6LwSeucqlSR8uHGvKOL4VzYlsfJfYqEcaJP+4Jni5Y+7a1MRl2Yl7F8qiAmWBrnAG9IW3w+m10rGE5eBFaHnQpBPQNcGK1u6dJQXsm8fsBaS4wbbZMBRYbjMfjxcGcsMlvBvypipEMO9+3Mb/hjjiY6VNLflRCx2CR70RrgjqmuV9ssZQIG/GdoXRhhom7+eFka3fQ1v2+dyOd+A6J1L/paYqU7qi7pNaCDNZpmIBFULlZUbKGLz9u/D9IY5bh2uyAvkiaPxlkqHlYkiR+0lpkkUPg2bYtQ++y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(53546011)(6506007)(36756003)(66556008)(38100700002)(4326008)(31696002)(31686004)(186003)(6486002)(66476007)(86362001)(316002)(83380400001)(6512007)(26005)(2906002)(5660300002)(8676002)(66946007)(6666004)(6916009)(2616005)(8936002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enkvdFYzQytNZDg2ZnNHNGhLaHZ3K1pOS2tOL1BOWVZ5WTBvR3M3bmtpM0tX?=
 =?utf-8?B?YUQvVFNyS1lmRm9ZWmZ2ZFhHTXVKOEIvT3IzYWFQUVNnMUQ2MG5YM2hLYisw?=
 =?utf-8?B?U0xOQU9YOG1vN3pxNWttaDU5ajBobGhpNFphVWNQUzZSUVJZcVFFZlE1eWtQ?=
 =?utf-8?B?Rml0K1piVzJmcDZhUmgxaThxNXI4cE95Z3pKWXp0QUd2Wnh3NXNNWDJsK29j?=
 =?utf-8?B?OXBoY0lJdU1nWnBiWFVuL0gxRkw3ays3UldWSHhKUHduOU5BdXV2KzFuTDMx?=
 =?utf-8?B?ZWJpZmM2ZFZGRDlraXF4ODVPK1FHUlM3b0M5UW1udFhlLzFVRjBoM256ZmQ3?=
 =?utf-8?B?MmV4OXcyd0x6aENzTXJjT3AwNVZLcmJzMnRPeFcwd0R4U2hveVRrMVA3S3Bk?=
 =?utf-8?B?bGZFV1pBNGZrd0RhUTlBVTV4cDZFZU4vT3BIUSsvZGNDZ3dZSTM0M0hweGFT?=
 =?utf-8?B?L0dEYmpCdGY1OG9zOWpaRjYvWU5aYjdHcWpZZzN0M2tldVFGejBoVFVPN0RZ?=
 =?utf-8?B?dFY4bXNLcFB5ZVM1Zy9YZ3hhYnZhdHFHcVgvMUFwUVdLQXlJcjRsMzJFc0Jx?=
 =?utf-8?B?OW4zR2VhcWV0ZDhueEtaVGFkcXBlVjBUWmYvYWVTUGZueWIrbUxIa2kvQW5S?=
 =?utf-8?B?NGhnYmZFNXk3WnBFbnd6MDNMand1TVIrYmpoUzhCV3lBR3d0b2J1NS93SkxI?=
 =?utf-8?B?ZWRhMDJGZ3Y4ZTgzQkNQZjR0SGRDekdPdGM4UUNRZENOdlNBMElsT3gzNnNS?=
 =?utf-8?B?VDJaM3BobUJkNVlyWG5VMzUxb205TFBzcE16blI1SGRVVURYQ2oySkpybnZU?=
 =?utf-8?B?bkIwNVQyN1d5ZmRwNjRmTjRiWUxjZWIzc2JnRnA2aFIweHA1Vm1NT1dOWjg2?=
 =?utf-8?B?SjkrNXRKY3pqY010b0RpZjJCblFPUWNUSVIwdnVUVDB3b0ZuTjRMNVRBSXdQ?=
 =?utf-8?B?K3VBS3Vod0l0czdBMmZFNTk5S1lJMnhIMUtyenNmVlJZblUrWEd2clg1cGxD?=
 =?utf-8?B?akFTRDZ4YU1uRWhEK2VWUU1HUHFGUVNuOE5BSk1oRGdoRGJnbVIzdGJPUFJH?=
 =?utf-8?B?VXFSYXIvYVJzN2J4UEtRTnVTMzNtZkRQMjJzYWhDSmlMN2FjMSs3U3EyMk54?=
 =?utf-8?B?enhyNk4zRmg0L1F5cVhoOFI3M25MUzBLZjMzSnh5OXhjV0o0Z1M4bjZ2WGIw?=
 =?utf-8?B?RE5qaFBxZ1dSaDZScktSMTBZbFNVVWxtOXNoek1aNGhsc2JpOGFtZVF0dzJI?=
 =?utf-8?B?S0VVY0xVaWp1QVVxWlArclgrUzRnbHJNSzM3QUZuSzF0Skd1TXVzZXhsQ2sw?=
 =?utf-8?B?L2U1T1Z3UkJ1RUJxMUgxcGF2cEZ1aUJlNng2dWR6ZXBpbUxNQi9KWjYxdEhN?=
 =?utf-8?B?dExQV0JDSzAzQ3Z0Z01FRWxFRldXelV5TnRyWXlGWTZZSXFEQ1lwZDlUeXJO?=
 =?utf-8?B?TGhmMU5HUnlZNm4vVDN2NTgvWTc2LzN1MGZtOC9VVjdZdldhTis1NnRzMW1J?=
 =?utf-8?B?TXlid0ZXcGh3emt2Q0crTXpHR214dTlWd1lWWXg2anVubDNwMURxLzhxY1FR?=
 =?utf-8?B?aTMxTTUyUHlRRjVBL21xRHZCdmpjQlhIT01WQlpGNHRucGZ1UmR5a1RNWWlB?=
 =?utf-8?B?WXNOQmFCck5xeVRyNTE5Nk1VS0VoR3NmS0Q2YUN0RHNaaVdBK2Z4ekFZWHNF?=
 =?utf-8?B?amdwRFh3UkQwdVEvaGZ1ajdCek9WNXlhMCtFUUFhelhtV0pEQzN6NElLbWZB?=
 =?utf-8?B?UGpiVGlldzZxYXdJQmJBVzJPSGs3cjd4SEo4RUdxd09tRVlMSlRmVEswYzhz?=
 =?utf-8?B?Q0xnWnUrYmIvbVMwTTlDMEVYK0xnaThwa29BZGFiL21TTnVxb2xsWkFBemc3?=
 =?utf-8?B?czRxMS8zOWl1cjZlVVNieGNlMUp2TUNyVmFTRFhUME80dXF0RVdETitjUFNa?=
 =?utf-8?B?VGsyUTBVeSs0Z000TFFZVlNmMmRXMittYys4Rjc1NUtLYlN2WEs3SXovS2tC?=
 =?utf-8?B?NlBRSHpobGs5QXpvaVBRZjRDeDYzQUVaNEhBR016a2d4c20rZU16d3Fmb3cv?=
 =?utf-8?B?SnlzMU5SUmNFVXIyWGJoNG9mYStVcHJsVkRSdUgzek1OaFFpbWpQekh0ODhG?=
 =?utf-8?B?SEl2MkU2clFQQkdzbnJBMGs5LytUTU1OeXorZURRMGgzUlFHOHdVR1lFcmhE?=
 =?utf-8?Q?UAQb4TQP1u1yEXw41qySJSk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12501d0-dfbc-4857-370a-08d9eb572e65
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 23:03:12.9420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emZ1cvJwPPSAlOPHpEf527TK77zwUDE8eAdOr2cAg0vnS7TZBopQXwocnd4RftwJXmPVPKroX9Zz9UKdQmK0tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5284
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On 2/8/22 15:46, Jean Delvare wrote:
> On Tue, 8 Feb 2022 13:36:55 -0600, Terry Bowman wrote:
>> On 2/8/22 11:11, Jean Delvare wrote:
>>> Unfortunately I'm not really able to test this series. While I do have
>>> an AMD-based laptop which uses the i2c-piix4 driver, the SMBus has
>>> never been usable on it. The driver creates 3 i2c buses (port 0 at
>>> 0b00, port 2 at 0b00 and port 1 at 0b20). The first 2 do not seem to
>>> have any device on them (i2cdetect returns empty). The last one must
>>> have some devices on it, I see address 0x1c answers the ping,
>>> unfortunately as soon as probing reaches address 0x2c, all later pings
>>> return success, regardless of the address. It seems that some I2C
>>> device (probably the one at 0x2c, but I don't know what it is) is
>>> holding SDA low forever, therefore preventing any use of the whole
>>> SMBus port until the next reboot.
>>
>> My understanding is the OEM may have different i2c devices because it
>> is mainboard specific.
> 
> Yes, the devices on the SMBus could be anything Lenovo decided to use.
> Tomorrow I'll try to scan the SMBus but skipping the problematic
> address, to see if it works around the problem.
> 
>>>> (...)
>>>> Changes in v4:
>>>> (...)
>>>>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
>>>>    already enabled. (Terry Bowman)  
>>>
>>> I'm curious, how can you be sure of that actually?
>>
>> The removed code was using a MMIO region to write 1 to 'mmioen'. This was 
>> using the MMIO region to enable same MMIO region.
> 
> Ah ah, I get it now. Nice chicken or the egg situation :-)
> 
>> Programmer's manual shows FCH::PM::ISACONTROL[mmioen] has a '1' reset value.
>> Per programmer's manual, FCH::PM::ISACONTROL[mmioen] enables MMIO mapping 
>> at FED8_0000h..FED8_1FFFh. The FCH::PM::ISACONTROL register is MMIO 
>> mapped at FED8_0304h. 'mmioen' was intended to be set using port I/O to 
>> enable MMIO but, port I/O access to these registers is now disabled.
> 
> Is my understanding correct that there is some overlapping of the
> access methods and there are certain chipsets where both legacy I/O and
> MMIO access is possible?
> 
Yes. 

> If so, while there's indeed nothing to be done for the most recent
> systems where only MMIO access is possible, you may still need to
> enable MMIO access through legacy I/O if you try to use MMIO on
> chipsets where both are possible. I'm not sure what exactly where you
> set the limit. In the last patch you say that 0x51 is the first
> revision of the family 17h CPUs, but is family 17h the first where MMIO
> is available, or the first where legacy I/O isn't?
> 
Family 17h, SMBus PCI ID >= 0x51 is the first where cd6h/cd7h port I/O is disabled. 
If SMBus PCI ID < 0x51 then cd6h/cd7h port I/O is used. 
  
Regards,
Terry

