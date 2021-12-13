Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC3D473333
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 18:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbhLMRsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 12:48:25 -0500
Received: from mail-mw2nam08on2048.outbound.protection.outlook.com ([40.107.101.48]:28289
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230404AbhLMRsY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 12:48:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ck6ET7BZw8qEq16xNJXJ7X1oYGBIyatkL+IJjr1TXdccp9MzXgisZ39WD2/Dx2KpZ6wHwsaZ3ivbS7M34vR+U4D8kujQyGFIfxfo9hSjxhGpty9IKUb1QCtiNP0jjIAvbpi8xPIuikVVkU2IYR3k60Mc8zQUeUGaWGHuafzmShVvsew6OYxuym6mxBo+rTm9oVv8Khc0FEuy0TeLCmtEXWt+/kDRt6okeXp2/7lWujpGsllIVd8T5u4aCc825oH5aUf2M0aVQZa7RYmTHFncAtQCycolhOOLwjBnw3K7D9CgyM4j2F62ZHz+TN97f6HdCc/wkQL96DmxxgQJxc3n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+B56nxxv4XJg1PnkGOlmII28PMfg4ePiLGPRbIa8d2A=;
 b=iWa2JoFxc53YZHM9LLZ971QS6fFb+Y2wwL+0kce8c67YJqTY22jKt8GQoDw/acFbWLB64jF413JbH2eP46DIjgfi/WbMOAN4qpjpCJk+TiiKsEZ/dc0sdDYCgoTgoWB1BUoMeUNJWtwhjpHZvcUpOSuKTur8VZu9O8FSxhLsGc+24wGNnxJrj+VsxRwTadmzrQOCJ3ccYVHHO8g//ccVou2p57rhtwvFppIwpgeyFggYYyJ/CQgBEsryT0gfzVAeFinBWZ9C3RIp1mVmuzNq8vBM2aeXCX83ol9N27/zoDegfMsnEtSkNduGGfvTGU4o7cUqktJPaTr5tVmp+5iPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B56nxxv4XJg1PnkGOlmII28PMfg4ePiLGPRbIa8d2A=;
 b=3XURui7eUy1PM64RX5VGDM56w+bqxbsPYLdYPdu877obQGzocY9Mv/gnC+FkYA1UKgnUwRAPAzb35Gyg8T+tS5zHqpEd+joI1zl41akPQN1TQdWtGEO1mAggBEWtzwDiqRU9CrN2ypNhGLzh2F02PNmZ3kFQjR3GW2wnsFMXby8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Mon, 13 Dec
 2021 17:48:22 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::f154:648:177d:297b]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::f154:648:177d:297b%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 17:48:22 +0000
