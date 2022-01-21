Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F7C4966B7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 22:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbiAUVCK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 16:02:10 -0500
Received: from mail-dm3nam07on2066.outbound.protection.outlook.com ([40.107.95.66]:34272
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230151AbiAUVCJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 16:02:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJlESxr7N9Qzz4yKsOIwmjmG7FJh0kKUssJWEHAJ6reXvLbndNM3cZI8IEfXwBKdv0FZcYskhtdHJrbYNu8J7vkVDmgtj5wdtq+nz1WdsoOivgsxBdNh5XYJ+f5zK9p3MZgYhiexpAckUSMSHJflnq/UQVmKqvxJkNkfa7a+sPqndj7fRDEpnFpvdpyc3HQ1cV18dUfNDBBs/9tzYkr3L5H+C16vQv4f0jAovJS2W4URnlIrs9Vi8Dy0gxHD/DjeJfZ8BcgyDAHUSGksm0lj5c6Z4d85e6FCFW4ndufvaHygYeatp0aK4rWZ5hGv82Zh5FhCOoqjGgi5/17HGqk7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIleaBspDlZtMSPRa1OdSLcMQXWh+ftS7eap8ossb+4=;
 b=nMmU7JGhl+ankuj4pie1JOscegi9xgyjNIAJsnlz9Tzw3g+llSv2N9kzNdossUizQLNN0CRDC5zwdvwYFFYOpL7ET7zJn3fB+9vAdtkSTQn760wBlKrNMjvRmPxsjWS0bK1tEYC0XTldo3d0tT/fHdxAPl2v+Gns0mt57u6t+drj3uiMh9ILdGf8I0fsZEKUO/7EW4HRYfXuCfGPNEVCFkn6/QDvHjbPw9IErnBqW8uSwruhkX/YKAt0pLvaBTaUD8TP9pS6ShU1fLgGKOZoAfGxZfZHHVnTaFWs3Dos+7jgcNx1+/LG/5O3W8p3/xKmyAQnxBrKPpAtx5l7Uu3VIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIleaBspDlZtMSPRa1OdSLcMQXWh+ftS7eap8ossb+4=;
 b=nWocPZcxFE1oFi66eqd0vxCxld/2GSbde9aBiILq2EjkbdnaqTH94Z/JpR9fJVG3IXk7GIcYuAMr2fn0/eM5yXBroYE1CLwGzcex/uN/rUBgWP5fj4od/mQF1WZO1zWZjNfFDTq/xQTqHQ2uPv6V2onLcji0BPd2KgL0Aq2nU9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BL0PR12MB2402.namprd12.prod.outlook.com (2603:10b6:207:45::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 21:02:07 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 21:02:07 +0000
Message-ID: <846b8323-2ebb-90c1-d1df-b12a303206f3@amd.com>
Date:   Fri, 21 Jan 2022 15:02:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Reply-To: Terry.Bowman@amd.com
Subject: Re: [PATCH v3 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port
 select
Content-Language: en-US
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
 <20220119230626.31560-9-terry.bowman@amd.com>
 <CAHp75VcGmmRpRD99tFHd7WOPs6uyz3uWuTEoc=G+VmbPYAUvuA@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <CAHp75VcGmmRpRD99tFHd7WOPs6uyz3uWuTEoc=G+VmbPYAUvuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::19) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 734e45e1-e3c2-4233-e93e-08d9dd21486e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2402:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB2402DAA1EB81CEEC2AA4A6FE835B9@BL0PR12MB2402.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qixJ3JCFAF+hyjcKv7/1Cr7qqKI1iR2MW+ahxDVBuDsQ4MJNZbOyPvOyWfPDJq9zyvP4lk0HVnmZqBFhiPftv+nqvo6KjfMoO4ZBkE5NE10e9e1jkUULp7czMjNgA7xXTdvM9c9uS3/jIO06ezFUZ5k1saalHNtU4IG6XO4pNJrzUhzwFKjhlv22EU8KD727yrLqNLqDDnXXXxv+ONIW8MGF/p5LCxZm03bb+Tmnnu/Bjn4eZhwWOuO6CJcC//emGYxfF798Q5PP/Og+8puMqjrbSOWeFYDBFjZIFkDb/erUqCvp16O3Tg13w6PChOaE7vhKKKjVbWng3y4+45inGooJb/LMfkbbWy1R27Hd6J8pHOQ1JbaawreYDB9FVRy6Ux+rpo1b2Be7gLg7lMCmvYbUEEdXkipsE3ihZGW9SGABqSmWkgfpDl0NAytnpanVUSzd7jE6Kwekx3VGqxB2uxQM9owdjXZfT8WdjJ/oczXmbsWiZtV0hQ2OKbz61NgR8buC8crdHDYkB9nmiltiXpvc/KV2n9YhJuzYLvAky765vN3HVj3MpX+0xe5Ffiy2Lf53n/pdrGNbzHNRPH2hQP+F7adR1tgNlaSDGTnKCMVKudmA+swsb23AU3HUdPBJnGgIoT9W40QDVr3j7VKMDp9TSfyHLolwzFpr8tRaYDo1mhO81GSUR4jy1Bj2NH3X0yJrgmdaraRVBgxCz4OgSjeiE2YZpkOofDenQOODmdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(2616005)(31686004)(8936002)(66946007)(66556008)(66476007)(6486002)(8676002)(31696002)(6916009)(3450700001)(5660300002)(4326008)(53546011)(508600001)(2906002)(6506007)(54906003)(186003)(6666004)(86362001)(4744005)(316002)(26005)(36756003)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmtQbGdDV0gzZzdHVTEzLy80bHhJS2xkRVBMazF6MW5ZT0hKcHhONGJwSEF5?=
 =?utf-8?B?T1VrSVRjQW9TWHFlNnlaWFdPYVNKMWtUM3VNTUUrVkJaWkxPcEMrVU53dHRM?=
 =?utf-8?B?dW1tSkpLSHV0UnRqb2trVzNGZEdKMjhYNFloV1ZaUjBWM1RXRFZzbE43TkVJ?=
 =?utf-8?B?TWpyK1BHU1NJNTVrVHVEQjdrN1l5V3p3VjVtUmZjblgwaVAyQ0hyUldDcWp4?=
 =?utf-8?B?L29OUVRscGxmMGJya09YZGI3b3RkWUk4QnpMYmRkdmhqUU1sQXorTldsdXZ2?=
 =?utf-8?B?VGJkamc1SHd6RDZMei9Vd0k4Z3RoZWlGaHk5bndGYmpKSVVHdk4yU25wZTNZ?=
 =?utf-8?B?MXZWYUZjNTgwQzhLYkp1YXZOR3dnQUE0K0lLTnV3R3BxVCs0dWlmUUREdmpu?=
 =?utf-8?B?SWhIY0U4cjIrcXhxdlhnQ1RodGx5TG44d2xpeWF4b1ZITXBvWWc0NEUycHdi?=
 =?utf-8?B?NnI3OE5SSnVMRGMzRUd2ck52RTh2ZVZwZ2FWbUtONElVV3hiYXIxbUwyR1RR?=
 =?utf-8?B?M3l5a3FVVG5WbHh3Vyt4L1hTSWFMME9jOVZPVVFPVEsxT3MxOHE3MUFON24z?=
 =?utf-8?B?NFVEM1I2V1VDcW80RkczaXpHek9HaENpUTFMWWhhcFZDRVJYMHhTT1pENkxZ?=
 =?utf-8?B?TlA3TUVjTHI5VDhkSTNDMG9ZNUtVSXQrU09oNnkxTk5CRks0alVjNklWb2c1?=
 =?utf-8?B?QWtIODlaa3VwWWd1ZitiSys2eDBPWGxXT2xFWXl0Tm9ac2NhSzhCWlRLb050?=
 =?utf-8?B?R1lNbXN4MGdGVXVqK3JmbFFJNnh2SE5qV3VZdE1VcTk0TXRSRStnYzkwelBQ?=
 =?utf-8?B?TzNPdHc0UHlBeXZ0SlhvdUU1SWpLVFQ5bGJaMVB5MUVOcm5wOXN2WE5TSCtM?=
 =?utf-8?B?dXNTRXQ5d1dsMU9FcmNIRWNXdFo1Tk9UZHFOaXNpdSs4ZUgrcFNSdzJnUmN5?=
 =?utf-8?B?cFk1dDFnN2pvMThCZUtrUjZoeDhFWWdCUUJ5RTRsOFNrZ25xd0ZURkpxVk1Z?=
 =?utf-8?B?QU1zS0M1clZsaU15V3YzVW43WkpqM3VwbjBPRXp0QWFDWlEwcXV5c0xzRzhZ?=
 =?utf-8?B?RVRROEhaN0N0ZDZDMllyOU54VllLdDZzU0RlTVYrVEpobStCempXckhEV1V0?=
 =?utf-8?B?M0JKTWRFY0phditnYmtTWEVEM3h3bU5kNTgxdERKZUJ4aGcwSXBrRHNzbFoz?=
 =?utf-8?B?dy9BMW9Zc3N4cS9HRzNUcjhlQTZDTTNsa2hQUkJwQm5Ubk95MzVDT21KdUdT?=
 =?utf-8?B?ZndVS2ZZRmZlb2NTaEhRK3A4QVJTb0h5SjdIejIrRWhCZWdLNXlxTEs2WENT?=
 =?utf-8?B?VmY0WHdBZGNaU0hmK3Noby80b3lTc3VpOGM0Mm92SnNkU0dnZFkwNTAyMWM0?=
 =?utf-8?B?YnMwSG5WTGZhU3FESnFZaC9vRm5lWEg0N2VDV1BONllPVVNSSDR6Y2RIN0lx?=
 =?utf-8?B?Y1d4T1BLb0xST1ROK1BRdUEwcm05WkRqMkptUkZ0anBVU2NSUDRhd2ZLNlhU?=
 =?utf-8?B?VWczaDI3ejBzSGo5c1dscW5DbEtsK0VmUGpVak03TXM5eStZdWNYdjRUU3Vk?=
 =?utf-8?B?aGtHTEgyQ0VtZXJqTHBtZjdOOXM2YzRQSzJhbnNERTZnUlpkaG1EL29EWXZX?=
 =?utf-8?B?Ui9GdnV2elNBeHdVTjBUNEFHdUxHZVU0ZVR0ditxMTVoZEhMRXNxTmdiaFBQ?=
 =?utf-8?B?QVJSQXNNSmxSRGd0SFJXVXhFYkJiVmkvcFNlT1JDU2lwZHlrdDhWQWdaTEVL?=
 =?utf-8?B?TnpQdDU2VC83bmlHdzZUT0lXeDEwT1ZYUnpHQW1oejF2UjRsZ25IWmFYZGlm?=
 =?utf-8?B?eXNXa0xTU1pCSGlYdFVOTk42U3RMd1d6L3lpZk8zYTBEb3FCanlkYmxoaVVF?=
 =?utf-8?B?S2ZkdXAySzhEdGRyWEY1cW5Rc2RUZjU3VXB5d2tkM2puc0p5U3pSZE4yQVl6?=
 =?utf-8?B?UXIvbFphcjZzaTZubmlNTE84NXBpTHY4bkpLS2ZDcWdWMkJMZjE5R2ZNaHo2?=
 =?utf-8?B?SitubVJTT3JSbm1UUCtZd0xTMEZnN3BpNUdCVWdLeTNaekdYWmFVblpVRUx3?=
 =?utf-8?B?azlGdzU2UHQwUDVmM05FYW5rZkxRdEJDYnNNTURadmRhKzUraExTRWc4Qm9T?=
 =?utf-8?B?RCthRUkvU3J2RTUvWEVBL2VQWDQ2ZjUvQ3NxNmgwSnJCN3B3djFDVXlBU1c4?=
 =?utf-8?Q?v/1Kq6xrnGngR1p/nnemZYE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734e45e1-e3c2-4233-e93e-08d9dd21486e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 21:02:07.0710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rw4ulKc/5FXFVE4JxEB272Dl4spFEh8UrtSdWHfphooOUzWpQ/K6a0KA7LqwEQKDhLuf36EtJCBbU/iDWF82g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2402
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/20/22 05:28, Andy Shevchenko wrote:
> On Thu, Jan 20, 2022 at 1:08 AM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> AMD processors include registers capable of selecting between 2 SMBus
>> ports. Port selection is made during each user access by writing to
>> FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
>> SMBus port selection because cd6h/cd7h port I/O is not available on
>> later AMD processors.
> 
> ...
> 
>>  }
>> +
>>  /*
> 
> Stray change.
> 
> 

Hi Andy,

Looking at this closer I find the added line separates the closing 
function brace from the next function's comment header. Are you sure I 
need to remove this line?

Regards,
Terry
