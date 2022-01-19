Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EECA493F22
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 18:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356447AbiASReK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 12:34:10 -0500
Received: from mail-bn8nam12on2042.outbound.protection.outlook.com ([40.107.237.42]:46049
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1356453AbiASReD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 12:34:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDcAtFzU/RDFQ1MTpn+j2etkpVhI+5bTdlBoR5zewBxZB89WBUoY2ExUzqupD0UXz/eONVv5Gywo2d/UlF2R+F2YvxTicrrtnnQgkCJsHWC/yaBtU11f3H5XNuysIrFrB8k5U+EmsEiggTxTFOV62mr5fU1ogRaF3pXKOUmULJV6sMTMUykWEqnWJIxmA9JP4oDDoTnzV6YIL+olD54Ua5rT7fizxTiH+eazaWivB/HJ4ucq6TugqFHlEa+z1Q7uCwn9nUBOo9FTyZ+JcgXKBHFiy1BCpgdjZdEd4yo0n6vK0RxuR6XypwLIYdzsSFsjUX7zbtjhZqGQoItJF2j2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeZOycq8MjIbE5qRqxDna860qOGxTmFNRf9fiH9fd44=;
 b=TyyyO6JcGL4wzkaaXg1wAlg3Isypu99VsnLyHAiAzDkogqGhdWKj9kaAlppHA8Df6jGCVrDoOqyqpYnoBxwnecqS/zv6M3/o/4NJOzm1+c1pLoY8agFqqydn2iccFYFPOJvTsyX5mAfJQRBaT7p+7SY06vcuO39bThsAnuyFxfGRYOx1SxFc7Do5ZDHlm9kD4cfgQLxKHflV3x7rA2J0Zp1ZbtCLT+IsgKLafRbkGg4R7h11Igzp6Z5CQ/RD28ArKJt96zunXKPGB60eIMJN7aXmV3MCm+u2CSUCXbU2DeiBtpRmZuTmPd2UA2Z+hV0peCyXLJqC32kNCNtqea+6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeZOycq8MjIbE5qRqxDna860qOGxTmFNRf9fiH9fd44=;
 b=yTEueLyTYZiSHynLbjqTCmPd3OrtDCt5ewfdvvRkJ3jHiLMVl8aTOLtRMVmBcT782RljgfZIKqxfAE0fAqJ93dn+XJQ9yKs76KSsz257i2kZOplHmIiphHbrCeiV0OKDNIQh84p4GWZ2ZPZPfchgIQgM5aHrPshMDzKeMlnYBb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BYAPR12MB2600.namprd12.prod.outlook.com (2603:10b6:a03:69::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 17:33:57 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 17:33:57 +0000
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        jdelvare@suse.com, linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220119163012.4274665d@endymion>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <dda39f1f-b683-35ac-d810-d4759c4f8448@amd.com>
Date:   Wed, 19 Jan 2022 11:33:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220119163012.4274665d@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0048.namprd19.prod.outlook.com
 (2603:10b6:208:19b::25) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cffd506-721d-4886-3a97-08d9db71df70
X-MS-TrafficTypeDiagnostic: BYAPR12MB2600:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2600D16CCF4DC7FEA91CE0E583599@BYAPR12MB2600.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ueVRrXf0kMBL80HsU84go1uBM4K2YOpoRSP++ni/BSC2yJKv3gy/skOtEcJjNC6r7oPSKR0BssX+00u9PLGTKG/bRSKSu1NdDCsDFKBQ21KYeF5YK61gvdHeTx0ckfs8KoyfzqkD5iqQkFyQZkSWPnqrLR212pSxQ/1C3+NpQOKR6oRhclZy8GVaV0AtoMshmH3NELCzz9FKgcuYIbz+sKpEyM3T3Lh1bJ3QdPMmv48fAv9z3Jyo8VdYZSzGAoq8AUdxIUeUoxkQcUtbCGROxu4fXZYGlaI3w7w1Lg1Ei1sKg2/VuWFBfZZacVBlcvANt9JrZvBkex/YKbBv568KvYC5IyslMXpcUH9bYNJ6depfE+6wL0DeICPwEGrL1X+rAoOu61oF0OEPK3hQk9RthGZ1zB7XEV14JeckvIVRfxurOAU+VagkyFZNHA1mN1cI474z7yArxhzS7J7jyfunBW6sb95PUyrd7/YaChhe/vh54nja7Wje+LDgSs9VMUfr5x+Ei0OX9S4B7Tkx2YJGQXWvqjK6+SDYmG03PCbMbw2dOgHsmaeWMArnvvYYprQ1HLdXT/aLilrHTCSxOtm5920kAsQL/aoqJUcBjLRl9B/xyh62vRKKCNORx1ECkitpMYzdzwc/CtR4GWdZTrMZhmUhcs5QRrfeqLoGxVqcG0fxDZN86JhmnNrEYU5yRXc/PNtCR0pTGMXpu8lHQhmSfAw6sBrs16OxhyCmF9OSSbLUpTYFduUZU6NjrJaILm2AzNFmq8A93H33Wpf+qDONsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6916009)(186003)(6506007)(86362001)(8676002)(31696002)(2906002)(53546011)(5660300002)(26005)(38100700002)(66556008)(66476007)(2616005)(6486002)(316002)(36756003)(66946007)(508600001)(6512007)(31686004)(4326008)(7416002)(83380400001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmExQkNHdDlKbkxiMTZRaHZFLy8wVXh2eEdxalZ6ZmxPamJtVE1hTDNCSmhW?=
 =?utf-8?B?Z210NDFDTmp4cVpudW9MSEszbFgrenpDb2hRaFV0N0ZHdGxXUS96NEYyQlZq?=
 =?utf-8?B?NzBubmt0TGhxYjlSZ2pGdUhLOVVlakZQMWxWMDdWbVNPYTVCTlAxcVdXbDRK?=
 =?utf-8?B?aS9KdFZ6WlI3Q0crakx1OHhKQUJ3Q1V3Wm0ydjUwOHBmKzhIbFpqMWxmanRh?=
 =?utf-8?B?TzVDVUlVeWxHS1J5RFdZRVdjYUdaWUx1MlNKd2tVK1l3aGxDSy9ZdklBSEEv?=
 =?utf-8?B?QUF6aGxkU1ZGTlRRV3QzS1RDZ01OUUNMcUUxYUxrZnhRY244R0xYekZidVk2?=
 =?utf-8?B?WVNudldWa3oxYUp2MW9vNUUvbUZoeEVIVHZpaVBqc1FNNjErZzNTL3lMb2RZ?=
 =?utf-8?B?SnZqaFQ5Nkc5cGNRWVprR2hRNmcxdjVtSjI0K3grVjRMTWsxRGZvNkdvaHo1?=
 =?utf-8?B?WGNhWE5qaTRBcnE5WCswTnZhVzRzT0VvN0pPcTRVUW5WU2lOaU11SFArOXJ1?=
 =?utf-8?B?Z3BjWHpQd2VBUkRhSGdnVE1KVlZLc2gwbEhSUUdjNlFUc0xKSE9Jamw4Umkv?=
 =?utf-8?B?MW1IaWRYRk94dzVodER6T1k5aHMxS2hPMHJvMnFkUlV4NmRFZS9ETHByMk9G?=
 =?utf-8?B?YjUrZFdNeVhFTW96U0JrZXNKd051Rm5iZVpWeVUwTWR4MXVWbjJ5UUxvQTV0?=
 =?utf-8?B?Y3RrTnJhRXpaSW4rM3duWGxvMHc1WWIzamN4Z2hnZ0xpekIzSDlMUnBjUnAx?=
 =?utf-8?B?dEYvRHRRcVY5Q0RkaitIa0haM3R6LzNBRnEwc2RJK2h0bXZxeHR3SVRHRUNz?=
 =?utf-8?B?dlY2bkowSVdYTjQvVGhZa0lxZjdUUExLUEFyTXVJZDAvamhITVR3Q281RUM2?=
 =?utf-8?B?dGJucE5iNnpYSjdtZWVWdHVqaXVQaXA2cEhURE9tZkdPY0dIRnE0Nko1c2dz?=
 =?utf-8?B?YUF6ZXJMNnJhcUEyNHRQTDZCVjNZWkdxTkhvYVk0SXRwUWpXdzJ6MjhaNUxL?=
 =?utf-8?B?dEQ5RnJIZXZaaFFaU3BjQXBGYUlBcklTR0U2VEJjWWNQVS9NZWtQUFUvNmtp?=
 =?utf-8?B?WDRQOWZMaCtWSldaTUN6VU5kby9kZnZhNGdaT3RaN3VrQVM4bW8weDJkQTha?=
 =?utf-8?B?WjRSR0N4RTh3QVZucmVFdHlzQjBhVDFsM2lFUUVRUllsTFFEMkdkdzZmREhw?=
 =?utf-8?B?d2I0MGlEdTJZTTRtcmNhZUNRMG1YK0cwRVhDVnBlT1krZE96c0R6aHhRT1l2?=
 =?utf-8?B?ZWwxVXUrakxhQjFPcHZ2WUcwenNxZjZxaFBqcnEyMlByZ0UzckM3Y0t0ZWVn?=
 =?utf-8?B?anlsbXFEWWVkSW5BaUMwNEppZEJjYTVrelZDSGNCVWpjUXVmbEVFdTBNZDY3?=
 =?utf-8?B?MUZ1MHZJRWFYek5oUWdaWkNmcVc1QWhBRmVWbzdlQ3h6K3p1SHZJQnJOM1R5?=
 =?utf-8?B?UzVLVzFsdyttNzJZUG5sOEplUTNiQ243eTIyOEU2aXllN3BsdlovVzdqbzFF?=
 =?utf-8?B?WFc5VVBONWZGYURxcy94QTFsM0hNT3F3L2NiRU9Za2hCNlpRdVludTV5VGRU?=
 =?utf-8?B?OWVtTExTdHAxZXBmL1pqK05BOVQ4RXFoclFIVFlHRDliRjNjTWE0TjJFN1d0?=
 =?utf-8?B?aWFkZzZhNmhYSWJ4ajMwVk4xSWRyck01MnVHcElWTk5VUkVDRC8xVUVHWTZ0?=
 =?utf-8?B?T1FZZFFoWFJLWjUwclVJZkdjRlRtY01lVzNWeURoUHVkRUVJNEdsd1VrQmpp?=
 =?utf-8?B?d0NKNExia0ltZjhOVlFHT0prV0gwSnhJUTMxZjJTVTViWHl2ZmhJc0dsRDY0?=
 =?utf-8?B?OVYxV04wUzNkS0VvbHRXT25VR1hvNzlrUVpDdnV1NERPajR0dVlFc3VHTUp6?=
 =?utf-8?B?Um9qOS8rMFd3NERBcExrbjhPRlRRSENveURGRUk2dzhJaWs4MXBsS0lQWmpP?=
 =?utf-8?B?QSs0d21FY2JVNTBFOWJOUmFZTGlSLzk5M2x6ZUhuN0ZidUJGWUY1aHVqazhm?=
 =?utf-8?B?d2liY2M2NGh0L2JXdysrZHgweVdGT055UTJnQnIwcEI5Vk01aytuRWY3dVRj?=
 =?utf-8?B?VHBQTVRlTFluZ01Pa001aVR1bTlpU2hpc045b0VTWUFNbmNwYXRlMkJUVVRq?=
 =?utf-8?B?MGN5SlU3aVd3Uit1T3RrbzZJa25DdG9ZekZ5bWZpWGQ3STFXQVE4c0J3OC80?=
 =?utf-8?Q?mSvK4Hd+ePuTnLXLErIBdpw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cffd506-721d-4886-3a97-08d9db71df70
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 17:33:57.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4CYxjlIB8PxSwJRYNEsaw0QXak7Hjwg3fOaGe7fqpyFOzJnSkaJ/WCA6M4IMAM592porA0ujmKZdLY79FMvoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2600
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/19/22 9:30 AM, Jean Delvare wrote:
> Hi Terry,
> 
> On Tue, 18 Jan 2022 14:22:30 -0600, Terry Bowman wrote:
>> This series uses request_mem_region() to synchronize accesses to the MMIO
>> registers mentioned above. request_mem_region() is missing the retry
>> logic in the case the resource is busy. As a result, request_mem_region()
>> will fail immediately if the resource is busy. The 'muxed' variant is
>> needed here but request_muxed_mem_region() is not defined to use.  I will
>> follow up with another patch series to define the
>> request_muxed_mem_region() and use in both drivers.
> 
> Shouldn't this be done the other way around, first introducing
> request_muxed_mem_region() and then using it directly in both drivers,
> rather than having a temporary situation where a failure can happen?
> 
> As far as I'm concerned, the patch series you just posted are
> acceptable only if request_muxed_mem_region() gets accepted too.
> Otherwise we end up with the situation where a driver could randomly
> fail.
> 

Hi Jean,
                                                                      
I considered sending the request_muxed_mem_region() patch series first but 
was concerned the patch might not be accepted without a need or usage. I 
didn't see an obvious path forward for the order of submissions because of 
the dependencies. 

I need to make the review easy for you and the other maintainers. I can 
send the request_muxed_mem_region() single patch series ASAP if you like. 
Then I change the request_mem_region() -> request_muxed_mem_region() as 
needed in the piix4_smbus v3 and sp5100_tco v4 and add dependency line as 
well? Is their a risk the driver patches will take 2 merge windows before 
added to the tree ? Is there anything I can do to avoid this?

Regards,
Terry