Message-ID: <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
Date:   Mon, 13 Dec 2021 11:48:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Reply-To: Terry.Bowman@amd.com
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, thomas.lendacky@amd.com
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion> <20211105170550.746443b9@endymion>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20211105170550.746443b9@endymion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:805:f2::19) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4add9057-647f-4735-de6b-08d9be60c149
X-MS-TrafficTypeDiagnostic: CH0PR12MB5106:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5106EF7FB6C132AADF93E0E483749@CH0PR12MB5106.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvt2ECth+KXiayuUOT8hHxHegi9O6XutjFyAV7JK/dA/tpIEVI/hdwefS1Tz+l9qgg9WA8/H24KhkZuu3RtQjfi3t83rqqR6t3ycHb9AfzFRPgmi96bFEQ1+d9GHN4NikMLQMj2IUeSJ/aOe491E47iIZLbcbcd+cxwNOGFFWmzEAytll9vE68DIIl6qRbmrTcHAO9fHNV8UgKjC6WIzN45X8wS1SPHjS3JNjSgk9C+MGWih3Dvfek9t2QuUeaJqPcS9ZzUoF0ECTUb8qv0o34k4xKEEwDI00NQ9FrY0p9Lwu44JDxCi8dW3NghLqRcbPOxrF75X6Y+HWzxbcupNAKCkdVZb68qDtlxlNdUTBH0KQTc9Je7kl+mUVRUbZmMRfDVjQSsPADDzRZGYR8U6qRpBkFvadYZo3ZYMhuGVUvO2D/swoyGDTuUZ5fioK5CxhX0nsJpjEqyBaUgHCzK6f/DNbDwpQQH+dpiTKz+F0bboXTi6aDvUO3UrU2irYD/l9Msh4mJvgsy2qBCNzIEJSbA3VZXryt0E/9g1SnCHP5H33ywyCc0ma9IX/LyHBDFSeUqt4DSNpYyyo8iQY0PBL46LD7SSc/IoGDZG5JwB/f3YLQYDvccsJyC9drFQJDPad4D04HdGLI6cL6d9Qk4RimNeWr667rjbTeL5Agw1hL4oBxjajtMjcXTp0BhRiBQdZFXDFIemyisBz7Qo9Aw5QzgZAoD20qNhUq9P6wvx+cn/oZ0tzpXamc92X/lLg8eYdNplOjuVC2HdlpRvlgwaFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(83380400001)(508600001)(31686004)(31696002)(8936002)(3450700001)(2616005)(66556008)(186003)(66946007)(6666004)(5660300002)(4326008)(26005)(66476007)(8676002)(53546011)(6506007)(6486002)(36756003)(110136005)(38100700002)(316002)(86362001)(2906002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVNvR1YwdEhONzB2SkxnV0tzY3VaUms5ZEFhb3hvckViR1JoYnJoeS9tT0JM?=
 =?utf-8?B?UVZRUVFlZUJnTk5pV24rcHNKOGpIZUY0YVhDNDJsVTlEcE5TakxQdmJubTBi?=
 =?utf-8?B?QjZZdWhpY08yZXRJdjM3SlhTRERuOERZdGZOaVk3aUFYMm1NLzlvN2loR0FJ?=
 =?utf-8?B?czVVbCtxNWZZSndRZjMvcVllUW9jUUFvNEczWU15ZlRXK3pKb2lMOGo3TFFs?=
 =?utf-8?B?UXQ2U3FhczhmZWZiaEJvcTRNbCtWUHhVVEk0SUthVXYxQUlqd0JHSzU3RWlT?=
 =?utf-8?B?dVJya3krY2tVNnJPZ1l2S2xFT0ljOUJOaklxNnVLcmZjL2F6OGMvQmVzWGhN?=
 =?utf-8?B?eVVFRzJsckl1VHIydXlSaVF1a2ZHSFNJWGk2dEpNYTRzR3dSdy9XWVA4QXhL?=
 =?utf-8?B?MXVwOXNKNWZaRU1DV0ZCc2xZeTFBNjJabDJ6Q1dLT3ljREF4N2hFVjR0OUJM?=
 =?utf-8?B?MElNRFlnM3J2alk5TWQydnRpbS83UnEyM1hLcE5uNnpMdW83VldoQUwxc1h0?=
 =?utf-8?B?ZFVCVnZ5azAxUytRZUtlRHFnaUY1bU1KTFVEY0p6UUFRVW9oemt1TlBLYy80?=
 =?utf-8?B?ZllIaUdmTld0RTNUbkMyamg3K3JnSmVOWUlnUEk2TkRkbHRrUEtyM1hEQ0pC?=
 =?utf-8?B?K1NTVndXUXBzVmpDbEJiMWJwYVhCUmVoWk8vVERJSzE1TDcvdWxmTmpYRUFm?=
 =?utf-8?B?M3huUXE3R1VHSVAxSmxCeVN4OEozWmhYaGN2dG1JL0dxOTk2a3l0dHZXY0p1?=
 =?utf-8?B?QWtMdDVnd1JoVHhOejZnbTVtY3pkNmJwUEM1MHluemJjcTc3Mm40UW81UlR5?=
 =?utf-8?B?QkI4eGl2UnpxeEppdXNQaklFMFEzYTNycmhZbjhkVEJ5NUZQanZVbXBRYVhC?=
 =?utf-8?B?T2QvSm8zZ2llOVZyNjBwOWhLSTR0alJXVlNITnlJczhNM1orNWNIS05YQ2ZL?=
 =?utf-8?B?ekFoUTY0VktibEZXb2dJZHJVMWI1eFhDSE5oYnZzUkdsc3FiWjdRb0k5TDlt?=
 =?utf-8?B?dVdpTnRDS2NsS0NQUG95VGFKWFVSL1hkQmZLZDF3QXVIN093NE8yR0xFYklk?=
 =?utf-8?B?TGFpTU5obUFsbzBZanlTQm05Y3FEQ2ozTlhTL0NvZWxjTWlLRHRuS3YvSlk0?=
 =?utf-8?B?VGpPaHdCTHZPN2ZlQi9IUHZTZTBQY09vc2V4ZWk0UXRNc2pMV1BscGN2QUV0?=
 =?utf-8?B?d2RBYmtjVVAzUDhWZ01nNURRVm5iRnBTOFpqRnZLQlRNeHlYanlHSjVSSHRF?=
 =?utf-8?B?L1F0YVBCbnZWVXdrcy9yQTQ5Qm8vT1NZODdISDR5VkNUTnN2V1BXYmpkRnMr?=
 =?utf-8?B?WExyKyttdlRQbS9VcFVzWU1CZ1F5SGZpKzV0ckR4MzA2OVJkTVloQWQvd1ZC?=
 =?utf-8?B?R1g4bEN0ZDV1L3pBUlptY3g4c3FTdXZJM2NJUnIwcFpzbTJncnJrc3R6VFZJ?=
 =?utf-8?B?eGtIZVZ0SHMrRzllOEpoWmwrV2h0NmczakE1QjVVTHZ2VU1CRHprMUR5akdD?=
 =?utf-8?B?VGhPRkJlNmRsd2huTksyd1BzRml1YkZLZE1rT3lkYnpYQ2NVRjQzMkYxQVBr?=
 =?utf-8?B?WDM5eTYzYnV5WUh3MzR1SUkwV0UrUUZWbW5kZFIyUlB5Zi9qZ0tYQTVubzVv?=
 =?utf-8?B?RnN1TDBLUkZmVE52M2dLLzhMbXNuTHMrakczUnZRZk9hV2JOL05jdUhFeklK?=
 =?utf-8?B?RE1Ra1hHL2E0ZUNjN1A1VnhtMUk3UnV5VTk4TUpOcFFDTUtQQjNJQjIwYlpj?=
 =?utf-8?B?RW8vT2JqaTU5NkhaWFpVdERTelhxenpTZWdvUmpTS3h2MDNjQVlnejkyR0lJ?=
 =?utf-8?B?bEtKKzViQmdkN0hlWUtuVlJWVWFySEF1cW5XNEdPaGNZU0NMOWpCMEZxNWk1?=
 =?utf-8?B?YTY0V1JPbE9XRHBDVWpGZ0VTWGM0Nzk4cFJZYVZUQlRCMEpYMVBPcTBvQW04?=
 =?utf-8?B?ODBNS00yY3FhMUUrRlJZanY5UzZTZ2gzVDYyM2ZNdXJzdFFUUUc4Nm0wbWJG?=
 =?utf-8?B?d1BSYzdEZGFvZ2ZtRlRDSEpyckNHemUzZFdPOXFHZTR6WW9mWXFrdERZR0k4?=
 =?utf-8?B?SDRnd1I2NDRhWnN4S2dSY1YyU2Z4MDVoRFFJTGZ4ZVdQbGRqbFBPaWVUdG5z?=
 =?utf-8?B?NVBYTTd3ZHF6MnZGd1BUUUF4aGkvMWg2N3ZVLzlaOUwrSk9zVHBQdFJ1cnFX?=
 =?utf-8?Q?PGODiCAxnsDoZ+ArCupflQ8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4add9057-647f-4735-de6b-08d9be60c149
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 17:48:22.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COtuPYbL6zfbvlr2KEVUTzHvXPGFy9zs05uj/BzzkrKGUpxFb8vsQX/GPSYsE4ksJg18PbTcXSMj1/8qH0UfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean and Guenter,

Jean, Thanks for your responses. I added comments below.

I added Guenter to this email because his input is needed for adding the same
changes to the sp5100_tco driver. The sp5100_tco and piix4_smbus driver
must use the same synchronization logic for the shared register.

On 11/5/21 11:05, Jean Delvare wrote:
> On Tue, 7 Sep 2021 18:37:20 +0200, Jean Delvare wrote:
>> More generally, I am worried about the overall design. The driver
>> originally used per-access I/O port requesting because keeping the I/O
>> ports busy all the time would prevent other drivers from working. Do we
>> still need to do the same with the new code? If it is possible and safe
>> to have a permanent mapping to the memory ports, that would be a lot
>> faster.
>>

Permanent mapping would likely improve performance but will not provide the
needed synchronization. As you mentioned below the sp5100 driver only uses
the DECODEEN register during initialization but the access must be
synchronized or an i2c transaction or sp5100_tco timer enable access may be
lost. I considered alternatives but most lead to driver coupling or considerable
complexity.

>> On the other hand, the read-modify-write cycle in
>> piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
>> request_mem_region() on the same memory area successfully.
>>
>> I'm not opposed to taking your patch with minimal changes (as long as
>> the code is safe) and working on performance improvements later.
> 

