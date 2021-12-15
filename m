Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E024759F3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 14:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237560AbhLONu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 08:50:26 -0500
Received: from mail-co1nam11on2046.outbound.protection.outlook.com ([40.107.220.46]:53336
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242995AbhLONuX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 08:50:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTVX7lfo7QBWLBmMHriX0s+h5rTNtHgXYDRn7HsmDhM1KjBwOxK8RsaBOTtopfiWHwWWjxfvOzwtX29/XbikAAvjK5eqehuCO8cvOOHN6Ni7XXP0b+3lLoscRKZa8uEBa1eByDf3T2MCnC96s8y1JQ2EWf8xA7WCrDqUOO+hDLtHsI89XKk0XqcmqPPVK0+xr1DsvScgb9L/5JpVBrcUd72xkiUT7xmJ1ZRexqWKDqKhAhZjiNTq8pvXgCfPy5wC3x8jiMUKLCP2yDeTy//z7hxElvsiDSB8fjQLqk/Mr4LVnMMYoGYtm13jEHvJAClb/cFi62ytxATllQ+stLYrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6Yb5A80IOuOJ0q3rzNxFKeipZLzpif18EexQri+YBw=;
 b=e+znsR7vAnZEmlv+dQEB+UfSeDGpT5QImsMquhhhfzDYAx0nA32mZ2TwkQuFXXxaym7goIJSRqcsFcv3tB/FjyyQrSkuUTDMWVu9rWKSGThPvvrgGMRrCCwtHVXOgVuiVzqzPU7e4MIE5G9uE451Y0fQo4QJxGOZ2XLnC7UmhLFWDjYYtYPgXJ4Viz6peYqtFR/+Ik1FXHf1nGJAEXYdULejgwoMUg+INYqBlX2VSBjM/ZlOaE4bOY24AlhwDV9lYkI1+4PcJYj9036v5zmopmi6y8HSh/bn4Z4k535z7jSq1s5/oqiVBC5/j1+LxnSZGMt6amDGODdI3vbpoMcBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6Yb5A80IOuOJ0q3rzNxFKeipZLzpif18EexQri+YBw=;
 b=D2xq40CbBRXRwNG5jJ6yituH0YIGkOj0T6FD9u5IXz/XCTAQIxT6lW/6eUQ7UPkMDTG7SqrPEHX/1wISbXDoUCSfIVIyq/GM1rlYvSGFlRgOy7sTk/T5VHqBLPTyR+cYQ2MWgKd4seK9jyIayOW2awVkVyjWRMD9lpnOqnBKUF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18)
 by DM6PR12MB2762.namprd12.prod.outlook.com (2603:10b6:5:45::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 13:50:21 +0000
Received: from DM6PR12MB4188.namprd12.prod.outlook.com
 ([fe80::76:8f86:a56f:38d0]) by DM6PR12MB4188.namprd12.prod.outlook.com
 ([fe80::76:8f86:a56f:38d0%7]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 13:50:21 +0000
Message-ID: <07800ea9-e0f9-bb6a-3690-5e81772d0fd4@amd.com>
Date:   Wed, 15 Dec 2021 19:20:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1 01/11] i2c: Introduce common module to instantiate CCGx
 UCSI
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
 <a0ac314f-9e9d-7749-6f22-fd3e44372288@linux.intel.com>
 <YbeKWScx1HwCYJTs@smile.fi.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
In-Reply-To: <YbeKWScx1HwCYJTs@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::13) To DM6PR12MB4188.namprd12.prod.outlook.com
 (2603:10b6:5:215::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 570ff7a2-0d89-48ce-9d24-08d9bfd1d5ea
X-MS-TrafficTypeDiagnostic: DM6PR12MB2762:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB276216D3351CB9E8639AFF65A0769@DM6PR12MB2762.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRC9zPgx02GVwiVfxt+6ojtZxlnmcBJ/Ag2+dcnDONcMbDbqlgT9dtmre//X93SBNc+EMGavTpMRnaxZrh3M/3ghqc0Gt+uDvs+N93ccG4yRfYB0aTfDfc86vXcDLNVgUSmH4A7zIec0k8rHTQ87yYW9Pdx3Mf4hDEBuBaK+08aeGOGx3UN1h78ALdnMNljQNaGim8yYsMQdZURi8yiu5lIQS0DGwbJNg7hmiWNk1AJI8QcTVjZN8HdBj5PhxyqSlnxQpnIhFd6GxxP5mk5JQmIRQeWpAw9h+7on//cQbon0Q0SayYTP771O6VZg7+zqZfdEYp8cIfu4sUGQyXVqmduKaT1+ZWxAgzKK0AXmjM9iKDAU5a/PSJFhHC2JvCPe+IFVHzrV3dPlaMxaHnqpdiLkfjbmmOAAqCstdyg6a4qyUZjMLRvAvjQdLOi4bLJSzrI5dij4CD2sB5NuKstoo3VsBvJqgCBOo1Nx4XUKdMqOd4lXjBNR1NWOVe6xagfswx/V9z1UMjQFu16xGUg9tz1oyLHo9JJwUkmoKsajA9oyjMF11kZoj3ksI41ZjGYrkSxDeWjhBRCyOBR30p1vIaDei52n/QEV1qINFbzEPuvF2iPS5Es9IvTURYhoMANDDFiuhJxC7nKmTwuAgw9u9bvEhZ6OwDG+bdXS7cwpgNgf3Paw1CqhzVtFJDfG8FFPWH5ObCmKp9+z9J8dqhTzwo58VYgRlxk5Ial2ol//dVyMDVctKW+Ou9gE8r9GEsZY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4188.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6486002)(8676002)(2906002)(6512007)(66556008)(66946007)(36756003)(316002)(8936002)(6666004)(66476007)(86362001)(4326008)(31696002)(5660300002)(31686004)(54906003)(38100700002)(110136005)(186003)(26005)(53546011)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFU1dUJnQ0ZVZTFseStJVWhiREJOc21kR1FTalV3bURFaWI1S082QzJLQUk5?=
 =?utf-8?B?dHJ3S09qSDZuWEFxQTh1akN4WGtqeDdaL3dveExQSzNVSCtqYkVPRzl4K0dX?=
 =?utf-8?B?Y0RqTkdrb3RHaHpGWXRGUllDd3NMRm5rcElmMXZqRkV3dVpWRFVKWStZQTRX?=
 =?utf-8?B?M0Qyb2lIYkpqMS9MODd0R21QdWJhZDZQZGpjbTRIOExaZHpsN3FyRm1DTCtr?=
 =?utf-8?B?TUxBV2FNa1BOQUplRi9nOXFJWEpobHcyd0RSQ3JVS2YzWGdpcWtLY0crQWhz?=
 =?utf-8?B?MEhQb2pNUHY1bFdYOVU1dGk2SXEvQWRiSmYrU1YzNUpCOWdzQWlZbXgzOGlX?=
 =?utf-8?B?NXNxSU1US0RhR2loNUgzWWJCR1JHbmM2cHZEZU9kZVYzdExxcWMyNkxWY2c0?=
 =?utf-8?B?clRxVXkzT01Sc2wyTjdFZ3oySDFZck1jaFVyWFlTM1JNMWxTNkJVTGVnY0k4?=
 =?utf-8?B?NnJ6aFFJOUY1Y0xtbGU2NkQ4a1lMeEswdk93eWZWSXR1ZEUraDN3eTYwMDh3?=
 =?utf-8?B?TnMya050Q1JUU0lUNHhLZXY1Nmc5TnM1WUpSUUJ0eG1tZVVIUU1QMjMrQW1G?=
 =?utf-8?B?bnphbVoyUktiNEV4cUV4Y2VmeEs0bU9ldi9XTDVsb2ZrclNXMWdhWnJCbzNO?=
 =?utf-8?B?UUV2MmNCT3hkdjJJMThQSXBJdFNxYlFTSVdnalN4djNhbGJwR2NBVlRvZWtS?=
 =?utf-8?B?RjZFWlg1ZE9VUkIvVUJ3aFlKUFV4djdSa0hpY1o1R0hxaUJncE8yWGU0SHdJ?=
 =?utf-8?B?SWtLTW5heWZtd2JPUHowU1hFcitXbmVUZURhTnhaeXVVMVU4eUVseG4vTHJK?=
 =?utf-8?B?eElrVi8rOGRZeVBhdUxPNWZFZGdBd3ZwR0xzOFhvaTMyV2l1SnV5eS81THRa?=
 =?utf-8?B?Yy85SFIzaU5Wd0JTNyszdUtpVzc5VTJ5UEVBMWt2VEg0a3kwZzNlTHZVR281?=
 =?utf-8?B?eVdwTitCZ0N1NHBxTHdoNTNkd0pNUGZacVFySHZsRDhYMU9rWnhNM1QrcW5I?=
 =?utf-8?B?V0tTM3dpbU1RMERwV0MyVC9BM0dBOVNwL0F4UG05NmhHNGRSV3JVTHh3dktw?=
 =?utf-8?B?eG51VUEvSmpzY2M2QU9nc2QrVzl1c21kMnZpMjNHOFNHR1ZSVkVWS3RhSFFj?=
 =?utf-8?B?WEF2aVdJY00wRnZ4dURKM1UyNlprRXRhTFFXWjlOSUZkQ3hqRit0aUdoV0dv?=
 =?utf-8?B?aEFaL1dNZ2RJVEpzT2xOemFoNW1heldnRUs5bEpwY0tvT2dOSUNFK2U4bHBT?=
 =?utf-8?B?NDRaR2dzVkpNMkZWN2JZb2lkajBEUURqREN4ZnF6MkhINmRrM2cwZ0g3TTRM?=
 =?utf-8?B?U21nTC9PWVNCK1NjN1NPOWFpa2hVd1dkbHNYM0ZnTWxrQjNUS1B3RWdiUEky?=
 =?utf-8?B?VzhNSVpnN1hIQ1FsbWNIZERJN3UzaE1IdDAyclpFQVZXaksvUHlXWXdKdjRr?=
 =?utf-8?B?RkxpM2FOYjF6UFIvNmt6ai9RT1h5eWdyUUFrN25MOWxOdS8zM3IrVGZHM3dS?=
 =?utf-8?B?Zk5VWXp4RFdTNVZ5NThGSHQvSlpyd2wwU3NZOGpvenFSeEkzVG9BNkNqcC8x?=
 =?utf-8?B?eDJEa3lFOWRsYy9WK3I3NStieHpFV0ZpdHNBb3kyYUswcEpkRnJXaGJ1TDNK?=
 =?utf-8?B?bWFCWFhLRXdkY2dST3pIMkhQZWNTM3RLK0JZc2ZyZ0k5dnljK1FPZERqbDJl?=
 =?utf-8?B?WUVKaFVHR1N2Z1Q1cG85TDBaSmVmbFNZSGUrOUFWQkd5bTFTSWdZMFNxdzBi?=
 =?utf-8?B?L3NzNTRGc3hZYTZtM0NqTzUrb0tvMnVjYjZ3RjdqdnBCVGs1MjJkZklheGto?=
 =?utf-8?B?T3FzUFpOWi9jR1hMQ0xqWjZOQzhRYVUxSmhRN0hsK2ZBV1FucE8rU2k4N0JM?=
 =?utf-8?B?dVJlbnJiQ2s5UG5DNEpoQWUrYld1Z3h1bC9OSjRPWjlNS05uUFFBcHhqMHJO?=
 =?utf-8?B?dlVuMkdEM2VFaFN2anphWGc5VFNHTHJaUHo3bnJKQWc0QXJ3Y1RKa3pWR0p3?=
 =?utf-8?B?MXo3Z3cwUzhTdmFvajRpTWNBTXZIbjcrd3ZHT0xHdFduc3lwNlRvZE41TDBj?=
 =?utf-8?B?a3U5MDVlTFVwQnp2VU9TUkNwS3p1MkFJUFMwYkpvZXorRW9qTEVEYkJHc0hy?=
 =?utf-8?Q?GkIw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570ff7a2-0d89-48ce-9d24-08d9bfd1d5ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4188.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 13:50:21.1377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7yclI1TFBRtB97vyg7Kq1eQ4yo1bHEr356EseeaXm8j5I77+6bebKETO2NI1r/o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2762
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 12/13/2021 11:30 PM, Andy Shevchenko wrote:
> On Wed, Dec 08, 2021 at 02:29:04PM +0200, Jarkko Nikula wrote:
>> On 12/7/21 21:21, Andy Shevchenko wrote:
>>> Introduce a common module to provide an API to instantiate UCSI device
>>> for Cypress CCGx Type-C controller. Individual bus drivers need to select
>>> this one on demand.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>    drivers/i2c/busses/Kconfig         |  7 +++++++
>>>    drivers/i2c/busses/Makefile        |  3 +++
>>>    drivers/i2c/busses/i2c-ccgx-ucsi.c | 27 +++++++++++++++++++++++++++
>>>    drivers/i2c/busses/i2c-ccgx-ucsi.h | 11 +++++++++++
>>>    4 files changed, 48 insertions(+)
>>>    create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.c
>>>    create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.h
>>>
>> I've mixed feelings about this set. I'd either put patches 3-8 first since
>> e.g. 6/11 and 8/11 are fixing existing issues or even better to split CCGx
>> UCSI stuff into another set.
> 
> I have sent v2 with DesignWare patches only and no conversion part included.
> 

It will be good we can take this patch also in this series. This is more 
nicer and cleaner solution. That said, we are working futuristic 
platform where CCGX is connected over system  i2c of our platform i.e 
AMDI0010 so in this case from designware platform i2c driver we will 
have to probe the CCGX driver.

Regards
Nehal