I confirmed through testing the request_mem_region() and request_muxed_region() 
macros provide exclusive locking. One difference between the 2 macros is the 
flag parameter, IORESOURCE_MUXED. request_muxed_region() uses the 
IORESOURCE_MUXED flag to retry the region lock if it's already locked. 
request_mem_region() does not use the IORESOURCE_MUXED and as a result will 
return -EBUSY immediately if the region is already locked.

I must clarify: the piix4_smbus v1 patch uses request_mem_region() which is not 
correct because it doesn't retry locking an already locked region.  The driver 
must support retrying the lock or piix4_smbus and sp5100_tco drivers may 
potentially fail loading. I added proposed piix4_smbus v2 changes below to solve.

I propose reusing the existing request_*() framework from include/linux/ioport.h 
and kernel/resource.c. A new helper macro will be required to provide an 
interface to the "muxed" iomem locking functionality already present in 
kernel/resource.c. The new macro will be similar to request_muxed_region() 
but will instead operate on iomem. This should provide the same performance 
while using the existing framework.

My plan is to add the following to include/linux/ioport.h in v2. This macro
will add the interface for using "muxed" iomem support:
#define request_mem_muxed_region(start,n,name)  __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)

The proposed changes will need review from more than one subsystem maintainer.
The macro addition in include/linux/ioport.h would reside in a
different maintainer's tree than this driver. The change to use the
request_mem_muxed_region() macro will also be made to the sp5100_tco driver.
The v2 review will include maintainers from subsystems owning piix4_smbus
driver, sp5100_tco driver, and include/linux/ioport.h.

The details provided above are described in a piix4_smbus context but would also be 
applied to the sp5100_tco driver for synchronizing the shared register.

Jean and Guenter, do you have concerns or changes you prefer to the proposal I 
described above? 

> I looked some more at the code. I was thinking that maybe if the
> registers accessed by the two drivers (i2c-piix4 and sp5100_tco) were
> disjoint, then each driver could simply request subsets of the mapped
> memory.
> 
> Unfortunately, while most registers are indeed exclusively used by one
> of the drivers, there's one register (0x00 = IsaDecode) which is used
> by both. So this simple approach isn't possible.
> 
> That being said, the register in question is only accessed at device
> initialization time (on the sp5100_tco side, that's in function
> sp5100_tco_setupdevice) and only for some devices (Embedded FCH). So
> one approach which may work is to let the i2c-piix4 driver instantiate
> the watchdog platform device in that case, instead of having sp5100_tco
> instantiate its own device as is currently the case. That way, the
> i2c-piix4 driver would request the "shared" memory area, perform the
> initialization steps for both functions (SMBus and watchdog) and then
> instantiate the watchdog device so that sp5100_tco gets loaded and goes
> on with the runtime management of the watchdog device.
> 
> If I'm not mistaken, this is what the i2c-i801 driver is already doing
> for the watchdog device in all recent Intel chipsets. So maybe the same
> approach can work for the i2c-piix4 driver for the AMD chipsets.
> However I must confess that I did not try to do it nor am I familiar
> with the sp5100_tco driver details, so maybe it's not possible for some
> reason.
> 
> If it's not possible then the only safe approach would be to migrate
> i2c-piix4 and sp5100_tco to a true MFD setup with 3 separate drivers:
> one new MFD PCI driver binding to the PCI device, providing access to
> the registers with proper locking, and instantiating the platform
> device, one driver for SMBus (basically i2c-piix4 converted to a
> platform driver and relying on the MFD driver for register access) and
> one driver for the watchdog (basically sp5100_tco converted to a
> platform driver and relying on the MFD driver for register access).
> That's a much larger change though, so I suppose we'd try avoid it if
> at all possible.
> 
